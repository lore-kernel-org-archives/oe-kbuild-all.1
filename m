Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8321D405F7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 00:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779064629; cv=none; b=V5IUS4RDP5jiY4jIYU5l+ZRrKfIffqFu3dxAdspT8MVESnjxs5dOWZxJfsfO0yOindvufIHEOzPSDgwwy2ydA+57r0G3M0tJauashRrMTyLM9I3qHXqZgIaF5xelXar8P69EvsgW/mXnXmPNGbJLIuJCYxArQR6BwMdjip7tmwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779064629; c=relaxed/simple;
	bh=MBBasAaj9y96QE5VSRK/3o809CrxHp1ppllpUbVtdvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dHZbB3NxF7gkSUTtr6nM2GJdwTcY7x0HTKPq+iOdqEfkkED1JqoMMwV6kysFA4PI9MbV3NmBudQmWb5SilaPi3kppZs5d1IiUj10teJG5EyO//3k9lvra2jmtFQHZWDE2KacOi3B9J81SQ7q2XajXGGW2yF1NKV36VFEYt3NZYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWS//zgA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWS//zgA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779064627; x=1810600627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MBBasAaj9y96QE5VSRK/3o809CrxHp1ppllpUbVtdvE=;
  b=XWS//zgAbpeEwe5zkinw/K18slqhrf+oAnIHLwemBybcHXPSN7cJtN9e
   MKVUJ0Kp3j7uwkprbHelfii9d18bu3P3BIWai/5d+9lCHRkgR8hCh4YTC
   UNzXVDfbhlOQFBnp6VF/75MJ2sbIHb7TEfe4Mgpq8M0UZSsCm7FyvoqyY
   9xYvj8nszTV1ebmEh4DAgxAyOxZK/uhMUgb0Y10L8k9giEUgbWwtJoXvE
   9taOmQSDDY9LNtm0ezcTeXWL9VqCxAkqT+nl+IMXBnQIcvYdelylEcli+
   GeHKnD1Q9Od2rNS28lw5fakm68WO16nNnjeDbkRoP9wWRi/9MT650SX1Q
   g==;
X-CSE-ConnectionGUID: x5Xa/CmUQ2K6ywI7uzDE+A==
X-CSE-MsgGUID: TxOqJVA0QA6cqOGfaoo0YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79052015"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79052015"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 17:37:06 -0700
X-CSE-ConnectionGUID: vbfqgVx+QYW5Fep3T10SlA==
X-CSE-MsgGUID: YecGhvObT4ykr+O3lZOwVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="239504152"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 May 2026 17:37:05 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOlyg-0000000027s-2AGw;
	Mon, 18 May 2026 00:37:02 +0000
Date: Mon, 18 May 2026 08:36:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-go 47/52] lib/dynamic_debug.c:1937:3:
 warning: variable 'i' is uninitialized when used here
