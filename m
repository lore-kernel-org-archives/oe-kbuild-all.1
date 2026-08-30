Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D16819CD0A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 21:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788125684; cv=none; b=ShsvtqYuknz1fxCyepAdw3DPIgOFzjDQ0ycNdiVyYTRGQ5o+EqQ7zLDB40SG6Cb0cai8VL98au99paVV1/PyxYl02PV/huhQ/8Hjc0J6t70Dhq7HDSIUNwwLaQfdMy/Rc3A691Nk2p6Qc5zdKdVvZcy/1ZhWuN3F+LIQh66yXK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788125684; c=relaxed/simple;
	bh=eMakZ5uWb0TLNU8gwlWBhze/AL+/a4VgmfD6Yc5VTAA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O5qssSWQL87QjTjtZKX0XXOMz1h4l58LcQOk1wcmQVkr3HvTGOtcpk2Iadb6Lc7oh635XUjrDVktLsvIcbbrWm8/OrQF7bqEu3yO1HcbM3bNAOpNfj1JXs3xSnAaivACB4+rWE4+LPX4Vjg1vGcngfHEqlRdB37jj81DO+erpQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ji0amnT1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ji0amnT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788125682; x=1819661682;
  h=date:from:to:cc:subject:message-id;
  bh=eMakZ5uWb0TLNU8gwlWBhze/AL+/a4VgmfD6Yc5VTAA=;
  b=Ji0amnT13wHmsmV0sEC4zUy6oIUthmO3Y32iULw9T4kMmfqO2Vn8OAzw
   xwjYDzFOLxFgoGqrcrjrEHKZfTeJTweW0dUmobmMEKDlelWBCgRjmdb2a
   T1haGV0vareLisoEHqBQYz8H/Jyj3rapdLirjWi9PTd2up0qEPyy4sTFj
   OL5d44c4c2fxExmXM9Nn69JfIJl3ald722Pm1OkPqjutyVOXxgH5qZtpo
   hlzCxefCKvKCPF3RXmGO4UIHhf7oL7U0v5kmoFXe3oHzE+Ox9kzLJiR27
   Rb6fupIjA6IFImprFeKMLqSx7ofpNl7OstnlJMOLrZIUeTHq+2ElcpHeX
   Q==;
X-CSE-ConnectionGUID: KAW87TbcQXO5QnDrKqhqxw==
X-CSE-MsgGUID: 7v2QPx/3Tfaukh1SMROJGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99885611"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99885611"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 14:34:42 -0700
X-CSE-ConnectionGUID: oBvsPyF2SdWgNMc7k5fzVQ==
X-CSE-MsgGUID: sdK16rbGSO2hYHawox1PZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="306869730"
Received: from lkp-server01.sh.intel.com (HELO 12c799cf0c09) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Aug 2026 14:34:41 -0700
Received: from kbuild by 12c799cf0c09 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0nAU-0000000004N-0Qg1;
	Sun, 30 Aug 2026 21:34:25 +0000
Date: Mon, 31 Aug 2026 05:26:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kelvin Zhang <zhangxp1998@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:feature/subpage 9/10]
 file.c:(.text.f2fs_sec_trim_file+0xe08): undefined reference to
 `__aeabi_ldivmod'
Message-ID: <202608310457.IU02LlMJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/subpage
head:   3a537197e7b9327a386b4c5deab273a387072d1f
commit: 7967e8f5c2c2f347acdc20281027d28c46b8a9e1 [9/10] f2fs: parameterize block size and mask macros
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260831/202608310457.IU02LlMJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608310457.IU02LlMJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608310457.IU02LlMJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/f2fs/file.o: in function `f2fs_sec_trim_file':
>> file.c:(.text.f2fs_sec_trim_file+0xe08): undefined reference to `__aeabi_ldivmod'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
