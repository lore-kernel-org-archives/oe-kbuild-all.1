Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3E19472
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 21:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683063282; x=1714599282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FRX0xJ8eMgI1yECkO/0BdVooPUoEjT+ULSuGv/yTcQs=;
  b=jQqe+I4bVL9SObs5kL95FMx5583gSwfbrhGet6AvT4OX8HAo7ghaIwjE
   BRsx9a30fW8TodSZDXFPykgBXnLOw2p+cbWr+2dMwf6miY/tndJl6wKze
   EfZlo9O4Q+Cs+SPdJySTsZSK2N4jNC4ma8AtRSWeiArsJ36GGeVYEzhXW
   Kw5ljPnG7wiuGmKKo4ZItJzThIo2DFHJ8aUe90DMjiID8RAD59e0YkQ0J
   dxH/2jXKCQ+XudjrWzkbKgcE6NP5Cq6nVT3Ls96dRY0iNJxeGt/syPLJP
   Q2TBTOwUgrqrC3b7uTUL9TWScfAYNKsf9Y+MXL+/uv007dVxcB/gDwiye
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="347329195"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="347329195"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 14:34:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="690441834"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="690441834"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 May 2023 14:34:39 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptxdv-0001IS-0c;
	Tue, 02 May 2023 21:34:39 +0000
Date: Wed, 3 May 2023 05:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:ctime 8/8] fs/gfs2/super.c:419:58: warning: passing
 argument 1 of 'ctime_nsec_peek' discards 'const' qualifier from pointer
 target type
Message-ID: <202305030554.9voWgE57-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git ctime
head:   951eec2d461c2335efd597b091570892787db758
commit: 951eec2d461c2335efd597b091570892787db758 [8/8] gfs2: convert to multigrain timestamps
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230503/202305030554.9voWgE57-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?id=951eec2d461c2335efd597b091570892787db758
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git
        git fetch --no-tags jlayton ctime
        git checkout 951eec2d461c2335efd597b091570892787db758
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305030554.9voWgE57-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:545,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/mempool.h:8,
                    from include/linux/bio.h:8,
                    from fs/gfs2/super.c:9:
   fs/gfs2/super.c: In function 'gfs2_dinode_out':
>> fs/gfs2/super.c:419:58: warning: passing argument 1 of 'ctime_nsec_peek' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     419 |         str->di_ctime_nsec = cpu_to_be32(ctime_nsec_peek(inode));
         |                                                          ^~~~~
   include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of macro '__cpu_to_be32'
      40 | #define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
         |                                                   ^
   fs/gfs2/super.c:419:30: note: in expansion of macro 'cpu_to_be32'
     419 |         str->di_ctime_nsec = cpu_to_be32(ctime_nsec_peek(inode));
         |                              ^~~~~~~~~~~
   In file included from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/bio.h:10:
   include/linux/fs.h:2255:50: note: expected 'struct inode *' but argument is of type 'const struct inode *'
    2255 | static inline long ctime_nsec_peek(struct inode *inode)
         |                                    ~~~~~~~~~~~~~~^~~~~


vim +419 fs/gfs2/super.c

   383	
   384	void gfs2_dinode_out(const struct gfs2_inode *ip, void *buf)
   385	{
   386		const struct inode *inode = &ip->i_inode;
   387		struct gfs2_dinode *str = buf;
   388	
   389		str->di_header.mh_magic = cpu_to_be32(GFS2_MAGIC);
   390		str->di_header.mh_type = cpu_to_be32(GFS2_METATYPE_DI);
   391		str->di_header.mh_format = cpu_to_be32(GFS2_FORMAT_DI);
   392		str->di_num.no_addr = cpu_to_be64(ip->i_no_addr);
   393		str->di_num.no_formal_ino = cpu_to_be64(ip->i_no_formal_ino);
   394		str->di_mode = cpu_to_be32(inode->i_mode);
   395		str->di_uid = cpu_to_be32(i_uid_read(inode));
   396		str->di_gid = cpu_to_be32(i_gid_read(inode));
   397		str->di_nlink = cpu_to_be32(inode->i_nlink);
   398		str->di_size = cpu_to_be64(i_size_read(inode));
   399		str->di_blocks = cpu_to_be64(gfs2_get_inode_blocks(inode));
   400		str->di_atime = cpu_to_be64(inode->i_atime.tv_sec);
   401		str->di_mtime = cpu_to_be64(inode->i_mtime.tv_sec);
   402		str->di_ctime = cpu_to_be64(inode->i_ctime.tv_sec);
   403	
   404		str->di_goal_meta = cpu_to_be64(ip->i_goal);
   405		str->di_goal_data = cpu_to_be64(ip->i_goal);
   406		str->di_generation = cpu_to_be64(ip->i_generation);
   407	
   408		str->di_flags = cpu_to_be32(ip->i_diskflags);
   409		str->di_height = cpu_to_be16(ip->i_height);
   410		str->di_payload_format = cpu_to_be32(S_ISDIR(inode->i_mode) &&
   411						     !(ip->i_diskflags & GFS2_DIF_EXHASH) ?
   412						     GFS2_FORMAT_DE : 0);
   413		str->di_depth = cpu_to_be16(ip->i_depth);
   414		str->di_entries = cpu_to_be32(ip->i_entries);
   415	
   416		str->di_eattr = cpu_to_be64(ip->i_eattr);
   417		str->di_atime_nsec = cpu_to_be32(inode->i_atime.tv_nsec);
   418		str->di_mtime_nsec = cpu_to_be32(inode->i_mtime.tv_nsec);
 > 419		str->di_ctime_nsec = cpu_to_be32(ctime_nsec_peek(inode));
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
