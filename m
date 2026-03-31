Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FD53C2E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 11:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956168; cv=none; b=acmS8wije7+XSQATDdkDTobsxhieVBMiqoK1QOmqdGKznuHAl+LjEaWK6J9WlCvPciM97mtWdZXcwtm2CJ24aMpJqqOFxR0Ir10CHjOZn0SJLKRbtHGUpYOzqApJNTXBNscbf/aa/098sYPxJg6srmfSk2/efg/9hYoKBjyGHn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956168; c=relaxed/simple;
	bh=+ATJ1AtK0MC7CGTFpoD4uGgcuZI1kiYqU7QE9tE17/w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kKcv+vOrk1qtikBRArFxEuG0Bsqo8AUh481E67yB96+18n2rECoR5iYBBPbJIL/s8gW+NyeG+0Bw6LBnimaQQmeKEtWd4/2AuKuPdfADnEjyaK/Tj+dzMB98Fd17H9UMl27T366uhliChlFlcgZw9FZoZRSlWKr7U5P4zwHxRHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCLQZd+R; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCLQZd+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774956167; x=1806492167;
  h=date:from:to:cc:subject:message-id;
  bh=+ATJ1AtK0MC7CGTFpoD4uGgcuZI1kiYqU7QE9tE17/w=;
  b=FCLQZd+RudPo3zw9qVn+V92xodeFc5bAwp1LsxULOfyZErzemwfEQ9Mx
   6fAZLtGUyQVetML8kYnw0paoXlO2IK0gxIzQ8fNMTGfbfSfKFroKJkla+
   9ACR2AgnBlwZmO4fAomkYXYpPP3YoMxS1+knIiap4iHDqYfIejdTHLRXe
   39VE2iQkAvkSkQ8wN1HiAl9RAJo2NOXP50D3q3jRoV1KS5sLLl4Ek+rss
   ZZuvAoPWgYssm2ob9JMXh87m+TnhMfPu++1+mk+dz9DXfUa5XVtBYNkH1
   fguNn4DODvJ6c/ogQjdoaT8VMQgFOJIpcSzWDQF3RDbbFTJ3OKybWsTon
   Q==;
X-CSE-ConnectionGUID: +s5kZEL/T9SRVnFHpSqWYw==
X-CSE-MsgGUID: B9Y8rHiwR8+x+BlPdk3hGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="76157635"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="76157635"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 04:22:47 -0700
X-CSE-ConnectionGUID: SFRfjK6ATMCvV3OF8ZLjoA==
X-CSE-MsgGUID: XYxSfsWKTPCYtsYn39MTEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="225333337"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Mar 2026 04:22:45 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7XBC-000000002ZB-1T0e;
	Tue, 31 Mar 2026 11:22:42 +0000
Date: Tue, 31 Mar 2026 19:21:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-12 3/3]
 kernel/kallsyms.c:503:17: warning: 'strcpy' source argument is the same as
 destination
