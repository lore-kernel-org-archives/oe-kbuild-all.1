Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDD17E9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735055380; cv=none; b=bTrdhpT7qlFSSBhKjDyBAizj74H8YQWBGdUswFm3oB0qIMlr5qXEIHbtuc3cV3RoHTUxlLGaXU2it+usC/xdT94mtf02IpOSeSH+S2Ug6MXgXeLRlR6Y7aMvQjnjzk/+EOVaQ5hhBrmzr5l8YEaM2sJoJDriqbE0K2tm7mapdok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735055380; c=relaxed/simple;
	bh=Ar51I+oEUSjF2FXxROVxbPhJqOIAPjpwmTGFHbcwaEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KMShL2uSv9uERfEAilHpzFscFz/uYUPUuhTPwbwxSnjTuzToUw8ZF1L60BXFcSnQYO5RYz+65QSfJYGCiGjUJ8lvZQax5jf2wq4mAmkK/rwxvOddIUW/3RERLO2hEend2/o1rl9y0xnvg2CdRrARJIXglpwbpowOcrP0aRTFzzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyYUgNCF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyYUgNCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735055379; x=1766591379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ar51I+oEUSjF2FXxROVxbPhJqOIAPjpwmTGFHbcwaEU=;
  b=cyYUgNCFE/R/v/yaMi8u0zlfgAdn4MCl7QhP3FSnBS99ZX54HnCuS3fL
   rKtajdk1X5qSkMsrM60I8DmpkBxOO4xa4/wcDANDiLvdXtvzsX8Ob9/TB
   UsnhQBRzBOvDfLQzi+jEtr1MSUDpcCOpYfG6pHlhEYe92VfPLq6gaKlSS
   PhO8km1LVrw4i6dQ8eQnE7mfSv35fmcnphRkVLL016mW9NRwC9qoIjRxK
   n+0j/EEdgqKy4WIZDeDgrKndBTwRfuxSp9GVDzAc8QuEfTwyeb6oc+7fP
   jYdCN0wnV1/f6Sig53UYlUDVVyaocQuQljXEaVe7/W+qczPjQa5hvt4tQ
   Q==;
X-CSE-ConnectionGUID: qn4rvcfDSk2E5wm1cvo2PQ==
X-CSE-MsgGUID: X5il3V9iQfyBvvMMmfyzsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35237480"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="35237480"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 07:49:38 -0800
X-CSE-ConnectionGUID: FnbIeBbdRLmHXofxGfjmEA==
X-CSE-MsgGUID: J/Cb+utXT4GC3DMBlFl0iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="104363793"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Dec 2024 07:49:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ7A6-0001Gh-1T;
	Tue, 24 Dec 2024 15:49:34 +0000
Date: Tue, 24 Dec 2024 23:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1343/1343] kernel/module.c:275:6:
 sparse: sparse: symbol 'set_module_sig_enforced' was not declared. Should it
 be static?
