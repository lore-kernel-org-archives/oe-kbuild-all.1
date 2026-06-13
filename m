Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599E93630AD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 19:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781379738; cv=none; b=PenexKGD23is1PhjrSh2O7MNJ2A6poMw2I3gEfPlVEpYluWaoB1QEY0DRtUoFl/DaPQwcQdIUWl+azM1AVUeI42bL8hrEGmLXxah9721dFcnc68gQGd01L3ZPAy/QrttsvVIuyFTmu0d+/XH574WOxHiO33dD/wRT4kZAtfgHgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781379738; c=relaxed/simple;
	bh=ihAAiFqD4vzjZ6/J/tZ2BWSdfXdYoRTDiX1sWB9Axqk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=keoocXv8kfth3U8aqAVzlxVuYA3WudJJc62uJaZA4g0L/xQFFIyVEom3pJqRd+vaRjFhSWEWIkpmpR7GgePL95+hlCvhtCdnPjomcGvWtLQ7I/hqNRh3jyn1QLVXxnHnO7R/JFWsfUODYkLIj8Fsh6tOWjZN1WX7i0cFsC4svLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8N/Td5X; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8N/Td5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781379736; x=1812915736;
  h=date:from:to:cc:subject:message-id;
  bh=ihAAiFqD4vzjZ6/J/tZ2BWSdfXdYoRTDiX1sWB9Axqk=;
  b=H8N/Td5XcwuemYkrJD6+sK1NvyEo9du882Xefby1kyMxq7AcqXKWxJxy
   jGmmFmZgjqCdNP6j7QoRfPFiS3XM189JakAOTobtbgA0lUq+lJxTRJGhD
   3XoiSWjwtXtPG1z455qcE9jV4Q6FVWmgUOMfR2QL7prL3/kVVuatCjKD+
   EG0v0nuS9v9ccMgYghm3+Hs9t5zHnhuj09YolahQZa1Iv89MPSRKJK9Ww
   VQbyhRbpQc0DGjhSVrpuoq3j6g8th6UK+2qtZaNyN7cQqjdkPUk0iTGib
   GiZkxfCsd2EtcYny58JGWLqNPEW39SNw/AF4kLObUL22TJqxQYYMdXcBU
   g==;
X-CSE-ConnectionGUID: HaDpNf9IRfuySPQj8NFRGQ==
X-CSE-MsgGUID: ovQYfeAJScWWCwxhSmNXjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="81312820"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="81312820"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 12:42:16 -0700
X-CSE-ConnectionGUID: Sb4RKNPZTy+nd/2sDUOnBw==
X-CSE-MsgGUID: odFudOamSSyTIsRn0n8MSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="271163910"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jun 2026 12:42:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYUF9-00000000QE0-405c;
	Sat, 13 Jun 2026 19:42:11 +0000
Date: Sun, 14 Jun 2026 03:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Travis F. Collins" <travis.collins@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:xlnx/fix/buf-mmap-multibuffer 27231/27391]
 firmware/204C_M4_L1_NP16_20p0_4x16.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202606140347.8pBGIBxw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nunojsa/linux xlnx/fix/buf-mmap-multibuffer
head:   a26a8baba71e866951f6abf4fc6c0504770c272e
commit: ef512f712856fcf8837737a868f490da2c4f8d2b [27231/27391] firmware: Update AD9084 profiles to v2.0.0
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20260614/202606140347.8pBGIBxw-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140347.8pBGIBxw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140347.8pBGIBxw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .github/CODEOWNERS: warning: ignored by one of the .gitignore files
   .github/PULL_REQUEST_TEMPLATE.md: warning: ignored by one of the .gitignore files
   .github/issue_template: warning: ignored by one of the .gitignore files
   .github/workflows/dispatch-mirror.yml: warning: ignored by one of the .gitignore files
   .github/workflows/dispatch-sync-ci.yml: warning: ignored by one of the .gitignore files
   .github/workflows/llm.yml: warning: ignored by one of the .gitignore files
   .github/workflows/main.yml: warning: ignored by one of the .gitignore files
   .github/workflows/pr-closed.yml: warning: ignored by one of the .gitignore files
   .github/workflows/top-level.yml: warning: ignored by one of the .gitignore files
   firmware/204C_8T8R_M8_L2_NP16_8p0_4x8.bin: warning: ignored by one of the .gitignore files
