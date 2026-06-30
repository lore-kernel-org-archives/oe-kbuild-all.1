Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56231DB92C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 00:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782779932; cv=none; b=iml7XTuJruRY3FonHnkmRL0F3M4Gb2+9tbv81W5z5wUkxijb5eK0deZnGeEMSCJtvaz+ave3FNJXbyYaebbPB33rPnFYKLtKECMfp+mX+Iz2QJ8JFphYtbydTSIIOKFvvaxrWNcgJ+lBADt2jttSk8JgXZ2IWwRF3GVz+n60c74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782779932; c=relaxed/simple;
	bh=pGFSAp96bWf4HABqQGAurKb3uaZFTipDEVi4+/VXBl8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l4Dr7JFDDr6P5bPgNPfPLCUmgsfq4sNCf2lNC0LE2tONMfpro2thcHoWOlqK/wDLI8N+QSqNdT8AIWrV4tgFdJZ8ILElxioSDptTQLb92GF8WJFxzAsQ8xcprVrYV6j+/DA60TjmvexSTnYHlOruPmZQFXp3cKC5VVtm/nWXWtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbG5O/PO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbG5O/PO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782779930; x=1814315930;
  h=date:from:to:cc:subject:message-id;
  bh=pGFSAp96bWf4HABqQGAurKb3uaZFTipDEVi4+/VXBl8=;
  b=YbG5O/PO+vtvq0FWgEvrIQkBH1kVg/zNkuxRSNhxYLxOKTMTB5pSHk0/
   NI/oNYWlpJkvLmS2Z6olH3ymjPj55xjueTf20LdCXr45CJAnJ8ElSmEY6
   aFcwFjXHZFZgCtUdAGaWAgcVoyFr5PpFWFClKDbad8n/YnW6+afWJyepg
   sHoEn8KyPRDxDk+JBOmeg6DIsg/27yAPoR1Gduj9k46DUezDIJXvu3wua
   RLajEOfIclbnR5OWeDTrIFe3xdzstidQLV5MiqXcJfd91y/fKltWHvP8Z
   AfjcIF5mQqPZ1rel2+OipOLHT8PKhwSVnj+u/0BegPsDDW/pri9o6QebD
   A==;
X-CSE-ConnectionGUID: OLLdRaAsRI6uRQ5eXy7pUg==
X-CSE-MsgGUID: pFlEUeFQQie6ykGu7cPpMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="87399083"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="87399083"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 17:38:46 -0700
X-CSE-ConnectionGUID: c2JAjeDOT6Wu/VWXG7H1oQ==
X-CSE-MsgGUID: jexrNDeLRLi/igz0xea5cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="251704028"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 Jun 2026 17:38:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weMUr-000000007t7-29XB;
	Tue, 30 Jun 2026 00:38:41 +0000
Date: Tue, 30 Jun 2026 08:38:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-xs-decode 2/2]
 include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of
 type 'long unsigned int', but argument 2 has type 'long long unsigned int'
Message-ID: <202606300830.uIiXUVTT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-xs-decode
head:   400df87aee7b6f393e5d363d377cb5a613f8b37a
commit: 400df87aee7b6f393e5d363d377cb5a613f8b37a [2/2] arm64: mm: When logging data aborts only decode Xs when ISV=1
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260630/202606300830.uIiXUVTT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606300830.uIiXUVTT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300830.uIiXUVTT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/slab.h:15,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:14,
                    from arch/arm64/mm/fault.c:10:
   arch/arm64/mm/fault.c: In function 'data_abort_decode':
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'long long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:534:9: note: in expansion of macro 'printk'
     534 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:9:25: note: in expansion of macro 'KERN_SOH'
       9 | #define KERN_ALERT      KERN_SOH "1"    /* action must be taken immediately */
         |                         ^~~~~~~~
   include/linux/printk.h:534:16: note: in expansion of macro 'KERN_ALERT'
     534 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   arch/arm64/mm/fault.c:79:17: note: in expansion of macro 'pr_alert'
      79 |                 pr_alert("  Xs = %lu\n",
         |                 ^~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
