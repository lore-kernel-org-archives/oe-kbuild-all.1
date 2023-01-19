Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8718715A3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 01:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674091046; x=1705627046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t3L7pb4nMneyJcUZFMrXDYy+31N6i7GwFAgkFxWOhk8=;
  b=HfTwyhd/mSF3k7uaf1yWZuv/0Acd01jjQ0DapApdfYYFxOZFePAuqnKf
   0G5hdiMyPoQN/WxgXu8VB62rsWnoWn7joykpbj37kbSQqUSwB5R8pqd9f
   gg2VROnW9o/16cqZr5+tgxvOQG7YrxENEfuV9hjL1Bx5dZJfnYJCyElmZ
   AzTJaxmwk123PFGNuGVJqKkq4mwXI3kfmw1I2FYyt3Vr07zciHOftP5Ks
   M0dF/jBO2Ad5nMfXPq1xvxqXT8sauXuyf9prCGA1jQIKc14IDBRAfLM/U
   8bSRKVNlGzVvjDu+ByRELnWt0hIfwGzu3IfdXeXC+DDkn4lvbgBhvbj0/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="304840776"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="304840776"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 17:17:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="748699199"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="748699199"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2023 17:17:24 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIJYS-0000vt-0t;
	Thu, 19 Jan 2023 01:17:24 +0000
Date: Thu, 19 Jan 2023 09:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 26/27]
 kernel/trace/ftrace.c:5862:13: error: implicit declaration of function
 'check_direct_multi'
Message-ID: <202301190924.j5Eqf0FA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   747784185d106a06b429736196d8817cb2d12a6f
commit: 7123e09cc1ac548e8e3baa43005779ae0dc181e0 [26/27] ftrace: Add set_filter_ftrace_direct_multi function
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230119/202301190924.j5Eqf0FA-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=7123e09cc1ac548e8e3baa43005779ae0dc181e0
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/tracing_multi_1
        git checkout 7123e09cc1ac548e8e3baa43005779ae0dc181e0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   kernel/trace/ftrace.c:300:5: warning: no previous prototype for '__register_ftrace_function' [-Wmissing-prototypes]
     300 | int __register_ftrace_function(struct ftrace_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:343:5: warning: no previous prototype for '__unregister_ftrace_function' [-Wmissing-prototypes]
     343 | int __unregister_ftrace_function(struct ftrace_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:4010:15: warning: no previous prototype for 'arch_ftrace_match_adjust' [-Wmissing-prototypes]
    4010 | char * __weak arch_ftrace_match_adjust(char *str, const char *search)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/ftrace.c:5853:5: warning: no previous prototype for 'set_filter_ftrace_direct_multi' [-Wmissing-prototypes]
    5853 | int set_filter_ftrace_direct_multi(struct ftrace_ops *ops, unsigned long *ips,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c: In function 'set_filter_ftrace_direct_multi':
>> kernel/trace/ftrace.c:5862:13: error: implicit declaration of function 'check_direct_multi' [-Werror=implicit-function-declaration]
    5862 |         if (check_direct_multi(ops))
         |             ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/rhashtable-types.h:14,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/sched.h:15,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/stop_machine.h:5,
                    from kernel/trace/ftrace.c:17:
>> kernel/trace/ftrace.c:5874:21: error: 'direct_mutex' undeclared (first use in this function); did you mean 'event_mutex'?
    5874 |         mutex_lock(&direct_mutex);
         |                     ^~~~~~~~~~~~
   include/linux/mutex.h:187:44: note: in definition of macro 'mutex_lock'
     187 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                                            ^~~~
   kernel/trace/ftrace.c:5874:21: note: each undeclared identifier is reported only once for each function it appears in
    5874 |         mutex_lock(&direct_mutex);
         |                     ^~~~~~~~~~~~
   include/linux/mutex.h:187:44: note: in definition of macro 'mutex_lock'
     187 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                                            ^~~~
>> kernel/trace/ftrace.c:5894:15: error: implicit declaration of function 'add_direct_functions_hash' [-Werror=implicit-function-declaration]
    5894 |         err = add_direct_functions_hash(hash_add, addr, &free_hash);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/ftrace.c:5896:17: error: implicit declaration of function 'remove_direct_functions_hash' [-Werror=implicit-function-declaration]
    5896 |                 remove_direct_functions_hash(hash_add, addr);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/check_direct_multi +5862 kernel/trace/ftrace.c

  5852	
> 5853	int set_filter_ftrace_direct_multi(struct ftrace_ops *ops, unsigned long *ips,
  5854					   unsigned int cnt, unsigned long addr)
  5855	{
  5856		struct ftrace_hash *free_hash = NULL, *rollback_hash = NULL;
  5857		struct ftrace_hash *hash = ops->func_hash->filter_hash;
  5858		struct ftrace_hash *hash_del = NULL, *hash_add = NULL;
  5859		struct ftrace_func_entry *entry;
  5860		int size, i, err = -ENOMEM;
  5861	
> 5862		if (check_direct_multi(ops))
  5863			return -EINVAL;
  5864		if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
  5865			return -EINVAL;
  5866	
  5867		sort(ips, cnt, sizeof(*ips), ips_cmp, NULL);
  5868	
  5869		hash_add = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
  5870		hash_del = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
  5871		if (!hash_add || !hash_del)
  5872			goto out;
  5873	
> 5874		mutex_lock(&direct_mutex);
  5875	
  5876		size = 1 << hash->size_bits;
  5877		for (i = 0; i < size; i++) {
  5878			hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
  5879				if (bsearch(&entry->ip, ips, cnt, sizeof(*ips), ips_cmp))
  5880					continue;
  5881				if (add_hash_entry(hash_del, entry->ip) < 0)
  5882					goto out_unlock;
  5883			}
  5884		}
  5885	
  5886		for (i = 0; i < cnt; i++) {
  5887			entry = ftrace_lookup_ip(hash, ips[i]);
  5888			if (!entry)
  5889				continue;
  5890			if (add_hash_entry(hash_add, entry->ip) < 0)
  5891				goto out_unlock;
  5892		}
  5893	
> 5894		err = add_direct_functions_hash(hash_add, addr, &free_hash);
  5895		if (err) {
> 5896			remove_direct_functions_hash(hash_add, addr);
  5897			goto out_unlock;
  5898		}
  5899	
  5900		remove_direct_functions_hash(hash_del, addr);
  5901	
  5902		err = ftrace_set_filter_ips(ops, ips, cnt, 0, 1);
  5903		if (err) {
  5904			WARN_ON_ONCE(add_direct_functions_hash(hash_del, addr, &rollback_hash));
  5905			remove_direct_functions_hash(hash_add, addr);
  5906		}
  5907	
  5908	out_unlock:
  5909		mutex_unlock(&direct_mutex);
  5910	out:
  5911		if (free_hash || rollback_hash) {
  5912			synchronize_rcu_tasks();
  5913			free_ftrace_hash(free_hash);
  5914			free_ftrace_hash(rollback_hash);
  5915		}
  5916		free_ftrace_hash(hash_add);
  5917		free_ftrace_hash(hash_del);
  5918		return err;
  5919	}
  5920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
