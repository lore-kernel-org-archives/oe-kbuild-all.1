Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8159639D6CB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 12:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503443; cv=none; b=mEh2taMRrM++QES/LOtAsd1e900oLJwF9R6zBYLLp7y9HGkyfXJFPkte56VF6RrSaVIeiMIiQSJ0e7EuQibV19pYMazwYPme3zYAT+4UDVq2TWyt6jBHgnrLf8r9VYV9tSb12vsWMeX3nReXiQB1ZsF0SBmz3nUWnmXjXE8E8n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503443; c=relaxed/simple;
	bh=Fvai66Ge/UcWhuUr2riNX0vOOFYSd1ECF0fR3IiOOrM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KYFT4yDJ9SmFqZsM0kSBIyrN2QWGFPf/BXb0XeL5dMu+gojWbXzhg2Fyw2VC3OHpNW1pT3BCLNor2Xzz+S2DPaQYvP5kdW6NP/GlVHOR4SsWJ/4hiesTWzuuDWH/kFk/LDxzOZ90ZuXkJG/yoBK8TRR6iYkll1YlKXVquLxxdIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HnYmmPCK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HnYmmPCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778503441; x=1810039441;
  h=date:from:to:cc:subject:message-id;
  bh=Fvai66Ge/UcWhuUr2riNX0vOOFYSd1ECF0fR3IiOOrM=;
  b=HnYmmPCK3vD9xXpvX+nGr1KsYFkinIu90G6d8tisgN0VJYdt5PHeIjh/
   /o0JILKQ/q7c4VHlFlCSbCibTCH1otiJQ9JQs+HnGT69MgN2Vams9v6z7
   qy+Vh7otzE1we6fFvM6U3vxOi8ql/Ane9GGT0xX4e/KvHoRC0zSPzQCNa
   g3qVXlgBqMHGKAzxQAaOouw2N7x2C/aNqwhgxzq50GkC40yLfXVsgwRns
   UArEcPiGyl7YLu/z7XEyeNjr8rvDV+J7smUUrFLOj9aFiMErx892GNe9g
   nviWK1Vylmkc1PgaEYBuTd6xgjJquAqJopUYA9UPp3r7v+Y+KBMnF4Io1
   g==;
X-CSE-ConnectionGUID: qUifoaMqQUiLBR2dNPU9Dw==
X-CSE-MsgGUID: HyGPZJVDR+Kym0hQj/v8SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79418784"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79418784"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 05:43:59 -0700
X-CSE-ConnectionGUID: s8GUeqMVS9GKlExhdm8jFw==
X-CSE-MsgGUID: 2s8VNp0kTWuaA/4rT9KeFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="231050231"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 May 2026 05:43:58 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMPzH-000000000Yl-2m4J;
	Mon, 11 May 2026 12:43:55 +0000
Date: Mon, 11 May 2026 20:43:29 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v1 8/8]
 fs/configfs/mount.c:181:28: warning: no previous prototype for
 'configfs_get_root'
