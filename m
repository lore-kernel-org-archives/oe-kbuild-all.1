Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E030630E834
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 20:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750365166; cv=none; b=ODfa13sCIHt68WM4EyNhNPZ1srbRbwLkjXtLHVvpAWAoqz5xuOHJTAxZ4hgjIIqigunSkeprdwmTzfeMKqZDsg3i1AFZyXi0sEu70bC4fUrWW6zk7eonKG0MSlsz8Y3ktZiQeyfl2rEEP3Cl3pr2LilBWBMkArxX/YjayXjxdaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750365166; c=relaxed/simple;
	bh=6qSE7fTfrybhMk0u2+wkXNkZdlXxIcxLS55Hn7z7v3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GSgybH3/be1jU5rU6kZ2kKasAp97PaJFzjezQfaRJQroKMjpTmBz+EdiKd5LjInQD9FtheooD4tBeV1LtRzZMfo5Q35qiPQWKON/AeshDhiLvkz7LwWcHdJaZ1w6Nwfp2xpPxgNbHeSfQPzc4RejeBUZiGJXvX9j97kSQgAelcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrpJe+AY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrpJe+AY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750365164; x=1781901164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6qSE7fTfrybhMk0u2+wkXNkZdlXxIcxLS55Hn7z7v3Y=;
  b=WrpJe+AYHDhu0gt7rjxMWL1H6FTTFf8BAP8HVpfnwZLCEyBkMu+tW92f
   qzZjLh4qzLGMcCWpa8HtNSkZ4Ghz4Asq+M1pWVCb8wmktWuEa2ywf6tLn
   m1iWBJvI5T4vYSAXnQoLBCX788rZGaRF2xDlkbJOaOyP9WL/BivYiaeXv
   c2OFGbP4eia8GeKurNrXi+sqbyozL4jIRx25crX0U4fL5TwO0CNQo57YT
   Zwdv3Xujh6e9dUP74avanaWe8TnVBmsVbFc37a3oStS8m8r1BI/PlNHxI
   pBnYbcUDCdOIBCREN/TQg8goLKo2aSnQqnp/cSZUvksbs0FvFMp3j1vFH
   A==;
X-CSE-ConnectionGUID: ePU0jbLNS4C1DSWLkr5qyw==
X-CSE-MsgGUID: TO46S31dS6WjsFwLJrtp+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="62887730"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="62887730"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 13:32:43 -0700
X-CSE-ConnectionGUID: R6v7Wh8KRTWtLmqYS+DjXg==
X-CSE-MsgGUID: /P4o1ml4QPajnQZN8C7AaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="174351147"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 13:32:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSLw7-000L5a-1i;
	Thu, 19 Jun 2025 20:32:39 +0000
Date: Fri, 20 Jun 2025 04:32:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chenrenhui <chenrenhui1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2974/2974] fs/fuse/inode.c:131:21: warning:
 unused variable 'fc'
