Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787002F32
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 13:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677677437; x=1709213437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GfWIpIBSvSGbYSGNuWpjO0b18G/PvPx8FUskJtm1WLE=;
  b=FVhZ+I7tR3dO8qaSRYG/acreq64wrLFJSpv7ngqvzQzOh7iH0tHFSNBP
   65ICDtvg+HXpkiThX+X7nMKnzJKJjPxnMTfLAXWIXtLLMvNDQZYNwAd7A
   i1chtAXt3biQOTt/KhPBqzjJ0ftJGk+p7JBH5XcYRz5TO8oV1tITWkUNi
   nBR8UjBKk8vYnWm5Y36Q2dMNY42MGYxjxZmqg/zWdLOy2yNqvsvyrdDiA
   hIKNtPMUtBtk9Tf4GAEVecOR9EcJBE8n2Qvy3FY5U0T8OKPBMUezJl/do
   TPpcLHBEHTm93qDvTKuas45reHooGuDEKrj+enE0fHcKiLyPifr4qfetJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="333133491"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="333133491"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 05:30:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="667868806"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="667868806"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Mar 2023 05:30:19 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXMXC-0006Ah-0s;
	Wed, 01 Mar 2023 13:30:18 +0000
Date: Wed, 1 Mar 2023 21:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/upstream-f2fs-stable-linux-4.19.y
 482/1172] fs/f2fs/inode.c:307:7: warning: format specifies type 'unsigned
 long' but the argument has type 'blkcnt_t' (aka 'unsigned long long')
Message-ID: <202303012149.vteQarPr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chao,

