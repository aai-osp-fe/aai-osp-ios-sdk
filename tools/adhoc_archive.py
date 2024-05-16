import re
import subprocess
import os
import shutil
import upload_pgy

def run_command(command):
    try:
        result = subprocess.check_output(command, stderr=subprocess.STDOUT, text=True)
        print(result)
        return result
    except subprocess.CalledProcessError as e:
        print(f'Error: {e.output}')
        raise

def main():
    increase_version()
    # 定义项目路径和输出路径
    project_path = '../Example/OSPKit.xcworkspace'  # 替换为你的项目路径
    output_path = 'archived_adhoc'  # 替换为你的输出路径

    # 定义 Scheme 名称
    scheme_name = 'OSPKit-Example'  # 替换为你的 Scheme 名称

    # 构建命令
    build_command = [
        'xcodebuild',
        'clean', 
        'archive',
        '-workspace', project_path,
        '-scheme', scheme_name,
        '-configuration', 'Release',
        '-archivePath', f'{output_path}/OSPKit_Example.xcarchive',
        '-allowProvisioningUpdates',
        '-verbose',
    ]

    # 导出 IPA 命令
    export_command = [
        'xcodebuild',
        '-exportArchive',
        '-archivePath', f'{output_path}/OSPKit_Example.xcarchive',
        '-exportOptionsPlist', 'exprot_adhoc.plist',
        '-exportPath', f'{output_path}/ipa',
        ' -allowProvisioningUpdates',
        '-verbose',
    ]

    try:
        # 执行构建
        print("begin archive")
        run_command(build_command)

        # 执行导出 IPA
        print("beigin exprot")
        run_command(export_command)

        print(f'IPA exported to {output_path}')
        
        upload_to_pgyer(f'{output_path}/ipa/OSPKit_Example.ipa')
        print("download page: https://www.pgyer.com/HB3FW0x8")
    except Exception as e:
        print(f'Build and export failed with error: {e}')

def upload_to_pgyer(path):
    api_key = 'd65316ffda0c78d35065c7c9dcfe0941'
    upload_pgy.upload_to_pgyer(path, api_key, 1)


def increase_version():
    # 进入 Xcode 项目目录
    incrementCommand = "agvtool next-version -all"

    os.system(f"cd ../Example;{incrementCommand};cd ../tools")

    


if __name__ == '__main__':
    main()

    
