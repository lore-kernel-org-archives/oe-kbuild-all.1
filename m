Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3344415853B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 06:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741762372; cv=none; b=pz4jOAuQS7jUKPAH/cQ0GNb2yNVwdO2OHIoJP9ea+GiOe99bdvZCcZDlsBB9obnKBlGUxjjLlm5fU7xQ9X7qKzgbpdvVtmswAyaraAwMPICDEt8VM9XgwwYPauEZ14641lKD28SIXbyh3x0JsLjyafS5/xOsBeicCw51X9kzRHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741762372; c=relaxed/simple;
	bh=gDyxDtCN1jnjGqv9ozFBOLfBTCeurosxeI1eqcNBvAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xe5DHCkaujuxv44zmFvWVk/m83Fzq/nRGigWW6JoNcxyhZOwH09Dj8bGzC2ICeWsdt2IDrEiaR1PHGAyzBe3x2TZwSEvEy+i1nuNcvdt9SD9i6ktpDMudrMQiYWzZqJ/luLsEuizwCXpyfOVgyxY1c33PYJkfPCqP6UweeolDtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ba8Z6OSq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ba8Z6OSq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741762370; x=1773298370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gDyxDtCN1jnjGqv9ozFBOLfBTCeurosxeI1eqcNBvAg=;
  b=ba8Z6OSqRaQlAAo9d9zN7wx1EwOg1ICgsdZ4AboxEdnw5SoP3jItkXty
   UnA2jbFu9PlujI+b1xtiWLDbdJjaiua9YRj+cfwH6L4h6LqyLiGrkWj2Z
   p+Tk2NuxuL7UxZcKLU5lb/hP4zoRqVEq5Tzp1vsRSDetPBKpvOjSyrtzE
   fg6CUVQ76GtS4CEDpdWOToGYeD6otLIY5pE7oOMxKMmGZtZkF5HYVtuHV
   KjiiQ5jfcGYEV2HCDTRs+WJKHg8DH1Rv1c4eU2akuisCeJkIg2j75e2Lh
   +ndgeKKgN83b1zM3IugrE1bprCBXa8Fddwt8UE6mZuYYvuMhUdBFSMhXK
   g==;
X-CSE-ConnectionGUID: 8z+8hhfYRQ6z8SUQVSjKTw==
X-CSE-MsgGUID: Nmjx0dLdSrenB2msp/3UCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="43032368"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="43032368"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 23:52:50 -0700
X-CSE-ConnectionGUID: zlkuaMkgR6m9358gOCAw0g==
X-CSE-MsgGUID: AsHQq+XLT66n0psyyg/dbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="125746338"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 11 Mar 2025 23:52:48 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsFxN-0008Ca-2Q;
	Wed, 12 Mar 2025 06:52:45 +0000
Date: Wed, 12 Mar 2025 14:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:_r8 69/70] lib/dynamic_debug.c:1752:5: warning: format
 specifies type 'long' but the argument has type 'int'
Message-ID: <202503121427.X9532Ank-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git _r8
head:   d2e2e629f0a887e71446afa03ead92dc5a4af57c
commit: 76d7ff040dcb70c93e714eb0e2ace87f220ec091 [69/70] dyndbg: print multiple headers (WIP,WAG)
config: i386-buildonly-randconfig-002-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121427.X9532Ank-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121427.X9532Ank-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121427.X9532Ank-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1752:5: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
    1751 |                 vpr_info("%ld header(s) found, format: %s\n",
         |                           ~~~
         |                           %d
    1752 |                          __start___dyndbg_descs - __hdr___dyndbg_descs,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:141:48: note: expanded from macro 'vpr_info'
     141 | #define vpr_info(fmt, ...)      vnpr_info(1, fmt, ##__VA_ARGS__)
         |                                              ~~~    ^~~~~~~~~~~
   lib/dynamic_debug.c:138:18: note: expanded from macro 'vnpr_info'
     138 |                 pr_info(fmt, ##__VA_ARGS__);                    \
         |                         ~~~    ^~~~~~~~~~~
   include/linux/printk.h:574:34: note: expanded from macro 'pr_info'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +1752 lib/dynamic_debug.c

  1724	
  1725	static int __init dynamic_debug_init(void)
  1726	{
  1727		struct _ddebug_codeorg *site, *site_mod_start;
  1728		struct _ddebug *iter, *iter_mod_start;
  1729		int ret, i, mod_sites, mod_ct;
  1730		const char *modname;
  1731		char *cmdline;
  1732	
  1733		struct _ddebug_info di = {
  1734			.descs.start = __start___dyndbg_descs,
  1735			.sites.start = __start___dyndbg_sites,
  1736			.maps.start  = __start___dyndbg_class_maps,
  1737			.users.start = __start___dyndbg_class_users,
  1738			.descs.len = __stop___dyndbg_descs - __start___dyndbg_descs,
  1739			.sites.len = __stop___dyndbg_sites - __start___dyndbg_sites,
  1740			.maps.len  = __stop___dyndbg_class_maps - __start___dyndbg_class_maps,
  1741			.users.len = __stop___dyndbg_class_users - __start___dyndbg_class_users,
  1742		};
  1743		pr_info("builtin descs:%d sites:%d maps:%d users:%d\n",
  1744			di.descs.len, di.sites.len, di.maps.len, di.users.len);
  1745		BUG_ON(di.sites.len != di.descs.len);
  1746	
  1747		ddebug_squeeze_codeorg(&di);
  1748	
  1749		if (&__hdr___dyndbg_descs != &__start___dyndbg_descs) {
  1750	
  1751			vpr_info("%ld header(s) found, format: %s\n",
> 1752				 __start___dyndbg_descs - __hdr___dyndbg_descs,
  1753				 __hdr___dyndbg_descs[0].format);
  1754	
  1755			for (i = 0; i < __start___dyndbg_descs - __hdr___dyndbg_descs; i++)
  1756				vpr_info("%d: format: %s\n",
  1757					 i, __hdr___dyndbg_descs[i].format);
  1758		}
  1759	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
