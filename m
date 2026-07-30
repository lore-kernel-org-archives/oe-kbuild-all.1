Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B404D312834
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 01:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785373856; cv=none; b=tztomPVoc8yA8Mhc9Xpt12BdTXPYIdTfStrtuFXAtmHQT/W5fS0dEZwmKFeeCLMDfzUf9JQoOc2/3MAlov7af/WVWOVPa1awwjipLUqFGHk1n1yl0A3X1B3eMZM0WOBLsdedz2EmV+gLsJn3N8JVPOPJfhEyMAj81ENgYSaV5HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785373856; c=relaxed/simple;
	bh=d66IdXYQ9Um2QD8z6BZXGtAxSIPo2BlScerTi5SE5Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=J/VWdcfN3y1dI/h6X+JI+tivEN7eyr98uR++ABZJnwntS9ZbRAP7zZnwSMtX+Oh2svVeOs57yOUPcYN/oJKF1k79QdTOaP0WyhBqKQJrAleQ/PZbXHI0DFBnjor5BNTDaUegRdH94b2wH4YYuiOXJZnNlnupJJyoqrMKpOfOmuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3cWqcii; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3cWqcii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785373854; x=1816909854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d66IdXYQ9Um2QD8z6BZXGtAxSIPo2BlScerTi5SE5Vc=;
  b=M3cWqciitbLwKITHgfxoHbyyxmUxP16g0cpwb43tStxQT6FRZGpM87Ks
   9m9O5X0rfXuLejfjVV6K2RZoepkWGbbq/vSGgpP4psOhiVX13+VtOW9zv
   RTTqBLbr7w8MIC+nQohpxBhh2rTJYnXURsD1J52v6oAGBcVIt1pQ8btJg
   U2z92BmLRKih/jcf9BOa+Hr/+xObJWbBqUcdIKlS3yOWvf8/EFU4+ws0U
   aC/67p2J3m+oS+XFhF21Bfuu9RZxCVWfoMCKEdvmVCN1HC46jEra2tqoJ
   QBfbBU6RmszxxpFAXwpodpgsP4nJGtFjhh9N2Q/YuiyP+gkcgS2zK/CF9
   g==;
X-CSE-ConnectionGUID: DUkrJMbzQoK2RziNsCzPcw==
X-CSE-MsgGUID: 3XKXVvU2R+64pzhW6mcIKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97503296"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="97503296"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 18:10:53 -0700
X-CSE-ConnectionGUID: ulvL0fe1RleEiVjE9fsr/g==
X-CSE-MsgGUID: jigvKI7oTzGiQyip0WcDNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="290109570"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Jul 2026 18:10:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpFIO-00000000fok-3Nhg;
	Thu, 30 Jul 2026 01:10:48 +0000
Date: Thu, 30 Jul 2026 09:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-ratelimit 57/81] lib/dynamic_debug.c:1987:3:
 warning: variable 'i' is uninitialized when used here
