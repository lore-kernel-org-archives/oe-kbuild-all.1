Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A1A346AC2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 05:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779081416; cv=none; b=jb3wlalCg3ZOu3fGHEBl/ZfYesqQQLSaTvhb84jWv12lp9X8AWu8oYKyBri1rfTXm8TQDCjt4tHxD1xmD/gPF6RT+UkXBzWvylde141F4WI4D9M12+knM5fTJ4dNBC991I7EXnIbrm75UpGoME1j0AhSZZ/Juzkoh3KgOmnUpuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779081416; c=relaxed/simple;
	bh=00shc1TsW9CRY9ikQJXenwN8QJrdupCUWG5XUwAwc4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A2u2V5fumNKKfYALg9psQK3vdXUdv6xUcRjfOHJwMiQPHQJzNIm/SPx6JqcG98hS3ul7WFPVZiLUpSlv5kBw1uvv6Yz31K1wZW9NBqhaiRirAZ+OMZXvW0qqswfbw6RYYyqLBMUxOLkYhFDwrr4kW6YcJhKNA7lGu8zcrbqIE8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAP6YUrs; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAP6YUrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779081415; x=1810617415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=00shc1TsW9CRY9ikQJXenwN8QJrdupCUWG5XUwAwc4U=;
  b=SAP6YUrseJYOFI+MNOvnzPdSfHdAT8L/LsPvV1dRkR5zvsuln3TTkF5G
   hSSHBdxhmK+LdXWgZNh9p+9H7cEYiHESNY4NlY96AQz9MipxbD+5mQGwr
   kDij6Qw7hKUZvZBcFosse9K/9wfReNI8XCEuYclZDQrKaTKYU8xFStr7N
   Z2VAt5kquDykz6AFOPc58uYIGNHNazm+O02MTZ5jTQh7ipxRF8cllUPSt
   /s6kK/lmk/mw8BEzPxkgUooB2R9SNPwxpKKLPVeFWMn3WUnNqGRjmnhRB
   lmo4VikT5b4/zP0CEkzrfS5LTnQ/712RBctGax8y9epGxEhMWgJZI5DXp
   w==;
X-CSE-ConnectionGUID: 0Guy2uH3RHyedvDLQLJr8A==
X-CSE-MsgGUID: /jZWxLKiTPmclWR63O6F8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79897367"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79897367"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 22:16:54 -0700
X-CSE-ConnectionGUID: a8QV4pXgTvGrTnuce8/Dww==
X-CSE-MsgGUID: UlC8gd1WSdesQ9Xwx+Bp3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="277413524"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 17 May 2026 22:16:53 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOqLS-000000009jh-2MdZ;
	Mon, 18 May 2026 05:16:50 +0000
Date: Mon, 18 May 2026 07:16:40 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-go 47/52] lib/dynamic_debug.c:1937:3:
 warning: variable 'i' is uninitialized when used here
Message-ID: <202605180703.wX1pFCU2-lkp@intel.com>
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
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260518/202605180703.wX1pFCU2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180703.wX1pFCU2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180703.wX1pFCU2-lkp@intel.com/

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
