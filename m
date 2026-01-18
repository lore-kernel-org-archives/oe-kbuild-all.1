Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83B62AD03
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 02:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768702179; cv=none; b=VEv+N2ju1MX3TTyTkzyPB+x7eKJI5TRkqFX9+ir7jn9VsM4YVjCarotKOiz9K2Q7AZwtt+kJ04gX6SxkW9CAtZfaLsItoCSnkHIz4clR8jyt9htERF6qHon6aKK/vhbBY6/C+9iDyQYGEmuOMvxTSjfaLN3Y1r0H0NddxZW1V7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768702179; c=relaxed/simple;
	bh=koM5/iM8YnRZYCZVi6J1q79X/iyz7Nx3Gdg4A76tOpM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ogmD06m/VpLDGFKMPj4Yh9Vt1Doh3Shhy/xhNI+gQnRW6UTzVZxjDwd5H4YPD2vb/jUoutT8ap1hB/Zdt9T0FZL0Jk/cf/5Cd6cVnzj7JvmTcG5+346VQGmmADvzQduQiDtyFKI9hLIYPi6xDomiZpKDp5LYuxNXY+BpDwPbPP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZbKsX8/c; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZbKsX8/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768702178; x=1800238178;
  h=date:from:to:cc:subject:message-id;
  bh=koM5/iM8YnRZYCZVi6J1q79X/iyz7Nx3Gdg4A76tOpM=;
  b=ZbKsX8/cSCy+ivmGLNdGawYf84FfmJfpgJ9wuAMiKxzIRN+p6nukuTXJ
   2AEZUjZnsAsbmYa1TGesbMb3QLIVLMg/F2YA4VDRbNaI9bLVz6aIWrgDG
   6TFnwSfT6YR60I9uxU4Pt+V4Zc6u17yjdZQq75Rod4DcbSqvti4v44ziA
   fjlJtCSU/M8PVvkQLT1dghPc3FyrlLr9ncuUi2jiHO5+pa7V5NgIhVG62
   zWbHCVkmREhS8n+JAnPipuKvc+O6UcqcsCao0hkgzuPr+SGWR+OZyTW/J
   eRYQcn4MYfco77/joSrCX4Io+1hQoyf9bK7bOWAI5WPhNJw8Dxs3HDR16
   A==;
X-CSE-ConnectionGUID: 7oyb28idQy+2yb7bMmsRoA==
X-CSE-MsgGUID: Aqae5T1aRF2KEb/D0sUi+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="57515986"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="57515986"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 18:09:36 -0800
X-CSE-ConnectionGUID: YnRaWT/FRZOkYcURcuVy1A==
X-CSE-MsgGUID: VwXyh0xaTRmapz275IF5zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205353011"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jan 2026 18:09:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhIEN-00000000MXU-2oM4;
	Sun, 18 Jan 2026 02:09:31 +0000
Date: Sun, 18 Jan 2026 10:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:for-next 44/44] nios2-linux-ld:
 smb2maperror.c:undefined reference to `kunit_binary_ptr_assert_format'
Message-ID: <202601181036.qzM6PieP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git for-next
head:   7e2b963b93483080d900f13e152acb63b7149f7a
commit: 7e2b963b93483080d900f13e152acb63b7149f7a [44/44] smb/client: introduce KUnit test to check search result of smb2_error_map_table
config: nios2-randconfig-001-20260117 (https://download.01.org/0day-ci/archive/20260118/202601181036.qzM6PieP-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181036.qzM6PieP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181036.qzM6PieP-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: fs/smb/client/smb2maperror.o: in function `maperror_test_check_search':
   smb2maperror.c:(.text+0xac): undefined reference to `kunit_binary_ptr_assert_format'
>> nios2-linux-ld: smb2maperror.c:(.text+0xb0): undefined reference to `kunit_binary_ptr_assert_format'
>> nios2-linux-ld: smb2maperror.c:(.text+0xd8): undefined reference to `__kunit_do_failed_assertion'
>> smb2maperror.c:(.text+0xd8): relocation truncated to fit: R_NIOS2_CALL26 against `__kunit_do_failed_assertion'
>> nios2-linux-ld: smb2maperror.c:(.text+0xfc): undefined reference to `kunit_binary_assert_format'
   nios2-linux-ld: smb2maperror.c:(.text+0x100): undefined reference to `kunit_binary_assert_format'
   nios2-linux-ld: smb2maperror.c:(.text+0x130): undefined reference to `__kunit_do_failed_assertion'
   smb2maperror.c:(.text+0x130): relocation truncated to fit: R_NIOS2_CALL26 against `__kunit_do_failed_assertion'
   nios2-linux-ld: smb2maperror.c:(.text+0x168): undefined reference to `kunit_binary_assert_format'
   nios2-linux-ld: smb2maperror.c:(.text+0x16c): undefined reference to `kunit_binary_assert_format'
   nios2-linux-ld: smb2maperror.c:(.text+0x194): undefined reference to `__kunit_do_failed_assertion'
   smb2maperror.c:(.text+0x194): relocation truncated to fit: R_NIOS2_CALL26 against `__kunit_do_failed_assertion'
>> nios2-linux-ld: smb2maperror.c:(.text+0x1bc): undefined reference to `kunit_binary_str_assert_format'
   nios2-linux-ld: smb2maperror.c:(.text+0x1c0): undefined reference to `kunit_binary_str_assert_format'
   nios2-linux-ld: smb2maperror.c:(.text+0x1e8): undefined reference to `__kunit_do_failed_assertion'
   smb2maperror.c:(.text+0x1e8): relocation truncated to fit: R_NIOS2_CALL26 against `__kunit_do_failed_assertion'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