Message-ID: <202605180838.x7k2Gb4G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-shrink-go
head:   270053dc597e59c9ffc0b5f17c8863076b56c7cf
commit: 3abfc0ec4ce891c42a2028af61ed0f2fb06cb64c [47/52] dyndbg: walk dd_mod_map intervals in dynamic_debug_init()
config: x86_64-randconfig-073-20260518 (https://download.01.org/0day-ci/archive/20260518/202605180838.x7k2Gb4G-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180838.x7k2Gb4G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180838.x7k2Gb4G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c:835:8: warning: unused variable 'nl' [-Wunused-variable]
     835 |         char *nl;
         |               ^~
>> lib/dynamic_debug.c:1937:3: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
    1937 |                 i += mod_di.descs.len;
         |                 ^
   lib/dynamic_debug.c:1860:7: note: initialize the variable 'i' to silence this warning
    1860 |         int i, ret = 0, mod_ct = 0;
         |              ^
         |               = 0
   2 warnings generated.


vim +/i +1937 lib/dynamic_debug.c

  1884	
  1885		if (&__start___dyndbg_descs == &__stop___dyndbg_descs) {
  1886			if (IS_ENABLED(CONFIG_DYNAMIC_DEBUG)) {
  1887				pr_warn("_ddebug table is empty in a CONFIG_DYNAMIC_DEBUG build\n");
  1888				return 1;
  1889			}
  1890			pr_info("Ignore empty _ddebug table in a CONFIG_DYNAMIC_DEBUG_CORE build\n");
  1891			ddebug_init_success = 1;
  1892			return 0;
  1893		}
  1894		/*
  1895		 * fill the 3 function, file, module trees with the values and
  1896		 * their intervals, and then walk the module intervals and
  1897		 * call add_module for each.
  1898		 */
  1899		ddebug_condense_sites(&di);
  1900	
  1901		/*
  1902		 * under rcu-lock, gather the modules' descriptor intervals
  1903		 * into an atomically alloc'd list
  1904		 */
  1905		rcu_read_lock();
  1906		MA_STATE(mas, &dd_mod_map, 0, ULONG_MAX);
  1907		mas_for_each(&mas, mod_name, ULONG_MAX) {
  1908			mod_info = kmalloc(sizeof(*mod_info), GFP_ATOMIC);
  1909			if (!mod_info) {
  1910				pr_warn("kmalloc failed, some modules may not be processed\n");
  1911				break;
  1912			}
  1913			mod_info->mod_name = (const char *)mod_name;
  1914			mod_info->start_addr = mas.index;
  1915			mod_info->end_addr = mas.last;
  1916			list_add_tail(&mod_info->link, &mod_list);
  1917		}
  1918		rcu_read_unlock();
  1919	
  1920		/*
  1921		 * walk the list, call ddebug_add_module for each, which may sleep
  1922		 */
  1923		list_for_each_entry_safe(mod_info, tmp, &mod_list, link) {
  1924			struct _ddebug_info mod_di = di;
  1925	
  1926			mod_di.mod_name = mod_info->mod_name;
  1927			mod_di.descs.start = (struct _ddebug *)mod_info->start_addr;
  1928			mod_di.descs.len = (mod_info->end_addr - mod_info->start_addr) / sizeof(struct _ddebug) + 1;
  1929	
  1930			ret = ddebug_add_module(&mod_di);
  1931			if (ret) {
  1932				pr_err("Failed to add module %s, error %d\n",
  1933				       mod_di.mod_name, ret);
  1934				goto out_err;
  1935			}
  1936			mod_ct++;
> 1937			i += mod_di.descs.len;
  1938			list_del(&mod_info->link);
  1939			kfree(mod_info);
  1940		}
  1941	
  1942		ddebug_init_success = 1;
  1943		vpr_info("%d prdebugs in %d modules, %d KiB in ddebug tables, %d+%d kiB in __dyndbg:_descs+_sites sections\n",
  1944			 i, mod_ct, (int)((mod_ct * sizeof(struct ddebug_table)) >> 10),
  1945			 (int)((i * sizeof(struct _ddebug)) >> 10),
  1946			 (int)((i * sizeof(struct _ddebug_site)) >> 10));
  1947	
  1948		if (di.maps.len)
  1949			v2pr_info("  %d builtin ddebug class-maps\n", di.maps.len);
  1950	
  1951		/* now that ddebug tables are loaded, process all boot args
  1952		 * again to find and activate queries given in dyndbg params.
  1953		 * While this has already been done for known boot params, it
  1954		 * ignored the unknown ones (dyndbg in particular).  Reusing
  1955		 * parse_args avoids ad-hoc parsing.  This will also attempt
  1956		 * to activate queries for not-yet-loaded modules, which is
  1957		 * slightly noisy if verbose, but harmless.
  1958		 */
  1959		cmdline = kstrdup(saved_command_line, GFP_KERNEL);
  1960		parse_args("dyndbg params", cmdline, NULL,
  1961			   0, 0, 0, NULL, &ddebug_dyndbg_boot_param_cb);
  1962		kfree(cmdline);
  1963		return 0;
  1964	
  1965	out_err:
  1966		/* Clean up any remaining items in mod_list on error */
  1967		list_for_each_entry_safe(mod_info, tmp, &mod_list, link) {
  1968			list_del(&mod_info->link);
  1969			kfree(mod_info);
  1970		}
  1971		ddebug_remove_all_tables();
  1972		return ret;
  1973	}
  1974	/* Allow early initialization for boot messages via boot param */
  1975	early_initcall(dynamic_debug_init);
  1976	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
