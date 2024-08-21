Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5333C79D1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 22:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724278386; cv=none; b=g8EtimwGaD6iGzAL3SVeO1f3Q3fYW6CZjg9hko+bOAQ+CZjXrigIunrAU5nYifKu7TmZaGaZ3ArSaHvhYDaol5XwjUvJdqLT7XV8AzxhEolOu2xcCt4O7nvyvTM0YQj5eqxxuCs3XhGbj8/f/VksF3y6Q3uKK50l3W1hWUoGQc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724278386; c=relaxed/simple;
	bh=qoMToTjLl/lQDrKvoGc09L8TXPQnTv/WgzFa4hcIVCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubicyZZNLsx3/3+1v18tzK2L7S/hWIFTrIXABCClHgBZwMcIk/i1zHnNRKsoJovpz7Ddr+ha73GZFPJuBrS4M8dUc3gGLu02fmWc8olbvFN40guD3Z7KW5qSOAk9Gn2bDtvlWUWG6ZvZSUv83wYs7SvkNzSd9fA3Ka90WQca60A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKthjrRs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKthjrRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724278384; x=1755814384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qoMToTjLl/lQDrKvoGc09L8TXPQnTv/WgzFa4hcIVCw=;
  b=TKthjrRsWFldrbegAhGLD+sZjnrs5ZgAJtK3+/xiP8Vpl3ps/l+Nag2o
   6aQ6pyAA0LR47AhWQ0e0o365n2cNNB5YALLCH9wus7ZaCgCwd02AOM8Fj
   p9zzT/IbadEKl55KGOEE5YyhRJNFxCCyvM1HtdFMQDiIzHdl8qPfboj1+
   /oMcqbp7+zdzQsrH8ORSLphvWM96ODVAIQUkTObCGiCUjlNnINSicRsC4
   RSYN9Iwf4ORq4P2X4X7SLfKIvro4/C3032gwchzRk2cWk53qfmkHQAgw+
   E7Wm4ZoFyrVQIyN44BrcqiUt674sl0X/Tyz3e8T+0pmrxPvo3NMyxl9+N
   g==;
X-CSE-ConnectionGUID: WYvDsL5YSp+thyhsZmHEGA==
X-CSE-MsgGUID: Q1bC2/mKTAmeD7no3wPvAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="48061803"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="48061803"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 15:13:03 -0700
X-CSE-ConnectionGUID: uFbzJMBCQOekzbGofyuodQ==
X-CSE-MsgGUID: PYs6jyrYTqOUb02V556H0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="66175253"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Aug 2024 15:13:03 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgtZc-000C0c-1j;
	Wed, 21 Aug 2024 22:13:00 +0000
Date: Thu, 22 Aug 2024 06:12:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] powerpc/mm: Fix return type of pgd_val()
Message-ID: <202408220601.673Z2Y21-lkp@intel.com>
References: <c24efad37454ae48eebe79b7da10a3a4770b966a.1724157845.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c24efad37454ae48eebe79b7da10a3a4770b966a.1724157845.git.christophe.leroy@csgroup.eu>

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/powerpc-mm-Fix-return-type-of-pgd_val/20240820-204522
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/c24efad37454ae48eebe79b7da10a3a4770b966a.1724157845.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH] powerpc/mm: Fix return type of pgd_val()
config: powerpc-ppc64e_defconfig (https://download.01.org/0day-ci/archive/20240822/202408220601.673Z2Y21-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408220601.673Z2Y21-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220601.673Z2Y21-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/pagemap.h:8,
                    from mm/pgtable-generic.c:10:
   mm/pgtable-generic.c: In function 'pgd_clear_bad':
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'long long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_ERR'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/powerpc/include/asm/nohash/64/pgtable.h:165:9: note: in expansion of macro 'pr_err'
     165 |         pr_err("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, pgd_val(e))
         |         ^~~~~~
   mm/pgtable-generic.c:27:9: note: in expansion of macro 'pgd_ERROR'
      27 |         pgd_ERROR(*pgd);
         |         ^~~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