FYI, the error/warning still remains.

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/upstream-f2fs-stable-linux-4.19.y
head:   b9aeb147225616494256fcf913c559afd4088a05
commit: 0f87f20d0536ae21524ce1c25335aec991229114 [482/1172] f2fs: fix to check i_compr_blocks correctly
config: mips-randconfig-r035-20230228 (https://download.01.org/0day-ci/archive/20230301/202303012149.vteQarPr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/0f87f20d0536ae21524ce1c25335aec991229114
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/upstream-f2fs-stable-linux-4.19.y
        git checkout 0f87f20d0536ae21524ce1c25335aec991229114
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash M=fs/f2fs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303012149.vteQarPr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/inode.c:307:7: warning: format specifies type 'unsigned long' but the argument has type 'blkcnt_t' (aka 'unsigned long long') [-Wformat]
                                     SECTOR_TO_BLOCK(inode->i_blocks));
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:1949:39: note: expanded from macro 'f2fs_warn'
           f2fs_printk(sbi, KERN_WARNING fmt, ##__VA_ARGS__)
                                         ~~~    ^~~~~~~~~~~
   fs/f2fs/segment.h:119:2: note: expanded from macro 'SECTOR_TO_BLOCK'
           ((sectors) >> F2FS_LOG_SECTORS_PER_BLOCK)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +307 fs/f2fs/inode.c

   198	
   199	static bool sanity_check_inode(struct inode *inode, struct page *node_page)
   200	{
   201		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
   202		struct f2fs_inode_info *fi = F2FS_I(inode);
   203		struct f2fs_inode *ri = F2FS_INODE(node_page);
   204		unsigned long long iblocks;
   205	
   206		iblocks = le64_to_cpu(F2FS_INODE(node_page)->i_blocks);
   207		if (!iblocks) {
   208			set_sbi_flag(sbi, SBI_NEED_FSCK);
   209			f2fs_warn(sbi, "%s: corrupted inode i_blocks i_ino=%lx iblocks=%llu, run fsck to fix.",
   210				  __func__, inode->i_ino, iblocks);
   211			return false;
   212		}
   213	
   214		if (ino_of_node(node_page) != nid_of_node(node_page)) {
   215			set_sbi_flag(sbi, SBI_NEED_FSCK);
   216			f2fs_warn(sbi, "%s: corrupted inode footer i_ino=%lx, ino,nid: [%u, %u] run fsck to fix.",
   217				  __func__, inode->i_ino,
   218				  ino_of_node(node_page), nid_of_node(node_page));
   219			return false;
   220		}
   221	
   222		if (f2fs_sb_has_flexible_inline_xattr(sbi)
   223				&& !f2fs_has_extra_attr(inode)) {
   224			set_sbi_flag(sbi, SBI_NEED_FSCK);
   225			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, run fsck to fix.",
   226				  __func__, inode->i_ino);
   227			return false;
   228		}
   229	
   230		if (f2fs_has_extra_attr(inode) &&
   231				!f2fs_sb_has_extra_attr(sbi)) {
   232			set_sbi_flag(sbi, SBI_NEED_FSCK);
   233			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
   234				  __func__, inode->i_ino);
   235			return false;
   236		}
   237	
   238		if (fi->i_extra_isize > F2FS_TOTAL_EXTRA_ATTR_SIZE ||
   239				fi->i_extra_isize % sizeof(__le32)) {
   240			set_sbi_flag(sbi, SBI_NEED_FSCK);
   241			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_extra_isize: %d, max: %zu",
   242				  __func__, inode->i_ino, fi->i_extra_isize,
   243				  F2FS_TOTAL_EXTRA_ATTR_SIZE);
   244			return false;
   245		}
   246	
   247		if (f2fs_has_extra_attr(inode) &&
   248			f2fs_sb_has_flexible_inline_xattr(sbi) &&
   249			f2fs_has_inline_xattr(inode) &&
   250			(!fi->i_inline_xattr_size ||
   251			fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
   252			set_sbi_flag(sbi, SBI_NEED_FSCK);
   253			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %zu",
   254				  __func__, inode->i_ino, fi->i_inline_xattr_size,
   255				  MAX_INLINE_XATTR_SIZE);
   256			return false;
   257		}
   258	
   259		if (F2FS_I(inode)->extent_tree) {
   260			struct extent_info *ei = &F2FS_I(inode)->extent_tree->largest;
   261	
   262			if (ei->len &&
   263				(!f2fs_is_valid_blkaddr(sbi, ei->blk,
   264							DATA_GENERIC_ENHANCE) ||
   265				!f2fs_is_valid_blkaddr(sbi, ei->blk + ei->len - 1,
   266							DATA_GENERIC_ENHANCE))) {
   267				set_sbi_flag(sbi, SBI_NEED_FSCK);
   268				f2fs_warn(sbi, "%s: inode (ino=%lx) extent info [%u, %u, %u] is incorrect, run fsck to fix",
   269					  __func__, inode->i_ino,
   270					  ei->blk, ei->fofs, ei->len);
   271				return false;
   272			}
   273		}
   274	
   275		if (f2fs_has_inline_data(inode) &&
   276				(!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))) {
   277			set_sbi_flag(sbi, SBI_NEED_FSCK);
   278			f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
   279				  __func__, inode->i_ino, inode->i_mode);
   280			return false;
   281		}
   282	
   283		if (f2fs_has_inline_dentry(inode) && !S_ISDIR(inode->i_mode)) {
   284			set_sbi_flag(sbi, SBI_NEED_FSCK);
   285			f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_dentry, run fsck to fix",
   286				  __func__, inode->i_ino, inode->i_mode);
   287			return false;
   288		}
   289	
   290		if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
   291				fi->i_flags & F2FS_COMPR_FL &&
   292				F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
   293							i_log_cluster_size)) {
   294			if (ri->i_compress_algorithm >= COMPRESS_MAX) {
   295				f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
   296					"compress algorithm: %u, run fsck to fix",
   297					  __func__, inode->i_ino,
   298					  ri->i_compress_algorithm);
   299				return false;
   300			}
   301			if (le64_to_cpu(ri->i_compr_blocks) >
   302					SECTOR_TO_BLOCK(inode->i_blocks)) {
   303				f2fs_warn(sbi, "%s: inode (ino=%lx) has inconsistent "
   304					"i_compr_blocks:%llu, i_blocks:%lu, run fsck to fix",
   305					  __func__, inode->i_ino,
   306					  le64_to_cpu(ri->i_compr_blocks),
 > 307					  SECTOR_TO_BLOCK(inode->i_blocks));
   308				return false;
   309			}
   310			if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
   311				ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
   312				f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
   313					"log cluster size: %u, run fsck to fix",
   314					  __func__, inode->i_ino,
   315					  ri->i_log_cluster_size);
   316				return false;
   317			}
   318		}
   319	
   320		return true;
   321	}
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
