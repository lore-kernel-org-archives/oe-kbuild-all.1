Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F68213AFA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 18:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691520339; x=1723056339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p+fC6Lc80sPIDCrbeiMDpjvGJzBZpxxcNjnaRS4gY2A=;
  b=ZfTR9D7BwpZddLMYEb1S/MH9lCETeikrbjMBKksiWDGgg4Scq2eB3J84
   3oKjv9Bm0xidpHBAOJLpXApWyJyEb9FtPo3VjMR/t2/oGy5vGj++SqI4w
   6f9Ttpo+xygioDCLuV9ypgAY/UOZQgmuNqszqUQwIvclfxzLbZBP8YfKX
   zzadQ5Vb2zhUKv+9+NSDh1JxbPx487C5/FYfsewp+M4BqefbrQPN6UMZM
   pvpGwitpBRa6JVsGQw38/JS4l25wRp7P1lQBEC9VVWPZ4GOk4qhEew2PL
   kaIvp0yooXZPUW9tyB2Er64rFv/c6hQZI4CVfapWNeL32/pDfUCnKHPv6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="370913717"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="370913717"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 11:45:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="874898635"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2023 11:45:11 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTRhb-0005Xo-1f;
	Tue, 08 Aug 2023 18:45:07 +0000
Date: Wed, 9 Aug 2023 02:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 195/205] fs/exfat/inode.c:222:51: error:
 passing argument 1 of 'exfat_get_dentry_set' from incompatible pointer type
