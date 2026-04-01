Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178BB32C92D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 06:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025400; cv=none; b=bUKDTjcTstmgZCjDRlCH2jzCIvsfaPnKXc1m+hdBzLSqfX150nRxjFOvDYxvtFOJEmQxrFGnwcVJdih65Xh13N5KAntK+X4Mk6tt+xOGpyBjRmDuVVA6f7ttio/gIUTSpyHuDSSUYZm2AaBzXQ9Mb7AhLBL+ftvsyT8orBMWpio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025400; c=relaxed/simple;
	bh=JjkZPltDb7kpJjJg97jlr7ibKdXKPRT9sZJ4qruGYA8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DwGbw9xbpe+OuLulOkZqR/+HP21x3siBhMSzjblYSGxk8ylCJD1SvmWApQ5h7Aw9+oyxLQHlFpQwQOAxwwXv5q2MB59tM1++sULEF9auTkzWnI2pi+gYikqaeSvzpuEZ/2ULZXa6CzEvmJF3VM9SzAEaCfhGgy6X1j9x4cuYlE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y0n8Xo95; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y0n8Xo95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775025400; x=1806561400;
  h=date:from:to:cc:subject:message-id;
  bh=JjkZPltDb7kpJjJg97jlr7ibKdXKPRT9sZJ4qruGYA8=;
  b=Y0n8Xo95R9jS/n2qjxSEkh61eH7xKebcrocI5+v/U+ptaaSQjKgAp8gi
   0qLgMj6cx9ZvtoHiiN6XqhdDlkk7uXC2GU5Uhdv1Itr17qUlTVSrp6UaN
   kHW8W72mBJ+6yMXTEAdU+86fGYClJqX1UfgrnzTJOiwdwkmcxiOqz4iWu
   IjHsdNa3oydCyzsTpr9iLrp99wI5n9uXcFIpdzsxlJB95YZMcZZ8ewmlp
   rikBJvjhCMPIFwCpMg1PNKCtkKPmRo9Wm9bunIrZbKZ5+il4+DIQ+Sgfe
   K1+ilXLmnZPJzy9QC5ulSUUk/LS/XgjuRwfuagOYov3ZzfHUz2HN/Q6zb
   Q==;
X-CSE-ConnectionGUID: KzzEzr7/RFerb6OV/LKOEw==
X-CSE-MsgGUID: hmktu8emQEe8+ljRnvtIbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87514014"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="87514014"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 23:36:37 -0700
X-CSE-ConnectionGUID: 9ehhimq8QFC1r1wUDA36IA==
X-CSE-MsgGUID: hPXhb3TLShyia5soQzJw0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="249805323"
Received: from lkp-server01.sh.intel.com (HELO 699e4e600a11) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Mar 2026 23:36:34 -0700
Received: from kbuild by 699e4e600a11 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7pBo-0000000002p-28k0;
	Wed, 01 Apr 2026 06:36:32 +0000
Date: Wed, 01 Apr 2026 14:36:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v7.0-rc2/obt 4/5]
 drivers/misc/lkdtm/bugs.c:871:32: sparse: sparse: cast truncates bits from
 constant value (7fffffff becomes ffff)
Message-ID: <202604011422.wBVoh3e2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.0-rc2/obt
head:   4ea34e6b6a719e744a10a08cbe8d0fdaa4682f9a
commit: 9ec0cb0c2fb8323a3aff6678a73c2f91a98f94f2 [4/5] lkdtm/bugs: Add basic Overflow Behavior Types test
config: alpha-randconfig-r133-20260401 (https://download.01.org/0day-ci/archive/20260401/202604011422.wBVoh3e2-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011422.wBVoh3e2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011422.wBVoh3e2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/misc/lkdtm/bugs.c:835:17: sparse: sparse: cast truncates bits from constant value (7fffffff becomes ff)
   drivers/misc/lkdtm/bugs.c:857:17: sparse: sparse: cast truncates bits from constant value (7fffffff becomes ff)
>> drivers/misc/lkdtm/bugs.c:871:32: sparse: sparse: cast truncates bits from constant value (7fffffff becomes ffff)
   drivers/misc/lkdtm/bugs.c:874:22: sparse: sparse: cast truncates bits from constant value (7fffffff becomes ffff)

vim +871 drivers/misc/lkdtm/bugs.c

   819	
   820	static void lkdtm_OBT_ASSIGN_TRUNCATE_TO(void)
   821	{
   822		volatile int big = INT_MAX;
   823		volatile int wide_low_value = 5;
   824		u8 __ob_trap narrow_low_value = 0;
   825		s32 __ob_trap same = 0;
   826		u8 __ob_trap small = 0;
   827	
   828		pr_info("Performing same-width assignment to OBT\n");
   829		same = big;
   830	
   831		pr_info("Performing small-value assignment to OBT\n");
   832		narrow_low_value = wide_low_value;
   833	
   834		pr_info("Expecting trap on truncated assignment to OBT\n");
 > 835		small = big;
   836	
   837		pr_err("FAIL: survived overflowing truncated assignment to OBT: %d -> %u (ok: %d -> %u)\n",
   838			same, small, wide_low_value, narrow_low_value);
   839		pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
   840	}
   841	
   842	static void lkdtm_OBT_ASSIGN_TRUNCATE_FROM(void)
   843	{
   844		volatile s32 __ob_trap big = INT_MAX;
   845		volatile s32 __ob_trap wide_low_value = 5;
   846		u8 narrow_low_value = 0;
   847		s32 same = 0;
   848		u8 small = 0;
   849	
   850		pr_info("Performing same-width assignment from OBT\n");
   851		same = big;
   852	
   853		pr_info("Performing small-value assignment from OBT\n");
   854		narrow_low_value = wide_low_value;
   855	
   856		pr_info("Expecting trap on truncated assignment from OBT\n");
   857		small = big;
   858	
   859		pr_err("FAIL: survived overflowing truncated assignment from OBT: %d -> %u (ok: %d -> %u)\n",
   860			same, small, wide_low_value, narrow_low_value);
   861		pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
   862	}
   863	
   864	static void lkdtm_OBT_CAST_TRUNCATE(void)
   865	{
   866		volatile u32 __ob_trap big = INT_MAX;
   867		u32 trunc = 0;
   868		u32 small = 0;
   869	
   870		pr_info("Performing wrapping too-small cast\n");
 > 871		trunc = (u16 __ob_wrap)big;
   872	
   873		pr_info("Expecting trap on too-small cast\n");
   874		small = (s16)big;
   875	
   876		pr_err("FAIL: survived truncated casting: %u -> %u (ok: %u -> %u)\n",
   877			big, small, big, trunc);
   878		pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
   879	}
   880	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
