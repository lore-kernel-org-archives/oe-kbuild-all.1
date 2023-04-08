Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC78EA1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 00:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680913397; x=1712449397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t6BCWrgS01zzZMQwKjz6vCnFJyQEK14rdDZanQl2fwo=;
  b=IfzWaa07l6m4LOlSjFEoVWMzJAnoMySNIqVTwYDCE53gzlEHFZZDV9qt
   t5H+fSkrsD/Mn98onIq8Fb07ViUAzSbr2Po1X7WheOPp3TKEYNN7bnz12
   79uaeWwTkmQBCQH/DF32Pp2MfgNqebxyY4v/hF5jvIPo5c2yqyJsB7PVU
   A0MkKyTHiDN/b0Kc6KDYU9zrxfYYBfH2TvuuQiLgYBvQ2lc8wSUsifd7t
   cDfQHVHkjxlOzAXrRnqtAkxh0x2QT4oiQSkAVGLqnpmhNJ4zH1H4T5Sgs
   rY3VlZULEf+30Z0W0oZRPDBjB4Vsrd3Xlwr2fpjvevX37OP8ideqS8Fjf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="370926122"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="370926122"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 17:23:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="1017409608"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="1017409608"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Apr 2023 17:23:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkwMM-000T3f-0y;
	Sat, 08 Apr 2023 00:23:14 +0000
Date: Sat, 8 Apr 2023 08:22:33 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230405-module-alloc-opts 38/40]
 kernel/module/stats.c:248:38: error: passing argument 1 of 'atomic64_inc'
 from incompatible pointer type
Message-ID: <202304080859.yBa1EqcG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230405-module-alloc-opts
head:   df3d0d8eab2e52ef53c9c95e45275904397cb19a
commit: 91f048af0cadf1b14de4c0be5481de5e34bbac2b [38/40] module: add debug stats to help identify memory pressure
config: csky-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304080859.yBa1EqcG-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=91f048af0cadf1b14de4c0be5481de5e34bbac2b
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230405-module-alloc-opts
        git checkout 91f048af0cadf1b14de4c0be5481de5e34bbac2b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash arch/csky/ drivers/staging/ kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080859.yBa1EqcG-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/module/stats.c: In function 'try_add_failed_module':
>> kernel/module/stats.c:248:38: error: passing argument 1 of 'atomic64_inc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     248 |                         atomic64_inc(&mod_fail->count);
         |                                      ^~~~~~~~~~~~~~~~
         |                                      |
         |                                      atomic_long_t * {aka atomic_t *}
   In file included from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/csky/include/asm/bitops.h:69,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/csky/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from kernel/module/stats.c:8:
   include/linux/atomic/atomic-instrumented.h:807:26: note: expected 'atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     807 | atomic64_inc(atomic64_t *v)
         |              ~~~~~~~~~~~~^
   kernel/module/stats.c:259:22: error: passing argument 1 of 'atomic64_inc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     259 |         atomic64_inc(&mod_fail->count);
         |                      ^~~~~~~~~~~~~~~~
         |                      |
         |                      atomic_long_t * {aka atomic_t *}
   include/linux/atomic/atomic-instrumented.h:807:26: note: expected 'atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     807 | atomic64_inc(atomic64_t *v)
         |              ~~~~~~~~~~~~^
   kernel/module/stats.c: In function 'read_file_mod_stats':
