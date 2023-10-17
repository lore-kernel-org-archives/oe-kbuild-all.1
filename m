Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872664176F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 11:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISTjFTCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697541020; x=1729077020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p8RqzN8ryseAnkRRBpD2TjoEBuikPSNW8WMhsfCNIfk=;
  b=ISTjFTCZyTpj5D0nkbTON/04NU2o8CLofhrUsPR0Or7QfpOuL9vhS/Jl
   Zm/HP2oOByQqC7JVnj1hfX7hurSc3tm20JFzfS6plN9CLqJ2ZwrRKo2/K
   pAgSaRyFAE2HfFHAozuBUU+uBzQdfoBdWKF4FtxDIfTKhi0YC4Mg0kqzn
   M4vXRTRWi9YpvQ++OaTM8WLQfLOP2UEB4jecPD9A09usQvAfRfsdk+Fwc
   Q/QXIW3E8NOBkCU7pjyMT/Tixk+L0+1OWzwqRTwYnAznLkyFGOJsSNtt+
   l7ER5yTwFGo1LE0+gjrSC1N3ewWLZjhglBQIDHLWJtC8VlHbDFgNpB38J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="389625988"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="389625988"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 04:09:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="705957508"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="705957508"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Oct 2023 04:09:25 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qshwu-0009Ul-1w;
	Tue, 17 Oct 2023 11:09:21 +0000
Date: Tue, 17 Oct 2023 19:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12978/13086]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:286:52:
 warning: '%s' directive output may be truncated writing up to 29 bytes into
 a region of size 23
