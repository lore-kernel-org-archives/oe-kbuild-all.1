Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B39C36F8EB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jun 2026 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782052971; cv=none; b=HjVjEwAqQ+7FQpfVCP5qA1EvDQXYrxSfTApYhMMRQMZ1/lAvAaAMLCyggJaJ+VTwKnsMldu81/Z3fpxqgjOpVyOqQgzarI/aihwpkS9yAN7TYiuT4bz3BNU2xKX+ecw3Eh8qAwO39iOiy5A+8BRSrtKC6MABgcFfadhOee5BSoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782052971; c=relaxed/simple;
	bh=WHv0EI77lLuFek5orAReV85xFgK9DsGQx7Xrh+vzTEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FITmJt6fHfneJagTk2XM346bNM3DLmWuB9lsIYeLH4Dnva4LxbPbOE8lq7fAG/ZX5DXIpyNejcsqaPP+T1NKKP5m69m8k0mWGNR0xZXWpCkrEsSRWnjpouxj+AWxI5MPPunCZDWnLxXTi0eA9SaM0YGz7nQ9ntb05xWSsQVMZgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFDNl/iJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFDNl/iJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782052969; x=1813588969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WHv0EI77lLuFek5orAReV85xFgK9DsGQx7Xrh+vzTEM=;
  b=LFDNl/iJVoYmP999dOtO3sb8GubBZPGoyjgJqUYsYz4sWThGhAgPe4E6
   oPt7SYPi7ujNKT1miz43lD0xSBhWKajUVVnvcrydTm+1JTTvbzG1/lCqy
   szCc8pysisnqobwRiCdNEGgXCSaAdBs9hhWjv1rbG3rappfMaOuh3BOHX
   WinMl0QcuYqyGwvJDNIJbQUd7gfAx/Na8fAQfh/l994ErWQGAfaJ+twY0
   SN14WfK3elhytVPoxNpnp9Foqr/VMFaQkO/evhfX+EVe7g/lXnWxmkSYA
   HfFByVlR229GNsDDHW1FpfKkXy+1uF/8MTLU5z0uVMgwKi3U6fC3mzVwV
   A==;
X-CSE-ConnectionGUID: v34XcMz0RNG/tAznJ8DePg==
X-CSE-MsgGUID: B0jIL/zrS524l1dpxCOa8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="94195315"
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; 
   d="scan'208";a="94195315"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2026 07:42:49 -0700
X-CSE-ConnectionGUID: sUdojfLSTSe6JTPh9bo0Ig==
X-CSE-MsgGUID: Mcg8s8KrQfmL/8H/bl1XmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; 
   d="scan'208";a="252918450"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 21 Jun 2026 07:42:47 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbJNg-000000005sj-49vl;
	Sun, 21 Jun 2026 14:42:40 +0000
Date: Sun, 21 Jun 2026 16:42:32 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:wk-merge 58/72] lib/dynamic_debug.c:1995:3: warning:
 variable 'i' is uninitialized when used here
Message-ID: <202606211611.H3G2qWlZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git wk-merge
head:   0868bbdcf86c3008826415c2c24eb4c254764023
commit: b26c9f06adac07b06e329075284ce585f69200fd [58/72] dyndbg: walk dd_mod_map intervals in dynamic_debug_init()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260621/202606211611.H3G2qWlZ-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260621/202606211611.H3G2qWlZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606211611.H3G2qWlZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1995:3: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
    1995 |                 i += mod_di.descs.len;
         |                 ^
   lib/dynamic_debug.c:1918:7: note: initialize the variable 'i' to silence this warning
    1918 |         int i, ret = 0, mod_ct = 0;
         |              ^
         |               = 0
   1 warning generated.


