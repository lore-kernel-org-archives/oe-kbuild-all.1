Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB1B1865D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 16:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695141241; x=1726677241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XZpIBnSgkGa/ncmo+0kefgMVs9Xpwzuup2UeBrdxQro=;
  b=cxPDDxQZwD94VnM1E9wE/RiszfELu/Y6Qu5eze3atsZ/kq78Ds+0fiMe
   9XBfMh7hle1lItI+0SpK5UPAWtNoBZFMzhAs8S33AOUGo/JeaFYjqxC50
   wBpBR/7k8JFZzhJxXT/+Zbhbl0jab/PalggChF5JafvAcXR/g5g89spOq
   xIVPRsgpTfv0AJREzYfFpHCaypJ5Y2T0xJeINKV7VPpd0AkSvUtVZlp5A
   cTFdW+tCcTjyu6T4AIr41GyUocfx9D+ebGpkn7C44XHdc2O/j94kMmD1R
   tHMoAjhOZCSSS/ZMKPBzBep1IT6UWEdu44Tkpz6IzrX9Kz43f76MELW2T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="377304619"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="377304619"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 09:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="739786740"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="739786740"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Sep 2023 09:33:59 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qidfg-0007ei-2u;
	Tue, 19 Sep 2023 16:33:56 +0000
Date: Wed, 20 Sep 2023 00:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: Lang Yu <Lang.Yu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Huang Rui <ray.huang@amd.com>
Subject: [linux-next:master 679/6333]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:49:52: warning: '%s' directive
 output may be truncated writing up to 63 bytes into a region of size 57
Message-ID: <202309200028.aUVuM8os-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   29e400e3ea486bf942b214769fc9778098114113
commit: 9d4346bdbc6484a1814011315827c258509b483c [679/6333] drm/amdgpu: add VPE 6.1.0 support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309200028.aUVuM8os-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200028.aUVuM8os-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200028.aUVuM8os-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c: In function 'amdgpu_vpe_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:49:52: warning: '%s' directive output may be truncated writing up to 63 bytes into a region of size 57 [-Wformat-truncation=]
      49 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", fw_prefix);
         |                                                    ^~       ~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:49:9: note: 'snprintf' output between 12 and 75 bytes into a destination of size 64
      49 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", fw_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +49 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c

    39	
    40	int amdgpu_vpe_init_microcode(struct amdgpu_vpe *vpe)
    41	{
    42		struct amdgpu_device *adev = vpe->ring.adev;
    43		const struct vpe_firmware_header_v1_0 *vpe_hdr;
    44		char fw_name[VPE_FW_NAME_LEN];
    45		char fw_prefix[VPE_FW_NAME_LEN];
    46		int ret;
    47	
    48		amdgpu_ucode_ip_version_decode(adev, VPE_HWIP, fw_prefix, sizeof(fw_prefix));
  > 49		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", fw_prefix);
    50	
    51		ret = amdgpu_ucode_request(adev, &adev->vpe.fw, fw_name);
    52		if (ret)
    53			goto out;
    54	
    55		vpe_hdr = (const struct vpe_firmware_header_v1_0 *)adev->vpe.fw->data;
    56		adev->vpe.fw_version = le32_to_cpu(vpe_hdr->header.ucode_version);
    57		adev->vpe.feature_version = le32_to_cpu(vpe_hdr->ucode_feature_version);
    58	
    59		return 0;
    60	out:
    61		dev_err(adev->dev, "fail to initialize vpe microcode\n");
    62		release_firmware(adev->vpe.fw);
    63		adev->vpe.fw = NULL;
    64		return ret;
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