Message-ID: <202605112059.vpzckh2k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v1
head:   c924e1daab3eb4efc26275918155673d5e90c6ba
commit: c924e1daab3eb4efc26275918155673d5e90c6ba [8/8] configfs: configfs_create_root()
config: i386-randconfig-141-20260511 (https://download.01.org/0day-ci/archive/20260511/202605112059.vpzckh2k-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9065-ge9cc34fd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605112059.vpzckh2k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605112059.vpzckh2k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/configfs/mount.c: In function 'configfs_test_super':
   fs/configfs/mount.c:70:23: error: invalid use of undefined type 'struct configfs_super_info'
      70 |         return sb_info->root == info->root && sb_info->ns == info->ns;
         |                       ^~
   fs/configfs/mount.c:70:37: error: invalid use of undefined type 'struct configfs_super_info'
      70 |         return sb_info->root == info->root && sb_info->ns == info->ns;
         |                                     ^~
   fs/configfs/mount.c:70:54: error: invalid use of undefined type 'struct configfs_super_info'
      70 |         return sb_info->root == info->root && sb_info->ns == info->ns;
         |                                                      ^~
   fs/configfs/mount.c:70:66: error: invalid use of undefined type 'struct configfs_super_info'
      70 |         return sb_info->root == info->root && sb_info->ns == info->ns;
         |                                                                  ^~
   In file included from include/linux/fs.h:45,
                    from fs/configfs/mount.c:11:
   fs/configfs/mount.c: In function 'configfs_fill_super':
   include/linux/slab.h:1040:57: error: invalid application of 'sizeof' to incomplete type 'struct configfs_super_info'
    1040 |         __alloc_objs(kzalloc, default_gfp(__VA_ARGS__), typeof(P), 1)
         |                                                         ^~~~~~
   include/linux/slab.h:973:51: note: in definition of macro '__alloc_objs'
     973 |         const size_t __obj_size = size_mul(sizeof(TYPE), COUNT);        \
         |                                                   ^~~~
   fs/configfs/mount.c:80:16: note: in expansion of macro 'kzalloc_obj'
      80 |         info = kzalloc_obj(*info);
         |                ^~~~~~~~~~~
   fs/configfs/mount.c:84:29: error: invalid use of undefined type 'struct configfs_super_info'
      84 |         INIT_LIST_HEAD(&info->root.s_sibling);
         |                             ^~
   fs/configfs/mount.c:85:29: error: invalid use of undefined type 'struct configfs_super_info'
      85 |         INIT_LIST_HEAD(&info->root.s_children);
         |                             ^~
   fs/configfs/mount.c:86:13: error: invalid use of undefined type 'struct configfs_super_info'
      86 |         info->root.s_type = CONFIGFS_ROOT;
         |             ^~
   fs/configfs/mount.c:87:13: error: invalid use of undefined type 'struct configfs_super_info'
      87 |         info->root.s_element = &info->group.cg_item;
         |             ^~
   fs/configfs/mount.c:87:37: error: invalid use of undefined type 'struct configfs_super_info'
      87 |         info->root.s_element = &info->group.cg_item;
         |                                     ^~
   fs/configfs/mount.c:88:13: error: invalid use of undefined type 'struct configfs_super_info'
      88 |         info->ns = fsi->ns;
         |             ^~
   fs/configfs/mount.c:90:13: error: invalid use of undefined type 'struct configfs_super_info'
      90 |         info->group.cg_item.ci_name = (char *)root_name;
         |             ^~
   fs/configfs/mount.c:98:41: error: invalid use of undefined type 'struct configfs_super_info'
      98 |                                    &info->root, sb);
         |                                         ^~
   fs/configfs/mount.c:114:32: error: invalid use of undefined type 'struct configfs_super_info'
     114 |         config_group_init(&info->group);
         |                                ^~
   fs/configfs/mount.c:115:13: error: invalid use of undefined type 'struct configfs_super_info'
     115 |         info->group.cg_item.ci_dentry = root;
         |             ^~
   fs/configfs/mount.c:116:31: error: invalid use of undefined type 'struct configfs_super_info'
     116 |         root->d_fsdata = &info->root;
         |                               ^~
   fs/configfs/mount.c: In function 'configfs_get_tree':
   fs/configfs/mount.c:126:16: error: implicit declaration of function 'vfs_get_super'; did you mean 'vfs_get_tree'? [-Wimplicit-function-declaration]
     126 |         return vfs_get_super(fc, configfs_test_super, configfs_fill_super);
         |                ^~~~~~~~~~~~~
         |                vfs_get_tree
   fs/configfs/mount.c: At top level:
>> fs/configfs/mount.c:181:28: warning: no previous prototype for 'configfs_get_root' [-Wmissing-prototypes]
     181 | struct configfs_root_info *configfs_get_root(struct ns_common *ns)
         |                            ^~~~~~~~~~~~~~~~~
   fs/configfs/mount.c: In function 'configfs_get_root':
   fs/configfs/mount.c:188:9: error: 'err' undeclared (first use in this function)
     188 |         err = idr_alloc(&configfs_mount, root, ns->ns_id,
         |         ^~~
   fs/configfs/mount.c:188:9: note: each undeclared identifier is reported only once for each function it appears in
   fs/configfs/mount.c: In function 'configfs_pin_fs':
   fs/configfs/mount.c:206:24: error: implicit declaration of function 'configfs_create_root'; did you mean 'configfs_get_root'? [-Wimplicit-function-declaration]
     206 |                 root = configfs_create_root(ns);
         |                        ^~~~~~~~~~~~~~~~~~~~
         |                        configfs_get_root
   fs/configfs/mount.c:206:22: error: assignment to 'struct configfs_root_info *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     206 |                 root = configfs_create_root(ns);
         |                      ^
   fs/configfs/mount.c: In function 'configfs_init':
   fs/configfs/mount.c:246:9: error: 'configfs_root' undeclared (first use in this function); did you mean 'configfs_init'?
     246 |         configfs_root = configfs_create_root(
         |         ^~~~~~~~~~~~~
         |         configfs_init
   fs/configfs/mount.c:247:62: error: expected ')' before ';' token
     247 |         err = sysfs_create_mount_point(kernel_kobj, "config");
         |                                                              ^
         |                                                              )
   fs/configfs/mount.c:246:45: note: to match this '('
     246 |         configfs_root = configfs_create_root(
         |                                             ^
   fs/configfs/mount.c:263:20: error: expected ';' before '}' token
     263 |         return err;
         |                    ^
         |                    ;
     264 | }
         | ~                   
   fs/configfs/mount.c:244:17: error: label 'out' used but not defined
     244 |                 goto out;
         |                 ^~~~
>> fs/configfs/mount.c:264:1: warning: no return statement in function returning non-void [-Wreturn-type]
     264 | }
         | ^
   fs/configfs/mount.c: In function 'configfs_test_super':
