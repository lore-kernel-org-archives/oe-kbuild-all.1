Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E325D303CAB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781342487; cv=none; b=MOEaClvFbVshNHaYGVvX1ocoKP1fZZOGzmAmvyJiSmQwavbcbVXJyHtZC8jgCwlLcBNBljKtWP51z9oChFKHmKpgD912tG59lw3G3gtWMgrU8vXW33amHDkKOlYuNg6C1iw1azo7oRBZuiDxrMn6FPeJ0FO6aL+MIhsA9BSY530=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781342487; c=relaxed/simple;
	bh=w5B0N+BawO7WK8LMB1bMM8u1T0BQFoPz4T6CmD/vJi4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X5u2kO2V8ftg5+iLxHBx9szf7pd/f6lN6cduJrsEHYrpNh2rUgkGLaFXUhKTKfFiDCVdfaVV2341QXzvSFH2nkdY+QugkSoCg5cU6F7MdG4wIxNJCfRLjsCBNs55e3PO33vYHN/Iazyt9MJ5ECO93uRqgtx8jOisWMvLvIvbkS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gt0sCqwM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gt0sCqwM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781342486; x=1812878486;
  h=date:from:to:cc:subject:message-id;
  bh=w5B0N+BawO7WK8LMB1bMM8u1T0BQFoPz4T6CmD/vJi4=;
  b=Gt0sCqwMe4FMa5pe0cGDGFzgtq6xUTim2h3VbROGggg7yIVQDBfuAhP6
   AVO0crhhQUFWiz6gRQfnJKYaIAofLglcD0YaYsyDbQKj8PB3JjfXC3L/E
   7DFhshttHDyMTwokH42UU6lRn28i5mWbNVp9WLS4S0v2uCTVXSOOdYkp1
   hJi6xNjzMDVRAMEMKf0g8QTyxZ1fPFYtdwvhSdPnKhuzAgIn9aZzMzQ4Z
   OgibKvx8jZjP8XIm1RQhyPCalNTBqsKAclF/K+09nCb21txIilYP0Lmzs
   SPqMPPlGYuK5dbiRa1pRtn7VqhBp8AfloadE+m+J229r7tEy1tArnCPCq
   g==;
X-CSE-ConnectionGUID: xwu+4AtYS3eVbTa5DElaTg==
X-CSE-MsgGUID: FGxaspfRREqHNShk+oArsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="69705190"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="69705190"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 02:21:25 -0700
X-CSE-ConnectionGUID: RusqzHTETmKoXkHrdQEFJA==
X-CSE-MsgGUID: WqPU9rQ/ROCt3eLSskTYpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="240671889"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Jun 2026 02:21:24 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYKYL-00000000Ppm-0wgy;
	Sat, 13 Jun 2026 09:21:21 +0000
Date: Sat, 13 Jun 2026 17:20:55 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Hennerich <michael.hennerich@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:xlnx/fix/buf-mmap-multibuffer 27139/27391]
 firmware/204C_M4_L4_NP16_20p0_4x4.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202606131754.6T12Xzyj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nunojsa/linux xlnx/fix/buf-mmap-multibuffer
head:   a26a8baba71e866951f6abf4fc6c0504770c272e
commit: 3c64e835a806da27bc896606ca48dd6b92837f81 [27139/27391] firmware: Add Apollo firmware files
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20260613/202606131754.6T12Xzyj-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131754.6T12Xzyj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131754.6T12Xzyj-lkp@intel.com/

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
   firmware/204C_M4_L1_NP16_20p0_16x4.bin: warning: ignored by one of the .gitignore files
>> firmware/204C_M4_L4_NP16_20p0_4x4.bin: warning: ignored by one of the .gitignore files
>> firmware/204C_M4_L8_NP12_16p2_6x1.bin: warning: ignored by one of the .gitignore files
>> firmware/204C_M4_L8_NP16_20p0_4x2.bin: warning: ignored by one of the .gitignore files
>> firmware/204C_M4_L8_NP16_20p0_4x4.bin: warning: ignored by one of the .gitignore files
   firmware/204C_M4_L8_NP16_2p5_4x2.bin: warning: ignored by one of the .gitignore files
>> firmware/204C_M4_L8_NP16_8p0_2x2.bin: warning: ignored by one of the .gitignore files
>> firmware/204C_M4_L8_NP16_8p0_4x2.bin: warning: ignored by one of the .gitignore files
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
>> firmware/app_signed_encrypted_B/flash_image_0x01030000.bin: warning: ignored by one of the .gitignore files
   firmware/app_signed_encrypted_B/flash_image_0x02000000.bin: warning: ignored by one of the .gitignore files
   firmware/app_signed_encrypted_B/flash_image_0x20000000.bin: warning: ignored by one of the .gitignore files
   firmware/app_signed_encrypted_B/flash_image_0x21000000.bin: warning: ignored by one of the .gitignore files
>> firmware/app_signed_encrypted_prod_B/flash_image_0x01030000.bin: warning: ignored by one of the .gitignore files
   firmware/app_signed_encrypted_prod_B/flash_image_0x02000000.bin: warning: ignored by one of the .gitignore files
   firmware/app_signed_encrypted_prod_B/flash_image_0x20000000.bin: warning: ignored by one of the .gitignore files
   firmware/app_signed_encrypted_prod_B/flash_image_0x21000000.bin: warning: ignored by one of the .gitignore files
>> firmware/id01_uc42.bin: warning: ignored by one of the .gitignore files
>> firmware/id01_uc43.bin: warning: ignored by one of the .gitignore files
   firmware/imageon_edid.bin: warning: ignored by one of the .gitignore files
   firmware/stream_image_6E3E00EFB74FE7D465FA88A171B81B8F.bin: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
