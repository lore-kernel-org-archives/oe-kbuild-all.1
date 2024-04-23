Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF33D4595D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 23:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713915172; cv=none; b=GLLHWwLgjzY/cpshWX8VwxVa5h/5DEueyTgqSzn/h0qcKHSbFQJUdQi09L1naD/ISrVsQa0DsNVWtC7/nD6g0ZCk1L8bgYnk0hULbxwYMij+crW2qtNkFL47dgIJTSVqM0mF++Yzh5rX0fuMQTQ3RBsKVu1KmIXm41DU8PSeeK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713915172; c=relaxed/simple;
	bh=P07uj5H8II0RpUX1IqAVzyt4lIJM0XmMLyglH3SiFis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cYM6mZN9nni/FKE8Sd5Nk8SWqVQQWqzkMRHIQE3fN2It6poP8FLmnvOXQJgBuNaSe1Gjkx5xVhtuwv/fmo3x2GZ3koR1rI0vq1KoOUmMNFIYaRpQHmdZYscdvHsFi/0euDVdR4tG1Tlv/95d0nLYGcSaezJfybgNz3B6fCMp504=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ON7K5V/t; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ON7K5V/t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713915170; x=1745451170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P07uj5H8II0RpUX1IqAVzyt4lIJM0XmMLyglH3SiFis=;
  b=ON7K5V/tRw1Yj4hK3ABmOb6xmQqgv6Ce9y0jeFy9XtMqaZUmqGjKO6cF
   TXrGxOrOtY9zuXbXNLeidO+wZZXQQ/WHJx9nGn/MtnN7xHDrwpU0Wb7AT
   0+48GGAogHLgqVaOwMzB4AV69qlvrbMZ5rMLGgU4cGhyTBIULad0RZVV2
   6Rx4R8/faNeQfRxHcag0K1Crk5RvzMXjuQC8gq1vlrIvuMTUGp2edqXBf
   /PwQ8v9SRozqbMjU/UzImm/HEVTIHJ4Utr9YUMfVGhScLpv9pciXJ81f4
   crjavW4IDIEVpYfUcCZcdCE7LEBfiQr+Y8Ig/Ory9meA0ky/xpShg3c1Q
   A==;
X-CSE-ConnectionGUID: /k1q7sNAQsuyAYHQMAJ0KQ==
X-CSE-MsgGUID: l4ZmDw58TH2YFtJC0fAs0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9398427"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9398427"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 16:32:49 -0700
X-CSE-ConnectionGUID: vo1vGkPdSNerlU8GndZ+XQ==
X-CSE-MsgGUID: /LA1Q0nLQEeyS32eHZWkEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="55726273"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Apr 2024 16:32:48 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzPcz-0000d6-1j;
	Tue, 23 Apr 2024 23:32:45 +0000
Date: Wed, 24 Apr 2024 07:31:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dave Airlie <airlied@redhat.com>
Subject: [linux-next:master 6727/7876]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0.c:80:52: error: '%s'
 directive output may be truncated writing up to 29 bytes into a region of
 size 23
Message-ID: <202404240740.I4CcAi2r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a59668a9397e7245b26e9be85d23f242ff757ae8
commit: 377b5b397d073c0aae36b833a5bcac0e6f349243 [6727/7876] Merge tag 'amd-drm-next-6.10-2024-04-19' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240424/202404240740.I4CcAi2r-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404240740.I4CcAi2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240740.I4CcAi2r-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0.c: In function 'smu_v14_0_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0.c:80:52: error: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Werror=format-truncation=]
      80 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                                                    ^~       ~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0.c:80:9: note: 'snprintf' output between 12 and 41 bytes into a destination of size 30
      80 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +80 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0.c