Message-ID: <202310171905.azfrKoID-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4d5ab2376ec576af173e5eac3887ed0b51bd8566
commit: cfcdac4a9ccc5a617998c0b9d3ebc1c4289a3cdb [12978/13086] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux
config: arm-buildonly-randconfig-r006-20230322 (https://download.01.org/0day-ci/archive/20231017/202310171905.azfrKoID-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171905.azfrKoID-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171905.azfrKoID-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c: In function 'smu_v13_0_6_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:286:52: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
     286 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                                                    ^~       ~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:286:9: note: 'snprintf' output between 12 and 41 bytes into a destination of size 30
     286 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0.c: In function 'smu_v14_0_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0.c:72:52: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
      72 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                                                    ^~       ~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0.c:72:9: note: 'snprintf' output between 12 and 41 bytes into a destination of size 30
      72 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +286 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c

511a95552ec878 Lijo Lazar 2023-03-02  263  
f20f3b0d6caf12 Lijo Lazar 2023-10-11  264  static int smu_v13_0_6_init_microcode(struct smu_context *smu)
f20f3b0d6caf12 Lijo Lazar 2023-10-11  265  {
f20f3b0d6caf12 Lijo Lazar 2023-10-11  266  	const struct smc_firmware_header_v2_1 *v2_1;
f20f3b0d6caf12 Lijo Lazar 2023-10-11  267  	const struct common_firmware_header *hdr;
f20f3b0d6caf12 Lijo Lazar 2023-10-11  268  	struct amdgpu_firmware_info *ucode = NULL;
f20f3b0d6caf12 Lijo Lazar 2023-10-11  269  	struct smc_soft_pptable_entry *entries;
f20f3b0d6caf12 Lijo Lazar 2023-10-11  270  	struct amdgpu_device *adev = smu->adev;
f20f3b0d6caf12 Lijo Lazar 2023-10-11  271  	uint32_t p2s_table_id = P2S_TABLE_ID_A;
f20f3b0d6caf12 Lijo Lazar 2023-10-11  272  	int ret = 0, i, p2stable_count;
f20f3b0d6caf12 Lijo Lazar 2023-10-11  273  	char ucode_prefix[30];
f20f3b0d6caf12 Lijo Lazar 2023-10-11  274  	char fw_name[30];
f20f3b0d6caf12 Lijo Lazar 2023-10-11  275  
f20f3b0d6caf12 Lijo Lazar 2023-10-11  276  	/* No need to load P2S tables in IOV mode */
f20f3b0d6caf12 Lijo Lazar 2023-10-11  277  	if (amdgpu_sriov_vf(adev))
f20f3b0d6caf12 Lijo Lazar 2023-10-11  278  		return 0;
f20f3b0d6caf12 Lijo Lazar 2023-10-11  279  
f20f3b0d6caf12 Lijo Lazar 2023-10-11  280  	if (!(adev->flags & AMD_IS_APU))
f20f3b0d6caf12 Lijo Lazar 2023-10-11  281  		p2s_table_id = P2S_TABLE_ID_X;
f20f3b0d6caf12 Lijo Lazar 2023-10-11  282  
f20f3b0d6caf12 Lijo Lazar 2023-10-11  283  	amdgpu_ucode_ip_version_decode(adev, MP1_HWIP, ucode_prefix,
f20f3b0d6caf12 Lijo Lazar 2023-10-11  284  				       sizeof(ucode_prefix));
f20f3b0d6caf12 Lijo Lazar 2023-10-11  285  
f20f3b0d6caf12 Lijo Lazar 2023-10-11 @286  	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
f20f3b0d6caf12 Lijo Lazar 2023-10-11  287  
f20f3b0d6caf12 Lijo Lazar 2023-10-11  288  	ret = amdgpu_ucode_request(adev, &adev->pm.fw, fw_name);
f20f3b0d6caf12 Lijo Lazar 2023-10-11  289  	if (ret)
f20f3b0d6caf12 Lijo Lazar 2023-10-11  290  		goto out;
f20f3b0d6caf12 Lijo Lazar 2023-10-11  291  
f20f3b0d6caf12 Lijo Lazar 2023-10-11  292  	hdr = (const struct common_firmware_header *)adev->pm.fw->data;
f20f3b0d6caf12 Lijo Lazar 2023-10-11  293  	amdgpu_ucode_print_smc_hdr(hdr);
f20f3b0d6caf12 Lijo Lazar 2023-10-11  294  
f20f3b0d6caf12 Lijo Lazar 2023-10-11  295  	/* SMU v13.0.6 binary file doesn't carry pptables, instead the entries
f20f3b0d6caf12 Lijo Lazar 2023-10-11  296  	 * are used to carry p2s tables.
f20f3b0d6caf12 Lijo Lazar 2023-10-11  297  	 */
f20f3b0d6caf12 Lijo Lazar 2023-10-11  298  	v2_1 = (const struct smc_firmware_header_v2_1 *)adev->pm.fw->data;
f20f3b0d6caf12 Lijo Lazar 2023-10-11  299  	entries = (struct smc_soft_pptable_entry
f20f3b0d6caf12 Lijo Lazar 2023-10-11  300  			   *)((uint8_t *)v2_1 +
f20f3b0d6caf12 Lijo Lazar 2023-10-11  301  			      le32_to_cpu(v2_1->pptable_entry_offset));
f20f3b0d6caf12 Lijo Lazar 2023-10-11  302  	p2stable_count = le32_to_cpu(v2_1->pptable_count);
f20f3b0d6caf12 Lijo Lazar 2023-10-11  303  	for (i = 0; i < p2stable_count; i++) {
f20f3b0d6caf12 Lijo Lazar 2023-10-11  304  		if (le32_to_cpu(entries[i].id) == p2s_table_id) {
f20f3b0d6caf12 Lijo Lazar 2023-10-11  305  			smu->pptable_firmware.data =
f20f3b0d6caf12 Lijo Lazar 2023-10-11  306  				((uint8_t *)v2_1 +
f20f3b0d6caf12 Lijo Lazar 2023-10-11  307  				 le32_to_cpu(entries[i].ppt_offset_bytes));
f20f3b0d6caf12 Lijo Lazar 2023-10-11  308  			smu->pptable_firmware.size =
f20f3b0d6caf12 Lijo Lazar 2023-10-11  309  				le32_to_cpu(entries[i].ppt_size_bytes);
f20f3b0d6caf12 Lijo Lazar 2023-10-11  310  			break;
f20f3b0d6caf12 Lijo Lazar 2023-10-11  311  		}
f20f3b0d6caf12 Lijo Lazar 2023-10-11  312  	}
f20f3b0d6caf12 Lijo Lazar 2023-10-11  313  
f20f3b0d6caf12 Lijo Lazar 2023-10-11  314  	if (smu->pptable_firmware.data && smu->pptable_firmware.size) {
f20f3b0d6caf12 Lijo Lazar 2023-10-11  315  		ucode = &adev->firmware.ucode[AMDGPU_UCODE_ID_P2S_TABLE];
f20f3b0d6caf12 Lijo Lazar 2023-10-11  316  		ucode->ucode_id = AMDGPU_UCODE_ID_P2S_TABLE;
f20f3b0d6caf12 Lijo Lazar 2023-10-11  317  		ucode->fw = &smu->pptable_firmware;
f20f3b0d6caf12 Lijo Lazar 2023-10-11  318  		adev->firmware.fw_size += ALIGN(ucode->fw->size, PAGE_SIZE);
f20f3b0d6caf12 Lijo Lazar 2023-10-11  319  	}
f20f3b0d6caf12 Lijo Lazar 2023-10-11  320  
f20f3b0d6caf12 Lijo Lazar 2023-10-11  321  	return 0;
f20f3b0d6caf12 Lijo Lazar 2023-10-11  322  out:
f20f3b0d6caf12 Lijo Lazar 2023-10-11  323  	amdgpu_ucode_release(&adev->pm.fw);
f20f3b0d6caf12 Lijo Lazar 2023-10-11  324  
f20f3b0d6caf12 Lijo Lazar 2023-10-11  325  	return ret;
f20f3b0d6caf12 Lijo Lazar 2023-10-11  326  }
f20f3b0d6caf12 Lijo Lazar 2023-10-11  327  

:::::: The code at line 286 was first introduced by commit
:::::: f20f3b0d6caf12cd9845e6552bf7da49060f515a drm/amd/pm: Add P2S tables for SMU v13.0.6

:::::: TO: Lijo Lazar <lijo.lazar@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
