Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B221C84A6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 00:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761093019; cv=none; b=jG3TMdZq329Nfswxkn6KgBykSBBmDajXFWky5poqh2SfreYjivcXDxf+0GBIBCwcBuGpxY8AH9LhTlrElrt+fnECcWZDSnagG+Ipib3/sTafpmptgwOyNu/3MLAcmF4kduFsiQRZNqp6rfLWc31o9FTDH83K0efkZdsiA7eWyYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761093019; c=relaxed/simple;
	bh=vUNh/hy1FiOjly7LLNUAYTyob2YQ/ioZThi+STDdieE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zw8D+hw/8dneZZk00tOEzUYpNLjWXEI0xhOcOBUHq4ii5F9zP59FwhexsOX2O07WX9ikHHfspQdv+2silhHZQzBAx0DWR18QIQYYwXrtuEZ3AfqP7D07NwE8tF0Di0Ol5XFrMEzCLOoF7Gh5RaO70l7V/uyjJQSGWlNfpgCxlzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vt5HMew0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vt5HMew0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761093018; x=1792629018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vUNh/hy1FiOjly7LLNUAYTyob2YQ/ioZThi+STDdieE=;
  b=Vt5HMew0BmHBAP7B55KAJqGfQiRcDIgD2vBxZvSRkHMMTrAMS/1nflHW
   4K29lElyKcediMiyfYUs/IGqCFbzDtPks1mQz4qYCF7FygWiVAjJBFpsL
   xSaAGxCRftmWd/PrBb52t9XPQ7Ddoz1cMontd6xTE7A7eeJeEeU35aERv
   XKdhE1VPMZ8oRSyzEpRk7zF1dpHmY2J8cVh0TP7fDwjw+JK180VwsmTPW
   3h8AHDCzDGU6fXaC2fDzBLzH2tkpKryTWefV2t/nZoDlhWSfxh7kH621Q
   MGXm6XCZjg3tCKTe4EDfhew8IhL+UfUP81Ah+W2U3852OYsfo5gA+T9XY
   Q==;
X-CSE-ConnectionGUID: 5ZjLwdrRQuiSfSYAwLZEeA==
X-CSE-MsgGUID: NYNDB0uFQFC8CJQFihgMxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66872314"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="66872314"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 17:30:18 -0700
X-CSE-ConnectionGUID: H+HFuXkcRm2v6uFHbJO4Sw==
X-CSE-MsgGUID: ZBSSQ7BrSVmzHcpONnAfmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="183667444"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Oct 2025 17:30:16 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBMk2-000BrP-0I;
	Wed, 22 Oct 2025 00:30:14 +0000
Date: Wed, 22 Oct 2025 08:30:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-6a5 48/51] lib/dynamic_debug.c:1563:12: warning:
 'ddebug_remove_module' declared 'static' but never defined
Message-ID: <202510220818.8kXVY3Ho-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-6a5
head:   a2f8b47e22fa6a1a9852e392166bc9adf45cc17d
commit: 9d7c2864c92a451e2936e8c6e3c1fd8244d09109 [48/51] dyndbg: save _ddebug_site mod,file,func fields into maple-trees WIP
config: nios2-randconfig-002-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220818.8kXVY3Ho-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220818.8kXVY3Ho-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220818.8kXVY3Ho-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_prefix_key':
   lib/dynamic_debug.c:1785:51: warning: left shift count >= width of type [-Wshift-count-overflow]
    1785 |         ((unsigned long)prefix_flags(desc->flags) << DDEBUG_PREFIX_KEY_FLAGS_SHIFT);
         |                                                   ^~
   lib/dynamic_debug.c: At top level:
>> lib/dynamic_debug.c:1563:12: warning: 'ddebug_remove_module' declared 'static' but never defined [-Wunused-function]
    1563 | static int ddebug_remove_module(const char *mod_name);
         |            ^~~~~~~~~~~~~~~~~~~~


vim +1563 lib/dynamic_debug.c

  1562	
> 1563	static int ddebug_remove_module(const char *mod_name);
  1564	/*
  1565	 * Allocate a new ddebug_table for the given module
  1566	 * and add it to the global list.
  1567	 */
  1568	static int ddebug_add_module(struct _ddebug_info *di)
  1569	{
  1570		struct ddebug_table *dt;
  1571		struct _ddebug_class_map *cm;
  1572		struct _ddebug_class_user *cli;
  1573		u64 reserved_ids = 0;
  1574		int i;
  1575	
  1576		if (!di->descs.len)
  1577			return 0;
  1578	
  1579		v3pr_info("add-module: %s %d sites\n", di->mod_name, di->descs.len);
  1580	
  1581		dt = kzalloc(sizeof(*dt), GFP_KERNEL);
  1582		if (dt == NULL) {
  1583			pr_err("error adding module: %s\n", di->mod_name);
  1584			return -ENOMEM;
  1585		}
  1586		INIT_LIST_HEAD(&dt->link);
  1587		/*
  1588		 * For built-in modules, di-> referents live in .*data and are
  1589		 * immortal. For loaded modules, di points at the dyndbg_info
  1590		 * member of its struct module, which lives at least as
  1591		 * long as this struct ddebug_table.
  1592		 */
  1593		dt->info = *di;
  1594		ddebug_condense_sites(&dt->info);
  1595	
  1596		dd_mark_vector_subrange(i, dt, cm, &dt->info, maps);
  1597		dd_mark_vector_subrange(i, dt, cli, &dt->info, users);
  1598		/* now di is stale */
  1599	
  1600		/* insure 2+ classmaps share the per-module 0..62 class_id space */
  1601		for_subvec(i, cm, &dt->info, maps)
  1602			if (ddebug_class_range_overlap(cm, &reserved_ids))
  1603				goto cleanup;
  1604	
  1605		mutex_lock(&ddebug_lock);
  1606		list_add_tail(&dt->link, &ddebug_tables);
  1607		mutex_unlock(&ddebug_lock);
  1608	
  1609		if (dt->info.maps.len)
  1610			ddebug_apply_class_maps(&dt->info);
  1611		if (dt->info.users.len)
  1612			ddebug_apply_class_users(&dt->info);
  1613	
  1614		vpr_info("%3u debug prints in module %s\n",
  1615			 dt->info.descs.len, dt->info.mod_name);
  1616		return 0;
  1617	cleanup:
  1618		WARN_ONCE("dyndbg multi-classmap conflict in %s\n", di->mod_name);
  1619		kfree(dt);
  1620		return -EINVAL;
  1621	}
  1622	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