Message-ID: <202607300833.pp1EF8bO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-ratelimit
head:   cbb49cd4279ef7137b7931337dbbc47d7f9532d0
commit: 75e0f7b4820647e0712c667269fc5c720aa378c5 [57/81] dyndbg: walk dd_mod_map intervals in dynamic_debug_init()
config: hexagon-randconfig-002-20260729 (https://download.01.org/0day-ci/archive/20260730/202607300833.pp1EF8bO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300833.pp1EF8bO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607300833.pp1EF8bO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1987:3: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
    1987 |                 i += mod_di.descs.len;
         |                 ^
   lib/dynamic_debug.c:1910:7: note: initialize the variable 'i' to silence this warning
    1910 |         int i, ret = 0, mod_ct = 0;
         |              ^
         |               = 0
   1 warning generated.


vim +/i +1987 lib/dynamic_debug.c

  1934	
  1935		if (&__start___dyndbg_descs == &__stop___dyndbg_descs) {
  1936			if (IS_ENABLED(CONFIG_DYNAMIC_DEBUG)) {
  1937				pr_warn("_ddebug table is empty in a CONFIG_DYNAMIC_DEBUG build\n");
  1938				return 1;
  1939			}
  1940			pr_info("Ignore empty _ddebug table in a CONFIG_DYNAMIC_DEBUG_CORE build\n");
  1941			ddebug_init_success = 1;
  1942			return 0;
  1943		}
  1944		/*
  1945		 * fill the 3 function, file, module trees with the values and
  1946		 * their intervals, and then walk the module intervals and
  1947		 * call add_module for each.
  1948		 */
  1949		ddebug_condense_sites(&di);
  1950	
  1951		/*
  1952		 * under rcu-lock, gather the modules' descriptor intervals
  1953		 * into an atomically alloc'd list
  1954		 */
  1955		rcu_read_lock();
  1956		MA_STATE(mas, &dd_mod_map, 0, ULONG_MAX);
  1957		mas_for_each(&mas, mod_name, ULONG_MAX) {
  1958			mod_info = kmalloc(sizeof(*mod_info), GFP_ATOMIC);
  1959			if (!mod_info) {
  1960				pr_warn("kmalloc failed, some modules may not be processed\n");
  1961				break;
  1962			}
  1963			mod_info->mod_name = (const char *)mod_name;
  1964			mod_info->start_addr = mas.index;
  1965			mod_info->end_addr = mas.last;
  1966			list_add_tail(&mod_info->link, &mod_list);
  1967		}
  1968		rcu_read_unlock();
  1969	
  1970		/*
  1971		 * walk the list, call ddebug_add_module for each, which may sleep
  1972		 */
  1973		list_for_each_entry_safe(mod_info, tmp, &mod_list, link) {
  1974			struct _ddebug_info mod_di = di;
  1975	
  1976			mod_di.mod_name = mod_info->mod_name;
  1977			mod_di.descs.start = (struct _ddebug *)mod_info->start_addr;
  1978			mod_di.descs.len = (mod_info->end_addr - mod_info->start_addr) / sizeof(struct _ddebug) + 1;
  1979	
  1980			ret = ddebug_add_module(&mod_di);
  1981			if (ret) {
  1982				pr_err("Failed to add module %s, error %d\n",
  1983				       mod_di.mod_name, ret);
  1984				goto out_err;
  1985			}
  1986			mod_ct++;
> 1987			i += mod_di.descs.len;
  1988			list_del(&mod_info->link);
  1989			kfree(mod_info);
  1990		}
  1991	
  1992		ddebug_init_success = 1;
  1993		vpr_info("%d prdebugs in %d modules, %d KiB in ddebug tables, %d+%d kiB in __dyndbg:_descs+_sites sections\n",
  1994			 i, mod_ct, (int)((mod_ct * sizeof(struct ddebug_table)) >> 10),
  1995			 (int)((i * sizeof(struct _ddebug)) >> 10),
  1996			 (int)((i * sizeof(struct _ddebug_site)) >> 10));
  1997	
  1998		if (di.maps.len)
  1999			v2pr_info("  %d builtin ddebug class-maps\n", di.maps.len);
  2000	
  2001		/* now that ddebug tables are loaded, process all boot args
  2002		 * again to find and activate queries given in dyndbg params.
  2003		 * While this has already been done for known boot params, it
  2004		 * ignored the unknown ones (dyndbg in particular).  Reusing
  2005		 * parse_args avoids ad-hoc parsing.  This will also attempt
  2006		 * to activate queries for not-yet-loaded modules, which is
  2007		 * slightly noisy if verbose, but harmless.
  2008		 */
  2009		cmdline = kstrdup(saved_command_line, GFP_KERNEL);
  2010		parse_args("dyndbg params", cmdline, NULL,
  2011			   0, 0, 0, NULL, &ddebug_dyndbg_boot_param_cb);
  2012		kfree(cmdline);
  2013		return 0;
  2014	
  2015	out_err:
  2016		/* Clean up any remaining items in mod_list on error */
  2017		list_for_each_entry_safe(mod_info, tmp, &mod_list, link) {
  2018			list_del(&mod_info->link);
  2019			kfree(mod_info);
  2020		}
  2021		ddebug_remove_all_tables();
  2022		return ret;
  2023	}
  2024	/* Allow early initialization for boot messages via boot param */
  2025	early_initcall(dynamic_debug_init);
  2026	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
