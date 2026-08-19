Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0913438A6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 02:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787105884; cv=none; b=JRYZPglHKmHxN+oRvTL0PKtnsn7uz2a6AqBjUUzFCBP2tzZ5YgDAUVz5zJ84ANVBzlG76XwuXHB25cE6jiz3ScgqqBq4e/A3a5leyHcUc/9eBv9D/VVLK2Ni36kI1KHVDOKW+oCY7YvvfUgAtL/UtcLnwbVukwpMGjmZGeTdgok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787105884; c=relaxed/simple;
	bh=P7pvplCMbUBQP7hus5vdPaMwGCXpYzN4oeJgP5M6/nk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b5mnq8iv5p0hHN8Fsa1sEKXYBu9nNDj5ki1b2MtSRu2NludFEkvRUQEhRDy4rW9A93MKfP0xqeC5gn9UYeT2IA5FM+eSnSD6t8sF4lpaJmmniMmwiHMmM7cWO/A3y3KD/3oEp7tKXWaBY6XQXSiSYwkGal9QAmQxLf9wZwduZwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lt90JBNc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lt90JBNc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787105882; x=1818641882;
  h=date:from:to:cc:subject:message-id;
  bh=P7pvplCMbUBQP7hus5vdPaMwGCXpYzN4oeJgP5M6/nk=;
  b=lt90JBNcFrcNI2AN1XMnD1H+bl26YSFRgAjgzdy5IUzLGJjPkFmRtL9y
   NXimRJ/aRtx5b8F2VYd87+bSJWAtVBNLsrULtjdbbKnAHiVJoKlo+0LWF
   4Knd7xubH0Qy2/SdJk9K5IqJzFnyz79Xr0YDBDDkPR+Tz8nJ4lzpY48HR
   9I8FGwhJKb0F2XhTO8zgOnwmPTLMnpGY+biaxddGTyROTe/BQDexrx+JB
   z1BldrLK9wz3T84dX4/BahwZPiVSw1Iqs5NCI9VsKczuHdxmpf3BPPJBl
   Sd1ogI0Ca0m3Ncza2xcP1IlY2SqMcGDjaVaTNFbE/2L5jcKBbrSKaG4jU
   A==;
X-CSE-ConnectionGUID: fS8S5kBZSSulXz7jDdkdrw==
X-CSE-MsgGUID: D1TJI0pOR/CuwIgjDgjOoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="90126239"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="90126239"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 19:18:01 -0700
X-CSE-ConnectionGUID: oJt0FXcPRKenCrInchcxeg==
X-CSE-MsgGUID: qC6Tq039QomOq0a3ixdyKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="267359599"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Aug 2026 19:17:59 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwVsL-00000000epW-0glu;
	Wed, 19 Aug 2026 02:17:57 +0000
Date: Wed, 19 Aug 2026 10:17:56 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/cache 6/13] fs/f2fs/recovery.c:439:35:
 warning: variable 'rn' set but not used