>> kernel/module/stats.c:290:36: error: passing argument 1 of 'atomic64_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     290 |         total_size = atomic64_read(&total_mod_size);
         |                                    ^~~~~~~~~~~~~~~
         |                                    |
         |                                    atomic_long_t * {aka atomic_t *}
   include/linux/atomic/atomic-instrumented.h:644:33: note: expected 'const atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     644 | atomic64_read(const atomic64_t *v)
         |               ~~~~~~~~~~~~~~~~~~^
   kernel/module/stats.c:291:35: error: passing argument 1 of 'atomic64_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     291 |         text_size = atomic64_read(&total_text_size);
         |                                   ^~~~~~~~~~~~~~~~
         |                                   |
         |                                   atomic_long_t * {aka atomic_t *}
   include/linux/atomic/atomic-instrumented.h:644:33: note: expected 'const atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     644 | atomic64_read(const atomic64_t *v)
         |               ~~~~~~~~~~~~~~~~~~^
   kernel/module/stats.c:292:38: error: passing argument 1 of 'atomic64_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     292 |         ikread_bytes = atomic64_read(&invalid_kread_bytes);
         |                                      ^~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      atomic_long_t * {aka atomic_t *}
   include/linux/atomic/atomic-instrumented.h:644:33: note: expected 'const atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     644 | atomic64_read(const atomic64_t *v)
         |               ~~~~~~~~~~~~~~~~~~^
   kernel/module/stats.c:293:43: error: passing argument 1 of 'atomic64_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     293 |         idecompress_bytes = atomic64_read(&invalid_decompress_bytes);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                           |
         |                                           atomic_long_t * {aka atomic_t *}
   include/linux/atomic/atomic-instrumented.h:644:33: note: expected 'const atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     644 | atomic64_read(const atomic64_t *v)
         |               ~~~~~~~~~~~~~~~~~~^
   kernel/module/stats.c:294:41: error: passing argument 1 of 'atomic64_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     294 |         ibecoming_bytes = atomic64_read(&invalid_becoming_bytes);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         atomic_long_t * {aka atomic_t *}
   include/linux/atomic/atomic-instrumented.h:644:33: note: expected 'const atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     644 | atomic64_read(const atomic64_t *v)
         |               ~~~~~~~~~~~~~~~~~~^
   kernel/module/stats.c:295:36: error: passing argument 1 of 'atomic64_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     295 |         imod_bytes = atomic64_read(&invalid_mod_bytes);
         |                                    ^~~~~~~~~~~~~~~~~~
         |                                    |
         |                                    atomic_long_t * {aka atomic_t *}
   include/linux/atomic/atomic-instrumented.h:644:33: note: expected 'const atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     644 | atomic64_read(const atomic64_t *v)
         |               ~~~~~~~~~~~~~~~~~~^
   kernel/module/stats.c:389:48: error: passing argument 1 of 'atomic64_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     389 |                                  atomic64_read(&mod_fail->count), mod_fail_to_str(mod_fail));
         |                                                ^~~~~~~~~~~~~~~~
         |                                                |
         |                                                atomic_long_t * {aka atomic_t *}
   include/linux/atomic/atomic-instrumented.h:644:33: note: expected 'const atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     644 | atomic64_read(const atomic64_t *v)
         |               ~~~~~~~~~~~~~~~~~~^
   cc1: some warnings being treated as errors