vim +/i +1995 lib/dynamic_debug.c

  1942	
  1943		if (&__start___dyndbg_descs == &__stop___dyndbg_descs) {
  1944			if (IS_ENABLED(CONFIG_DYNAMIC_DEBUG)) {
  1945				pr_warn("_ddebug table is empty in a CONFIG_DYNAMIC_DEBUG build\n");
  1946				return 1;
  1947			}
  1948			pr_info("Ignore empty _ddebug table in a CONFIG_DYNAMIC_DEBUG_CORE build\n");
  1949			ddebug_init_success = 1;
  1950			return 0;
  1951		}
  1952		/*
  1953		 * fill the 3 function, file, module trees with the values and
  1954		 * their intervals, and then walk the module intervals and
  1955		 * call add_module for each.
  1956		 */
  1957		ddebug_condense_sites(&di);
  1958	
  1959		/*
  1960		 * under rcu-lock, gather the modules' descriptor intervals
  1961		 * into an atomically alloc'd list
  1962		 */
  1963		rcu_read_lock();
  1964		MA_STATE(mas, &dd_mod_map, 0, ULONG_MAX);
  1965		mas_for_each(&mas, mod_name, ULONG_MAX) {
  1966			mod_info = kmalloc(sizeof(*mod_info), GFP_ATOMIC);
  1967			if (!mod_info) {
  1968				pr_warn("kmalloc failed, some modules may not be processed\n");
  1969				break;
  1970			}
  1971			mod_info->mod_name = (const char *)mod_name;
  1972			mod_info->start_addr = mas.index;
  1973			mod_info->end_addr = mas.last;
  1974			list_add_tail(&mod_info->link, &mod_list);
  1975		}
  1976		rcu_read_unlock();
  1977	
  1978		/*
  1979		 * walk the list, call ddebug_add_module for each, which may sleep
  1980		 */
  1981		list_for_each_entry_safe(mod_info, tmp, &mod_list, link) {
  1982			struct _ddebug_info mod_di = di;
  1983	
  1984			mod_di.mod_name = mod_info->mod_name;
  1985			mod_di.descs.start = (struct _ddebug *)mod_info->start_addr;
  1986			mod_di.descs.len = (mod_info->end_addr - mod_info->start_addr) / sizeof(struct _ddebug) + 1;
  1987	
  1988			ret = ddebug_add_module(&mod_di);
  1989			if (ret) {
  1990				pr_err("Failed to add module %s, error %d\n",
  1991				       mod_di.mod_name, ret);
  1992				goto out_err;
  1993			}
  1994			mod_ct++;
> 1995			i += mod_di.descs.len;
  1996			list_del(&mod_info->link);
  1997			kfree(mod_info);
  1998		}
  1999	
  2000		ddebug_init_success = 1;
  2001		vpr_info("%d prdebugs in %d modules, %d KiB in ddebug tables, %d+%d kiB in __dyndbg:_descs+_sites sections\n",
  2002			 i, mod_ct, (int)((mod_ct * sizeof(struct ddebug_table)) >> 10),
  2003			 (int)((i * sizeof(struct _ddebug)) >> 10),
  2004			 (int)((i * sizeof(struct _ddebug_site)) >> 10));
  2005	
  2006		if (di.maps.len)
  2007			v2pr_info("  %d builtin ddebug class-maps\n", di.maps.len);
  2008	
  2009		/* now that ddebug tables are loaded, process all boot args
  2010		 * again to find and activate queries given in dyndbg params.
  2011		 * While this has already been done for known boot params, it
  2012		 * ignored the unknown ones (dyndbg in particular).  Reusing
  2013		 * parse_args avoids ad-hoc parsing.  This will also attempt
  2014		 * to activate queries for not-yet-loaded modules, which is
  2015		 * slightly noisy if verbose, but harmless.
  2016		 */
  2017		cmdline = kstrdup(saved_command_line, GFP_KERNEL);
  2018		parse_args("dyndbg params", cmdline, NULL,
  2019			   0, 0, 0, NULL, &ddebug_dyndbg_boot_param_cb);
  2020		kfree(cmdline);
  2021		return 0;
  2022	
  2023	out_err:
  2024		/* Clean up any remaining items in mod_list on error */
  2025		list_for_each_entry_safe(mod_info, tmp, &mod_list, link) {
  2026			list_del(&mod_info->link);
  2027			kfree(mod_info);
  2028		}
  2029		ddebug_remove_all_tables();
  2030		return ret;
  2031	}
  2032	/* Allow early initialization for boot messages via boot param */
  2033	early_initcall(dynamic_debug_init);
  2034	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