Message-ID: <202412242304.vlx7BMb1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   33267d4a7f512d371a3ea853568832174be4caba
commit: e1f556835f4fdc766bbd0d4a44f3bbeb64671d1a [1343/1343] module: limit enabling module.sig_enforce
config: arm64-randconfig-r113-20241223 (https://download.01.org/0day-ci/archive/20241224/202412242304.vlx7BMb1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241224/202412242304.vlx7BMb1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412242304.vlx7BMb1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/module.c:275:6: sparse: sparse: symbol 'set_module_sig_enforced' was not declared. Should it be static?
   kernel/module.c:3984:41: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/module.c:3984:41: sparse:    struct mod_kallsyms [noderef] __rcu *
   kernel/module.c:3984:41: sparse:    struct mod_kallsyms *
   kernel/module.c:4119:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/module.c:4119:28: sparse:    struct mod_kallsyms [noderef] __rcu *
   kernel/module.c:4119:28: sparse:    struct mod_kallsyms *
   kernel/module.c:4138:41: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/module.c:4138:41: sparse:    struct mod_kallsyms [noderef] __rcu *
   kernel/module.c:4138:41: sparse:    struct mod_kallsyms *
   kernel/module.c:275:6: warning: no previous prototype for 'set_module_sig_enforced' [-Wmissing-prototypes]
     275 | void set_module_sig_enforced(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/module.c:4457:6: warning: no previous prototype for 'module_layout' [-Wmissing-prototypes]
    4457 | void module_layout(struct module *mod,
         |      ^~~~~~~~~~~~~
   kernel/module.c: In function 'add_sect_attrs':
   kernel/module.c:1516:17: warning: array subscript 0 is outside array bounds of 'struct module_sect_attr[0]' [-Warray-bounds=]
    1516 |         sattr = &sect_attrs->attrs[0];
         |                 ^~~~~~~~~~~~~~~~~~~~~
   kernel/module.c:1471:33: note: while referencing 'attrs'
    1471 |         struct module_sect_attr attrs[0];
         |                                 ^~~~~
   In function 'free_sect_attrs',
       inlined from 'add_sect_attrs' at kernel/module.c:1543:2:
   kernel/module.c:1488:40: warning: array subscript section is outside array bounds of 'struct module_sect_attr[0]' [-Warray-bounds=]
    1488 |                 kfree(sect_attrs->attrs[section].name);
         |                       ~~~~~~~~~~~~~~~~~^~~~~~~~~
   kernel/module.c: In function 'add_sect_attrs':
   kernel/module.c:1471:33: note: while referencing 'attrs'
    1471 |         struct module_sect_attr attrs[0];
         |                                 ^~~~~
   kernel/module.c: In function 'add_notes_attrs':
   kernel/module.c:1617:17: warning: array subscript 0 is outside array bounds of 'struct bin_attribute[0]' [-Warray-bounds=]
    1617 |         nattr = &notes_attrs->attrs[0];
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   kernel/module.c:1565:30: note: while referencing 'attrs'
    1565 |         struct bin_attribute attrs[0];
         |                              ^~~~~
   kernel/module.c:1639:43: warning: array subscript i is outside array bounds of 'struct bin_attribute[0]' [-Warray-bounds=]
    1639 |                                           &notes_attrs->attrs[i]))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/module.c:1565:30: note: while referencing 'attrs'
    1565 |         struct bin_attribute attrs[0];
         |                              ^~~~~
   In function 'free_notes_attrs',
       inlined from 'add_notes_attrs' at kernel/module.c:1646:2:
   kernel/module.c:1585:47: warning: array subscript i is outside array bounds of 'struct bin_attribute[0]' [-Warray-bounds=]
    1585 |                                               &notes_attrs->attrs[i]);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~
   kernel/module.c: In function 'add_notes_attrs':
   kernel/module.c:1565:30: note: while referencing 'attrs'
    1565 |         struct bin_attribute attrs[0];
         |                              ^~~~~
   kernel/module.c:1623:66: warning: array subscript loaded is outside array bounds of 'struct module_sect_attr[0]' [-Warray-bounds=]
    1623 |                         nattr->attr.name = mod->sect_attrs->attrs[loaded].name;
         |                                            ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   kernel/module.c:1471:33: note: while referencing 'attrs'
    1471 |         struct module_sect_attr attrs[0];
         |                                 ^~~~~
   In function 'free_notes_attrs',
       inlined from 'remove_notes_attrs' at kernel/module.c:1652:3,
       inlined from 'mod_sysfs_fini' at kernel/module.c:1852:2,
       inlined from 'mod_sysfs_teardown' at kernel/module.c:1895:2,
       inlined from 'free_module' at kernel/module.c:2171:2:
   kernel/module.c:1585:47: warning: array subscript i is outside array bounds of 'struct bin_attribute[0]' [-Warray-bounds=]
    1585 |                                               &notes_attrs->attrs[i]);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~
   kernel/module.c: In function 'free_module':
   kernel/module.c:1565:30: note: while referencing 'attrs'
    1565 |         struct bin_attribute attrs[0];
         |                              ^~~~~
   In function 'free_sect_attrs',
       inlined from 'remove_sect_attrs' at kernel/module.c:1553:3,
       inlined from 'mod_sysfs_fini' at kernel/module.c:1853:2,
       inlined from 'mod_sysfs_teardown' at kernel/module.c:1895:2,
       inlined from 'free_module' at kernel/module.c:2171:2:
   kernel/module.c:1488:40: warning: array subscript section is outside array bounds of 'struct module_sect_attr[0]' [-Warray-bounds=]
    1488 |                 kfree(sect_attrs->attrs[section].name);
         |                       ~~~~~~~~~~~~~~~~~^~~~~~~~~
   kernel/module.c: In function 'free_module':
   kernel/module.c:1471:33: note: while referencing 'attrs'
    1471 |         struct module_sect_attr attrs[0];
         |                                 ^~~~~

vim +/set_module_sig_enforced +275 kernel/module.c

   274	
 > 275	void set_module_sig_enforced(void)
   276	{
   277		sig_enforce = true;
   278	}
   279	#else
   280	#define sig_enforce false
   281	#endif
   282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
