Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC743A9615
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 23:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784332707; cv=none; b=pLxUhNR/952m2a8GcnS+WKdrmRCIL/7NpEaXxmbj2SWf9gWr+sfbrwgaQODrGMNT93HQiYsowr8i2Oac+Od8c4nXEMElj8NROmGsnD6D/xdLsZFYQTsVJid5g9NwLXPduGEX8YGVhIgCZbrOStBi0O1lr+jiVYNxMfDD+M4Jsoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784332707; c=relaxed/simple;
	bh=HyQRtwPJ+f3kGMojmDB0EE6NpywDOC8GijkWO6hwnKQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NcxRsZ14mQw1XkFgGIVudPY8HwF2g7ObmaeTMlk4Fjg1wBKJ3cR3f8aNfUnBxlTz+FrjLZEy07zwyeskGtol7t93l5H+F8BTmkzgdTzjCcc4JsU4itKFAqjZtvuM1kTCKHF+cHlaDRlOAjfm4ljqsTRTfLqhjoLZebB6uIvmAQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J51o2eVi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J51o2eVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784332707; x=1815868707;
  h=date:from:to:cc:subject:message-id;
  bh=HyQRtwPJ+f3kGMojmDB0EE6NpywDOC8GijkWO6hwnKQ=;
  b=J51o2eViEBGfTNtEkfMxuAxpHZzCwUTVt3KgWI2Ec6O12JZJ5YHunhkI
   Nil9wk72IDQPNz3tQ9t3UDSq9i5h7PcUnSfB+CoJIgC41mxTUsq95yM7H
   KQHkPLsmf3B+6MmErn2P/zPhWrBvcg5aIoYesJNAnrUUApVEbAp8o4h9d
   0d6qexhsZgQ9E+bgNtYxQ3dy3aNKZVkizU2NZz0dAn71X+CmT26bmMJuS
   DwduZnHopSFRzAYqFC+SWDLn9nAxKUQgZKdKdX9ViRRlib5iKgakmQ28/
   9B3T3HH4x81sZpgtxiaHXM/t0OdkvVwA7LikHMMPjSqw0uDK0o0RKjT3z
   Q==;
X-CSE-ConnectionGUID: 3Zto7Su5TqKGw20ijUVA6A==
X-CSE-MsgGUID: Pd6iSNyWQayyuJBs+8TP4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="102430158"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="102430158"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 16:58:26 -0700
X-CSE-ConnectionGUID: tMff+BMKRJ6CpvqCxV0NIQ==
X-CSE-MsgGUID: S1tmQAkfSjO3Qz5XTDbSXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="286975773"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Jul 2026 16:58:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wksRf-00000000TGS-3ZYe;
	Fri, 17 Jul 2026 23:58:20 +0000
Date: Sat, 18 Jul 2026 07:58:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-07 2/2]
 kernel/kallsyms.c:503:17: warning: 'strcpy' source argument is the same as
 destination
