Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D238E156F1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jan 2024 18:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IajjYvWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704219659; x=1735755659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jt3RjVGcvzhk2tKh8VrdWthDGr4OnjuDMFnTwFFBhwM=;
  b=IajjYvWaoWULkZIIifapP6BmfIf036JH/zG23OJCaZsDNBSAqfH+8R0p
   C7caAQCKn3x3MYAVX3MOVyAWvzd0zsk5FSX+wsmQ1uvs+Mu6egJbkacxz
   iS4wG1hjQrrAB9VXF1XUuZ9d5beGvjHLKACPW+c908aq0eZxkiPuu1HSa
   nmEPCuB4e2qyG/HyUnlM7tEDRK8ohX6sly5cKKBZg3OY0Ml2josXbn69b
   3WmKrhNVCO6DojISYI1zs5LdW63icCzjoog3VpG4gZJXoWW/qNdtjpNAP
   AG/w7OQw3uCJr6T1OT2lT6zUiMxJni5dG0U6sj4aiXSNH8qvi+OFQwg36
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="395785691"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="395785691"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 10:20:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="845647605"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="845647605"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 02 Jan 2024 10:20:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKjNn-000LNM-2c;
	Tue, 02 Jan 2024 18:20:55 +0000
Date: Wed, 3 Jan 2024 02:20:13 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:misc 1/2] include/linux/bpf.h:2744:5: warning: no previous
 prototype for function 'bpf_user_writable_register'
Message-ID: <202401030218.a9jyz0kz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git misc
head:   20d435f75e5c821a24146995afca94cdcf6a4d34
commit: 5214acb8d02febb2238f4f74dc27cf5bc460c206 [1/2] bpf: Introduce bpf_probe_write_user_registered()
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20240103/202401030218.a9jyz0kz-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project baf8a39aaf8b61a38b5b2b5591deb765e42eb00b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240103/202401030218.a9jyz0kz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401030218.a9jyz0kz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from kernel/fork.c:98:
>> include/linux/bpf.h:2744:5: warning: no previous prototype for function 'bpf_user_writable_register' [-Wmissing-prototypes]
    2744 | int bpf_user_writable_register(void __user *start, size_t size, u32 tag)
         |     ^
   include/linux/bpf.h:2744:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2744 | int bpf_user_writable_register(void __user *start, size_t size, u32 tag)
         | ^
         | static 
>> include/linux/bpf.h:2749:5: warning: no previous prototype for function 'bpf_user_writable_unregister' [-Wmissing-prototypes]
    2749 | int bpf_user_writable_unregister(void __user *start, size_t size)
         |     ^
   include/linux/bpf.h:2749:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2749 | int bpf_user_writable_unregister(void __user *start, size_t size)
         | ^
         | static 
>> include/linux/bpf.h:2754:6: warning: no previous prototype for function 'bpf_user_writable_free' [-Wmissing-prototypes]
    2754 | void bpf_user_writable_free(struct task_struct *t)
         |      ^
   include/linux/bpf.h:2754:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2754 | void bpf_user_writable_free(struct task_struct *t)
         | ^
         | static 
   15 warnings generated.


vim +/bpf_user_writable_register +2744 include/linux/bpf.h

  2743	
> 2744	int bpf_user_writable_register(void __user *start, size_t size, u32 tag)
  2745	{
  2746		return -EOPNOTSUPP;
  2747	}
  2748	
> 2749	int bpf_user_writable_unregister(void __user *start, size_t size)
  2750	{
  2751		return -EOPNOTSUPP;
  2752	}
  2753	
> 2754	void bpf_user_writable_free(struct task_struct *t)
  2755	{
  2756	}
  2757	#endif /* CONFIG_BPF_SYSCALL */
  2758	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
