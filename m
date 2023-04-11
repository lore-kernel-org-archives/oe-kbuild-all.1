Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B8617DB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 22:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681253373; x=1712789373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CVX11VxGJURGhtPzEEqIOWoQD6hp+c9DuLspefZIufI=;
  b=Z/Iw/bzaBcftMHKgSJSMlSQpughaHBncoXJXdjWF2lzMRK3HARXhjPV4
   SC2oNGkmSKYd8amM3PT6T6bho9wgD3SSedqLUm1McTb4KoV66N4ztPj7Q
   j/RN8b/GDZ5UxfEnrA1lBnwFVN45r7l2NfXGy88E8D3EpWqx21zRRUZ+p
   O747l0kZfbUWmjCmf/hOS+pIs61NppKToqx3O7JdRpmTSKB6/Gc05oMf4
   zMDWD5l1JcGG0n1blrpIXim0DwLYzThaf9828GqdpbJvfaHfgHq6NIv+g
   RiHObmGpskiP79zFA7dxPytAuULoCLAX82eQiMMooRYJ2jdWrQI55BIhO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="430039036"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="430039036"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 15:49:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="800092575"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="800092575"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2023 15:49:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmMnq-000Wmb-2W;
	Tue, 11 Apr 2023 22:49:30 +0000
Date: Wed, 12 Apr 2023 06:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230406-semaphore-kmod 37/39] kernel/module/stats.c:249:38:
 error: passing argument 1 of 'atomic64_inc' from incompatible pointer type
Message-ID: <202304120608.5a1OAUsv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230406-semaphore-kmod
head:   98d5d1da0c2007c7656f74d3663af2021c1a39b4
commit: 5e216069f14b35435fe9a9f63742e84abe40863a [37/39] module: add debug stats to help identify memory pressure
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230412/202304120608.5a1OAUsv-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=5e216069f14b35435fe9a9f63742e84abe40863a
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230406-semaphore-kmod
        git checkout 5e216069f14b35435fe9a9f63742e84abe40863a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304120608.5a1OAUsv-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/module/stats.c: In function 'try_add_failed_module':
>> kernel/module/stats.c:249:38: error: passing argument 1 of 'atomic64_inc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     249 |                         atomic64_inc(&mod_fail->count);
         |                                      ^~~~~~~~~~~~~~~~
         |                                      |
         |                                      atomic_long_t * {aka atomic_t *}
   In file included from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/sh/include/asm/bitops.h:23,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/sh/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from kernel/module/stats.c:8:
   include/linux/atomic/atomic-instrumented.h:807:26: note: expected 'atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     807 | atomic64_inc(atomic64_t *v)
         |              ~~~~~~~~~~~~^
   kernel/module/stats.c:260:22: error: passing argument 1 of 'atomic64_inc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     260 |         atomic64_inc(&mod_fail->count);
         |                      ^~~~~~~~~~~~~~~~
         |                      |
         |                      atomic_long_t * {aka atomic_t *}
   include/linux/atomic/atomic-instrumented.h:807:26: note: expected 'atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     807 | atomic64_inc(atomic64_t *v)
         |              ~~~~~~~~~~~~^
   kernel/module/stats.c: In function 'read_file_mod_stats':
