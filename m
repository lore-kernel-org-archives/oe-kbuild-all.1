Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C883C15A1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 May 2023 03:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684036642; x=1715572642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qnp7RY2J+KKjzCOBmnwAg59KAx4eoHHTO5ZqDeGG2+I=;
  b=EHZ3qcpvyFbmUjSRy/1QVREHr8VcjScRLyPnffF9uEQIwlP2gkcCmIaS
   qwoqxdsumCmPcoDafqlXSmj27jBXZLu/zE/Gf5VXDg3Cs43KCkInwgsrD
   9JkVjPzEY1Dk1Yd8gvr1CSiEtrSouI3hYH3lW3Yw+ohYaakrq6AklI03D
   ujSybTC/TgPB729VeNId/r5/bqraQchY1bOtwwbhvqG8DyDMBbZ2cXP1s
   qc72pG/lou5smbrlsx2+fH1sStUCWeVvxSt+fcJyLTL/dLLEd+AwgY/9Z
   EROdYb87bvC9tnez2W/2Fbgp/oJxCSiEEsYZC0/s/ZrlVwqPI2hRm6IYp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="330624348"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="330624348"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 20:57:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="874792599"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="874792599"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 May 2023 20:57:20 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1py2rH-0005oS-2t;
	Sun, 14 May 2023 03:57:19 +0000
Date: Sun, 14 May 2023 11:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 45/123] arch/s390/kernel/uv.c:228:34:
 error: no member named 'protected_count' in 'mm_context_t'
Message-ID: <202305141112.K0alrnT4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   a6b7126ab008b78116ff9c71f553e50b334c73ca
commit: 01c05ae79cfd485a82ac8f6264d12b719a64c17d [45/123] KVM: s390: pv: add export before import
config: s390-randconfig-r044-20230514 (https://download.01.org/0day-ci/archive/20230514/202305141112.K0alrnT4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=01c05ae79cfd485a82ac8f6264d12b719a64c17d
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.15
        git checkout 01c05ae79cfd485a82ac8f6264d12b719a64c17d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305141112.K0alrnT4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/uv.c:14:
   In file included from include/linux/memblock.h:14:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from arch/s390/kernel/uv.c:14:
   In file included from include/linux/memblock.h:14:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from arch/s390/kernel/uv.c:14:
   In file included from include/linux/memblock.h:14:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   arch/s390/kernel/uv.c:198:12: error: use of undeclared identifier 'UVC_CC_OK'
           if (cc == UVC_CC_OK)
                     ^
   arch/s390/kernel/uv.c:200:17: error: use of undeclared identifier 'UVC_CC_BUSY'
           else if (cc == UVC_CC_BUSY || cc == UVC_CC_PARTIAL)
                          ^
   arch/s390/kernel/uv.c:200:38: error: use of undeclared identifier 'UVC_CC_PARTIAL'
           else if (cc == UVC_CC_BUSY || cc == UVC_CC_PARTIAL)
                                               ^
>> arch/s390/kernel/uv.c:228:34: error: no member named 'protected_count' in 'mm_context_t'
           return atomic_read(&mm->context.protected_count) > 1;
                               ~~~~~~~~~~~ ^
   12 warnings and 4 errors generated.


vim +228 arch/s390/kernel/uv.c

   204	
   205	/**
   206	 * should_export_before_import - Determine whether an export is needed
   207	 * before an import-like operation
   208	 * @uvcb: the Ultravisor control block of the UVC to be performed
   209	 * @mm: the mm of the process
   210	 *
   211	 * Returns whether an export is needed before every import-like operation.
   212	 * This is needed for shared pages, which don't trigger a secure storage
   213	 * exception when accessed from a different guest.
   214	 *
   215	 * Although considered as one, the Unpin Page UVC is not an actual import,
   216	 * so it is not affected.
   217	 *
   218	 * No export is needed also when there is only one protected VM, because the
   219	 * page cannot belong to the wrong VM in that case (there is no "other VM"
   220	 * it can belong to).
   221	 *
   222	 * Return: true if an export is needed before every import, otherwise false.
   223	 */
   224	static bool should_export_before_import(struct uv_cb_header *uvcb, struct mm_struct *mm)
   225	{
   226		if (uvcb->cmd == UVC_CMD_UNPIN_PAGE_SHARED)
   227			return false;
 > 228		return atomic_read(&mm->context.protected_count) > 1;
   229	}
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