2c79b0bca2bac7 Tim Huang    2024-01-30   63  
fe6cd9152464ed Kenneth Feng 2023-04-26   64  int smu_v14_0_init_microcode(struct smu_context *smu)
fe6cd9152464ed Kenneth Feng 2023-04-26   65  {
fe6cd9152464ed Kenneth Feng 2023-04-26   66  	struct amdgpu_device *adev = smu->adev;
fe6cd9152464ed Kenneth Feng 2023-04-26   67  	char fw_name[30];
fa62c03917732e Kenneth Feng 2023-04-26   68  	char ucode_prefix[30];
fe6cd9152464ed Kenneth Feng 2023-04-26   69  	int err = 0;
fe6cd9152464ed Kenneth Feng 2023-04-26   70  	const struct smc_firmware_header_v1_0 *hdr;
fe6cd9152464ed Kenneth Feng 2023-04-26   71  	const struct common_firmware_header *header;
fe6cd9152464ed Kenneth Feng 2023-04-26   72  	struct amdgpu_firmware_info *ucode = NULL;
fe6cd9152464ed Kenneth Feng 2023-04-26   73  
fe6cd9152464ed Kenneth Feng 2023-04-26   74  	/* doesn't need to load smu firmware in IOV mode */
fe6cd9152464ed Kenneth Feng 2023-04-26   75  	if (amdgpu_sriov_vf(adev))
fe6cd9152464ed Kenneth Feng 2023-04-26   76  		return 0;
fe6cd9152464ed Kenneth Feng 2023-04-26   77  
fe6cd9152464ed Kenneth Feng 2023-04-26   78  	amdgpu_ucode_ip_version_decode(adev, MP1_HWIP, ucode_prefix, sizeof(ucode_prefix));
fe6cd9152464ed Kenneth Feng 2023-04-26   79  
fe6cd9152464ed Kenneth Feng 2023-04-26  @80  	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
fe6cd9152464ed Kenneth Feng 2023-04-26   81  
fe6cd9152464ed Kenneth Feng 2023-04-26   82  	err = amdgpu_ucode_request(adev, &adev->pm.fw, fw_name);
fe6cd9152464ed Kenneth Feng 2023-04-26   83  	if (err)
fe6cd9152464ed Kenneth Feng 2023-04-26   84  		goto out;
fe6cd9152464ed Kenneth Feng 2023-04-26   85  
fe6cd9152464ed Kenneth Feng 2023-04-26   86  	hdr = (const struct smc_firmware_header_v1_0 *) adev->pm.fw->data;
fe6cd9152464ed Kenneth Feng 2023-04-26   87  	amdgpu_ucode_print_smc_hdr(&hdr->header);
fe6cd9152464ed Kenneth Feng 2023-04-26   88  	adev->pm.fw_version = le32_to_cpu(hdr->header.ucode_version);
fe6cd9152464ed Kenneth Feng 2023-04-26   89  
fe6cd9152464ed Kenneth Feng 2023-04-26   90  	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
fe6cd9152464ed Kenneth Feng 2023-04-26   91  		ucode = &adev->firmware.ucode[AMDGPU_UCODE_ID_SMC];
fe6cd9152464ed Kenneth Feng 2023-04-26   92  		ucode->ucode_id = AMDGPU_UCODE_ID_SMC;
fe6cd9152464ed Kenneth Feng 2023-04-26   93  		ucode->fw = adev->pm.fw;
fe6cd9152464ed Kenneth Feng 2023-04-26   94  		header = (const struct common_firmware_header *)ucode->fw->data;
fe6cd9152464ed Kenneth Feng 2023-04-26   95  		adev->firmware.fw_size +=
fe6cd9152464ed Kenneth Feng 2023-04-26   96  			ALIGN(le32_to_cpu(header->ucode_size_bytes), PAGE_SIZE);
fe6cd9152464ed Kenneth Feng 2023-04-26   97  	}
fe6cd9152464ed Kenneth Feng 2023-04-26   98  
fe6cd9152464ed Kenneth Feng 2023-04-26   99  out:
fe6cd9152464ed Kenneth Feng 2023-04-26  100  	if (err)
fe6cd9152464ed Kenneth Feng 2023-04-26  101  		amdgpu_ucode_release(&adev->pm.fw);
fe6cd9152464ed Kenneth Feng 2023-04-26  102  	return err;
fe6cd9152464ed Kenneth Feng 2023-04-26  103  }
fe6cd9152464ed Kenneth Feng 2023-04-26  104  

:::::: The code at line 80 was first introduced by commit
:::::: fe6cd9152464ed086fbeb45b6118ca386ee7aca2 drm/amd/swsmu: add smu14 ip support

:::::: TO: Kenneth Feng <kenneth.feng@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
