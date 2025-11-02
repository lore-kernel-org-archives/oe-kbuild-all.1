Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420E921ABA4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 20:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762115474; cv=none; b=bVYMhgm7cc3d/5+EOW3Nc4ur6R5dv+i6GOIqcAP3nw1Lb8byCrc/JAS8Onsrxyf0dVfrXG42u+/0IGfIcklbPQCHkprsV0nRpYl8IFFfun4ab3E7d9KpIryPw4aGq9xj2Miduihswre/AQWr2S0YZKbVZIuj299GRnVNq13sn/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762115474; c=relaxed/simple;
	bh=mGNupP4EHWiNCJgGqM8PZTVu2NPZ819YnY6lF/Lkw2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YtinPUZ0DFisLs9bU/xQTLv16nmOvjIQkzfGYWc5u1+o6nFkRNMrlzsvwcAeBS45Nmi0dizPc4xtJfsSSdaNrutk4EXZGVTnMCB0B+hjSZf/n1AL3zMgYfTPWDbJlFBdAJd9dG+o6U2SbLi4MKjIHJpw5NsysY+jFVAIEcjGsYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OzYgCJ/N; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OzYgCJ/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762115472; x=1793651472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mGNupP4EHWiNCJgGqM8PZTVu2NPZ819YnY6lF/Lkw2Y=;
  b=OzYgCJ/NluPaxRDJ5j/TrrXErfACSUqDVJrBU87n0LVOjV/kWikWHxL7
   kaYZbVrKexxacsXz+LXBfB83CdO1qWAvOugwSYmyhbWw4zSD0LTYHDh7I
   USalA7TovgLCLpyLVvVVUS/C/hsPH+6RgZqQn9FzkwoB+M6aR8mRYbRSo
   AMFmllUkAYot/lVYDlb/fdvNwj55JGEnFhrLnzagrKu41+mOfWg24htCn
   XwQrlwCTp1GapXTa6MhCG9vtJ1bhvz8Maig80wd+BswY3nJPP1Ownp4lG
   1B13/Mu5PCS2MZZnONirwkdWL2ZBrdN2wv/opbLwhsstYuNmZMxCRKEVF
   g==;
X-CSE-ConnectionGUID: MmFO0nHzQY6mWjUNk9lRxA==
X-CSE-MsgGUID: OleLLZDTQe6rr0vvwcHiWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="75646457"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="75646457"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 12:31:11 -0800
X-CSE-ConnectionGUID: xDJMHbT6ShOrlgbpi1w/fw==
X-CSE-MsgGUID: HwOa+5LpTpSq++w0YHYD7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="190790840"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Nov 2025 12:31:10 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFejE-000PYD-0i;
	Sun, 02 Nov 2025 20:31:08 +0000
Date: Mon, 3 Nov 2025 04:30:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075] drivers/ub/ubus/route.c:96:6: warning:
 no previous prototype for function 'ub_route_clear'
Message-ID: <202511030449.YeWYye2b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5394cae209c4a4990d81be436ba17ae56fb09d16
commit: 9990ed08ad3b5049b5eb594c2e5ea53cb2cc6ffa [3075/3075] ub:ubus: Support for UB routing table configuration function
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251103/202511030449.YeWYye2b-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030449.YeWYye2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030449.YeWYye2b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/route.c:96:6: warning: no previous prototype for function 'ub_route_clear' [-Wmissing-prototypes]
      96 | void ub_route_clear(struct ub_entity *uent)
         |      ^
   drivers/ub/ubus/route.c:96:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      96 | void ub_route_clear(struct ub_entity *uent)
         | ^
         | static 
>> drivers/ub/ubus/route.c:109:5: warning: no previous prototype for function 'ub_route_add_entry' [-Wmissing-prototypes]
     109 | int ub_route_add_entry(struct ub_port *port, u32 cna, short distance)
         |     ^
   drivers/ub/ubus/route.c:109:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     109 | int ub_route_add_entry(struct ub_port *port, u32 cna, short distance)
         | ^
         | static 
>> drivers/ub/ubus/route.c:144:6: warning: no previous prototype for function 'ub_route_sync_dev' [-Wmissing-prototypes]
     144 | void ub_route_sync_dev(struct ub_entity *uent)
         |      ^
   drivers/ub/ubus/route.c:144:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     144 | void ub_route_sync_dev(struct ub_entity *uent)
         | ^
         | static 
   3 warnings generated.
--
>> drivers/ub/ubus/route.c:141: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * after updating routing table in software, this function must be called


vim +/ub_route_clear +96 drivers/ub/ubus/route.c

    95	
  > 96	void ub_route_clear(struct ub_entity *uent)
    97	{
    98		struct ub_port *port;
    99	
   100		if (!uent)
   101			return;
   102	
   103		for_each_uent_port(port, uent)
   104			bitmap_clear(port->cna_maps, 0, UB_ROUTE_TABLE_ENTRY_BITS);
   105	
   106		ub_clear_cna_list(&uent->cna_list);
   107	}
   108	
 > 109	int ub_route_add_entry(struct ub_port *port, u32 cna, short distance)
   110	{
   111		if (!port)
   112			return -EINVAL;
   113	
   114		if (test_bit(cna, port->cna_maps))
   115			return -EEXIST;
   116	
   117		set_bit(cna, port->cna_maps);
   118		return ub_add_cna_node(cna, distance, &port->uent->cna_list);
   119	}
   120	
   121	static void ub_set_route_table_entry(struct ub_entity *uent, u32 dst_cna,
   122					     u32 *route_table_entry)
   123	{
   124		int i;
   125		u32 offset;
   126	
   127		/* Routing Table Block is not required for single-port devices. */
   128		if (uent->port_nums == 1)
   129			return;
   130	
   131		pr_info("cna %#x uent set dstcna %#x route\n", uent->cna, dst_cna);
   132	
   133		for (i = 0; i < EBW(uent->port_nums); i++) {
   134			offset = ((dst_cna + 1) * EBW(uent->port_nums) + i) << SZ_2;
   135			ub_cfg_write_dword(uent, UB_ROUTE_TABLE_ENTRY_START + offset,
   136					   route_table_entry[i]);
   137		}
   138	}
   139	
   140	/**
 > 141	 * after updating routing table in software, this function must be called
   142	 * to sync the software routing table to config space
   143	 */
 > 144	void ub_route_sync_dev(struct ub_entity *uent)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
