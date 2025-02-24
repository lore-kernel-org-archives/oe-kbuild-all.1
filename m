Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5666C1514EE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 14:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407750; cv=none; b=IcJ4gQnzJz4qDkV4TW5mydjMo2YTQ0BKKBrvLKhXAtnY98BVkU7HuZOHT4grQ9/f5mdqHo3PU2JKiyTGQGR+GTryp1E7lQA7Zp3xAMWknN2iFFV6cvHYigYkK7oEl78qOXNbyVuBiceA5OuUrv2gDiTEiyWkGv7/cDFOIB1ONPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407750; c=relaxed/simple;
	bh=Ik49N44wkkI0agS+eke55mtKCwOe2gQAVvTZneYAqnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EFR37V9D1ysFXXTT1ph0cUqUhNtUzSgl7slKRpBSBXFNn1W0qw+hz/FS1gdRjV79iRWVVGoon6AX0KR44gnkFQV+PmFYRNOu6II2L4JMA3YgBBZmIxjBkSZSrlZ1U57a952lsMXm9xD3ikK7XDyclCfcOkzz6h+7aWedHBxG48Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYgTfEY7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYgTfEY7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740407749; x=1771943749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ik49N44wkkI0agS+eke55mtKCwOe2gQAVvTZneYAqnw=;
  b=gYgTfEY72AOsMHsg37gDly7iaW5cUkQv6LWiKRvPr1wXKCT2wUZ/BzOH
   evQhhiPzRxixrnlLqeDj5LqbUit+2p8vujsyBrpBDBjVWPUVKymktDW7Q
   jQOCDI9hybB2ig4uoKaHWep/E/MyYSZgP50j26JHP7tWmgUL9SiIlhScZ
   TyyPGnGcx8LoOHlg5kRdqWSJ6u2sVSZCSV2pZKg7HRHlvaoNMibprhwA8
   Xv0h6yhgwcy7jvvT4mJQ4tBif0N0w1VtCwsf08SB/GPV5jFHjWhaoThn3
   O9YyLi/a3m3NkHvvww/7+/f1DHHvyd36hRA6RXloPZsfDpUZsqHpvBVGH
   w==;
X-CSE-ConnectionGUID: Af8T8PL3Qgi0Iwnvax60iQ==
X-CSE-MsgGUID: ltRq6uIDTgWDm/e5EHaeKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58710804"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="58710804"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 06:35:49 -0800
X-CSE-ConnectionGUID: +FvmEhXwSUKi2PXXIlSCpQ==
X-CSE-MsgGUID: 15tY/UxvT3mFuQPz8mHUnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116056121"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Feb 2025 06:35:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmZYf-0008TJ-0Y;
	Mon, 24 Feb 2025 14:35:45 +0000
Date: Mon, 24 Feb 2025 22:35:00 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [linux-next:master 5115/5954]
 arch/mips/include/asm/mips-cm.h:119:13: warning: 'mips_cm_update_property'
 defined but not used
Message-ID: <202502242237.0xBgT1Tt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4ef7aa6a88280d015c6533a210e46efd55bdb57f
commit: e27fbe16af5cfc40639de4ced67d1a866a1953e9 [5115/5954] MIPS: cm: Detect CM quirks from device tree
config: mips-ath79_defconfig (https://download.01.org/0day-ci/archive/20250224/202502242237.0xBgT1Tt-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502242237.0xBgT1Tt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502242237.0xBgT1Tt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/mips/include/asm/mips-cps.h:106,
                    from arch/mips/kernel/process.c:36:
>> arch/mips/include/asm/mips-cm.h:119:13: warning: 'mips_cm_update_property' defined but not used [-Wunused-function]
     119 | static void mips_cm_update_property(void) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~
--
   arch/mips/kernel/traps.c: In function 'do_mcheck':
   arch/mips/kernel/traps.c:1592:24: warning: variable 'prev_state' set but not used [-Wunused-but-set-variable]
    1592 |         enum ctx_state prev_state;
         |                        ^~~~~~~~~~
   In file included from arch/mips/include/asm/mips-cps.h:106,
                    from arch/mips/kernel/traps.c:55:
   arch/mips/include/asm/mips-cm.h: At top level:
>> arch/mips/include/asm/mips-cm.h:119:13: warning: 'mips_cm_update_property' defined but not used [-Wunused-function]
     119 | static void mips_cm_update_property(void) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/mips_cm_update_property +119 arch/mips/include/asm/mips-cm.h

   109	
   110	/**
   111	 * mips_cm_update_property - update property from the device tree
   112	 *
   113	 * Retrieve the properties from the device tree if a CM node exist and
   114	 * update the internal variable based on this.
   115	 */
   116	#ifdef CONFIG_MIPS_CM
   117	extern void mips_cm_update_property(void);
   118	#else
 > 119	static void mips_cm_update_property(void) {}
   120	#endif
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