Message-ID: <202603311912.l6xH0DEH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-12
head:   3b39ad55c85573c3788e8a9bef0196d103d4fd94
commit: 26030cb984dd65e0cb2d0c2489d94941cf8897b4 [3/3] extrawarn: move -Wrestrict into W=1 warnings
config: arm-randconfig-r072-20260331 (https://download.01.org/0day-ci/archive/20260331/202603311912.l6xH0DEH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311912.l6xH0DEH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311912.l6xH0DEH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/kallsyms.c: In function '__sprint_symbol.constprop':
>> kernel/kallsyms.c:503:17: warning: 'strcpy' source argument is the same as destination [-Wrestrict]
     503 |                 strcpy(buffer, name);
         |                 ^~~~~~~~~~~~~~~~~~~~


vim +/strcpy +503 kernel/kallsyms.c

9d65cb4a1718a07 Alexey Dobriyan 2007-05-08  485  
42e380832a6911c Robert Peterson 2007-04-30  486  /* Look up a kernel symbol and return it in a text buffer. */
0f77a8d378254f2 Namhyung Kim    2011-03-24  487  static int __sprint_symbol(char *buffer, unsigned long address,
9294523e3768030 Stephen Boyd    2021-07-07  488  			   int symbol_offset, int add_offset, int add_buildid)
^1da177e4c3f415 Linus Torvalds  2005-04-16  489  {
^1da177e4c3f415 Linus Torvalds  2005-04-16  490  	char *modname;
9294523e3768030 Stephen Boyd    2021-07-07  491  	const unsigned char *buildid;
^1da177e4c3f415 Linus Torvalds  2005-04-16  492  	const char *name;
^1da177e4c3f415 Linus Torvalds  2005-04-16  493  	unsigned long offset, size;
966c8c12dc9e77f Hugh Dickins    2008-11-19  494  	int len;
^1da177e4c3f415 Linus Torvalds  2005-04-16  495  
0f77a8d378254f2 Namhyung Kim    2011-03-24  496  	address += symbol_offset;
9294523e3768030 Stephen Boyd    2021-07-07  497  	name = kallsyms_lookup_buildid(address, &size, &offset, &modname, &buildid,
9294523e3768030 Stephen Boyd    2021-07-07  498  				       buffer);
^1da177e4c3f415 Linus Torvalds  2005-04-16  499  	if (!name)
b86280aa48b67c8 Namhyung Kim    2014-08-08  500  		return sprintf(buffer, "0x%lx", address - symbol_offset);
19769b762607fea Andrew Morton   2007-07-15  501  
966c8c12dc9e77f Hugh Dickins    2008-11-19  502  	if (name != buffer)
966c8c12dc9e77f Hugh Dickins    2008-11-19 @503  		strcpy(buffer, name);
966c8c12dc9e77f Hugh Dickins    2008-11-19  504  	len = strlen(buffer);
0f77a8d378254f2 Namhyung Kim    2011-03-24  505  	offset -= symbol_offset;
966c8c12dc9e77f Hugh Dickins    2008-11-19  506  
4796dd200db943e Stephen Boyd    2012-05-29  507  	if (add_offset)
4796dd200db943e Stephen Boyd    2012-05-29  508  		len += sprintf(buffer + len, "+%#lx/%#lx", offset, size);
4796dd200db943e Stephen Boyd    2012-05-29  509  
9294523e3768030 Stephen Boyd    2021-07-07  510  	if (modname) {
9294523e3768030 Stephen Boyd    2021-07-07  511  		len += sprintf(buffer + len, " [%s", modname);
9294523e3768030 Stephen Boyd    2021-07-07  512  #if IS_ENABLED(CONFIG_STACKTRACE_BUILD_ID)
9294523e3768030 Stephen Boyd    2021-07-07  513  		if (add_buildid && buildid) {
9294523e3768030 Stephen Boyd    2021-07-07  514  			/* build ID should match length of sprintf */
9294523e3768030 Stephen Boyd    2021-07-07  515  #if IS_ENABLED(CONFIG_MODULES)
9294523e3768030 Stephen Boyd    2021-07-07  516  			static_assert(sizeof(typeof_member(struct module, build_id)) == 20);
9294523e3768030 Stephen Boyd    2021-07-07  517  #endif
9294523e3768030 Stephen Boyd    2021-07-07  518  			len += sprintf(buffer + len, " %20phN", buildid);
9294523e3768030 Stephen Boyd    2021-07-07  519  		}
9294523e3768030 Stephen Boyd    2021-07-07  520  #endif
9294523e3768030 Stephen Boyd    2021-07-07  521  		len += sprintf(buffer + len, "]");
9294523e3768030 Stephen Boyd    2021-07-07  522  	}
966c8c12dc9e77f Hugh Dickins    2008-11-19  523  
966c8c12dc9e77f Hugh Dickins    2008-11-19  524  	return len;
^1da177e4c3f415 Linus Torvalds  2005-04-16  525  }
0f77a8d378254f2 Namhyung Kim    2011-03-24  526  

:::::: The code at line 503 was first introduced by commit
:::::: 966c8c12dc9e77f931e2281ba25d2f0244b06949 sprint_symbol(): use less stack

:::::: TO: Hugh Dickins <hugh@veritas.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