>> fs/configfs/mount.c:71:1: warning: control reaches end of non-void function [-Wreturn-type]
      71 | }
         | ^


vim +/configfs_get_root +181 fs/configfs/mount.c

    63	
    64	static int configfs_test_super(struct super_block *sb, struct fs_context *fc)
    65	{
    66		struct configfs_super_info *sb_info =
    67			(struct configfs_super_info *)sb->s_fs_info;
    68		struct configfs_super_info *info = fc->s_fs_info;
    69	
    70		return sb_info->root == info->root && sb_info->ns == info->ns;
  > 71	}
    72	
    73	static int configfs_fill_super(struct super_block *sb, struct fs_context *fc)
    74	{
    75		struct configfs_fs_info *fsi = fc->fs_private;
    76		struct configfs_super_info *info;
    77		struct inode *inode;
    78		struct dentry *root;
    79	
    80		info = kzalloc_obj(*info);
    81		if (!info)
    82			return -ENOMEM;
    83	
    84		INIT_LIST_HEAD(&info->root.s_sibling);
    85		INIT_LIST_HEAD(&info->root.s_children);
    86		info->root.s_type = CONFIGFS_ROOT;
    87		info->root.s_element = &info->group.cg_item;
    88		info->ns = fsi->ns;
    89	
    90		info->group.cg_item.ci_name = (char *)root_name;
    91		sb->s_blocksize = PAGE_SIZE;
    92		sb->s_blocksize_bits = PAGE_SHIFT;
    93		sb->s_magic = CONFIGFS_MAGIC;
    94		sb->s_op = &configfs_ops;
    95		sb->s_time_gran = 1;
    96	
    97		inode = configfs_new_inode(S_IFDIR | S_IRWXU | S_IRUGO | S_IXUGO,
    98					   &info->root, sb);
    99		if (inode) {
   100			inode->i_op = &configfs_root_inode_operations;
   101			inode->i_fop = &configfs_dir_operations;
   102			/* directory inodes start off with i_nlink == 2 (for "." entry) */
   103			inc_nlink(inode);
   104		} else {
   105			pr_debug("could not get root inode\n");
   106			return -ENOMEM;
   107		}
   108	
   109		root = d_make_root(inode);
   110		if (!root) {
   111			pr_debug("%s: could not get root dentry!\n",__func__);
   112			return -ENOMEM;
   113		}
   114		config_group_init(&info->group);
   115		info->group.cg_item.ci_dentry = root;
   116		root->d_fsdata = &info->root;
   117		sb->s_root = root;
   118		set_default_d_op(sb, &configfs_dentry_ops); /* the rest get that */
   119		sb->s_d_flags |= DCACHE_DONTCACHE;
   120		sb->s_fs_info = info;
   121		return 0;
   122	}
   123	
   124	static int configfs_get_tree(struct fs_context *fc)
   125	{
   126		return vfs_get_super(fc, configfs_test_super, configfs_fill_super);
   127	}
   128	
   129	static void configfs_fs_context_free(struct fs_context *fc)
   130	{
   131		struct configfs_fs_info *fsi = fc->fs_private;
   132	
   133		if (fsi->ns)
   134			kobj_ns_drop(KOBJ_NS_TYPE_NET, fsi->ns);
   135	
   136		kfree(fsi);
   137	}
   138	
   139	static const struct fs_context_operations configfs_context_ops = {
   140		.get_tree	= configfs_get_tree,
   141		.free		= configfs_fs_context_free,
   142	};
   143	
   144	static int configfs_init_fs_context(struct fs_context *fc)
   145	{
   146		struct configfs_fs_info *fsi;
   147	
   148		fsi = kzalloc_obj(*fsi);
   149		if (!fsi)
   150			return -ENOMEM;
   151		fsi->ns = kobj_ns_grab_current(KOBJ_NS_TYPE_NET);
   152		if (fsi->ns) {
   153			struct net *netns = to_net_ns(fsi->ns);
   154	
   155			put_user_ns(fc->user_ns);
   156			fc->user_ns = get_user_ns(netns->user_ns);
   157		}
   158		fc->fs_private = fsi;
   159		fc->ops = &configfs_context_ops;
   160		fc->global = true;
   161		return 0;
   162	}
   163	
   164	static void configfs_kill_sb(struct super_block *sb)
   165	{
   166		struct configfs_sb_info *info =
   167			(struct configfs_sb_info *)(sb->s_fs_info);
   168	
   169		kill_anon_super(sb);
   170		kfree(info);
   171	}
   172	
   173	static struct file_system_type configfs_fs_type = {
   174		.owner		= THIS_MODULE,
   175		.name		= "configfs",
   176		.init_fs_context = configfs_init_fs_context,
   177		.kill_sb	= configfs_kill_sb,
   178	};
   179	MODULE_ALIAS_FS("configfs");
   180	
 > 181	struct configfs_root_info *configfs_get_root(struct ns_common *ns)
   182	{
   183		struct configfs_root_info *root =
   184			kzalloc_obj(*root);
   185	
   186		if (!root)
   187			return ERR_PTR(-ENOMEM);
   188		err = idr_alloc(&configfs_mount, root, ns->ns_id,
   189				ns->ns_id + 1, GFP_KERNEL);
   190		if (err < 0) {
   191			kfree(root);
   192			return ERR_PTR(err);
   193		}
   194		WARN_ON(err != ns->ns_id);
   195		return root;
   196	}
   197	
   198	struct dentry *configfs_pin_fs(void)
   199	{
   200		struct ns_common *ns = from_mnt_ns(current->nsproxy->mnt_ns);
   201		struct configfs_root_info *root = idr_find(&configfs_mount,
   202							   ns->ns_id);
   203		int err;
   204	
   205		if (!root) {
   206			root = configfs_create_root(ns);
   207			if (IS_ERR(root))
   208				return ERR_CAST(root);
   209		}
   210		err = simple_pin_fs(&configfs_fs_type, &root->mnt,
   211				    &root->count);
   212		if (err) {
   213			idr_remove(&configfs_mount, ns->ns_id);
   214			kfree(root);
   215			return ERR_PTR(err);
   216		}
   217		pr_debug("%s: pin ns %llu\n", __func__, ns->ns_id);
   218		return root->mnt->mnt_root;
   219	}
   220	
   221	void configfs_release_fs(void)
   222	{
   223		struct ns_common *ns = from_mnt_ns(current->nsproxy->mnt_ns);
   224		struct configfs_root_info *root = idr_find(&configfs_mount,
   225							   ns->ns_id);
   226	
   227		simple_release_fs(&root->mnt, &root->count);
   228		if (!root->count) {
   229			pr_debug("%s: drop ns %llu\n", __func__, ns->ns_id);
   230			idr_remove(&configfs_mount, ns->ns_id);
   231			kfree(root);
   232		}
   233	}
   234	
   235	
   236	static int __init configfs_init(void)
   237	{
   238		int err = -ENOMEM;
   239	
   240		configfs_dir_cachep = kmem_cache_create("configfs_dir_cache",
   241							sizeof(struct configfs_dirent),
   242							0, 0, NULL);
   243		if (!configfs_dir_cachep)
   244			goto out;
   245	
   246		configfs_root = configfs_create_root(
   247		err = sysfs_create_mount_point(kernel_kobj, "config");
   248		if (err)
   249			goto out2;
   250	
   251		err = register_filesystem(&configfs_fs_type);
   252		if (err)
   253			goto out3;
   254	
   255		return 0;
   256	out3:
   257		pr_err("Unable to register filesystem!\n");
   258		sysfs_remove_mount_point(kernel_kobj, "config");
   259	out2:
   260		kmem_cache_destroy(configfs_dir_cachep);
   261		configfs_dir_cachep = NULL;
   262	out:
   263		return err;
 > 264	}
   265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
