Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C84D4085D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 18:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724264275; cv=none; b=ON2AzapVZwe7kdu1mlZ8DWZF1dOk3Z9W870l4IAdWMzCisfI89Y2xcuDQk7Sd4+svTmW2zn3vANEJj3UlERL2nk7qsDBnqxhFWeuRstzDXlA95dG6n7Os15VnRQIZnAh4vseQl0k9eF1iLqGbXhpp44vq41Vv/TURgUBJJb3VFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724264275; c=relaxed/simple;
	bh=xu1UvmbD4WMZAblFQVw+aqWVY6uS8LEdM+hsGoQqjEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfdzrPGdM+Xa2PB/l0vVyCx2TwHVsUxyTYjhtYhpO2Nv7Ibrq7NEFkh9NtwIlVUKICT0T//bYtbbtLwOYdLpFQqkrcQ508NtFcyu1viuycSYeb1ZYSID67EiD9A29bAWxc7RX9W3R4RC5n9M/Ek7SXxpEC23sH/vN09KoQbjO5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdFIY+m0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdFIY+m0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724264274; x=1755800274;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xu1UvmbD4WMZAblFQVw+aqWVY6uS8LEdM+hsGoQqjEQ=;
  b=CdFIY+m0I1Xouq92yzMeAgn1awTonw3XuB3JgU6O2j2oqoVaKRwksVJw
   TgPFGdf3AOrJhVrdl6RfDiFuKULo1lSFFAD45FxHqS5ZsUYWXTrhuWPpB
   l1jYhV8hbfYnak/jTGWvkHnDe83sq38zERKYg1bNSys0T0Ahq5BilyqHI
   7EeifBTzs5YPjz7gL0Ty9PP4VxwsyygMpWp1Olibor/9j2Vj3hDMqmo0z
   imkSmaptYZFSd1NMpu5jVWngeA5HfkUcEKrzJ8raYaaUi4tLbvexNWzbD
   m7QAnvis6oaqIoTEGU7m/aiej7AgWv3sz4KxTUOgjK3FVxgqWAE0m/4g9
   w==;
X-CSE-ConnectionGUID: YjfwCBCIR1eWs6k9qg78Xw==
X-CSE-MsgGUID: XrU1SbuwQZmiTaVZPuso/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33259186"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="33259186"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 11:17:53 -0700
X-CSE-ConnectionGUID: l4tZ72ETRoCdP1GnJrreLQ==
X-CSE-MsgGUID: b63lVi4+Syi5402vsX6GyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="84342085"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Aug 2024 11:17:52 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgpu2-000BmC-1U;
	Wed, 21 Aug 2024 18:17:50 +0000
Date: Thu, 22 Aug 2024 02:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] powerpc/mm: Fix return type of pgd_val()
Message-ID: <202408220250.RzCjhNLe-lkp@intel.com>
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
config: powerpc64-randconfig-r123-20240821 (https://download.01.org/0day-ci/archive/20240822/202408220250.RzCjhNLe-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20240822/202408220250.RzCjhNLe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220250.RzCjhNLe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/pgtable-generic.c:27:2: warning: format specifies type 'unsigned long' but the argument has type 'unsigned long long' [-Wformat]
           pgd_ERROR(*pgd);
           ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/nohash/64/pgtable.h:165:56: note: expanded from macro 'pgd_ERROR'
           pr_err("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, pgd_val(e))
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/printk.h:508:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +27 mm/pgtable-generic.c

e2cda322648122d Andrea Arcangeli 2011-01-13  18  
bc4b4448dba660a Joonsoo Kim      2013-09-11  19  /*
bc4b4448dba660a Joonsoo Kim      2013-09-11  20   * If a p?d_bad entry is found while walking page tables, report
bc4b4448dba660a Joonsoo Kim      2013-09-11  21   * the error, before resetting entry to p?d_none.  Usually (but
bc4b4448dba660a Joonsoo Kim      2013-09-11  22   * very seldom) called out from the p?d_none_or_clear_bad macros.
bc4b4448dba660a Joonsoo Kim      2013-09-11  23   */
bc4b4448dba660a Joonsoo Kim      2013-09-11  24  
bc4b4448dba660a Joonsoo Kim      2013-09-11  25  void pgd_clear_bad(pgd_t *pgd)
bc4b4448dba660a Joonsoo Kim      2013-09-11  26  {
bc4b4448dba660a Joonsoo Kim      2013-09-11 @27  	pgd_ERROR(*pgd);
bc4b4448dba660a Joonsoo Kim      2013-09-11  28  	pgd_clear(pgd);
bc4b4448dba660a Joonsoo Kim      2013-09-11  29  }
bc4b4448dba660a Joonsoo Kim      2013-09-11  30  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