Message-ID: <202308090239.95QzDN7f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   d30ed4ee0dcd740c1a0d8751ff34b32146e24dd6
commit: 15ae7076d8e1211c809f4a110bcc7ac85b4722e9 [195/205] exfat: move exfat_entry_set_cache from heap to stack
config: csky-randconfig-r011-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090239.95QzDN7f-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090239.95QzDN7f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090239.95QzDN7f-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/exfat/inode.c: In function 'exfat_map_cluster':
>> fs/exfat/inode.c:222:51: error: passing argument 1 of 'exfat_get_dentry_set' from incompatible pointer type [-Werror=incompatible-pointer-types]
     222 |                         es = exfat_get_dentry_set(sb, &(ei->dir), ei->entry,
         |                                                   ^~
         |                                                   |
         |                                                   struct super_block *
   In file included from fs/exfat/inode.c:18:
   fs/exfat/exfat_fs.h:473:56: note: expected 'struct exfat_entry_set_cache *' but argument is of type 'struct super_block *'
     473 | int exfat_get_dentry_set(struct exfat_entry_set_cache *es,
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   fs/exfat/inode.c:222:55: error: passing argument 2 of 'exfat_get_dentry_set' from incompatible pointer type [-Werror=incompatible-pointer-types]
     222 |                         es = exfat_get_dentry_set(sb, &(ei->dir), ei->entry,
         |                                                       ^~~~~~~~~~
         |                                                       |
         |                                                       struct exfat_chain *
   fs/exfat/exfat_fs.h:474:37: note: expected 'struct super_block *' but argument is of type 'struct exfat_chain *'
     474 |                 struct super_block *sb, struct exfat_chain *p_dir, int entry,
         |                 ~~~~~~~~~~~~~~~~~~~~^~
>> fs/exfat/inode.c:222:69: warning: passing argument 3 of 'exfat_get_dentry_set' makes pointer from integer without a cast [-Wint-conversion]
     222 |                         es = exfat_get_dentry_set(sb, &(ei->dir), ei->entry,
         |                                                                   ~~^~~~~~~
         |                                                                     |
         |                                                                     int
   fs/exfat/exfat_fs.h:474:61: note: expected 'struct exfat_chain *' but argument is of type 'int'
     474 |                 struct super_block *sb, struct exfat_chain *p_dir, int entry,
         |                                         ~~~~~~~~~~~~~~~~~~~~^~~~~
>> fs/exfat/inode.c:222:30: error: too few arguments to function 'exfat_get_dentry_set'
     222 |                         es = exfat_get_dentry_set(sb, &(ei->dir), ei->entry,
         |                              ^~~~~~~~~~~~~~~~~~~~
   fs/exfat/exfat_fs.h:473:5: note: declared here
     473 | int exfat_get_dentry_set(struct exfat_entry_set_cache *es,
         |     ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   fs/exfat/file.c: In function '__exfat_truncate':
>> fs/exfat/file.c:158:43: error: passing argument 1 of 'exfat_get_dentry_set' from incompatible pointer type [-Werror=incompatible-pointer-types]
     158 |                 es = exfat_get_dentry_set(sb, &(ei->dir), ei->entry,
         |                                           ^~
         |                                           |
         |                                           struct super_block *
   In file included from fs/exfat/file.c:12:
   fs/exfat/exfat_fs.h:473:56: note: expected 'struct exfat_entry_set_cache *' but argument is of type 'struct super_block *'
     473 | int exfat_get_dentry_set(struct exfat_entry_set_cache *es,
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   fs/exfat/file.c:158:47: error: passing argument 2 of 'exfat_get_dentry_set' from incompatible pointer type [-Werror=incompatible-pointer-types]
     158 |                 es = exfat_get_dentry_set(sb, &(ei->dir), ei->entry,
         |                                               ^~~~~~~~~~
         |                                               |
         |                                               struct exfat_chain *
   fs/exfat/exfat_fs.h:474:37: note: expected 'struct super_block *' but argument is of type 'struct exfat_chain *'
     474 |                 struct super_block *sb, struct exfat_chain *p_dir, int entry,
         |                 ~~~~~~~~~~~~~~~~~~~~^~
>> fs/exfat/file.c:158:61: warning: passing argument 3 of 'exfat_get_dentry_set' makes pointer from integer without a cast [-Wint-conversion]
     158 |                 es = exfat_get_dentry_set(sb, &(ei->dir), ei->entry,
         |                                                           ~~^~~~~~~
         |                                                             |
         |                                                             int
   fs/exfat/exfat_fs.h:474:61: note: expected 'struct exfat_chain *' but argument is of type 'int'
     474 |                 struct super_block *sb, struct exfat_chain *p_dir, int entry,
         |                                         ~~~~~~~~~~~~~~~~~~~~^~~~~
>> fs/exfat/file.c:158:22: error: too few arguments to function 'exfat_get_dentry_set'
     158 |                 es = exfat_get_dentry_set(sb, &(ei->dir), ei->entry,
         |                      ^~~~~~~~~~~~~~~~~~~~
   fs/exfat/exfat_fs.h:473:5: note: declared here
     473 | int exfat_get_dentry_set(struct exfat_entry_set_cache *es,
         |     ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/exfat_get_dentry_set +222 fs/exfat/inode.c

5f2aa075070cf5 Namjae Jeon           2020-03-02   98  
5f2aa075070cf5 Namjae Jeon           2020-03-02   99  /*
5f2aa075070cf5 Namjae Jeon           2020-03-02  100   * Input: inode, (logical) clu_offset, target allocation area
5f2aa075070cf5 Namjae Jeon           2020-03-02  101   * Output: errcode, cluster number
5f2aa075070cf5 Namjae Jeon           2020-03-02  102   * *clu = (~0), if it's unable to allocate a new cluster
5f2aa075070cf5 Namjae Jeon           2020-03-02  103   */
5f2aa075070cf5 Namjae Jeon           2020-03-02  104  static int exfat_map_cluster(struct inode *inode, unsigned int clu_offset,
5f2aa075070cf5 Namjae Jeon           2020-03-02  105  		unsigned int *clu, int create)
5f2aa075070cf5 Namjae Jeon           2020-03-02  106  {
5f2aa075070cf5 Namjae Jeon           2020-03-02  107  	int ret, modified = false;
5f2aa075070cf5 Namjae Jeon           2020-03-02  108  	unsigned int last_clu;
5f2aa075070cf5 Namjae Jeon           2020-03-02  109  	struct exfat_chain new_clu;
5f2aa075070cf5 Namjae Jeon           2020-03-02  110  	struct super_block *sb = inode->i_sb;
5f2aa075070cf5 Namjae Jeon           2020-03-02  111  	struct exfat_sb_info *sbi = EXFAT_SB(sb);
5f2aa075070cf5 Namjae Jeon           2020-03-02  112  	struct exfat_inode_info *ei = EXFAT_I(inode);
5f2aa075070cf5 Namjae Jeon           2020-03-02  113  	unsigned int local_clu_offset = clu_offset;
5f2aa075070cf5 Namjae Jeon           2020-03-02  114  	unsigned int num_to_be_allocated = 0, num_clusters = 0;
5f2aa075070cf5 Namjae Jeon           2020-03-02  115  
1b810d5cb6ce6f Christophe Vu-Brugier 2021-11-02  116  	if (ei->i_size_ondisk > 0)
5f2aa075070cf5 Namjae Jeon           2020-03-02  117  		num_clusters =
1b810d5cb6ce6f Christophe Vu-Brugier 2021-11-02  118  			EXFAT_B_TO_CLU_ROUND_UP(ei->i_size_ondisk, sbi);
5f2aa075070cf5 Namjae Jeon           2020-03-02  119  
5f2aa075070cf5 Namjae Jeon           2020-03-02  120  	if (clu_offset >= num_clusters)
5f2aa075070cf5 Namjae Jeon           2020-03-02  121  		num_to_be_allocated = clu_offset - num_clusters + 1;
5f2aa075070cf5 Namjae Jeon           2020-03-02  122  
5f2aa075070cf5 Namjae Jeon           2020-03-02  123  	if (!create && (num_to_be_allocated > 0)) {
5f2aa075070cf5 Namjae Jeon           2020-03-02  124  		*clu = EXFAT_EOF_CLUSTER;
5f2aa075070cf5 Namjae Jeon           2020-03-02  125  		return 0;
5f2aa075070cf5 Namjae Jeon           2020-03-02  126  	}
5f2aa075070cf5 Namjae Jeon           2020-03-02  127  
5f2aa075070cf5 Namjae Jeon           2020-03-02  128  	*clu = last_clu = ei->start_clu;
5f2aa075070cf5 Namjae Jeon           2020-03-02  129  
5f2aa075070cf5 Namjae Jeon           2020-03-02  130  	if (ei->flags == ALLOC_NO_FAT_CHAIN) {
5f2aa075070cf5 Namjae Jeon           2020-03-02  131  		if (clu_offset > 0 && *clu != EXFAT_EOF_CLUSTER) {
5f2aa075070cf5 Namjae Jeon           2020-03-02  132  			last_clu += clu_offset - 1;
5f2aa075070cf5 Namjae Jeon           2020-03-02  133  
5f2aa075070cf5 Namjae Jeon           2020-03-02  134  			if (clu_offset == num_clusters)
5f2aa075070cf5 Namjae Jeon           2020-03-02  135  				*clu = EXFAT_EOF_CLUSTER;
5f2aa075070cf5 Namjae Jeon           2020-03-02  136  			else
5f2aa075070cf5 Namjae Jeon           2020-03-02  137  				*clu += clu_offset;
5f2aa075070cf5 Namjae Jeon           2020-03-02  138  		}
5f2aa075070cf5 Namjae Jeon           2020-03-02  139  	} else if (ei->type == TYPE_FILE) {
5f2aa075070cf5 Namjae Jeon           2020-03-02  140  		unsigned int fclus = 0;
5f2aa075070cf5 Namjae Jeon           2020-03-02  141  		int err = exfat_get_cluster(inode, clu_offset,
5f2aa075070cf5 Namjae Jeon           2020-03-02  142  				&fclus, clu, &last_clu, 1);
5f2aa075070cf5 Namjae Jeon           2020-03-02  143  		if (err)
5f2aa075070cf5 Namjae Jeon           2020-03-02  144  			return -EIO;
5f2aa075070cf5 Namjae Jeon           2020-03-02  145  
5f2aa075070cf5 Namjae Jeon           2020-03-02  146  		clu_offset -= fclus;
5f2aa075070cf5 Namjae Jeon           2020-03-02  147  	} else {
5f2aa075070cf5 Namjae Jeon           2020-03-02  148  		/* hint information */
5f2aa075070cf5 Namjae Jeon           2020-03-02  149  		if (clu_offset > 0 && ei->hint_bmap.off != EXFAT_EOF_CLUSTER &&
5f2aa075070cf5 Namjae Jeon           2020-03-02  150  		    ei->hint_bmap.off > 0 && clu_offset >= ei->hint_bmap.off) {
5f2aa075070cf5 Namjae Jeon           2020-03-02  151  			clu_offset -= ei->hint_bmap.off;
5f2aa075070cf5 Namjae Jeon           2020-03-02  152  			/* hint_bmap.clu should be valid */
5f2aa075070cf5 Namjae Jeon           2020-03-02  153  			WARN_ON(ei->hint_bmap.clu < 2);
5f2aa075070cf5 Namjae Jeon           2020-03-02  154  			*clu = ei->hint_bmap.clu;
5f2aa075070cf5 Namjae Jeon           2020-03-02  155  		}
5f2aa075070cf5 Namjae Jeon           2020-03-02  156  
5f2aa075070cf5 Namjae Jeon           2020-03-02  157  		while (clu_offset > 0 && *clu != EXFAT_EOF_CLUSTER) {
5f2aa075070cf5 Namjae Jeon           2020-03-02  158  			last_clu = *clu;
5f2aa075070cf5 Namjae Jeon           2020-03-02  159  			if (exfat_get_next_cluster(sb, clu))
5f2aa075070cf5 Namjae Jeon           2020-03-02  160  				return -EIO;
5f2aa075070cf5 Namjae Jeon           2020-03-02  161  			clu_offset--;
5f2aa075070cf5 Namjae Jeon           2020-03-02  162  		}
5f2aa075070cf5 Namjae Jeon           2020-03-02  163  	}
5f2aa075070cf5 Namjae Jeon           2020-03-02  164  
5f2aa075070cf5 Namjae Jeon           2020-03-02  165  	if (*clu == EXFAT_EOF_CLUSTER) {
7018ec68f08249 Tetsuhiro Kohada      2020-07-31  166  		exfat_set_volume_dirty(sb);
5f2aa075070cf5 Namjae Jeon           2020-03-02  167  
5f2aa075070cf5 Namjae Jeon           2020-03-02  168  		new_clu.dir = (last_clu == EXFAT_EOF_CLUSTER) ?
5f2aa075070cf5 Namjae Jeon           2020-03-02  169  				EXFAT_EOF_CLUSTER : last_clu + 1;
5f2aa075070cf5 Namjae Jeon           2020-03-02  170  		new_clu.size = 0;
5f2aa075070cf5 Namjae Jeon           2020-03-02  171  		new_clu.flags = ei->flags;
5f2aa075070cf5 Namjae Jeon           2020-03-02  172  
5f2aa075070cf5 Namjae Jeon           2020-03-02  173  		/* allocate a cluster */
5f2aa075070cf5 Namjae Jeon           2020-03-02  174  		if (num_to_be_allocated < 1) {
5f2aa075070cf5 Namjae Jeon           2020-03-02  175  			/* Broken FAT (i_sze > allocated FAT) */
5f2aa075070cf5 Namjae Jeon           2020-03-02  176  			exfat_fs_error(sb, "broken FAT chain.");
5f2aa075070cf5 Namjae Jeon           2020-03-02  177  			return -EIO;
5f2aa075070cf5 Namjae Jeon           2020-03-02  178  		}
5f2aa075070cf5 Namjae Jeon           2020-03-02  179  
5f2aa075070cf5 Namjae Jeon           2020-03-02  180  		ret = exfat_alloc_cluster(inode, num_to_be_allocated, &new_clu);
5f2aa075070cf5 Namjae Jeon           2020-03-02  181  		if (ret)
5f2aa075070cf5 Namjae Jeon           2020-03-02  182  			return ret;
5f2aa075070cf5 Namjae Jeon           2020-03-02  183  
5f2aa075070cf5 Namjae Jeon           2020-03-02  184  		if (new_clu.dir == EXFAT_EOF_CLUSTER ||
5f2aa075070cf5 Namjae Jeon           2020-03-02  185  		    new_clu.dir == EXFAT_FREE_CLUSTER) {
5f2aa075070cf5 Namjae Jeon           2020-03-02  186  			exfat_fs_error(sb,
5f2aa075070cf5 Namjae Jeon           2020-03-02  187  				"bogus cluster new allocated (last_clu : %u, new_clu : %u)",
5f2aa075070cf5 Namjae Jeon           2020-03-02  188  				last_clu, new_clu.dir);
5f2aa075070cf5 Namjae Jeon           2020-03-02  189  			return -EIO;
5f2aa075070cf5 Namjae Jeon           2020-03-02  190  		}
5f2aa075070cf5 Namjae Jeon           2020-03-02  191  
5f2aa075070cf5 Namjae Jeon           2020-03-02  192  		/* append to the FAT chain */
5f2aa075070cf5 Namjae Jeon           2020-03-02  193  		if (last_clu == EXFAT_EOF_CLUSTER) {
5f2aa075070cf5 Namjae Jeon           2020-03-02  194  			if (new_clu.flags == ALLOC_FAT_CHAIN)
5f2aa075070cf5 Namjae Jeon           2020-03-02  195  				ei->flags = ALLOC_FAT_CHAIN;
5f2aa075070cf5 Namjae Jeon           2020-03-02  196  			ei->start_clu = new_clu.dir;
5f2aa075070cf5 Namjae Jeon           2020-03-02  197  			modified = true;
5f2aa075070cf5 Namjae Jeon           2020-03-02  198  		} else {
5f2aa075070cf5 Namjae Jeon           2020-03-02  199  			if (new_clu.flags != ei->flags) {
5f2aa075070cf5 Namjae Jeon           2020-03-02  200  				/* no-fat-chain bit is disabled,
5f2aa075070cf5 Namjae Jeon           2020-03-02  201  				 * so fat-chain should be synced with
5f2aa075070cf5 Namjae Jeon           2020-03-02  202  				 * alloc-bitmap
5f2aa075070cf5 Namjae Jeon           2020-03-02  203  				 */
5f2aa075070cf5 Namjae Jeon           2020-03-02  204  				exfat_chain_cont_cluster(sb, ei->start_clu,
5f2aa075070cf5 Namjae Jeon           2020-03-02  205  					num_clusters);
5f2aa075070cf5 Namjae Jeon           2020-03-02  206  				ei->flags = ALLOC_FAT_CHAIN;
5f2aa075070cf5 Namjae Jeon           2020-03-02  207  				modified = true;
5f2aa075070cf5 Namjae Jeon           2020-03-02  208  			}
5f2aa075070cf5 Namjae Jeon           2020-03-02  209  			if (new_clu.flags == ALLOC_FAT_CHAIN)
5f2aa075070cf5 Namjae Jeon           2020-03-02  210  				if (exfat_ent_set(sb, last_clu, new_clu.dir))
5f2aa075070cf5 Namjae Jeon           2020-03-02  211  					return -EIO;
5f2aa075070cf5 Namjae Jeon           2020-03-02  212  		}
5f2aa075070cf5 Namjae Jeon           2020-03-02  213  
5f2aa075070cf5 Namjae Jeon           2020-03-02  214  		num_clusters += num_to_be_allocated;
5f2aa075070cf5 Namjae Jeon           2020-03-02  215  		*clu = new_clu.dir;
5f2aa075070cf5 Namjae Jeon           2020-03-02  216  
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  217  		if (ei->dir.dir != DIR_DELETED && modified) {
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  218  			struct exfat_dentry *ep;
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  219  			struct exfat_entry_set_cache *es;
8b0c471773819c Tetsuhiro Kohada      2020-06-24  220  			int err;
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  221  
5f2aa075070cf5 Namjae Jeon           2020-03-02 @222  			es = exfat_get_dentry_set(sb, &(ei->dir), ei->entry,
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  223  				ES_ALL_ENTRIES);
5f2aa075070cf5 Namjae Jeon           2020-03-02  224  			if (!es)
5f2aa075070cf5 Namjae Jeon           2020-03-02  225  				return -EIO;
5f2aa075070cf5 Namjae Jeon           2020-03-02  226  			/* get stream entry */
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  227  			ep = exfat_get_dentry_cached(es, 1);
5f2aa075070cf5 Namjae Jeon           2020-03-02  228  
5f2aa075070cf5 Namjae Jeon           2020-03-02  229  			/* update directory entry */
5f2aa075070cf5 Namjae Jeon           2020-03-02  230  			ep->dentry.stream.flags = ei->flags;
5f2aa075070cf5 Namjae Jeon           2020-03-02  231  			ep->dentry.stream.start_clu =
5f2aa075070cf5 Namjae Jeon           2020-03-02  232  				cpu_to_le32(ei->start_clu);
5f2aa075070cf5 Namjae Jeon           2020-03-02  233  			ep->dentry.stream.valid_size =
5f2aa075070cf5 Namjae Jeon           2020-03-02  234  				cpu_to_le64(i_size_read(inode));
5f2aa075070cf5 Namjae Jeon           2020-03-02  235  			ep->dentry.stream.size =
5f2aa075070cf5 Namjae Jeon           2020-03-02  236  				ep->dentry.stream.valid_size;
5f2aa075070cf5 Namjae Jeon           2020-03-02  237  
943af1fdacfebe Tetsuhiro Kohada      2020-05-20  238  			exfat_update_dir_chksum_with_entry_set(es);
8b0c471773819c Tetsuhiro Kohada      2020-06-24  239  			err = exfat_free_dentry_set(es, inode_needs_sync(inode));
8b0c471773819c Tetsuhiro Kohada      2020-06-24  240  			if (err)
8b0c471773819c Tetsuhiro Kohada      2020-06-24  241  				return err;
5f2aa075070cf5 Namjae Jeon           2020-03-02  242  		} /* end of if != DIR_DELETED */
5f2aa075070cf5 Namjae Jeon           2020-03-02  243  
f9dbc35ecb9431 Yuezhang Mo           2023-01-04  244  		inode->i_blocks += EXFAT_CLU_TO_B(num_to_be_allocated, sbi) >> 9;
5f2aa075070cf5 Namjae Jeon           2020-03-02  245  
5f2aa075070cf5 Namjae Jeon           2020-03-02  246  		/*
5f2aa075070cf5 Namjae Jeon           2020-03-02  247  		 * Move *clu pointer along FAT chains (hole care) because the
5f2aa075070cf5 Namjae Jeon           2020-03-02  248  		 * caller of this function expect *clu to be the last cluster.
5f2aa075070cf5 Namjae Jeon           2020-03-02  249  		 * This only works when num_to_be_allocated >= 2,
5f2aa075070cf5 Namjae Jeon           2020-03-02  250  		 * *clu = (the first cluster of the allocated chain) =>
5f2aa075070cf5 Namjae Jeon           2020-03-02  251  		 * (the last cluster of ...)
5f2aa075070cf5 Namjae Jeon           2020-03-02  252  		 */
5f2aa075070cf5 Namjae Jeon           2020-03-02  253  		if (ei->flags == ALLOC_NO_FAT_CHAIN) {
5f2aa075070cf5 Namjae Jeon           2020-03-02  254  			*clu += num_to_be_allocated - 1;
5f2aa075070cf5 Namjae Jeon           2020-03-02  255  		} else {
5f2aa075070cf5 Namjae Jeon           2020-03-02  256  			while (num_to_be_allocated > 1) {
5f2aa075070cf5 Namjae Jeon           2020-03-02  257  				if (exfat_get_next_cluster(sb, clu))
5f2aa075070cf5 Namjae Jeon           2020-03-02  258  					return -EIO;
5f2aa075070cf5 Namjae Jeon           2020-03-02  259  				num_to_be_allocated--;
5f2aa075070cf5 Namjae Jeon           2020-03-02  260  			}
5f2aa075070cf5 Namjae Jeon           2020-03-02  261  		}
5f2aa075070cf5 Namjae Jeon           2020-03-02  262  
5f2aa075070cf5 Namjae Jeon           2020-03-02  263  	}
5f2aa075070cf5 Namjae Jeon           2020-03-02  264  
5f2aa075070cf5 Namjae Jeon           2020-03-02  265  	/* hint information */
5f2aa075070cf5 Namjae Jeon           2020-03-02  266  	ei->hint_bmap.off = local_clu_offset;
5f2aa075070cf5 Namjae Jeon           2020-03-02  267  	ei->hint_bmap.clu = *clu;
5f2aa075070cf5 Namjae Jeon           2020-03-02  268  
5f2aa075070cf5 Namjae Jeon           2020-03-02  269  	return 0;
5f2aa075070cf5 Namjae Jeon           2020-03-02  270  }
5f2aa075070cf5 Namjae Jeon           2020-03-02  271  

:::::: The code at line 222 was first introduced by commit
:::::: 5f2aa075070cf5b2e6aae011d5a3390408d7d913 exfat: add inode operations

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
