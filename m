Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749B72598
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 22:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683497692; x=1715033692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZwCn3WI8ULzghx1uSWAzLJHxm9FZ+STyMdWdLpiaObE=;
  b=KK1ogSvEOMPXf+Gab45oaGqfGSSHE3S+vDjXb094Af4i4k25BT/2RLoh
   SuMoZnwSGjKdLRSAZFYs50rjWnzuzrXUtNuHv/HFxnAPWJRPiUEkR0/os
   K3WjGTxqW+ueww5V2J+w/iJaStxHk0e1AKV3akjH1yB82ZuW3Eo/KKKRk
   WmNppV8s6ort6qty6QNcbWoPs+lD/iBTAgyFZcLLfUrJqKMhTS1UAQNUJ
   p8MbdKYmzhpbh94tM8IxuJrIMKjX8UZjeTk4GF1l+uSgjpb13x7Hgq1kc
   fdM76NOnrx6WP1A4eVR30NGXvBDBvwVTgvOdCBPk29yeocQJllvv7vucS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="351675013"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="351675013"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 15:14:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="763163747"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="763163747"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 May 2023 15:14:50 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvmeY-0000tN-0Q;
	Sun, 07 May 2023 22:14:50 +0000
Date: Mon, 8 May 2023 06:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFCv5 5/5] iomap: Add per-block dirty state tracking to improve
 performance
Message-ID: <202305080608.DiBXbvKQ-lkp@intel.com>
References: <86987466d8d7863bd0dca81e9d6c3eff7abd4964.1683485700.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86987466d8d7863bd0dca81e9d6c3eff7abd4964.1683485700.git.ritesh.list@gmail.com>

Hi Ritesh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on gfs2/for-next linus/master v6.4-rc1 next-20230505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ritesh-Harjani-IBM/iomap-Rename-iomap_page_create-release-to-iop_alloc-free/20230508-032903
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/86987466d8d7863bd0dca81e9d6c3eff7abd4964.1683485700.git.ritesh.list%40gmail.com
patch subject: [RFCv5 5/5] iomap: Add per-block dirty state tracking to improve performance
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230508/202305080608.DiBXbvKQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a05d7e56a951c074e0d13c4e9908a90b4e14ad92
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ritesh-Harjani-IBM/iomap-Rename-iomap_page_create-release-to-iop_alloc-free/20230508-032903
        git checkout a05d7e56a951c074e0d13c4e9908a90b4e14ad92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305080608.DiBXbvKQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/iomap/buffered-io.c: In function 'iomap_read_inline_data':
   fs/iomap/buffered-io.c:311:28: warning: variable 'iop' set but not used [-Wunused-but-set-variable]
     311 |         struct iomap_page *iop;
         |                            ^~~
   fs/iomap/buffered-io.c: In function 'iomap_dirty_folio':
   fs/iomap/buffered-io.c:626:28: warning: variable 'iop' set but not used [-Wunused-but-set-variable]
     626 |         struct iomap_page *iop;
         |                            ^~~
   fs/iomap/buffered-io.c: In function 'iomap_write_delalloc_scan':
>> fs/iomap/buffered-io.c:1032:51: warning: variable 'blks_per_folio' set but not used [-Wunused-but-set-variable]
    1032 |                 unsigned int first_blk, last_blk, blks_per_folio, i;
         |                                                   ^~~~~~~~~~~~~~


vim +/blks_per_folio +1032 fs/iomap/buffered-io.c

  1007	
  1008	/*
  1009	 * Scan the data range passed to us for dirty page cache folios. If we find a
  1010	 * dirty folio, punch out the preceeding range and update the offset from which
  1011	 * the next punch will start from.
  1012	 *
  1013	 * We can punch out storage reservations under clean pages because they either
  1014	 * contain data that has been written back - in which case the delalloc punch
  1015	 * over that range is a no-op - or they have been read faults in which case they
  1016	 * contain zeroes and we can remove the delalloc backing range and any new
  1017	 * writes to those pages will do the normal hole filling operation...
  1018	 *
  1019	 * This makes the logic simple: we only need to keep the delalloc extents only
  1020	 * over the dirty ranges of the page cache.
  1021	 *
  1022	 * This function uses [start_byte, end_byte) intervals (i.e. open ended) to
  1023	 * simplify range iterations.
  1024	 */
  1025	static int iomap_write_delalloc_scan(struct inode *inode,
  1026			loff_t *punch_start_byte, loff_t start_byte, loff_t end_byte,
  1027			int (*punch)(struct inode *inode, loff_t offset, loff_t length))
  1028	{
  1029		while (start_byte < end_byte) {
  1030			struct folio	*folio;
  1031			struct iomap_page *iop;
> 1032			unsigned int first_blk, last_blk, blks_per_folio, i;
  1033			loff_t last_byte;
  1034			u8 blkbits = inode->i_blkbits;
  1035	
  1036			/* grab locked page */
  1037			folio = filemap_lock_folio(inode->i_mapping,
  1038					start_byte >> PAGE_SHIFT);
  1039			if (!folio) {
  1040				start_byte = ALIGN_DOWN(start_byte, PAGE_SIZE) +
  1041						PAGE_SIZE;
  1042				continue;
  1043			}
  1044	
  1045			/* if dirty, punch up to offset */
  1046			if (folio_test_dirty(folio)) {
  1047				if (start_byte > *punch_start_byte) {
  1048					int	error;
  1049	
  1050					error = punch(inode, *punch_start_byte,
  1051							start_byte - *punch_start_byte);
  1052					if (error) {
  1053						folio_unlock(folio);
  1054						folio_put(folio);
  1055						return error;
  1056					}
  1057				}
  1058	
  1059				/*
  1060				 * When we have per-block dirty tracking, there can be
  1061				 * blocks within a folio which are marked uptodate
  1062				 * but not dirty. In that case it is necessary to punch
  1063				 * out such blocks to avoid leaking any delalloc blocks.
  1064				 */
  1065				iop = to_iomap_page(folio);
  1066				if (!iop)
  1067					goto skip_iop_punch;
  1068				last_byte = min_t(loff_t, end_byte - 1,
  1069					(folio_next_index(folio) << PAGE_SHIFT) - 1);
  1070				first_blk = offset_in_folio(folio, start_byte) >>
  1071							    blkbits;
  1072				last_blk = offset_in_folio(folio, last_byte) >>
  1073							   blkbits;
  1074				blks_per_folio = i_blocks_per_folio(inode, folio);
  1075				for (i = first_blk; i <= last_blk; i++) {
  1076					if (!iop_test_block_dirty(folio, i))
  1077						punch(inode, i << blkbits,
  1078							     1 << blkbits);
  1079				}
  1080	skip_iop_punch:
  1081				/*
  1082				 * Make sure the next punch start is correctly bound to
  1083				 * the end of this data range, not the end of the folio.
  1084				 */
  1085				*punch_start_byte = min_t(loff_t, end_byte,
  1086						folio_next_index(folio) << PAGE_SHIFT);
  1087			}
  1088	
  1089			/* move offset to start of next folio in range */
  1090			start_byte = folio_next_index(folio) << PAGE_SHIFT;
  1091			folio_unlock(folio);
  1092			folio_put(folio);
  1093		}
  1094		return 0;
  1095	}
  1096	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
