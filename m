Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1DF7C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 10:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676457824; x=1707993824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/1OMOHCxN7/tyrIKEZ6hN3hq1dxCHr8e10vCMGb9EO8=;
  b=O7xMljf/j0EU/F67NUMawlQey2do7sxEHIrvvtUdQBNFB1ptaEpf7sc8
   e5YnDppbZq5fuO2ZO0GMPOFbpE6osTZi/ECCwVmpMB+INOFSYwcVvyLyx
   YZdIBbGgphQG/sGpAn/t1HoHAF46bJcwWMy4flkmOWykvbs9Ojq9AyMDt
   xLw9DNPObaxByBgWjQ5S16f7Pb/oH3DMl9/2FTM5llzydXoZxZky9zgf3
   xWniRcGFWsOvw376l9O06Hea8M4S9jpj9eLYv1Ly+MNtXH+LEnUo7y/dD
   4qVbJlayXgSHFWjumkhmWdD/WEMEvAWLDt0GryekBNM4E/bSUOXbrsmKV
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="396020771"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="396020771"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 02:43:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="915104174"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="915104174"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Feb 2023 02:43:43 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSFGI-0009Hl-2D;
	Wed, 15 Feb 2023 10:43:42 +0000
Date: Wed, 15 Feb 2023 18:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:pptrs-online-parent-repair 76/84]
 fs/xfs/libxfs/xfs_parent.c:149:25: warning: result of comparison of constant
 256 with expression of type 'const uint8_t' (aka 'const unsigned char') is
 always true
Message-ID: <202302151815.aOovmt1W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git pptrs-online-parent-repair
head:   3d6a7fbcc79ebb1a96479c8b10d26de1c3591f36
commit: b130661cbf6cfd2d3fd9faddc899697e3095d2d1 [76/84] xfs: rearrange bits of the parent pointer apis for fsck
config: hexagon-randconfig-r045-20230215 (https://download.01.org/0day-ci/archive/20230215/202302151815.aOovmt1W-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=b130661cbf6cfd2d3fd9faddc899697e3095d2d1
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs pptrs-online-parent-repair
        git checkout b130661cbf6cfd2d3fd9faddc899697e3095d2d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302151815.aOovmt1W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/libxfs/xfs_parent.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/xfs/libxfs/xfs_parent.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/xfs/libxfs/xfs_parent.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> fs/xfs/libxfs/xfs_parent.c:149:25: warning: result of comparison of constant 256 with expression of type 'const uint8_t' (aka 'const unsigned char') is always true [-Wtautological-constant-out-of-range-compare]
           ASSERT(irec->p_namelen < MAXNAMELEN);
                  ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   fs/xfs/xfs_linux.h:214:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE__))
                   ^~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   7 warnings generated.


vim +149 fs/xfs/libxfs/xfs_parent.c

   137	
   138	/*
   139	 * Convert an incore parent_name record to its ondisk format.  If @value or
   140	 * @valuelen are NULL, they will not be written to.
   141	 */
   142	void
   143	xfs_parent_irec_to_disk(
   144		struct xfs_parent_name_rec	*rec,
   145		void				*value,
   146		int				*valuelen,
   147		const struct xfs_parent_name_irec *irec)
   148	{
 > 149		ASSERT(irec->p_namelen < MAXNAMELEN);
   150	
   151		rec->p_ino = cpu_to_be64(irec->p_ino);
   152		rec->p_gen = cpu_to_be32(irec->p_gen);
   153		rec->p_diroffset = cpu_to_be32(irec->p_diroffset);
   154	
   155		if (valuelen) {
   156			ASSERT(*valuelen > 0);
   157			ASSERT(*valuelen >= irec->p_namelen);
   158			ASSERT(*valuelen < MAXNAMELEN);
   159	
   160			*valuelen = irec->p_namelen;
   161		}
   162	
   163		if (value)
   164			memcpy(value, irec->p_name, irec->p_namelen);
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