Message-ID: <202506200422.FFs2lebc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0bb9efd4883938dec34f710bce07ec3ecf5a04bd
commit: f16d89538c1c2988f355d33d15e4c639b0cf5207 [2974/2974] fuse: add fuse fastpath forget cmd support
config: arm64-randconfig-001-20250620 (https://download.01.org/0day-ci/archive/20250620/202506200422.FFs2lebc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200422.FFs2lebc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200422.FFs2lebc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/fuse/fuse_i.h:23,
                    from fs/fuse/inode.c:9:
   include/linux/backing-dev.h:430:49: warning: 'struct cgroup_subsys' declared inside parameter list will not be visible outside of this definition or declaration
     430 | static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
         |                                                 ^~~~~~~~~~~~~
   fs/fuse/inode.c: In function 'fuse_evict_inode':
>> fs/fuse/inode.c:131:21: warning: unused variable 'fc' [-Wunused-variable]
     131 |   struct fuse_conn *fc = get_fuse_conn(inode);
         |                     ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CPPC_CPUFREQ_SYSFS_INTERFACE
   Depends on [n]: CPU_FREQ [=y] && (ARM || ARM64 [=y]) && ACPI_CPPC_CPUFREQ [=n]
   Selected by [m]:
   - CPU_FREQ_GOV_SEEP [=m] && CPU_FREQ [=y] && (ACPI_CPPC_CPUFREQ [=n] || ARM64 [=y])


vim +/fc +131 fs/fuse/inode.c

d8a5ba45457e4a Miklos Szeredi     2005-09-09    8  
d8a5ba45457e4a Miklos Szeredi     2005-09-09   @9  #include "fuse_i.h"
d8a5ba45457e4a Miklos Szeredi     2005-09-09   10  
d8a5ba45457e4a Miklos Szeredi     2005-09-09   11  #include <linux/pagemap.h>
d8a5ba45457e4a Miklos Szeredi     2005-09-09   12  #include <linux/slab.h>
d8a5ba45457e4a Miklos Szeredi     2005-09-09   13  #include <linux/file.h>
d8a5ba45457e4a Miklos Szeredi     2005-09-09   14  #include <linux/seq_file.h>
d8a5ba45457e4a Miklos Szeredi     2005-09-09   15  #include <linux/init.h>
d8a5ba45457e4a Miklos Szeredi     2005-09-09   16  #include <linux/module.h>
487ea5af6358cb Csaba Henk         2009-08-26   17  #include <linux/moduleparam.h>
c30da2e981a703 David Howells      2019-03-25   18  #include <linux/fs_context.h>
c30da2e981a703 David Howells      2019-03-25   19  #include <linux/fs_parser.h>
d8a5ba45457e4a Miklos Szeredi     2005-09-09   20  #include <linux/statfs.h>
9c8ef5614da226 Miklos Szeredi     2006-06-25   21  #include <linux/random.h>
e8edc6e03a5c85 Alexey Dobriyan    2007-05-21   22  #include <linux/sched.h>
dbd561d236ff16 Miklos Szeredi     2008-07-25   23  #include <linux/exportfs.h>
60bcc88ad185d5 Seth Forshee       2016-08-29   24  #include <linux/posix_acl.h>
0b6e9ea041e6c9 Seth Forshee       2014-07-02   25  #include <linux/pid_namespace.h>
d738472f483478 chenrenhui         2025-05-13   26  #ifdef CONFIG_FUSE_FASTPATH
d738472f483478 chenrenhui         2025-05-13   27  #include <linux/fast_ipc.h>
d738472f483478 chenrenhui         2025-05-13   28  #endif
d8a5ba45457e4a Miklos Szeredi     2005-09-09   29  
d8a5ba45457e4a Miklos Szeredi     2005-09-09   30  MODULE_AUTHOR("Miklos Szeredi <miklos@szeredi.hu>");
d8a5ba45457e4a Miklos Szeredi     2005-09-09   31  MODULE_DESCRIPTION("Filesystem in Userspace");
d8a5ba45457e4a Miklos Szeredi     2005-09-09   32  MODULE_LICENSE("GPL");
d8a5ba45457e4a Miklos Szeredi     2005-09-09   33  
e18b890bb0881b Christoph Lameter  2006-12-06   34  static struct kmem_cache *fuse_inode_cachep;
bafa96541b250a Miklos Szeredi     2006-06-25   35  struct list_head fuse_conn_list;
bafa96541b250a Miklos Szeredi     2006-06-25   36  DEFINE_MUTEX(fuse_mutex);
d8a5ba45457e4a Miklos Szeredi     2005-09-09   37  
e4dca7b7aa08b2 Kees Cook          2017-10-17   38  static int set_global_limit(const char *val, const struct kernel_param *kp);
487ea5af6358cb Csaba Henk         2009-08-26   39  
79a9d99434b104 Csaba Henk         2009-08-26   40  unsigned max_user_bgreq;
487ea5af6358cb Csaba Henk         2009-08-26   41  module_param_call(max_user_bgreq, set_global_limit, param_get_uint,
487ea5af6358cb Csaba Henk         2009-08-26   42  		  &max_user_bgreq, 0644);
487ea5af6358cb Csaba Henk         2009-08-26   43  __MODULE_PARM_TYPE(max_user_bgreq, "uint");
487ea5af6358cb Csaba Henk         2009-08-26   44  MODULE_PARM_DESC(max_user_bgreq,
487ea5af6358cb Csaba Henk         2009-08-26   45   "Global limit for the maximum number of backgrounded requests an "
487ea5af6358cb Csaba Henk         2009-08-26   46   "unprivileged user can set");
487ea5af6358cb Csaba Henk         2009-08-26   47  
79a9d99434b104 Csaba Henk         2009-08-26   48  unsigned max_user_congthresh;
487ea5af6358cb Csaba Henk         2009-08-26   49  module_param_call(max_user_congthresh, set_global_limit, param_get_uint,
487ea5af6358cb Csaba Henk         2009-08-26   50  		  &max_user_congthresh, 0644);
487ea5af6358cb Csaba Henk         2009-08-26   51  __MODULE_PARM_TYPE(max_user_congthresh, "uint");
487ea5af6358cb Csaba Henk         2009-08-26   52  MODULE_PARM_DESC(max_user_congthresh,
487ea5af6358cb Csaba Henk         2009-08-26   53   "Global limit for the maximum congestion threshold an "
487ea5af6358cb Csaba Henk         2009-08-26   54   "unprivileged user can set");
487ea5af6358cb Csaba Henk         2009-08-26   55  
d8a5ba45457e4a Miklos Szeredi     2005-09-09   56  #define FUSE_SUPER_MAGIC 0x65735546
d8a5ba45457e4a Miklos Szeredi     2005-09-09   57  
d1875dbaa58e48 Miklos Szeredi     2008-02-08   58  #define FUSE_DEFAULT_BLKSIZE 512
d1875dbaa58e48 Miklos Szeredi     2008-02-08   59  
7a6d3c8b3049d0 Csaba Henk         2009-07-01   60  /** Maximum number of outstanding background requests */
7a6d3c8b3049d0 Csaba Henk         2009-07-01   61  #define FUSE_DEFAULT_MAX_BACKGROUND 12
7a6d3c8b3049d0 Csaba Henk         2009-07-01   62  
7a6d3c8b3049d0 Csaba Henk         2009-07-01   63  /** Congestion starts at 75% of maximum */
7a6d3c8b3049d0 Csaba Henk         2009-07-01   64  #define FUSE_DEFAULT_CONGESTION_THRESHOLD (FUSE_DEFAULT_MAX_BACKGROUND * 3 / 4)
7a6d3c8b3049d0 Csaba Henk         2009-07-01   65  
c30da2e981a703 David Howells      2019-03-25   66  #ifdef CONFIG_BLOCK
c30da2e981a703 David Howells      2019-03-25   67  static struct file_system_type fuseblk_fs_type;
c30da2e981a703 David Howells      2019-03-25   68  #endif
c30da2e981a703 David Howells      2019-03-25   69  
a2daff6803a384 Randy Dunlap       2011-05-31   70  struct fuse_forget_link *fuse_alloc_forget(void)
07e77dca8a1f17 Miklos Szeredi     2010-12-07   71  {
dc69e98c241e14 Khazhismel Kumykov 2019-09-17   72  	return kzalloc(sizeof(struct fuse_forget_link), GFP_KERNEL_ACCOUNT);
07e77dca8a1f17 Miklos Szeredi     2010-12-07   73  }
07e77dca8a1f17 Miklos Szeredi     2010-12-07   74  
d8a5ba45457e4a Miklos Szeredi     2005-09-09   75  static struct inode *fuse_alloc_inode(struct super_block *sb)
d8a5ba45457e4a Miklos Szeredi     2005-09-09   76  {
d8a5ba45457e4a Miklos Szeredi     2005-09-09   77  	struct fuse_inode *fi;
d8a5ba45457e4a Miklos Szeredi     2005-09-09   78  
9031a69cf9f024 zhangliguang       2019-05-06   79  	fi = kmem_cache_alloc(fuse_inode_cachep, GFP_KERNEL);
9031a69cf9f024 zhangliguang       2019-05-06   80  	if (!fi)
d8a5ba45457e4a Miklos Szeredi     2005-09-09   81  		return NULL;
d8a5ba45457e4a Miklos Szeredi     2005-09-09   82  
0a0898cf413876 Miklos Szeredi     2006-07-30   83  	fi->i_time = 0;
2f1e81965fd0f6 Miklos Szeredi     2018-10-15   84  	fi->inval_mask = 0;
d8a5ba45457e4a Miklos Szeredi     2005-09-09   85  	fi->nodeid = 0;
9e6268db496a25 Miklos Szeredi     2005-09-09   86  	fi->nlookup = 0;
fbee36b92abc96 John Muir          2007-11-28   87  	fi->attr_version = 0;
45c72cd73c788d Pavel Shilovsky    2012-05-10   88  	fi->orig_ino = 0;
4582a4ab2a0e72 Feng Shuo          2013-01-15   89  	fi->state = 0;
5c672ab3f0ee0f Miklos Szeredi     2016-06-30   90  	mutex_init(&fi->mutex);
6ae330cad6ef22 Vivek Goyal        2020-08-19   91  	init_rwsem(&fi->i_mmap_sem);
f15ecfef058d94 Kirill Tkhai       2018-11-09   92  	spin_lock_init(&fi->lock);
07e77dca8a1f17 Miklos Szeredi     2010-12-07   93  	fi->forget = fuse_alloc_forget();
c2d0ad00d948de Vivek Goyal        2020-08-19   94  	if (!fi->forget)
c2d0ad00d948de Vivek Goyal        2020-08-19   95  		goto out_free;
c2d0ad00d948de Vivek Goyal        2020-08-19   96  
c2d0ad00d948de Vivek Goyal        2020-08-19   97  	if (IS_ENABLED(CONFIG_FUSE_DAX) && !fuse_dax_inode_alloc(sb, fi))
c2d0ad00d948de Vivek Goyal        2020-08-19   98  		goto out_free_forget;
d8a5ba45457e4a Miklos Szeredi     2005-09-09   99  
9031a69cf9f024 zhangliguang       2019-05-06  100  	return &fi->inode;
c2d0ad00d948de Vivek Goyal        2020-08-19  101  
c2d0ad00d948de Vivek Goyal        2020-08-19  102  out_free_forget:
c2d0ad00d948de Vivek Goyal        2020-08-19  103  	kfree(fi->forget);
c2d0ad00d948de Vivek Goyal        2020-08-19  104  out_free:
c2d0ad00d948de Vivek Goyal        2020-08-19  105  	kmem_cache_free(fuse_inode_cachep, fi);
c2d0ad00d948de Vivek Goyal        2020-08-19  106  	return NULL;
d8a5ba45457e4a Miklos Szeredi     2005-09-09  107  }
d8a5ba45457e4a Miklos Szeredi     2005-09-09  108  
9baf28bbfea165 Al Viro            2019-04-15  109  static void fuse_free_inode(struct inode *inode)
d8a5ba45457e4a Miklos Szeredi     2005-09-09  110  {
e5e5558e923f35 Miklos Szeredi     2005-09-09  111  	struct fuse_inode *fi = get_fuse_inode(inode);
9baf28bbfea165 Al Viro            2019-04-15  112  
5c672ab3f0ee0f Miklos Szeredi     2016-06-30  113  	mutex_destroy(&fi->mutex);
07e77dca8a1f17 Miklos Szeredi     2010-12-07  114  	kfree(fi->forget);
c2d0ad00d948de Vivek Goyal        2020-08-19  115  #ifdef CONFIG_FUSE_DAX
c2d0ad00d948de Vivek Goyal        2020-08-19  116  	kfree(fi->dax);
c2d0ad00d948de Vivek Goyal        2020-08-19  117  #endif
9baf28bbfea165 Al Viro            2019-04-15  118  	kmem_cache_free(fuse_inode_cachep, fi);
d8a5ba45457e4a Miklos Szeredi     2005-09-09  119  }
d8a5ba45457e4a Miklos Szeredi     2005-09-09  120  
b57922d97fd6f7 Al Viro            2010-06-07  121  static void fuse_evict_inode(struct inode *inode)
d8a5ba45457e4a Miklos Szeredi     2005-09-09  122  {
9baf28bbfea165 Al Viro            2019-04-15  123  	struct fuse_inode *fi = get_fuse_inode(inode);
9baf28bbfea165 Al Viro            2019-04-15  124  
f562783e91daf0 Miklos Szeredi     2022-01-14  125  	/* Will write inode on close/munmap and in all other dirtiers */
f562783e91daf0 Miklos Szeredi     2022-01-14  126  	WARN_ON(inode->i_state & I_DIRTY_INODE);
f562783e91daf0 Miklos Szeredi     2022-01-14  127  
91b0abe36a7b2b Johannes Weiner    2014-04-03  128  	truncate_inode_pages_final(&inode->i_data);
dbd5768f87ff6f Jan Kara           2012-05-03  129  	clear_inode(inode);
1751e8a6cb935e Linus Torvalds     2017-11-27  130  	if (inode->i_sb->s_flags & SB_ACTIVE) {
e5e5558e923f35 Miklos Szeredi     2005-09-09 @131  		struct fuse_conn *fc = get_fuse_conn(inode);
c2d0ad00d948de Vivek Goyal        2020-08-19  132  
c2d0ad00d948de Vivek Goyal        2020-08-19  133  		if (FUSE_IS_DAX(inode))
c2d0ad00d948de Vivek Goyal        2020-08-19  134  			fuse_dax_inode_cleanup(inode);
1866d779d5d2ab Max Reitz          2020-09-09  135  		if (fi->nlookup) {
f16d89538c1c29 wuyifeng10         2025-05-20  136  #ifdef CONFIG_FUSE_FASTPATH
f16d89538c1c29 wuyifeng10         2025-05-20  137  			fuse_fast_forget(get_fuse_mount(inode), fi->forget,
f16d89538c1c29 wuyifeng10         2025-05-20  138  					  fi->nodeid, fi->nlookup);
f16d89538c1c29 wuyifeng10         2025-05-20  139  #else
1866d779d5d2ab Max Reitz          2020-09-09  140  			fuse_queue_forget(fc, fi->forget, fi->nodeid,
1866d779d5d2ab Max Reitz          2020-09-09  141  					  fi->nlookup);
f16d89538c1c29 wuyifeng10         2025-05-20  142  #endif
07e77dca8a1f17 Miklos Szeredi     2010-12-07  143  			fi->forget = NULL;
e5e5558e923f35 Miklos Szeredi     2005-09-09  144  		}
1866d779d5d2ab Max Reitz          2020-09-09  145  	}
ebbe4b9f88081d Miklos Szeredi     2021-01-18  146  	if (S_ISREG(inode->i_mode) && !fuse_is_bad(inode)) {
9baf28bbfea165 Al Viro            2019-04-15  147  		WARN_ON(!list_empty(&fi->write_files));
9baf28bbfea165 Al Viro            2019-04-15  148  		WARN_ON(!list_empty(&fi->queued_writes));
9baf28bbfea165 Al Viro            2019-04-15  149  	}
d8a5ba45457e4a Miklos Szeredi     2005-09-09  150  }
d8a5ba45457e4a Miklos Szeredi     2005-09-09  151  

:::::: The code at line 131 was first introduced by commit
:::::: e5e5558e923f35839108a12718494ecb73fb782f [PATCH] FUSE - read-only operations

:::::: TO: Miklos Szeredi <miklos@szeredi.hu>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