vim +/atomic64_inc +248 kernel/module/stats.c

   240	
   241	int try_add_failed_module(const char *name, size_t len, enum fail_dup_mod_reason reason)
   242	{
   243		struct mod_fail_load *mod_fail;
   244	
   245		list_for_each_entry_rcu(mod_fail, &dup_failed_modules, list,
   246					lockdep_is_held(&module_mutex)) {
   247			if (strlen(mod_fail->name) == len && !memcmp(mod_fail->name, name, len)) {
 > 248	                        atomic64_inc(&mod_fail->count);
   249				__set_bit(reason, &mod_fail->dup_fail_mask);
   250	                        goto out;
   251	                }
   252	        }
   253	
   254		mod_fail = kzalloc(sizeof(*mod_fail), GFP_KERNEL);
   255		if (!mod_fail)
   256			return -ENOMEM;
   257		memcpy(mod_fail->name, name, len);
   258		__set_bit(reason, &mod_fail->dup_fail_mask);
 > 259	        atomic64_inc(&mod_fail->count);
   260	        list_add_rcu(&mod_fail->list, &dup_failed_modules);
   261	out:
   262		return 0;
   263	}
   264	
   265	/*
   266	 * At 64 bytes per module and assuming a 1024 bytes preamble we can fit the
   267	 * 112 module prints within 8k.
   268	 *
   269	 * 1024 + (64*112) = 8k
   270	 */
   271	#define MAX_PREAMBLE 1024
   272	#define MAX_FAILED_MOD_PRINT 112
   273	#define MAX_BYTES_PER_MOD 64
   274	static ssize_t read_file_mod_stats(struct file *file, char __user *user_buf,
   275					   size_t count, loff_t *ppos)
   276	{
   277		struct mod_fail_load *mod_fail;
   278		unsigned int len, size, count_failed = 0;
   279		char *buf;
   280		u32 live_mod_count, fkreads, fdecompress, fbecoming, floads;
   281		u64 total_size, text_size, ikread_bytes, ibecoming_bytes, idecompress_bytes, imod_bytes,
   282		    total_virtual_lost;
   283	
   284		live_mod_count = atomic_read(&modcount);
   285		fkreads = atomic_read(&failed_kreads);
   286		fdecompress = atomic_read(&failed_decompress);
   287		fbecoming = atomic_read(&failed_becoming);
   288		floads = atomic_read(&failed_load_modules);
   289	
 > 290		total_size = atomic64_read(&total_mod_size);
   291		text_size = atomic64_read(&total_text_size);
   292		ikread_bytes = atomic64_read(&invalid_kread_bytes);
   293		idecompress_bytes = atomic64_read(&invalid_decompress_bytes);
   294		ibecoming_bytes = atomic64_read(&invalid_becoming_bytes);
   295		imod_bytes = atomic64_read(&invalid_mod_bytes);
   296	
   297		total_virtual_lost = ikread_bytes + idecompress_bytes + ibecoming_bytes + imod_bytes;
   298	
   299		size = MAX_PREAMBLE + min((unsigned int)(floads + fbecoming) * MAX_BYTES_PER_MOD,
   300				  (unsigned int) MAX_FAILED_MOD_PRINT * MAX_BYTES_PER_MOD);
   301		buf = kzalloc(size, GFP_KERNEL);
   302		if (buf == NULL)
   303			return -ENOMEM;
   304	
   305		/* The beginning of our debug preamble */
   306		len = scnprintf(buf + 0, size - len, "%25s\t%u\n", "Mods ever loaded", live_mod_count);
   307	
   308		len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods failed on kread", fkreads);
   309	
   310		len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods failed on decompress",
   311				 fdecompress);
   312		len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods failed on becoming", fbecoming);
   313	
   314		len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods failed on load", floads);
   315	
   316		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Total module size", total_size);
   317		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Total mod text size", text_size);
   318	
   319		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Failed kread bytes", ikread_bytes);
   320	
   321		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Failed decompress bytes",
   322				 idecompress_bytes);
   323	
   324		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Failed becoming bytes", ibecoming_bytes);
   325	
   326		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Failed kmod bytes", imod_bytes);
   327	
   328		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Virtual mem wasted bytes", total_virtual_lost);
   329	
   330		if (live_mod_count && total_size) {
   331			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Average mod size",
   332					 DIV_ROUND_UP(total_size, live_mod_count));
   333		}
   334	
   335		if (live_mod_count && text_size) {
   336			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Average mod text size",
   337					 DIV_ROUND_UP(text_size, live_mod_count));
   338		}
   339	
   340		/*
   341		 * We use WARN_ON_ONCE() for the counters to ensure we always have parity
   342		 * for keeping tabs on a type of failure with one type of byte counter.
   343		 * The counters for imod_bytes does not increase for fkreads failures
   344		 * for example, and so on.
   345		 */
   346	
   347		WARN_ON_ONCE(ikread_bytes && !fkreads);
   348		if (fkreads && ikread_bytes) {
   349			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Avg fail kread bytes",
   350					 DIV_ROUND_UP(ikread_bytes, fkreads));
   351		}
   352	
   353		WARN_ON_ONCE(ibecoming_bytes && !fbecoming);
   354		if (fbecoming && ibecoming_bytes) {
   355			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Avg fail becoming bytes",
   356					 DIV_ROUND_UP(ibecoming_bytes, fbecoming));
   357		}
   358	
   359		WARN_ON_ONCE(idecompress_bytes && !fdecompress);
   360		if (fdecompress && idecompress_bytes) {
   361			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Avg fail decomp bytes",
   362					 DIV_ROUND_UP(idecompress_bytes, fdecompress));
   363		}
   364	
   365		WARN_ON_ONCE(imod_bytes && !floads);
   366		if (floads && imod_bytes) {
   367			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Average fail load bytes",
   368					 DIV_ROUND_UP(imod_bytes, floads));
   369		}
   370	
   371		/* End of our debug preamble header. */
   372	
   373		/* Catch when we've gone beyond our expected preamble */
   374		WARN_ON_ONCE(len >= MAX_PREAMBLE);
   375	
   376		if (list_empty(&dup_failed_modules))
   377			goto out;
   378	
   379		len += scnprintf(buf + len, size - len, "Duplicate failed modules:\n");
   380		len += scnprintf(buf + len, size - len, "%25s\t%15s\t%25s\n",
   381				 "module-name", "How-many-times", "Reason");
   382		mutex_lock(&module_mutex);
   383	
   384	
   385		list_for_each_entry_rcu(mod_fail, &dup_failed_modules, list) {
   386			if (WARN_ON_ONCE(++count_failed >= MAX_FAILED_MOD_PRINT))
   387				goto out_unlock;
   388			len += scnprintf(buf + len, size - len, "%25s\t%15llu\t%25s\n", mod_fail->name,
   389					 atomic64_read(&mod_fail->count), mod_fail_to_str(mod_fail));
   390		}
   391	out_unlock:
   392		mutex_unlock(&module_mutex);
   393	out:
   394		kfree(buf);
   395	        return simple_read_from_buffer(user_buf, count, ppos, buf, len);
   396	}
   397	#undef MAX_PREAMBLE
   398	#undef MAX_FAILED_MOD_PRINT
   399	#undef MAX_BYTES_PER_MOD
   400	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
