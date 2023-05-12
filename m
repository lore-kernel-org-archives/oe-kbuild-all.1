Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC8FA3C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 04:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683865177; x=1715401177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UWqr0iQo+wf7VUSZ4+9+bVLoH5iZdya70YxMjQFlGag=;
  b=mx542GTFK8a562ZJirHJ6xG0rMmF0RDDG7+ljNaoftD1LAr/Fuob8lsU
   hym1n/Hj6q/SHsO4cYdIh6uHr4cOQLglgq/R2RdsXCPIVJmQq6b1VAQ7b
   GBN2piiY4/VPRqMef1wQazFB1A+PzoEC28ULVGLEmkdX6IY+l5Vw3mQoP
   RpXaUfLFuk8RfkNWxrmD1K8BJEu5OL4QJZPPwiOxSeFpPpSxYGYRy1YSs
   VrTH7NGsFLxcKJOw6n6XpbqKadyW4aqRF49ezqoHYNU+VOR39QrSLzfx0
   TktOkBNKKscgD0fmA20kWnwaKWRKMhZu8o1Nfy70ldmukuaYLLTKaqwy6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="340007286"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="340007286"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 21:19:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="789650893"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="789650893"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 May 2023 21:19:36 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxKFj-0004VD-20;
	Fri, 12 May 2023 04:19:35 +0000
Date: Fri, 12 May 2023 12:19:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 38/56] arch/s390/kernel/uv.c:228:34:
 error: no member named 'protected_count' in 'mm_context_t'
Message-ID: <202305121238.vMzainAr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   5f80e1aa393db03e72e3dd1229a2c831f1893709
commit: 07e1985464cd4f7ce5cf48bb315e5b4fb6b08e11 [38/56] KVM: s390: pv: add export before import
config: s390-randconfig-r021-20230509 (https://download.01.org/0day-ci/archive/20230512/202305121238.vMzainAr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=07e1985464cd4f7ce5cf48bb315e5b4fb6b08e11
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.15
        git checkout 07e1985464cd4f7ce5cf48bb315e5b4fb6b08e11
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121238.vMzainAr-lkp@intel.com/

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
