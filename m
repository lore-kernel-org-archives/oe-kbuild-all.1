Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DAAA94F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 21:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675200147; x=1706736147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lg/4o7dLR61DZONFZ50LnWM6ZC0zTabiAZYKLARkjbo=;
  b=MJSyywJmKlkZSZgBDHwsndWC8eunZMwlSxRAS96maL41XpCKlkW5fQMP
   Oj1AkjxdZ6ubEU1kueqU0UrnfypMQGnKdiup9S7gz1nRvYxuJ/bjrfL4B
   ydmGoPL8DooEDM4swlhP8A31T+8i9zLhF3oXbju0QLM7SwKzOXF6GH/Gn
   4BhwGZUzhZEAPDP6b9iapX59iTk6ESzxu8UT2nLl/u3YIz66NoLlK3jO8
   vdwCSzkbO+QCFXmvv4J10gng3P/WVEiVm6Z/v7G8IxNWzflv25Mt0kA/P
   rtHBgUg0+7yFp/KJcGjCioUOFgO9B9OF67/YUItVOp1U2vujXbYn23WRa
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="390331313"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="390331313"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 13:22:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="838538868"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="838538868"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Jan 2023 13:22:25 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMy5A-0004iA-2G;
	Tue, 31 Jan 2023 21:22:24 +0000
Date: Wed, 1 Feb 2023 05:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Seth Forshee <sforshee@kernel.org>
Subject: [vfs-idmapping:b4/fs-acl-remove-generic-xattr-handlers.v3.wip.v2
 6/11] fs/reiserfs/super.c:2043: undefined reference to
 `reiserfs_xattr_handlers'
Message-ID: <202302010527.uyPzKnvd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git b4/fs-acl-remove-generic-xattr-handlers.v3.wip.v2
head:   334d732cc27b12707709dcbc99b8061f9b7a2be7
commit: 19695032552608e9144fe72c3c107f90db34fe2c [6/11] reiserfs: rework ->listxattr() implementation
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230201/202302010527.uyPzKnvd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git/commit/?id=19695032552608e9144fe72c3c107f90db34fe2c
        git remote add vfs-idmapping https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git
        git fetch --no-tags vfs-idmapping b4/fs-acl-remove-generic-xattr-handlers.v3.wip.v2
        git checkout 19695032552608e9144fe72c3c107f90db34fe2c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: arch/x86/um/checksum_32.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: fs/reiserfs/super.o: in function `reiserfs_fill_super':