Message-ID: <202607180745.QGy1LHlp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-07
head:   78af4078ece5032768bb0bc9282e26ca123d7679
commit: 26030cb984dd65e0cb2d0c2489d94941cf8897b4 [2/2] extrawarn: move -Wrestrict into W=1 warnings
config: arm64-randconfig-001-20260717 (https://download.01.org/0day-ci/archive/20260718/202607180745.QGy1LHlp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180745.QGy1LHlp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 26030cb984dd ("extrawarn: move -Wrestrict into W=1 warnings")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180745.QGy1LHlp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/kallsyms.c: In function '__sprint_symbol.constprop':
>> kernel/kallsyms.c:503:17: warning: 'strcpy' source argument is the same as destination [-Wrestrict]
     503 |                 strcpy(buffer, name);
         |                 ^~~~~~~~~~~~~~~~~~~~


vim +/strcpy +503 kernel/kallsyms.c

9d65cb4a1718a0 Alexey Dobriyan 2007-05-08  485  
42e380832a6911 Robert Peterson 2007-04-30  486  /* Look up a kernel symbol and return it in a text buffer. */
0f77a8d378254f Namhyung Kim    2011-03-24  487  static int __sprint_symbol(char *buffer, unsigned long address,
9294523e376803 Stephen Boyd    2021-07-07  488  			   int symbol_offset, int add_offset, int add_buildid)
^1da177e4c3f41 Linus Torvalds  2005-04-16  489  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  490  	char *modname;
9294523e376803 Stephen Boyd    2021-07-07  491  	const unsigned char *buildid;
^1da177e4c3f41 Linus Torvalds  2005-04-16  492  	const char *name;
^1da177e4c3f41 Linus Torvalds  2005-04-16  493  	unsigned long offset, size;
966c8c12dc9e77 Hugh Dickins    2008-11-19  494  	int len;
^1da177e4c3f41 Linus Torvalds  2005-04-16  495  
0f77a8d378254f Namhyung Kim    2011-03-24  496  	address += symbol_offset;
9294523e376803 Stephen Boyd    2021-07-07  497  	name = kallsyms_lookup_buildid(address, &size, &offset, &modname, &buildid,
9294523e376803 Stephen Boyd    2021-07-07  498  				       buffer);
^1da177e4c3f41 Linus Torvalds  2005-04-16  499  	if (!name)
b86280aa48b67c Namhyung Kim    2014-08-08  500  		return sprintf(buffer, "0x%lx", address - symbol_offset);
19769b762607fe Andrew Morton   2007-07-15  501  
966c8c12dc9e77 Hugh Dickins    2008-11-19  502  	if (name != buffer)
966c8c12dc9e77 Hugh Dickins    2008-11-19 @503  		strcpy(buffer, name);
966c8c12dc9e77 Hugh Dickins    2008-11-19  504  	len = strlen(buffer);
0f77a8d378254f Namhyung Kim    2011-03-24  505  	offset -= symbol_offset;
966c8c12dc9e77 Hugh Dickins    2008-11-19  506  
4796dd200db943 Stephen Boyd    2012-05-29  507  	if (add_offset)
4796dd200db943 Stephen Boyd    2012-05-29  508  		len += sprintf(buffer + len, "+%#lx/%#lx", offset, size);
4796dd200db943 Stephen Boyd    2012-05-29  509  
9294523e376803 Stephen Boyd    2021-07-07  510  	if (modname) {
9294523e376803 Stephen Boyd    2021-07-07  511  		len += sprintf(buffer + len, " [%s", modname);
9294523e376803 Stephen Boyd    2021-07-07  512  #if IS_ENABLED(CONFIG_STACKTRACE_BUILD_ID)
9294523e376803 Stephen Boyd    2021-07-07  513  		if (add_buildid && buildid) {
9294523e376803 Stephen Boyd    2021-07-07  514  			/* build ID should match length of sprintf */
9294523e376803 Stephen Boyd    2021-07-07  515  #if IS_ENABLED(CONFIG_MODULES)
9294523e376803 Stephen Boyd    2021-07-07  516  			static_assert(sizeof(typeof_member(struct module, build_id)) == 20);
9294523e376803 Stephen Boyd    2021-07-07  517  #endif
9294523e376803 Stephen Boyd    2021-07-07  518  			len += sprintf(buffer + len, " %20phN", buildid);
9294523e376803 Stephen Boyd    2021-07-07  519  		}
9294523e376803 Stephen Boyd    2021-07-07  520  #endif
9294523e376803 Stephen Boyd    2021-07-07  521  		len += sprintf(buffer + len, "]");
9294523e376803 Stephen Boyd    2021-07-07  522  	}
966c8c12dc9e77 Hugh Dickins    2008-11-19  523  
966c8c12dc9e77 Hugh Dickins    2008-11-19  524  	return len;
^1da177e4c3f41 Linus Torvalds  2005-04-16  525  }
0f77a8d378254f Namhyung Kim    2011-03-24  526  

:::::: The code at line 503 was first introduced by commit
:::::: 966c8c12dc9e77f931e2281ba25d2f0244b06949 sprint_symbol(): use less stack

:::::: TO: Hugh Dickins <hugh@veritas.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