Message-ID: <202608191055.PhLtC7Tw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/cache
head:   cc6a23d8c232f588f3a5415d1b10a19e1e4ce860
commit: 843ddf01eb4efc800bdac9de795bdeb57940a3e0 [6/13] f2fs: cache: use meta cache
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260819/202608191055.PhLtC7Tw-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191055.PhLtC7Tw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191055.PhLtC7Tw-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                            ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   fs/f2fs/recovery.c:409:54: warning: passing argument 1 of 'next_blkaddr_of_node' makes pointer from integer without a cast [-Wint-conversion]
     409 |                 *blkaddr_fast = next_blkaddr_of_node(CACHE_FOLIO(entry));
         |                                                      ^~~~~~~~~~~~~~~~~~
         |                                                      |
         |                                                      int
   In file included from fs/f2fs/recovery.c:14:
   fs/f2fs/node.h:268:64: note: expected 'const struct folio *' but argument is of type 'int'
     268 | static inline block_t next_blkaddr_of_node(const struct folio *node_folio)
         |                                            ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   fs/f2fs/recovery.c: In function 'find_fsync_dnodes':
   fs/f2fs/recovery.c:451:48: warning: passing argument 2 of 'is_recoverable_dnode' makes pointer from integer without a cast [-Wint-conversion]
     451 |                 if (!is_recoverable_dnode(sbi, CACHE_FOLIO(entry))) {
         |                                                ^~~~~~~~~~~~~~~~~~
         |                                                |
         |                                                int
   In file included from fs/f2fs/recovery.c:14:
   fs/f2fs/node.h:314:87: note: expected 'const struct folio *' but argument is of type 'int'
     314 | static inline bool is_recoverable_dnode(struct f2fs_sb_info *sbi, const struct folio *folio)
         |                                                                   ~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/f2fs/recovery.c:456:37: warning: passing argument 1 of 'is_node' makes pointer from integer without a cast [-Wint-conversion]
     456 |                 if (!is_fsync_dnode(CACHE_FOLIO(entry)))
         |                                     ^~~~~~~~~~~~~~~~~~
         |                                     |
         |                                     int
   fs/f2fs/node.h:404:41: note: in definition of macro 'is_fsync_dnode'
     404 | #define is_fsync_dnode(folio)   is_node(folio, FSYNC_BIT_SHIFT)
         |                                         ^~~~~
   fs/f2fs/node.h:397:47: note: expected 'const struct folio *' but argument is of type 'int'
     397 | static inline int is_node(const struct folio *folio, int type)
         |                           ~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/f2fs/recovery.c:459:65: warning: passing argument 1 of 'ino_of_node' makes pointer from integer without a cast [-Wint-conversion]
     459 |                 fsync_entry = get_fsync_inode(head, ino_of_node(CACHE_FOLIO(entry)));
         |                                                                 ^~~~~~~~~~~~~~~~~~
         |                                                                 |
         |                                                                 int
   In file included from fs/f2fs/recovery.c:14:
   fs/f2fs/node.h:243:53: note: expected 'const struct folio *' but argument is of type 'int'
     243 | static inline nid_t ino_of_node(const struct folio *node_folio)
         |                                 ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   fs/f2fs/recovery.c:464:50: warning: passing argument 1 of 'IS_INODE' makes pointer from integer without a cast [-Wint-conversion]
     464 |                                         IS_INODE(CACHE_FOLIO(entry)) &&
         |                                                  ^~~~~~~~~~~~~~~~~~
         |                                                  |
         |                                                  int
   In file included from fs/f2fs/recovery.c:13:
   fs/f2fs/f2fs.h:3272:49: note: expected 'const struct folio *' but argument is of type 'int'
    3272 | static inline bool IS_INODE(const struct folio *folio)
         |                             ~~~~~~~~~~~~~~~~~~~~^~~~~
   In file included from fs/f2fs/recovery.c:14:
   fs/f2fs/recovery.c:465:55: warning: passing argument 1 of 'is_node' makes pointer from integer without a cast [-Wint-conversion]
     465 |                                         is_dent_dnode(CACHE_FOLIO(entry))) {
         |                                                       ^~~~~~~~~~~~~~~~~~
         |                                                       |
         |                                                       int
   fs/f2fs/node.h:405:41: note: in definition of macro 'is_dent_dnode'
     405 | #define is_dent_dnode(folio)    is_node(folio, DENT_BIT_SHIFT)
         |                                         ^~~~~
   fs/f2fs/node.h:397:47: note: expected 'const struct folio *' but argument is of type 'int'
     397 | static inline int is_node(const struct folio *folio, int type)
         |                           ~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/f2fs/recovery.c:474:78: warning: passing argument 1 of 'ino_of_node' makes pointer from integer without a cast [-Wint-conversion]
     474 |                         fsync_entry = add_fsync_inode(sbi, head, ino_of_node(CACHE_FOLIO(entry)),
         |                                                                              ^~~~~~~~~~~~~~~~~~
         |                                                                              |
         |                                                                              int
   In file included from fs/f2fs/recovery.c:14:
   fs/f2fs/node.h:243:53: note: expected 'const struct folio *' but argument is of type 'int'
     243 | static inline nid_t ino_of_node(const struct folio *node_folio)
         |                                 ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   fs/f2fs/recovery.c:493:30: warning: passing argument 1 of 'IS_INODE' makes pointer from integer without a cast [-Wint-conversion]
     493 |                 if (IS_INODE(CACHE_FOLIO(entry)) && is_dent_dnode(CACHE_FOLIO(entry)))
         |                              ^~~~~~~~~~~~~~~~~~
         |                              |
         |                              int
   In file included from fs/f2fs/recovery.c:13:
   fs/f2fs/f2fs.h:3272:49: note: expected 'const struct folio *' but argument is of type 'int'
    3272 | static inline bool IS_INODE(const struct folio *folio)
         |                             ~~~~~~~~~~~~~~~~~~~~^~~~~
   In file included from fs/f2fs/recovery.c:14:
   fs/f2fs/recovery.c:493:67: warning: passing argument 1 of 'is_node' makes pointer from integer without a cast [-Wint-conversion]
     493 |                 if (IS_INODE(CACHE_FOLIO(entry)) && is_dent_dnode(CACHE_FOLIO(entry)))
         |                                                                   ^~~~~~~~~~~~~~~~~~
         |                                                                   |
         |                                                                   int
   fs/f2fs/node.h:405:41: note: in definition of macro 'is_dent_dnode'
     405 | #define is_dent_dnode(folio)    is_node(folio, DENT_BIT_SHIFT)
         |                                         ^~~~~
   fs/f2fs/node.h:397:47: note: expected 'const struct folio *' but argument is of type 'int'
     397 | static inline int is_node(const struct folio *folio, int type)
         |                           ~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/f2fs/recovery.c:497:48: warning: passing argument 1 of 'next_blkaddr_of_node' makes pointer from integer without a cast [-Wint-conversion]
     497 |                 blkaddr = next_blkaddr_of_node(CACHE_FOLIO(entry));
         |                                                ^~~~~~~~~~~~~~~~~~
         |                                                |
         |                                                int
   In file included from fs/f2fs/recovery.c:14:
   fs/f2fs/node.h:268:64: note: expected 'const struct folio *' but argument is of type 'int'
     268 | static inline block_t next_blkaddr_of_node(const struct folio *node_folio)
         |                                            ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
>> fs/f2fs/recovery.c:439:35: warning: variable 'rn' set but not used [-Wunused-but-set-variable]
     439 |                 struct f2fs_node *rn;
         |                                   ^~
   fs/f2fs/recovery.c: In function 'do_recover_data':
   fs/f2fs/recovery.c:659:22: warning: passing argument 1 of 'IS_INODE' makes pointer from integer without a cast [-Wint-conversion]
     659 |         if (IS_INODE(CACHE_FOLIO(entry))) {
         |                      ^~~~~~~~~~~~~~~~~~
         |                      |
         |                      int
   In file included from fs/f2fs/recovery.c:13:
   fs/f2fs/f2fs.h:3272:49: note: expected 'const struct folio *' but argument is of type 'int'
    3272 | static inline bool IS_INODE(const struct folio *folio)
         |                             ~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/f2fs/recovery.c:663:53: warning: passing argument 1 of 'ofs_of_node' makes pointer from integer without a cast [-Wint-conversion]
     663 |         } else if (f2fs_has_xattr_block(ofs_of_node(CACHE_FOLIO(entry)))) {
         |                                                     ^~~~~~~~~~~~~~~~~~
         |                                                     |
         |                                                     int
   In file included from fs/f2fs/recovery.c:14:
   fs/f2fs/node.h:255:60: note: expected 'const struct folio *' but argument is of type 'int'
     255 | static inline unsigned int ofs_of_node(const struct folio *node_folio)
         |                                        ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   fs/f2fs/recovery.c:679:53: warning: passing argument 1 of 'ofs_of_node' makes pointer from integer without a cast [-Wint-conversion]
     679 |         start = f2fs_start_bidx_of_node(ofs_of_node(CACHE_FOLIO(entry)), inode);
         |                                                     ^~~~~~~~~~~~~~~~~~
         |                                                     |
         |                                                     int
   In file included from fs/f2fs/recovery.c:14:
   fs/f2fs/node.h:255:60: note: expected 'const struct folio *' but argument is of type 'int'
     255 | static inline unsigned int ofs_of_node(const struct folio *node_folio)
         |                                        ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   fs/f2fs/recovery.c:680:54: warning: passing argument 1 of 'IS_INODE' makes pointer from integer without a cast [-Wint-conversion]
     680 |         end = start + addrs_per_page(inode, IS_INODE(CACHE_FOLIO(entry)));
         |                                                      ^~~~~~~~~~~~~~~~~~
         |                                                      |
         |                                                      int
   In file included from fs/f2fs/recovery.c:13:
   fs/f2fs/f2fs.h:3272:49: note: expected 'const struct folio *' but argument is of type 'int'
    3272 | static inline bool IS_INODE(const struct folio *folio)
         |                             ~~~~~~~~~~~~~~~~~~~~^~~~~
   In file included from include/asm-generic/div64.h:27,
                    from ./arch/nios2/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from fs/f2fs/recovery.c:9:
   fs/f2fs/recovery.c:699:48: warning: passing argument 1 of 'ino_of_node' makes pointer from integer without a cast [-Wint-conversion]
     699 |         f2fs_bug_on(sbi, ni.ino != ino_of_node(CACHE_FOLIO(entry)));
         |                                                ^~~~~~~~~~~~~~~~~~
         |                                                |
         |                                                int
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   fs/f2fs/f2fs.h:33:41: note: in expansion of macro 'BUG_ON'
      33 | #define f2fs_bug_on(sbi, condition)     BUG_ON(condition)
         |                                         ^~~~~~
   fs/f2fs/recovery.c:699:9: note: in expansion of macro 'f2fs_bug_on'
     699 |         f2fs_bug_on(sbi, ni.ino != ino_of_node(CACHE_FOLIO(entry)));
         |         ^~~~~~~~~~~
   In file included from fs/f2fs/recovery.c:14:
   fs/f2fs/node.h:243:53: note: expected 'const struct folio *' but argument is of type 'int'
     243 | static inline nid_t ino_of_node(const struct folio *node_folio)
         |                                 ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   fs/f2fs/recovery.c:701:55: warning: passing argument 1 of 'ofs_of_node' makes pointer from integer without a cast [-Wint-conversion]
     701 |         if (ofs_of_node(dn.node_folio) != ofs_of_node(CACHE_FOLIO(entry))) {
         |                                                       ^~~~~~~~~~~~~~~~~~
         |                                                       |
         |                                                       int
   In file included from fs/f2fs/recovery.c:14:
   fs/f2fs/node.h:255:60: note: expected 'const struct folio *' but argument is of type 'int'
     255 | static inline unsigned int ofs_of_node(const struct folio *node_folio)
         |                                        ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   In file included from fs/f2fs/recovery.c:13:
   fs/f2fs/recovery.c:704:39: warning: passing argument 1 of 'ofs_of_node' makes pointer from integer without a cast [-Wint-conversion]
     704 |                           ofs_of_node(CACHE_FOLIO(entry)));
         |                                       ^~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       int
   fs/f2fs/f2fs.h:2130:53: note: in definition of macro 'f2fs_warn'
    2130 |         f2fs_printk(sbi, false, KERN_WARNING fmt, ##__VA_ARGS__)
         |                                                     ^~~~~~~~~~~
   In file included from fs/f2fs/recovery.c:14:
   fs/f2fs/node.h:255:60: note: expected 'const struct folio *' but argument is of type 'int'
     255 | static inline unsigned int ofs_of_node(const struct folio *node_folio)
         |                                        ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   fs/f2fs/recovery.c:715:47: warning: passing argument 2 of 'data_blkaddr' makes pointer from integer without a cast [-Wint-conversion]
     715 |                 dest = data_blkaddr(dn.inode, CACHE_FOLIO(entry), dn.ofs_in_node);
         |                                               ^~~~~~~~~~~~~~~~~~
         |                                               |
         |                                               int
   In file included from fs/f2fs/recovery.c:13:
   fs/f2fs/f2fs.h:3309:39: note: expected 'struct folio *' but argument is of type 'int'
    3309 |                         struct folio *node_folio, unsigned int offset)
         |                         ~~~~~~~~~~~~~~^~~~~~~~~~
   fs/f2fs/recovery.c:790:41: warning: passing argument 2 of 'copy_node_footer' makes pointer from integer without a cast [-Wint-conversion]


vim +/rn +439 fs/f2fs/recovery.c

   422	
   423	static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
   424					bool check_only, bool *new_inode)
   425	{
   426		struct curseg_info *curseg;
   427		block_t blkaddr, blkaddr_fast;
   428		bool is_detecting = true;
   429		int err = 0;
   430	
   431		/* get node pages in the current segment */
   432		curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
   433		blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
   434		blkaddr_fast = blkaddr;
   435	
   436		while (1) {
   437			struct fsync_inode_entry *fsync_entry;
   438			struct f2fs_cached_block *entry;
 > 439			struct f2fs_node *rn;
   440	
   441			if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
   442				return 0;
   443	
   444			entry = f2fs_get_tmp_cache(sbi, blkaddr);
   445			if (IS_ERR(entry)) {
   446				err = PTR_ERR(entry);
   447				break;
   448			}
   449			rn = CACHED_NODE(entry);
   450	
   451			if (!is_recoverable_dnode(sbi, CACHE_FOLIO(entry))) {
   452				f2fs_put_cache(entry, true);
   453				break;
   454			}
   455	
   456			if (!is_fsync_dnode(CACHE_FOLIO(entry)))
   457				goto next;
   458	
   459			fsync_entry = get_fsync_inode(head, ino_of_node(CACHE_FOLIO(entry)));
   460			if (!fsync_entry) {
   461				bool quota_inode = false;
   462	
   463				if (!check_only &&
   464						IS_INODE(CACHE_FOLIO(entry)) &&
   465						is_dent_dnode(CACHE_FOLIO(entry))) {
   466					err = f2fs_recover_inode_page(sbi, entry);
   467					if (err) {
   468						f2fs_put_cache(entry, true);
   469						break;
   470					}
   471					quota_inode = true;
   472				}
   473	
   474				fsync_entry = add_fsync_inode(sbi, head, ino_of_node(CACHE_FOLIO(entry)),
   475									quota_inode);
   476				if (IS_ERR(fsync_entry)) {
   477					err = PTR_ERR(fsync_entry);
   478					/*
   479					 * CP | dnode(F) | inode(DF)
   480					 * For this case, we should not give up now.
   481					 */
   482					if (err == -ENOENT) {
   483						if (check_only)
   484							*new_inode = true;
   485						goto next;
   486					}
   487					f2fs_put_cache(entry, true);
   488					break;
   489				}
   490			}
   491			fsync_entry->blkaddr = blkaddr;
   492	
   493			if (IS_INODE(CACHE_FOLIO(entry)) && is_dent_dnode(CACHE_FOLIO(entry)))
   494				fsync_entry->last_dentry = blkaddr;
   495	next:
   496			/* check next segment */
   497			blkaddr = next_blkaddr_of_node(CACHE_FOLIO(entry));
   498			f2fs_put_cache(entry, true);
   499	
   500			err = sanity_check_node_chain(sbi, blkaddr, &blkaddr_fast,
   501					&is_detecting);
   502			if (err)
   503				break;
   504		}
   505		return err;
   506	}
   507	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