>> fs/reiserfs/super.c:2043: undefined reference to `reiserfs_xattr_handlers'
   collect2: error: ld returned 1 exit status


vim +2043 fs/reiserfs/super.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  2004  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2005  	/* make data=ordered the default */
^1da177e4c3f41 Linus Torvalds      2005-04-16  2006  	if (!reiserfs_data_log(s) && !reiserfs_data_ordered(s) &&
bd4c625c061c2a Linus Torvalds      2005-07-12  2007  	    !reiserfs_data_writeback(s)) {
efaa33eb1309d6 Artem Bityutskiy    2012-06-01  2008  		sbi->s_mount_opt |= (1 << REISERFS_DATA_ORDERED);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2009  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2010  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2011  	if (reiserfs_data_log(s)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2012  		reiserfs_info(s, "using journaled data mode\n");
^1da177e4c3f41 Linus Torvalds      2005-04-16  2013  	} else if (reiserfs_data_ordered(s)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2014  		reiserfs_info(s, "using ordered data mode\n");
^1da177e4c3f41 Linus Torvalds      2005-04-16  2015  	} else {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2016  		reiserfs_info(s, "using writeback data mode\n");
^1da177e4c3f41 Linus Torvalds      2005-04-16  2017  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2018  	if (reiserfs_barrier_flush(s)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2019  		printk("reiserfs: using flush barriers\n");
^1da177e4c3f41 Linus Torvalds      2005-04-16  2020  	}
f32485be8397ad Frederic Weisbecker 2012-01-10  2021  
37c69b98d0dca5 Frederic Weisbecker 2012-01-10  2022  	if (journal_init(s, jdev_name, old_format, commit_max_age)) {
37c69b98d0dca5 Frederic Weisbecker 2012-01-10  2023  		SWARN(silent, s, "sh-2022",
37c69b98d0dca5 Frederic Weisbecker 2012-01-10  2024  		      "unable to initialize journal space");
37c69b98d0dca5 Frederic Weisbecker 2012-01-10  2025  		goto error_unlocked;
37c69b98d0dca5 Frederic Weisbecker 2012-01-10  2026  	} else {
098297b27d23ad Jeff Mahoney        2014-04-23  2027  		/*
098297b27d23ad Jeff Mahoney        2014-04-23  2028  		 * once this is set, journal_release must be called
098297b27d23ad Jeff Mahoney        2014-04-23  2029  		 * if we error out of the mount
37c69b98d0dca5 Frederic Weisbecker 2012-01-10  2030  		 */
098297b27d23ad Jeff Mahoney        2014-04-23  2031  		jinit_done = 1;
37c69b98d0dca5 Frederic Weisbecker 2012-01-10  2032  	}
37c69b98d0dca5 Frederic Weisbecker 2012-01-10  2033  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2034  	if (reread_meta_blocks(s)) {
45b03d5e8e674e Jeff Mahoney        2009-03-30  2035  		SWARN(silent, s, "jmacd-9",
45b03d5e8e674e Jeff Mahoney        2009-03-30  2036  		      "unable to reread meta blocks after journal init");
9b467e6ebebbe7 Frederic Weisbecker 2012-01-10  2037  		goto error_unlocked;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2038  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2039  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2040  	if (replay_only(s))
9b467e6ebebbe7 Frederic Weisbecker 2012-01-10  2041  		goto error_unlocked;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2042  
60e4cf67a582d6 Jeff Mahoney        2019-10-24 @2043  	s->s_xattr = reiserfs_xattr_handlers;
60e4cf67a582d6 Jeff Mahoney        2019-10-24  2044  
bc98a42c1f7d0f David Howells       2017-07-17  2045  	if (bdev_read_only(s->s_bdev) && !sb_rdonly(s)) {
45b03d5e8e674e Jeff Mahoney        2009-03-30  2046  		SWARN(silent, s, "clm-7000",
45b03d5e8e674e Jeff Mahoney        2009-03-30  2047  		      "Detected readonly device, marking FS readonly");
1751e8a6cb935e Linus Torvalds      2017-11-27  2048  		s->s_flags |= SB_RDONLY;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2049  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2050  	args.objectid = REISERFS_ROOT_OBJECTID;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2051  	args.dirid = REISERFS_ROOT_PARENT_OBJECTID;
bd4c625c061c2a Linus Torvalds      2005-07-12  2052  	root_inode =
bd4c625c061c2a Linus Torvalds      2005-07-12  2053  	    iget5_locked(s, REISERFS_ROOT_OBJECTID, reiserfs_find_actor,
a228bf8f0a3e5f Jeff Mahoney        2014-04-23  2054  			 reiserfs_init_locked_inode, (void *)&args);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2055  	if (!root_inode) {
45b03d5e8e674e Jeff Mahoney        2009-03-30  2056  		SWARN(silent, s, "jmacd-10", "get root inode failed");
9b467e6ebebbe7 Frederic Weisbecker 2012-01-10  2057  		goto error_unlocked;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2058  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2059  
9b467e6ebebbe7 Frederic Weisbecker 2012-01-10  2060  	/*
9b467e6ebebbe7 Frederic Weisbecker 2012-01-10  2061  	 * This path assumed to be called with the BKL in the old times.
9b467e6ebebbe7 Frederic Weisbecker 2012-01-10  2062  	 * Now we have inherited the big reiserfs lock from it and many
9b467e6ebebbe7 Frederic Weisbecker 2012-01-10  2063  	 * reiserfs helpers called in the mount path and elsewhere require
9b467e6ebebbe7 Frederic Weisbecker 2012-01-10  2064  	 * this lock to be held even if it's not always necessary. Let's be
9b467e6ebebbe7 Frederic Weisbecker 2012-01-10  2065  	 * conservative and hold it early. The window can be reduced after
9b467e6ebebbe7 Frederic Weisbecker 2012-01-10  2066  	 * careful review of the code.
9b467e6ebebbe7 Frederic Weisbecker 2012-01-10  2067  	 */
9b467e6ebebbe7 Frederic Weisbecker 2012-01-10  2068  	reiserfs_write_lock(s);
9b467e6ebebbe7 Frederic Weisbecker 2012-01-10  2069  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2070  	if (root_inode->i_state & I_NEW) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2071  		reiserfs_read_locked_inode(root_inode, &args);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2072  		unlock_new_inode(root_inode);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2073  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2074  
2acf15b94d5b8e Yu Kuai             2021-07-02  2075  	if (!S_ISDIR(root_inode->i_mode) || !inode_get_bytes(root_inode) ||
2acf15b94d5b8e Yu Kuai             2021-07-02  2076  	    !root_inode->i_size) {
2acf15b94d5b8e Yu Kuai             2021-07-02  2077  		SWARN(silent, s, "", "corrupt root inode, run fsck");
2acf15b94d5b8e Yu Kuai             2021-07-02  2078  		iput(root_inode);
2acf15b94d5b8e Yu Kuai             2021-07-02  2079  		errval = -EUCLEAN;
2acf15b94d5b8e Yu Kuai             2021-07-02  2080  		goto error;
2acf15b94d5b8e Yu Kuai             2021-07-02  2081  	}
2acf15b94d5b8e Yu Kuai             2021-07-02  2082  
48fde701aff662 Al Viro             2012-01-08  2083  	s->s_root = d_make_root(root_inode);
48fde701aff662 Al Viro             2012-01-08  2084  	if (!s->s_root)
^1da177e4c3f41 Linus Torvalds      2005-04-16  2085  		goto error;
098297b27d23ad Jeff Mahoney        2014-04-23  2086  	/* define and initialize hash function */
^1da177e4c3f41 Linus Torvalds      2005-04-16  2087  	sbi->s_hash_function = hash_function(s);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2088  	if (sbi->s_hash_function == NULL) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2089  		dput(s->s_root);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2090  		s->s_root = NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2091  		goto error;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2092  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2093  
bd4c625c061c2a Linus Torvalds      2005-07-12  2094  	if (is_reiserfs_3_5(rs)
bd4c625c061c2a Linus Torvalds      2005-07-12  2095  	    || (is_reiserfs_jr(rs) && SB_VERSION(s) == REISERFS_VERSION_1))
a228bf8f0a3e5f Jeff Mahoney        2014-04-23  2096  		set_bit(REISERFS_3_5, &sbi->s_properties);
e1fabd3ccf0290 Jeff Mahoney        2006-09-30  2097  	else if (old_format)
a228bf8f0a3e5f Jeff Mahoney        2014-04-23  2098  		set_bit(REISERFS_OLD_FORMAT, &sbi->s_properties);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2099  	else
a228bf8f0a3e5f Jeff Mahoney        2014-04-23  2100  		set_bit(REISERFS_3_6, &sbi->s_properties);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2101  
bc98a42c1f7d0f David Howells       2017-07-17  2102  	if (!sb_rdonly(s)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2103  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2104  		errval = journal_begin(&th, s, 1);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2105  		if (errval) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2106  			dput(s->s_root);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2107  			s->s_root = NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2108  			goto error;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2109  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2110  		reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2111  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2112  		set_sb_umount_state(rs, REISERFS_ERROR_FS);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2113  		set_sb_fs_state(rs, 0);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2114  
098297b27d23ad Jeff Mahoney        2014-04-23  2115  		/*
098297b27d23ad Jeff Mahoney        2014-04-23  2116  		 * Clear out s_bmap_nr if it would wrap. We can handle this
cb680c1be62e98 Jeff Mahoney        2007-10-18  2117  		 * case, but older revisions can't. This will cause the
cb680c1be62e98 Jeff Mahoney        2007-10-18  2118  		 * file system to fail mount on those older implementations,
098297b27d23ad Jeff Mahoney        2014-04-23  2119  		 * avoiding corruption. -jeffm
098297b27d23ad Jeff Mahoney        2014-04-23  2120  		 */
cb680c1be62e98 Jeff Mahoney        2007-10-18  2121  		if (bmap_would_wrap(reiserfs_bmap_count(s)) &&
cb680c1be62e98 Jeff Mahoney        2007-10-18  2122  		    sb_bmap_nr(rs) != 0) {
45b03d5e8e674e Jeff Mahoney        2009-03-30  2123  			reiserfs_warning(s, "super-2030", "This file system "
cb680c1be62e98 Jeff Mahoney        2007-10-18  2124  					"claims to use %u bitmap blocks in "
cb680c1be62e98 Jeff Mahoney        2007-10-18  2125  					"its super block, but requires %u. "
cb680c1be62e98 Jeff Mahoney        2007-10-18  2126  					"Clearing to zero.", sb_bmap_nr(rs),
cb680c1be62e98 Jeff Mahoney        2007-10-18  2127  					reiserfs_bmap_count(s));
cb680c1be62e98 Jeff Mahoney        2007-10-18  2128  
cb680c1be62e98 Jeff Mahoney        2007-10-18  2129  			set_sb_bmap_nr(rs, 0);
cb680c1be62e98 Jeff Mahoney        2007-10-18  2130  		}
cb680c1be62e98 Jeff Mahoney        2007-10-18  2131  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2132  		if (old_format_only(s)) {
098297b27d23ad Jeff Mahoney        2014-04-23  2133  			/*
098297b27d23ad Jeff Mahoney        2014-04-23  2134  			 * filesystem of format 3.5 either with standard
098297b27d23ad Jeff Mahoney        2014-04-23  2135  			 * or non-standard journal
098297b27d23ad Jeff Mahoney        2014-04-23  2136  			 */
^1da177e4c3f41 Linus Torvalds      2005-04-16  2137  			if (convert_reiserfs(s)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2138  				/* and -o conv is given */
^1da177e4c3f41 Linus Torvalds      2005-04-16  2139  				if (!silent)
bd4c625c061c2a Linus Torvalds      2005-07-12  2140  					reiserfs_info(s,
bd4c625c061c2a Linus Torvalds      2005-07-12  2141  						      "converting 3.5 filesystem to the 3.6 format");
^1da177e4c3f41 Linus Torvalds      2005-04-16  2142  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2143  				if (is_reiserfs_3_5(rs))
098297b27d23ad Jeff Mahoney        2014-04-23  2144  					/*
098297b27d23ad Jeff Mahoney        2014-04-23  2145  					 * put magic string of 3.6 format.
098297b27d23ad Jeff Mahoney        2014-04-23  2146  					 * 2.2 will not be able to
098297b27d23ad Jeff Mahoney        2014-04-23  2147  					 * mount this filesystem anymore
098297b27d23ad Jeff Mahoney        2014-04-23  2148  					 */
bd4c625c061c2a Linus Torvalds      2005-07-12  2149  					memcpy(rs->s_v1.s_magic,
bd4c625c061c2a Linus Torvalds      2005-07-12  2150  					       reiserfs_3_6_magic_string,
bd4c625c061c2a Linus Torvalds      2005-07-12  2151  					       sizeof
bd4c625c061c2a Linus Torvalds      2005-07-12  2152  					       (reiserfs_3_6_magic_string));
^1da177e4c3f41 Linus Torvalds      2005-04-16  2153  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2154  				set_sb_version(rs, REISERFS_VERSION_2);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2155  				reiserfs_convert_objectid_map_v1(s);
a228bf8f0a3e5f Jeff Mahoney        2014-04-23  2156  				set_bit(REISERFS_3_6, &sbi->s_properties);
a228bf8f0a3e5f Jeff Mahoney        2014-04-23  2157  				clear_bit(REISERFS_3_5, &sbi->s_properties);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2158  			} else if (!silent) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2159  				reiserfs_info(s, "using 3.5.x disk format\n");
^1da177e4c3f41 Linus Torvalds      2005-04-16  2160  			}
702d21c6f6c790 Jeff Mahoney        2009-03-30  2161  		} else
702d21c6f6c790 Jeff Mahoney        2009-03-30  2162  			set_sb_mnt_count(rs, sb_mnt_count(rs) + 1);
702d21c6f6c790 Jeff Mahoney        2009-03-30  2163  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2164  
09f1b80ba8c967 Jeff Mahoney        2014-04-23  2165  		journal_mark_dirty(&th, SB_BUFFER_WITH_SB(s));
58d854265c4c7d Jeff Mahoney        2014-04-23  2166  		errval = journal_end(&th);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2167  		if (errval) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2168  			dput(s->s_root);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2169  			s->s_root = NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2170  			goto error;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2171  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2172  
4c05141df57f4f Jeff Mahoney        2013-08-08  2173  		reiserfs_write_unlock(s);
edcc37a0478836 Al Viro             2009-05-03  2174  		if ((errval = reiserfs_lookup_privroot(s)) ||
edcc37a0478836 Al Viro             2009-05-03  2175  		    (errval = reiserfs_xattr_init(s, s->s_flags))) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2176  			dput(s->s_root);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2177  			s->s_root = NULL;
4c05141df57f4f Jeff Mahoney        2013-08-08  2178  			goto error_unlocked;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2179  		}
4c05141df57f4f Jeff Mahoney        2013-08-08  2180  		reiserfs_write_lock(s);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2181  
098297b27d23ad Jeff Mahoney        2014-04-23  2182  		/*
098297b27d23ad Jeff Mahoney        2014-04-23  2183  		 * look for files which were to be removed in previous session
098297b27d23ad Jeff Mahoney        2014-04-23  2184  		 */
^1da177e4c3f41 Linus Torvalds      2005-04-16  2185  		finish_unfinished(s);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2186  	} else {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2187  		if (old_format_only(s) && !silent) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2188  			reiserfs_info(s, "using 3.5.x disk format\n");
^1da177e4c3f41 Linus Torvalds      2005-04-16  2189  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2190  
4c05141df57f4f Jeff Mahoney        2013-08-08  2191  		reiserfs_write_unlock(s);
edcc37a0478836 Al Viro             2009-05-03  2192  		if ((errval = reiserfs_lookup_privroot(s)) ||
edcc37a0478836 Al Viro             2009-05-03  2193  		    (errval = reiserfs_xattr_init(s, s->s_flags))) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2194  			dput(s->s_root);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2195  			s->s_root = NULL;
4c05141df57f4f Jeff Mahoney        2013-08-08  2196  			goto error_unlocked;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2197  		}
4c05141df57f4f Jeff Mahoney        2013-08-08  2198  		reiserfs_write_lock(s);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2199  	}
098297b27d23ad Jeff Mahoney        2014-04-23  2200  	/*
098297b27d23ad Jeff Mahoney        2014-04-23  2201  	 * mark hash in super block: it could be unset. overwrite should be ok
098297b27d23ad Jeff Mahoney        2014-04-23  2202  	 */
^1da177e4c3f41 Linus Torvalds      2005-04-16  2203  	set_sb_hash_function_code(rs, function2code(sbi->s_hash_function));
^1da177e4c3f41 Linus Torvalds      2005-04-16  2204  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2205  	handle_attrs(s);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2206  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2207  	reiserfs_proc_info_init(s);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2208  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2209  	init_waitqueue_head(&(sbi->s_wait));
^1da177e4c3f41 Linus Torvalds      2005-04-16  2210  	spin_lock_init(&sbi->bitmap_lock);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2211  
8ebc423238341b Frederic Weisbecker 2009-04-07  2212  	reiserfs_write_unlock(s);
8ebc423238341b Frederic Weisbecker 2009-04-07  2213  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2214  	return (0);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2215  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2216  error:
f32485be8397ad Frederic Weisbecker 2012-01-10  2217  	reiserfs_write_unlock(s);
5065227b46235e Jeff Mahoney        2006-09-30  2218  
f32485be8397ad Frederic Weisbecker 2012-01-10  2219  error_unlocked:
f32485be8397ad Frederic Weisbecker 2012-01-10  2220  	/* kill the commit thread, free journal ram */
f32485be8397ad Frederic Weisbecker 2012-01-10  2221  	if (jinit_done) {
f32485be8397ad Frederic Weisbecker 2012-01-10  2222  		reiserfs_write_lock(s);
f32485be8397ad Frederic Weisbecker 2012-01-10  2223  		journal_release_error(NULL, s);
b7b7fa43103a9f Jeff Mahoney        2010-03-29  2224  		reiserfs_write_unlock(s);
f32485be8397ad Frederic Weisbecker 2012-01-10  2225  	}
b7b7fa43103a9f Jeff Mahoney        2010-03-29  2226  
fa0c5540739320 Jiri Slaby          2014-12-12  2227  	if (sbi->commit_wq)
fa0c5540739320 Jiri Slaby          2014-12-12  2228  		destroy_workqueue(sbi->commit_wq);
fa0c5540739320 Jiri Slaby          2014-12-12  2229  
71b0576bdb862e Jan Kara            2017-04-05  2230  	reiserfs_cancel_old_flush(s);
033369d1af1264 Artem Bityutskiy    2012-06-01  2231  
5065227b46235e Jeff Mahoney        2006-09-30  2232  	reiserfs_free_bitmap_cache(s);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2233  	if (SB_BUFFER_WITH_SB(s))
^1da177e4c3f41 Linus Torvalds      2005-04-16  2234  		brelse(SB_BUFFER_WITH_SB(s));
^1da177e4c3f41 Linus Torvalds      2005-04-16  2235  #ifdef CONFIG_QUOTA
5065227b46235e Jeff Mahoney        2006-09-30  2236  	{
5065227b46235e Jeff Mahoney        2006-09-30  2237  		int j;
aca60617738334 Jan Kara            2014-09-10  2238  		for (j = 0; j < REISERFS_MAXQUOTAS; j++)
00b441970a0ab4 Jan Kara            2008-07-25  2239  			kfree(qf_names[j]);
5065227b46235e Jeff Mahoney        2006-09-30  2240  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2241  #endif
5474ca7da6f34f Jan Kara            2019-12-12  2242  	kfree(sbi->s_jdev);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2243  	kfree(sbi);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2244  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2245  	s->s_fs_info = NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2246  	return errval;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2247  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  2248  

:::::: The code at line 2043 was first introduced by commit
:::::: 60e4cf67a582d64f07713eda5fcc8ccdaf7833e6 reiserfs: fix extended attributes on the root directory

:::::: TO: Jeff Mahoney <jeffm@suse.com>
:::::: CC: Jan Kara <jack@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