>> firmware/204C_M4_L1_NP16_20p0_4x16.bin: warning: ignored by one of the .gitignore files
   firmware/204C_M4_L4_NP16_20p0_4x4.bin: warning: ignored by one of the .gitignore files
   firmware/204C_M4_L8_NP12_16p2_6x1.bin: warning: ignored by one of the .gitignore files
   firmware/204C_M4_L8_NP16_20p0_4x2.bin: warning: ignored by one of the .gitignore files
   firmware/204C_M4_L8_NP16_20p0_4x4.bin: warning: ignored by one of the .gitignore files
   firmware/204C_M4_L8_NP16_8p0_2x2.bin: warning: ignored by one of the .gitignore files
   firmware/204C_M4_L8_NP16_8p0_4x2.bin: warning: ignored by one of the .gitignore files
   firmware/ADRV9025_DPDCORE_FW.bin: warning: ignored by one of the .gitignore files
   firmware/ADRV9025_FW.bin: warning: ignored by one of the .gitignore files
   firmware/Mykonos_M3.bin: warning: ignored by one of the .gitignore files
   firmware/Navassa_CMOS_init_cals.bin: warning: ignored by one of the .gitignore files
   firmware/Navassa_CMOS_init_cals_adrv9003.bin: warning: ignored by one of the .gitignore files
   firmware/Navassa_EvaluationFw.bin: warning: ignored by one of the .gitignore files
   firmware/Navassa_LVDS_init_cals.bin: warning: ignored by one of the .gitignore files
   firmware/Navassa_LVDS_init_cals_adrv9003.bin: warning: ignored by one of the .gitignore files
   firmware/Navassa_Stream.bin: warning: ignored by one of the .gitignore files
   firmware/TaliseRxArmFirmware.bin: warning: ignored by one of the .gitignore files
   firmware/TaliseStream.bin: warning: ignored by one of the .gitignore files
   firmware/TaliseTDDArmFirmware.bin: warning: ignored by one of the .gitignore files
   firmware/TaliseTxArmFirmware.bin: warning: ignored by one of the .gitignore files
   firmware/adau1761.bin: warning: ignored by one of the .gitignore files
   firmware/app_signed_encrypted_B/flash_image_0x01030000.bin: warning: ignored by one of the .gitignore files
   firmware/app_signed_encrypted_B/flash_image_0x02000000.bin: warning: ignored by one of the .gitignore files
   firmware/app_signed_encrypted_B/flash_image_0x20000000.bin: warning: ignored by one of the .gitignore files
   firmware/app_signed_encrypted_B/flash_image_0x21000000.bin: warning: ignored by one of the .gitignore files
   firmware/app_signed_encrypted_prod_B/flash_image_0x01030000.bin: warning: ignored by one of the .gitignore files
   firmware/app_signed_encrypted_prod_B/flash_image_0x02000000.bin: warning: ignored by one of the .gitignore files
   firmware/app_signed_encrypted_prod_B/flash_image_0x20000000.bin: warning: ignored by one of the .gitignore files
   firmware/app_signed_encrypted_prod_B/flash_image_0x21000000.bin: warning: ignored by one of the .gitignore files
   firmware/id01_uc42.bin: warning: ignored by one of the .gitignore files
   firmware/id01_uc43.bin: warning: ignored by one of the .gitignore files
   firmware/imageon_edid.bin: warning: ignored by one of the .gitignore files
   firmware/stream_image_6E3E00EFB74FE7D465FA88A171B81B8F.bin: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
