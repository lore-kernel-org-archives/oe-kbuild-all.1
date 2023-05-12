Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5532A49
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 04:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683864583; x=1715400583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HM4UIOQI6nwZ5Tdcxt7YHcIzhl7nZ/GwGqODp8262Rg=;
  b=jWTlIIxWsOzHb8fnvse3d4yl7GWJiiOQpDHgSIMcGd7ISFHj8oFYq/LA
   EvvzkJipzHUMOlBt6P9UWHCBXEqzeXmbpJ+iwJsfZD8G6F+SHiI94VHNb
   TgG3Cpsgt/QcrCgpif6GsHSTnqEf3DkYbbYVtThh9nBmDFdTZo9vY/58F
   +JfRGtii1v8QHzZ2h51CYgtovq3X0uUXRdUkLS+Q9u7xRiUYEMHTCFEpg
   9zwIo92fnRsX5WfR4z5jaPslF4btz20Dr3t3y71KkGvEBKuyM4dQZTdQz
   fQ6YroCoU4yWBD+bFMFdbfIkRvHz6orDjQeXiP3BeUFTkq95DWrEfyhvG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="416324480"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="416324480"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 21:09:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="732872127"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="732872127"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 May 2023 21:09:35 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxK63-0004UN-0e;
	Fri, 12 May 2023 04:09:35 +0000
Date: Fri, 12 May 2023 12:09:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 37/56] arch/s390/kernel/uv.c:198:12:
 error: use of undeclared identifier 'UVC_CC_OK'
Message-ID: <202305121108.F8jLgpc3-lkp@intel.com>
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
commit: 1a90bacabae84bd6b85efdfff193b7e1d2fc58d3 [37/56] KVM: s390: pv: avoid stalls when making pages secure
config: s390-randconfig-r021-20230509 (https://download.01.org/0day-ci/archive/20230512/202305121108.F8jLgpc3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=1a90bacabae84bd6b85efdfff193b7e1d2fc58d3
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.15
        git checkout 1a90bacabae84bd6b85efdfff193b7e1d2fc58d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121108.F8jLgpc3-lkp@intel.com/

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
>> arch/s390/kernel/uv.c:198:12: error: use of undeclared identifier 'UVC_CC_OK'
           if (cc == UVC_CC_OK)
                     ^
>> arch/s390/kernel/uv.c:200:17: error: use of undeclared identifier 'UVC_CC_BUSY'
           else if (cc == UVC_CC_BUSY || cc == UVC_CC_PARTIAL)
                          ^
>> arch/s390/kernel/uv.c:200:38: error: use of undeclared identifier 'UVC_CC_PARTIAL'
           else if (cc == UVC_CC_BUSY || cc == UVC_CC_PARTIAL)
                                               ^
   12 warnings and 3 errors generated.


vim +/UVC_CC_OK +198 arch/s390/kernel/uv.c

   162	
   163	static int make_secure_pte(pte_t *ptep, unsigned long addr,
   164				   struct page *exp_page, struct uv_cb_header *uvcb)
   165	{
   166		pte_t entry = READ_ONCE(*ptep);
   167		struct page *page;
   168		int expected, cc = 0;
   169	
   170		if (!pte_present(entry))
   171			return -ENXIO;
   172		if (pte_val(entry) & _PAGE_INVALID)
   173			return -ENXIO;
   174	
   175		page = pte_page(entry);
   176		if (page != exp_page)
   177			return -ENXIO;
   178		if (PageWriteback(page))
   179			return -EAGAIN;
   180		expected = expected_page_refs(page);
   181		if (!page_ref_freeze(page, expected))
   182			return -EBUSY;
   183		set_bit(PG_arch_1, &page->flags);
   184		/*
   185		 * If the UVC does not succeed or fail immediately, we don't want to
   186		 * loop for long, or we might get stall notifications.
   187		 * On the other hand, this is a complex scenario and we are holding a lot of
   188		 * locks, so we can't easily sleep and reschedule. We try only once,
   189		 * and if the UVC returned busy or partial completion, we return
   190		 * -EAGAIN and we let the callers deal with it.
   191		 */
   192		cc = __uv_call(0, (u64)uvcb);
   193		page_ref_unfreeze(page, expected);
   194		/*
   195		 * Return -ENXIO if the page was not mapped, -EINVAL for other errors.
   196		 * If busy or partially completed, return -EAGAIN.
   197		 */
 > 198		if (cc == UVC_CC_OK)
   199			return 0;
 > 200		else if (cc == UVC_CC_BUSY || cc == UVC_CC_PARTIAL)
   201			return -EAGAIN;
   202		return uvcb->rc == 0x10a ? -ENXIO : -EINVAL;
   203	}
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
