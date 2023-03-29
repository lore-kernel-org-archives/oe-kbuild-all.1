Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690771102
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 07:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680075405; x=1711611405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NDW+4F8uADaon0OIEsKwJv4vHVXWeM0DMgqQw8Pkf/Y=;
  b=jUUIwDmeUlQV/xoTX9hEnMRBknvBa/ViPhrQEGqY9tCaiqjjVtZZA6Bq
   jI9EVxTku3ACl3EVGjQ9Q6f+01la0MGEKo2TenzZuZf9fJmdArKU0mbRt
   swYXS2cCQiYB7SfxjcvSH9GwybXhEbu77kMNEpnzsWzlA0JlDX4xeKi3Z
   e1OYUFc1auOjKqJXmGSdNqGYKBWWVgXfs1jbPKUtuVNaxWa9+10MF9rrp
   YS6wS/VG7uaZDd6iDTqxWb7fMHY/26faCsgzn5lq5nO2j6Fg425faoMD0
   WYN7ZxVHYrE8oQGTpCuOTx8OVJ0NeLFMwG+VvO2jjuN6wKOsAk4HM/1bZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="403427349"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="403427349"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 00:36:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="714535069"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="714535069"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 29 Mar 2023 00:36:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phQMK-000JJe-2B;
	Wed, 29 Mar 2023 07:36:40 +0000
Date: Wed, 29 Mar 2023 15:35:53 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230328-module-alloc-opts 40/40]
 kernel/module/tracking.c:18:39: error: expected ';' before 'int'
Message-ID: <202303291533.36FfMXoT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230328-module-alloc-opts
head:   6a931d2d6ad46e4090218b63a131b8c9591699e0
commit: 6a931d2d6ad46e4090218b63a131b8c9591699e0 [40/40] module: add debug stats to help identify memory pressure
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230329/202303291533.36FfMXoT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=6a931d2d6ad46e4090218b63a131b8c9591699e0
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230328-module-alloc-opts
        git checkout 6a931d2d6ad46e4090218b63a131b8c9591699e0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303291533.36FfMXoT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/module/stats.c: In function 'read_file_mod_stats':
>> kernel/module/stats.c:120:38: warning: variable 'floads' set but not used [-Wunused-but-set-variable]
     120 |         u32 live_mod_count, fkreads, floads;
         |                                      ^~~~~~
>> kernel/module/stats.c:120:29: warning: variable 'fkreads' set but not used [-Wunused-but-set-variable]
     120 |         u32 live_mod_count, fkreads, floads;
         |                             ^~~~~~~
--
>> kernel/module/tracking.c:18:39: error: expected ';' before 'int'
      18 | extern struct dentry *mod_debugfs_root
         |                                       ^
         |                                       ;
      19 | 
      20 | int try_add_tainted_module(struct module *mod)
         | ~~~                                    
   kernel/module/tracking.c: In function 'unloaded_tainted_modules_init':
>> kernel/module/tracking.c:124:55: error: 'mod_debugfs_root' undeclared (first use in this function)
     124 |         debugfs_create_file("unloaded_tainted", 0444, mod_debugfs_root, NULL,
         |                                                       ^~~~~~~~~~~~~~~~
   kernel/module/tracking.c:124:55: note: each undeclared identifier is reported only once for each function it appears in


vim +18 kernel/module/tracking.c

    16	
    17	static LIST_HEAD(unloaded_tainted_modules);
  > 18	extern struct dentry *mod_debugfs_root
    19	
    20	int try_add_tainted_module(struct module *mod)
    21	{
    22		struct mod_unload_taint *mod_taint;
    23	
    24		module_assert_mutex_or_preempt();
    25	
    26		if (!mod->taints)
    27			goto out;
    28	
    29		list_for_each_entry_rcu(mod_taint, &unloaded_tainted_modules, list,
    30					lockdep_is_held(&module_mutex)) {
    31			if (!strcmp(mod_taint->name, mod->name) &&
    32			    mod_taint->taints & mod->taints) {
    33				mod_taint->count++;
    34				goto out;
    35			}
    36		}
    37	
    38		mod_taint = kmalloc(sizeof(*mod_taint), GFP_KERNEL);
    39		if (unlikely(!mod_taint))
    40			return -ENOMEM;
    41		strscpy(mod_taint->name, mod->name, MODULE_NAME_LEN);
    42		mod_taint->taints = mod->taints;
    43		list_add_rcu(&mod_taint->list, &unloaded_tainted_modules);
    44		mod_taint->count = 1;
    45	out:
    46		return 0;
    47	}
    48	
    49	void print_unloaded_tainted_modules(void)
    50	{
    51		struct mod_unload_taint *mod_taint;
    52		char buf[MODULE_FLAGS_BUF_SIZE];
    53	
    54		if (!list_empty(&unloaded_tainted_modules)) {
    55			printk(KERN_DEFAULT "Unloaded tainted modules:");
    56			list_for_each_entry_rcu(mod_taint, &unloaded_tainted_modules,
    57						list) {
    58				size_t l;
    59	
    60				l = module_flags_taint(mod_taint->taints, buf);
    61				buf[l++] = '\0';
    62				pr_cont(" %s(%s):%llu", mod_taint->name, buf,
    63					mod_taint->count);
    64			}
    65		}
    66	}
    67	
    68	#ifdef CONFIG_DEBUG_FS
    69	static void *unloaded_tainted_modules_seq_start(struct seq_file *m, loff_t *pos)
    70		__acquires(rcu)
    71	{
    72		rcu_read_lock();
    73		return seq_list_start_rcu(&unloaded_tainted_modules, *pos);
    74	}
    75	
    76	static void *unloaded_tainted_modules_seq_next(struct seq_file *m, void *p, loff_t *pos)
    77	{
    78		return seq_list_next_rcu(p, &unloaded_tainted_modules, pos);
    79	}
    80	
    81	static void unloaded_tainted_modules_seq_stop(struct seq_file *m, void *p)
    82		__releases(rcu)
    83	{
    84		rcu_read_unlock();
    85	}
    86	
    87	static int unloaded_tainted_modules_seq_show(struct seq_file *m, void *p)
    88	{
    89		struct mod_unload_taint *mod_taint;
    90		char buf[MODULE_FLAGS_BUF_SIZE];
    91		size_t l;
    92	
    93		mod_taint = list_entry(p, struct mod_unload_taint, list);
    94		l = module_flags_taint(mod_taint->taints, buf);
    95		buf[l++] = '\0';
    96	
    97		seq_printf(m, "%s (%s) %llu", mod_taint->name, buf, mod_taint->count);
    98		seq_puts(m, "\n");
    99	
   100		return 0;
   101	}
   102	
   103	static const struct seq_operations unloaded_tainted_modules_seq_ops = {
   104		.start = unloaded_tainted_modules_seq_start,
   105		.next  = unloaded_tainted_modules_seq_next,
   106		.stop  = unloaded_tainted_modules_seq_stop,
   107		.show  = unloaded_tainted_modules_seq_show,
   108	};
   109	
   110	static int unloaded_tainted_modules_open(struct inode *inode, struct file *file)
   111	{
   112		return seq_open(file, &unloaded_tainted_modules_seq_ops);
   113	}
   114	
   115	static const struct file_operations unloaded_tainted_modules_fops = {
   116		.open = unloaded_tainted_modules_open,
   117		.read = seq_read,
   118		.llseek = seq_lseek,
   119		.release = seq_release,
   120	};
   121	
   122	static int __init unloaded_tainted_modules_init(void)
   123	{
 > 124		debugfs_create_file("unloaded_tainted", 0444, mod_debugfs_root, NULL,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