>> kernel/module/stats.c:291:36: error: passing argument 1 of 'atomic64_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     291 |         total_size = atomic64_read(&total_mod_size);
         |                                    ^~~~~~~~~~~~~~~
         |                                    |
         |                                    atomic_long_t * {aka atomic_t *}
   include/linux/atomic/atomic-instrumented.h:644:33: note: expected 'const atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     644 | atomic64_read(const atomic64_t *v)
         |               ~~~~~~~~~~~~~~~~~~^
   kernel/module/stats.c:292:35: error: passing argument 1 of 'atomic64_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     292 |         text_size = atomic64_read(&total_text_size);
         |                                   ^~~~~~~~~~~~~~~~
         |                                   |
         |                                   atomic_long_t * {aka atomic_t *}
   include/linux/atomic/atomic-instrumented.h:644:33: note: expected 'const atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     644 | atomic64_read(const atomic64_t *v)
         |               ~~~~~~~~~~~~~~~~~~^
   kernel/module/stats.c:293:38: error: passing argument 1 of 'atomic64_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     293 |         ikread_bytes = atomic64_read(&invalid_kread_bytes);
         |                                      ^~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      atomic_long_t * {aka atomic_t *}
   include/linux/atomic/atomic-instrumented.h:644:33: note: expected 'const atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     644 | atomic64_read(const atomic64_t *v)
         |               ~~~~~~~~~~~~~~~~~~^
   kernel/module/stats.c:294:43: error: passing argument 1 of 'atomic64_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     294 |         idecompress_bytes = atomic64_read(&invalid_decompress_bytes);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                           |
         |                                           atomic_long_t * {aka atomic_t *}
   include/linux/atomic/atomic-instrumented.h:644:33: note: expected 'const atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     644 | atomic64_read(const atomic64_t *v)
         |               ~~~~~~~~~~~~~~~~~~^
   kernel/module/stats.c:295:41: error: passing argument 1 of 'atomic64_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     295 |         ibecoming_bytes = atomic64_read(&invalid_becoming_bytes);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         atomic_long_t * {aka atomic_t *}
   include/linux/atomic/atomic-instrumented.h:644:33: note: expected 'const atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     644 | atomic64_read(const atomic64_t *v)
         |               ~~~~~~~~~~~~~~~~~~^
   kernel/module/stats.c:296:36: error: passing argument 1 of 'atomic64_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     296 |         imod_bytes = atomic64_read(&invalid_mod_bytes);
         |                                    ^~~~~~~~~~~~~~~~~~
         |                                    |
         |                                    atomic_long_t * {aka atomic_t *}
   include/linux/atomic/atomic-instrumented.h:644:33: note: expected 'const atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     644 | atomic64_read(const atomic64_t *v)
         |               ~~~~~~~~~~~~~~~~~~^
   kernel/module/stats.c:390:48: error: passing argument 1 of 'atomic64_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     390 |                                  atomic64_read(&mod_fail->count), mod_fail_to_str(mod_fail));
         |                                                ^~~~~~~~~~~~~~~~
         |                                                |
         |                                                atomic_long_t * {aka atomic_t *}
   include/linux/atomic/atomic-instrumented.h:644:33: note: expected 'const atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     644 | atomic64_read(const atomic64_t *v)
         |               ~~~~~~~~~~~~~~~~~~^
   cc1: some warnings being treated as errors


