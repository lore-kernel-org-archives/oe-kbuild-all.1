Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0562182B4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 17:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683654032; x=1715190032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3wPN8aK3kCsVFd64W41XTtVjMG0ts0bEFdniP6pb/ts=;
  b=mKsMB8JPgWWBO4//butKXcfa1RsyYjQ7d9pOHTyrKik2TdZH6vCS3wgi
   5d48V7Y4tRDCwzr2j2aNgfrJ9eMZcBIe5R2WH9OzkovwaKdqOiTKHcgy9
   n3vLvjs8/Sg5iFIbPS5zs83IiRcfPeigiYMMwirT/dE+3oUQkloa9btQC
   8UoXddF2gVYQvY34BG9Pt0YKhc4qWmPM4JcMAdvvA8bNmx8WrNLt114L4
   jIxTeDAXRwV9EiPDOeI9d0Q+KUl0xi46wBdn7iRAWRNm+YLZHCNj72V3W
   QVLdR2IayxuQQunmO3vyGpq3SXpnWGbF2ovdNPrvj2f45Nzpxu4yy5s9c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="350038653"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="350038653"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 10:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="823219235"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="823219235"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 May 2023 10:40:03 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwRJj-0002Kw-08;
	Tue, 09 May 2023 17:40:03 +0000
Date: Wed, 10 May 2023 01:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:gpio-irq 3/8] drivers/irqchip/irq-mpfs-mux.c:209:11: error:
 use of undeclared identifier 'irq_domain_free_irqs_top'; did you mean
 'irq_domain_free_irqs'?
Message-ID: <202305100110.6IQbsrur-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git gpio-irq
head:   6ef4b8fad90b5bae682bd4b88b807f2a38822fe8
commit: f39a859cf7fec51e695de4544786f2b0fb566e75 [3/8] irqchip: add mpfs gpio interrupt mux
config: s390-randconfig-r044-20230509 (https://download.01.org/0day-ci/archive/20230510/202305100110.6IQbsrur-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?id=f39a859cf7fec51e695de4544786f2b0fb566e75
        git remote add conor https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
        git fetch --no-tags conor gpio-irq
        git checkout f39a859cf7fec51e695de4544786f2b0fb566e75
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100110.6IQbsrur-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-mpfs-mux.c:12:
   In file included from include/linux/irqchip.h:17:
   In file included from include/linux/of_irq.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/irqchip/irq-mpfs-mux.c:12:
   In file included from include/linux/irqchip.h:17:
   In file included from include/linux/of_irq.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/irqchip/irq-mpfs-mux.c:12:
   In file included from include/linux/irqchip.h:17:
   In file included from include/linux/of_irq.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/irqchip/irq-mpfs-mux.c:209:11: error: use of undeclared identifier 'irq_domain_free_irqs_top'; did you mean 'irq_domain_free_irqs'?
           .free           = irq_domain_free_irqs_top,
                             ^~~~~~~~~~~~~~~~~~~~~~~~
                             irq_domain_free_irqs
   include/linux/irqdomain.h:582:20: note: 'irq_domain_free_irqs' declared here
   static inline void irq_domain_free_irqs(unsigned int virq,
                      ^
>> drivers/irqchip/irq-mpfs-mux.c:207:3: error: field designator 'translate' does not refer to any field in type 'const struct irq_domain_ops'
           .translate      = mpfs_irq_mux_nondirect_translate,
           ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mpfs-mux.c:208:3: error: field designator 'alloc' does not refer to any field in type 'const struct irq_domain_ops'
           .alloc          = mpfs_irq_mux_nondirect_alloc,
           ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mpfs-mux.c:209:3: error: field designator 'free' does not refer to any field in type 'const struct irq_domain_ops'
           .free           = irq_domain_free_irqs_top,
           ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-mpfs-mux.c:286:11: error: use of undeclared identifier 'irq_domain_free_irqs_top'; did you mean 'irq_domain_free_irqs'?
           .free           = irq_domain_free_irqs_top,
                             ^~~~~~~~~~~~~~~~~~~~~~~~
                             irq_domain_free_irqs
   include/linux/irqdomain.h:582:20: note: 'irq_domain_free_irqs' declared here
   static inline void irq_domain_free_irqs(unsigned int virq,
                      ^
   drivers/irqchip/irq-mpfs-mux.c:284:3: error: field designator 'translate' does not refer to any field in type 'const struct irq_domain_ops'
           .translate      = mpfs_irq_mux_direct_translate,
           ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-mpfs-mux.c:285:3: error: field designator 'alloc' does not refer to any field in type 'const struct irq_domain_ops'
           .alloc          = mpfs_irq_mux_direct_alloc,
           ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-mpfs-mux.c:286:3: error: field designator 'free' does not refer to any field in type 'const struct irq_domain_ops'
           .free           = irq_domain_free_irqs_top,
           ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12 warnings and 8 errors generated.


vim +209 drivers/irqchip/irq-mpfs-mux.c

   204	
   205	static const struct irq_domain_ops mpfs_irq_mux_nondirect_domain_ops = {
   206		.select		= mpfs_irq_mux_nondirect_select,
 > 207		.translate	= mpfs_irq_mux_nondirect_translate,
 > 208		.alloc		= mpfs_irq_mux_nondirect_alloc,
 > 209		.free		= irq_domain_free_irqs_top,
   210	};
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
