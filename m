Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970D3A42
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 10:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694342447; x=1725878447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SffAgeq+w1Ui5SY1Ck8R89Jvc1xInelScvPEGigLG4A=;
  b=TP+vatSd1G7uItsbzRYmdIchL8bdhYK77PIImeH8lrYaL8GWAYoEwMQw
   rNNmFgyST61WxlFgOvz4038u2XP4CT9oBtb8H6pPyBQ+wzM7q3/Ef0z44
   BhDTZYnL5BRrW7tUVD+O31IL0k73a+TenGE4Q/59xD/+vnkA/SXxGUdi5
   C7gbPeC/Ui+7ra5sOC8F5xGoDKUv4KJJ6vpQCezl2tUlGY6uq7OPqmxue
   +C/wslZ/0NcDNd3XCMDYwoMnoX3ZR7uDBf8HVSkutRBOBG3x+7PaP86wj
   Mar5wIh0090gIcce1A4B8YHjXRX+xLJB3kQ0WUJPgcO92mb0eFRZxpIPf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="408861335"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="408861335"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 03:40:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="989748453"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="989748453"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Sep 2023 03:40:45 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfHrv-0004o4-1U;
	Sun, 10 Sep 2023 10:40:43 +0000
Date: Sun, 10 Sep 2023 18:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 14120/14158]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:60:52: warning: '%s' directive
 output may be truncated writing up to 63 bytes into a region of size 57
Message-ID: <202309101830.7uQV4SMc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   af3c30d33476bc2694b0d699173544b07f7ae7de
commit: 75736b3ff0253cb1246f9f65a0594b1369a2d8b6 [14120/14158] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230910/202309101830.7uQV4SMc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309101830.7uQV4SMc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309101830.7uQV4SMc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c: In function 'amdgpu_vpe_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:60:52: warning: '%s' directive output may be truncated writing up to 63 bytes into a region of size 57 [-Wformat-truncation=]
      60 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", fw_prefix);
         |                                                    ^~       ~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:60:9: note: 'snprintf' output between 12 and 75 bytes into a destination of size 64
      60 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", fw_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +60 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c

f9ecae9a4ec19c2 Lang Yu 2023-06-27  50  
9d4346bdbc6484a Lang Yu 2022-05-23  51  int amdgpu_vpe_init_microcode(struct amdgpu_vpe *vpe)
9d4346bdbc6484a Lang Yu 2022-05-23  52  {
9d4346bdbc6484a Lang Yu 2022-05-23  53  	struct amdgpu_device *adev = vpe->ring.adev;
9d4346bdbc6484a Lang Yu 2022-05-23  54  	const struct vpe_firmware_header_v1_0 *vpe_hdr;
9d4346bdbc6484a Lang Yu 2022-05-23  55  	char fw_name[VPE_FW_NAME_LEN];
9d4346bdbc6484a Lang Yu 2022-05-23  56  	char fw_prefix[VPE_FW_NAME_LEN];
9d4346bdbc6484a Lang Yu 2022-05-23  57  	int ret;
9d4346bdbc6484a Lang Yu 2022-05-23  58  
9d4346bdbc6484a Lang Yu 2022-05-23  59  	amdgpu_ucode_ip_version_decode(adev, VPE_HWIP, fw_prefix, sizeof(fw_prefix));
9d4346bdbc6484a Lang Yu 2022-05-23 @60  	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", fw_prefix);
9d4346bdbc6484a Lang Yu 2022-05-23  61  
9d4346bdbc6484a Lang Yu 2022-05-23  62  	ret = amdgpu_ucode_request(adev, &adev->vpe.fw, fw_name);
9d4346bdbc6484a Lang Yu 2022-05-23  63  	if (ret)
9d4346bdbc6484a Lang Yu 2022-05-23  64  		goto out;
9d4346bdbc6484a Lang Yu 2022-05-23  65  
9d4346bdbc6484a Lang Yu 2022-05-23  66  	vpe_hdr = (const struct vpe_firmware_header_v1_0 *)adev->vpe.fw->data;
9d4346bdbc6484a Lang Yu 2022-05-23  67  	adev->vpe.fw_version = le32_to_cpu(vpe_hdr->header.ucode_version);
9d4346bdbc6484a Lang Yu 2022-05-23  68  	adev->vpe.feature_version = le32_to_cpu(vpe_hdr->ucode_feature_version);
9d4346bdbc6484a Lang Yu 2022-05-23  69  
c5d67a0ec3cc05e Lang Yu 2023-05-09  70  	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
c5d67a0ec3cc05e Lang Yu 2023-05-09  71  		struct amdgpu_firmware_info *info;
c5d67a0ec3cc05e Lang Yu 2023-05-09  72  
c5d67a0ec3cc05e Lang Yu 2023-05-09  73  		info = &adev->firmware.ucode[AMDGPU_UCODE_ID_VPE_CTX];
c5d67a0ec3cc05e Lang Yu 2023-05-09  74  		info->ucode_id = AMDGPU_UCODE_ID_VPE_CTX;
c5d67a0ec3cc05e Lang Yu 2023-05-09  75  		info->fw = adev->vpe.fw;
c5d67a0ec3cc05e Lang Yu 2023-05-09  76  		adev->firmware.fw_size +=
c5d67a0ec3cc05e Lang Yu 2023-05-09  77  			ALIGN(le32_to_cpu(vpe_hdr->ctx_ucode_size_bytes), PAGE_SIZE);
c5d67a0ec3cc05e Lang Yu 2023-05-09  78  
c5d67a0ec3cc05e Lang Yu 2023-05-09  79  		info = &adev->firmware.ucode[AMDGPU_UCODE_ID_VPE_CTL];
c5d67a0ec3cc05e Lang Yu 2023-05-09  80  		info->ucode_id = AMDGPU_UCODE_ID_VPE_CTL;
c5d67a0ec3cc05e Lang Yu 2023-05-09  81  		info->fw = adev->vpe.fw;
c5d67a0ec3cc05e Lang Yu 2023-05-09  82  		adev->firmware.fw_size +=
c5d67a0ec3cc05e Lang Yu 2023-05-09  83  			ALIGN(le32_to_cpu(vpe_hdr->ctl_ucode_size_bytes), PAGE_SIZE);
c5d67a0ec3cc05e Lang Yu 2023-05-09  84  	}
c5d67a0ec3cc05e Lang Yu 2023-05-09  85  
9d4346bdbc6484a Lang Yu 2022-05-23  86  	return 0;
9d4346bdbc6484a Lang Yu 2022-05-23  87  out:
9d4346bdbc6484a Lang Yu 2022-05-23  88  	dev_err(adev->dev, "fail to initialize vpe microcode\n");
9d4346bdbc6484a Lang Yu 2022-05-23  89  	release_firmware(adev->vpe.fw);
9d4346bdbc6484a Lang Yu 2022-05-23  90  	adev->vpe.fw = NULL;
9d4346bdbc6484a Lang Yu 2022-05-23  91  	return ret;
9d4346bdbc6484a Lang Yu 2022-05-23  92  }
9d4346bdbc6484a Lang Yu 2022-05-23  93  

:::::: The code at line 60 was first introduced by commit
:::::: 9d4346bdbc6484a1814011315827c258509b483c drm/amdgpu: add VPE 6.1.0 support

:::::: TO: Lang Yu <Lang.Yu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
