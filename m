Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9182747B413
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 20:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782852722; cv=none; b=bhheX9w3liO7K7vXpKz4xRqNBNvT6Q7NecXEr2A4wdEBeqjFR6pQe9AD8Zq7D2DC1ym21+meWd0lOAyGjXLMNEbNgwBIVHDbmPwxUYqJXrkj50Re8r1dUXckIwQZzw/ZhqTdS8oB8D+aOOF82I5RRytmPfK7sAuINReRmHuyRTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782852722; c=relaxed/simple;
	bh=3t1YhUUhMZa5M+ivGQOMFVLFGUpXbw/aj8YdLoyfwxc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d6GcdKQkHvogF5wq5OoarMwksJlM6LqL2nsrnd/ItrEKX/Fck7Xwq70ZDcyOzY4J67nEId0F+IhXwwu3gop+Wq07zVAGV94i4JpV1ygB0rgr4bkzhYv1C8xocXiB7a6oS4dR5yXyo0zJV8NaOuMIY5cUCtZmmozyGWx9rBjwuIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TaNPKmoa; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TaNPKmoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782852720; x=1814388720;
  h=date:from:to:cc:subject:message-id;
  bh=3t1YhUUhMZa5M+ivGQOMFVLFGUpXbw/aj8YdLoyfwxc=;
  b=TaNPKmoaFqoAXxVaZgwAdjMV3lEiDV7ixOfyRw+vaAl2+caEprbay83A
   B9dUEw5m0uCBzmA41GGyCLseGSTubycUwRLZsxtaPUvQn3p9AT/eFfBfB
   PxPn7l6zTzbQ1FOOc+xla8K9ZvLETsoLfD8XbffvsSvJEnbYsnIAB7xD6
   IENfInSxe/xiPi7kg7sjaHWwbjfbHtIi+3jSIAvDKiVJb2hW2KrYgKDAo
   orRJdLxQmlAtiVuqjhAGWYoWrSS0ovvI/PYQgjnKLlsClKHmdRUFP7E7f
   SwyClNiGE5no9yONhOW+QQkc0mo2vTGhaKZZXWkzleMbmo5Rhp3FSixDp
   g==;
X-CSE-ConnectionGUID: GSZAR5GKSoioaRqF5vEiFg==
X-CSE-MsgGUID: Cr15zk5aRzWixOSdEgAJcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="82565248"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="82565248"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 13:52:00 -0700
X-CSE-ConnectionGUID: GUE4cmX+RK+Q70K8Kgq4HA==
X-CSE-MsgGUID: n3rt1u4QQH24ZlmaFE6BWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="282424766"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 30 Jun 2026 13:51:58 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wefQy-000000000Yf-1c4x;
	Tue, 30 Jun 2026 20:51:56 +0000
Date: Tue, 30 Jun 2026 22:51:43 +0200
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:sdei-nmi/diag-complete-off 5/5]
 ./include/linux/arm_sdei.h:16:50: error: expected identifier or '(' before
 numeric constant
Message-ID: <202606302210.fzykbTJM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git sdei-nmi/diag-complete-off
head:   9c7998bb7f7765535361c4ac0087f1401b3eecd4
commit: 9c7998bb7f7765535361c4ac0087f1401b3eecd4 [5/5] arm64/sdei: DIAG complete-then-CPU_OFF for the SDEI stop (Grace re-online test)
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260630/202606302210.fzykbTJM-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606302210.fzykbTJM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606302210.fzykbTJM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/smp.c:10:
>> ./include/linux/arm_sdei.h:16:50: error: expected identifier or '(' before numeric constant
      16 | #define sdei_arch_get_entry_point(conduit)      (0)
         |                                                  ^
   ./arch/arm64/include/asm/sdei.h:56:15: note: in expansion of macro 'sdei_arch_get_entry_point'
      56 | unsigned long sdei_arch_get_entry_point(int conduit);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/smp.c:11:
>> ./arch/arm64/include/asm/sdei.h:57:9: warning: "sdei_arch_get_entry_point" redefined
      57 | #define sdei_arch_get_entry_point(x)    sdei_arch_get_entry_point(x)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/arm_sdei.h:16:9: note: this is the location of the previous definition
      16 | #define sdei_arch_get_entry_point(conduit)      (0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +16 ./include/linux/arm_sdei.h

ad6eb31ef90355 James Morse 2018-01-08  13  
ad6eb31ef90355 James Morse 2018-01-08  14  /* Arch code should override this to set the entry point from firmware... */
ad6eb31ef90355 James Morse 2018-01-08  15  #ifndef sdei_arch_get_entry_point
ad6eb31ef90355 James Morse 2018-01-08 @16  #define sdei_arch_get_entry_point(conduit)	(0)
ad6eb31ef90355 James Morse 2018-01-08  17  #endif
ad6eb31ef90355 James Morse 2018-01-08  18  

:::::: The code at line 16 was first introduced by commit
:::::: ad6eb31ef90355993eb55ff77e0e855ae7d91e4c firmware: arm_sdei: Add driver for Software Delegated Exceptions

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