vim +/atomic64_inc +249 kernel/module/stats.c

   241	
   242	int try_add_failed_module(const char *name, size_t len, enum fail_dup_mod_reason reason)
   243	{
   244		struct mod_fail_load *mod_fail;
   245	
   246		list_for_each_entry_rcu(mod_fail, &dup_failed_modules, list,
   247					lockdep_is_held(&module_mutex)) {
   248			if (strlen(mod_fail->name) == len && !memcmp(mod_fail->name, name, len)) {
 > 249	                        atomic64_inc(&mod_fail->count);
   250				__set_bit(reason, &mod_fail->dup_fail_mask);
   251	                        goto out;
   252	                }
   253	        }
   254	
   255		mod_fail = kzalloc(sizeof(*mod_fail), GFP_KERNEL);
   256		if (!mod_fail)
   257			return -ENOMEM;
   258		memcpy(mod_fail->name, name, len);
   259		__set_bit(reason, &mod_fail->dup_fail_mask);
   260	        atomic64_inc(&mod_fail->count);
   261	        list_add_rcu(&mod_fail->list, &dup_failed_modules);
   262	out:
   263		return 0;
   264	}
   265	
   266	/*
   267	 * At 64 bytes per module and assuming a 1024 bytes preamble we can fit the
   268	 * 112 module prints within 8k.
   269	 *
   270	 * 1024 + (64*112) = 8k
   271	 */
   272	#define MAX_PREAMBLE 1024
   273	#define MAX_FAILED_MOD_PRINT 112
   274	#define MAX_BYTES_PER_MOD 64
   275	static ssize_t read_file_mod_stats(struct file *file, char __user *user_buf,
   276					   size_t count, loff_t *ppos)
   277	{
   278		struct mod_fail_load *mod_fail;
   279		unsigned int len, size, count_failed = 0;
   280		char *buf;
   281		u32 live_mod_count, fkreads, fdecompress, fbecoming, floads;
   282		u64 total_size, text_size, ikread_bytes, ibecoming_bytes, idecompress_bytes, imod_bytes,
   283		    total_virtual_lost;
   284	
   285		live_mod_count = atomic_read(&modcount);
   286		fkreads = atomic_read(&failed_kreads);
   287		fdecompress = atomic_read(&failed_decompress);
   288		fbecoming = atomic_read(&failed_becoming);
   289		floads = atomic_read(&failed_load_modules);
   290	
 > 291		total_size = atomic64_read(&total_mod_size);
   292		text_size = atomic64_read(&total_text_size);
   293		ikread_bytes = atomic64_read(&invalid_kread_bytes);
   294		idecompress_bytes = atomic64_read(&invalid_decompress_bytes);
   295		ibecoming_bytes = atomic64_read(&invalid_becoming_bytes);
   296		imod_bytes = atomic64_read(&invalid_mod_bytes);
   297	
   298		total_virtual_lost = ikread_bytes + idecompress_bytes + ibecoming_bytes + imod_bytes;
   299	
   300		size = MAX_PREAMBLE + min((unsigned int)(floads + fbecoming) * MAX_BYTES_PER_MOD,
   301				  (unsigned int) MAX_FAILED_MOD_PRINT * MAX_BYTES_PER_MOD);
   302		buf = kzalloc(size, GFP_KERNEL);
   303		if (buf == NULL)
   304			return -ENOMEM;
   305	
   306		/* The beginning of our debug preamble */
   307		len = scnprintf(buf + 0, size - len, "%25s\t%u\n", "Mods ever loaded", live_mod_count);
   308	
   309		len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods failed on kread", fkreads);
   310	
   311		len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods failed on decompress",
   312				 fdecompress);
   313		len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods failed on becoming", fbecoming);
   314	
   315		len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods failed on load", floads);
   316	
   317		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Total module size", total_size);
   318		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Total mod text size", text_size);
   319	
   320		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Failed kread bytes", ikread_bytes);
   321	
   322		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Failed decompress bytes",
   323				 idecompress_bytes);
   324	
   325		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Failed becoming bytes", ibecoming_bytes);
   326	
   327		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Failed kmod bytes", imod_bytes);
   328	
   329		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Virtual mem wasted bytes", total_virtual_lost);
   330	
   331		if (live_mod_count && total_size) {
   332			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Average mod size",
   333					 DIV_ROUND_UP(total_size, live_mod_count));
   334		}
   335	
   336		if (live_mod_count && text_size) {
   337			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Average mod text size",
   338					 DIV_ROUND_UP(text_size, live_mod_count));
   339		}
   340	
   341		/*
   342		 * We use WARN_ON_ONCE() for the counters to ensure we always have parity
   343		 * for keeping tabs on a type of failure with one type of byte counter.
   344		 * The counters for imod_bytes does not increase for fkreads failures
   345		 * for example, and so on.
   346		 */
   347	
   348		WARN_ON_ONCE(ikread_bytes && !fkreads);
   349		if (fkreads && ikread_bytes) {
   350			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Avg fail kread bytes",
   351					 DIV_ROUND_UP(ikread_bytes, fkreads));
   352		}
   353	
   354		WARN_ON_ONCE(ibecoming_bytes && !fbecoming);
   355		if (fbecoming && ibecoming_bytes) {
   356			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Avg fail becoming bytes",
   357					 DIV_ROUND_UP(ibecoming_bytes, fbecoming));
   358		}
   359	
   360		WARN_ON_ONCE(idecompress_bytes && !fdecompress);
   361		if (fdecompress && idecompress_bytes) {
   362			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Avg fail decomp bytes",
   363					 DIV_ROUND_UP(idecompress_bytes, fdecompress));
   364		}
   365	
   366		WARN_ON_ONCE(imod_bytes && !floads);
   367		if (floads && imod_bytes) {
   368			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Average fail load bytes",
   369					 DIV_ROUND_UP(imod_bytes, floads));
   370		}
   371	
   372		/* End of our debug preamble header. */
   373	
   374		/* Catch when we've gone beyond our expected preamble */
   375		WARN_ON_ONCE(len >= MAX_PREAMBLE);
   376	
   377		if (list_empty(&dup_failed_modules))
   378			goto out;
   379	
   380		len += scnprintf(buf + len, size - len, "Duplicate failed modules:\n");
   381		len += scnprintf(buf + len, size - len, "%25s\t%15s\t%25s\n",
   382				 "module-name", "How-many-times", "Reason");
   383		mutex_lock(&module_mutex);
   384	
   385	
   386		list_for_each_entry_rcu(mod_fail, &dup_failed_modules, list) {
   387			if (WARN_ON_ONCE(++count_failed >= MAX_FAILED_MOD_PRINT))
   388				goto out_unlock;
   389			len += scnprintf(buf + len, size - len, "%25s\t%15llu\t%25s\n", mod_fail->name,
   390					 atomic64_read(&mod_fail->count), mod_fail_to_str(mod_fail));
   391		}
   392	out_unlock:
   393		mutex_unlock(&module_mutex);
   394	out:
   395		kfree(buf);
   396	        return simple_read_from_buffer(user_buf, count, ppos, buf, len);
   397	}
   398	#undef MAX_PREAMBLE
   399	#undef MAX_FAILED_MOD_PRINT
   400	#undef MAX_BYTES_PER_MOD
   401	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
