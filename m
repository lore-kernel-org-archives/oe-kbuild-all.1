Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A01A385
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 22:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712788252; cv=none; b=O8za76Q1OhivzNi/J1tE7JvPBQ9xF8Q+jyfC2OQV/gO48JYMVaF+7pyEwuaB5/n13DW3+C3FUGnLcQTNl3g7baxrwWpIhVhEplUZ+j2wRRQ+eZErZWXTiZ/1GE4zKVZYac6/PbLjGGyMjK5UHScQN9Rh5615SIjt2gYlgYacZ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712788252; c=relaxed/simple;
	bh=T0ToEqrpx+hL25eJrum6aadYIf0wv3J9FCx6FwxXFgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dGcuwTnI0l8IyyCRDNoQ9LUytWoFkYtpHyxjpct/S6FZZVCZtm4MbGMXT5+BPt5pXHy5prCyLedViy472K09tjjDguYTWeOje1QQ5kvT5mklypq2NGbV1mE/PqCe8EeiuFTBbV69oCL3cfd3i8XWQr0KlZn1IO4koQyrxQdl+TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIR6QAPb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIR6QAPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712788250; x=1744324250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T0ToEqrpx+hL25eJrum6aadYIf0wv3J9FCx6FwxXFgs=;
  b=TIR6QAPbL9bWurLKG7saTqQcG4TSffa+bmMvRvLVlx2UMO61U8J37svM
   I+ZC2q55R9k3zkoaS+UTTWLFWNpgoRCW3NTxYBswmS/onFQ3TwiX4HvdO
   Tji5dbQc1uoJ3qwA9DMHsKJu+VAUFC5lAICQeYvJe30/lkC68j39y7ZNV
   LHPy/ZdKTna11au+1co0nA2I2GoQItzLhenPZMQ0QyJOSlthlEUZ1/hJw
   IxxpW2RgR/T4FIVgojM7eQ182cspdUVCX/5x6SMtU/4riQOysViMhBdWR
   +JVBwSE7TJOnKyElXu3YrLvpi1DLclGymTT/bV9wYy83gBGgIWbYiQpGB
   A==;
X-CSE-ConnectionGUID: 973Qs/PtSh60885j6CsSOA==
X-CSE-MsgGUID: 9h1MEIZdR06SkuuCA/Ad2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8740892"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8740892"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 15:30:50 -0700
X-CSE-ConnectionGUID: zTnYnxvtSxiXNJCXwVJAVA==
X-CSE-MsgGUID: KwXlN7u1RUKZHDt2HWjP1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="25177698"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Apr 2024 15:30:48 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rugSs-0007tj-1O;
	Wed, 10 Apr 2024 22:30:46 +0000
Date: Thu, 11 Apr 2024 06:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.1 4/5]
 arch/x86/include/asm/page_types.h:11:9: warning: 'PAGE_SIZE' macro redefined
Message-ID: <202404110609.ENnGWkgn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.1
head:   dbe528dceca7fe608061c8686e00aa4d53042767
commit: 7fb104a83d94f08496291125374fdf7c49ea7baa [4/5] mm: memcg: merge multiple page_counters into a single structure
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240411/202404110609.ENnGWkgn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110609.ENnGWkgn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110609.ENnGWkgn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/open.c:14:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/open.c:14:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/open.c:14:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from fs/open.c:19:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
>> arch/x86/include/asm/page_types.h:11:9: warning: 'PAGE_SIZE' macro redefined [-Wmacro-redefined]
      11 | #define PAGE_SIZE               (_AC(1,UL) << PAGE_SHIFT)
         |         ^
   arch/um/include/asm/page.h:14:9: note: previous definition is here
      14 | #define PAGE_SIZE       (_AC(1, UL) << PAGE_SHIFT)
         |         ^
   In file included from fs/open.c:19:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
>> arch/x86/include/asm/page_types.h:30:9: warning: 'PAGE_OFFSET' macro redefined [-Wmacro-redefined]
      30 | #define PAGE_OFFSET             ((unsigned long)__PAGE_OFFSET)
         |         ^
   arch/um/include/asm/page.h:93:9: note: previous definition is here
      93 | #define PAGE_OFFSET (uml_physmem)
         |         ^
   In file included from fs/open.c:19:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
>> arch/x86/include/asm/page_types.h:32:9: warning: 'VM_DATA_DEFAULT_FLAGS' macro redefined [-Wmacro-redefined]
      32 | #define VM_DATA_DEFAULT_FLAGS   VM_DATA_FLAGS_TSK_EXEC
         |         ^
   include/linux/mm.h:423:9: note: previous definition is here
     423 | #define VM_DATA_DEFAULT_FLAGS  VM_DATA_FLAGS_EXEC
         |         ^
   In file included from fs/open.c:19:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
   In file included from arch/x86/include/asm/page_types.h:40:
>> arch/x86/include/asm/page_64_types.h:15:9: warning: 'THREAD_SIZE_ORDER' macro redefined [-Wmacro-redefined]
      15 | #define THREAD_SIZE_ORDER       (2 + KASAN_STACK_ORDER)
         |         ^
   arch/um/include/asm/thread_info.h:9:9: note: previous definition is here
       9 | #define THREAD_SIZE_ORDER CONFIG_KERNEL_STACK_ORDER
         |         ^
   In file included from fs/open.c:19:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
   In file included from arch/x86/include/asm/page_types.h:40:
>> arch/x86/include/asm/page_64_types.h:16:9: warning: 'THREAD_SIZE' macro redefined [-Wmacro-redefined]
      16 | #define THREAD_SIZE  (PAGE_SIZE << THREAD_SIZE_ORDER)
         |         ^
   arch/um/include/asm/thread_info.h:10:9: note: previous definition is here
      10 | #define THREAD_SIZE ((1 << CONFIG_KERNEL_STACK_ORDER) * PAGE_SIZE)
         |         ^
   In file included from fs/open.c:19:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
   In file included from arch/x86/include/asm/page_types.h:40:
>> arch/x86/include/asm/page_64_types.h:64:9: warning: 'TASK_SIZE_MAX' macro redefined [-Wmacro-redefined]
      64 | #define TASK_SIZE_MAX           task_size_max()
         |         ^
   include/asm-generic/access_ok.h:16:9: note: previous definition is here
      16 | #define TASK_SIZE_MAX                   TASK_SIZE
         |         ^
   In file included from fs/open.c:19:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
   In file included from arch/x86/include/asm/page_types.h:40:
>> arch/x86/include/asm/page_64_types.h:75:9: warning: 'TASK_SIZE' macro redefined [-Wmacro-redefined]
      75 | #define TASK_SIZE               (test_thread_flag(TIF_ADDR32) ? \
         |         ^
   arch/um/include/asm/processor-generic.h:62:9: note: previous definition is here
      62 | #define TASK_SIZE (task_size)
         |         ^
   In file included from fs/open.c:19:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
   In file included from arch/x86/include/asm/page_types.h:40:
>> arch/x86/include/asm/page_64_types.h:77:9: warning: 'TASK_SIZE_OF' macro redefined [-Wmacro-redefined]
      77 | #define TASK_SIZE_OF(child)     ((test_tsk_thread_flag(child, TIF_ADDR32)) ? \
         |         ^
   include/linux/sched.h:2164:9: note: previous definition is here
    2164 | #define TASK_SIZE_OF(tsk)       TASK_SIZE
         |         ^
   In file included from fs/open.c:19:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
   In file included from arch/x86/include/asm/page_types.h:40:
>> arch/x86/include/asm/page_64_types.h:80:9: warning: 'STACK_TOP' macro redefined [-Wmacro-redefined]
      80 | #define STACK_TOP               TASK_SIZE_LOW
         |         ^
   arch/um/include/asm/processor-generic.h:70:9: note: previous definition is here
      70 | #define STACK_TOP       (TASK_SIZE - 2 * PAGE_SIZE)
         |         ^
   In file included from fs/open.c:19:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
   In file included from arch/x86/include/asm/page_types.h:40:
>> arch/x86/include/asm/page_64_types.h:81:9: warning: 'STACK_TOP_MAX' macro redefined [-Wmacro-redefined]
      81 | #define STACK_TOP_MAX           TASK_SIZE_MAX
         |         ^
   arch/um/include/asm/processor-generic.h:71:9: note: previous definition is here
      71 | #define STACK_TOP_MAX   STACK_TOP
         |         ^
   22 warnings generated.
--
   In file included from fs/exec.c:33:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/exec.c:33:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/exec.c:33:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from fs/exec.c:33:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
>> arch/x86/include/asm/page_types.h:11:9: warning: 'PAGE_SIZE' macro redefined [-Wmacro-redefined]
      11 | #define PAGE_SIZE               (_AC(1,UL) << PAGE_SHIFT)
         |         ^
   arch/um/include/asm/page.h:14:9: note: previous definition is here
      14 | #define PAGE_SIZE       (_AC(1, UL) << PAGE_SHIFT)
         |         ^
   In file included from fs/exec.c:33:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
>> arch/x86/include/asm/page_types.h:30:9: warning: 'PAGE_OFFSET' macro redefined [-Wmacro-redefined]
      30 | #define PAGE_OFFSET             ((unsigned long)__PAGE_OFFSET)
         |         ^
   arch/um/include/asm/page.h:93:9: note: previous definition is here
      93 | #define PAGE_OFFSET (uml_physmem)
         |         ^
   In file included from fs/exec.c:33:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
>> arch/x86/include/asm/page_types.h:32:9: warning: 'VM_DATA_DEFAULT_FLAGS' macro redefined [-Wmacro-redefined]
      32 | #define VM_DATA_DEFAULT_FLAGS   VM_DATA_FLAGS_TSK_EXEC
         |         ^
   include/linux/mm.h:423:9: note: previous definition is here
     423 | #define VM_DATA_DEFAULT_FLAGS  VM_DATA_FLAGS_EXEC
         |         ^
   In file included from fs/exec.c:33:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
   In file included from arch/x86/include/asm/page_types.h:40:
>> arch/x86/include/asm/page_64_types.h:15:9: warning: 'THREAD_SIZE_ORDER' macro redefined [-Wmacro-redefined]
      15 | #define THREAD_SIZE_ORDER       (2 + KASAN_STACK_ORDER)
         |         ^
   arch/um/include/asm/thread_info.h:9:9: note: previous definition is here
       9 | #define THREAD_SIZE_ORDER CONFIG_KERNEL_STACK_ORDER
         |         ^
   In file included from fs/exec.c:33:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
   In file included from arch/x86/include/asm/page_types.h:40:
>> arch/x86/include/asm/page_64_types.h:16:9: warning: 'THREAD_SIZE' macro redefined [-Wmacro-redefined]
      16 | #define THREAD_SIZE  (PAGE_SIZE << THREAD_SIZE_ORDER)
         |         ^
   arch/um/include/asm/thread_info.h:10:9: note: previous definition is here
      10 | #define THREAD_SIZE ((1 << CONFIG_KERNEL_STACK_ORDER) * PAGE_SIZE)
         |         ^
   In file included from fs/exec.c:33:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
   In file included from arch/x86/include/asm/page_types.h:40:
>> arch/x86/include/asm/page_64_types.h:64:9: warning: 'TASK_SIZE_MAX' macro redefined [-Wmacro-redefined]
      64 | #define TASK_SIZE_MAX           task_size_max()
         |         ^
   include/asm-generic/access_ok.h:16:9: note: previous definition is here
      16 | #define TASK_SIZE_MAX                   TASK_SIZE
         |         ^
   In file included from fs/exec.c:33:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
   In file included from arch/x86/include/asm/page_types.h:40:
>> arch/x86/include/asm/page_64_types.h:75:9: warning: 'TASK_SIZE' macro redefined [-Wmacro-redefined]
      75 | #define TASK_SIZE               (test_thread_flag(TIF_ADDR32) ? \
         |         ^
   arch/um/include/asm/processor-generic.h:62:9: note: previous definition is here
      62 | #define TASK_SIZE (task_size)
         |         ^
   In file included from fs/exec.c:33:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
   In file included from arch/x86/include/asm/page_types.h:40:
>> arch/x86/include/asm/page_64_types.h:77:9: warning: 'TASK_SIZE_OF' macro redefined [-Wmacro-redefined]
      77 | #define TASK_SIZE_OF(child)     ((test_tsk_thread_flag(child, TIF_ADDR32)) ? \
         |         ^
   include/linux/sched.h:2164:9: note: previous definition is here
    2164 | #define TASK_SIZE_OF(tsk)       TASK_SIZE
         |         ^
   In file included from fs/exec.c:33:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
   In file included from arch/x86/include/asm/page_types.h:40:
>> arch/x86/include/asm/page_64_types.h:80:9: warning: 'STACK_TOP' macro redefined [-Wmacro-redefined]
      80 | #define STACK_TOP               TASK_SIZE_LOW
         |         ^
   arch/um/include/asm/processor-generic.h:70:9: note: previous definition is here
      70 | #define STACK_TOP       (TASK_SIZE - 2 * PAGE_SIZE)
         |         ^
   In file included from fs/exec.c:33:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
   In file included from include/linux/page_counter.h:9:
   In file included from arch/x86/include/asm/page_types.h:40:
>> arch/x86/include/asm/page_64_types.h:81:9: warning: 'STACK_TOP_MAX' macro redefined [-Wmacro-redefined]
      81 | #define STACK_TOP_MAX           TASK_SIZE_MAX
         |         ^
   arch/um/include/asm/processor-generic.h:71:9: note: previous definition is here
      71 | #define STACK_TOP_MAX   STACK_TOP
         |         ^
   In file included from fs/exec.c:74:
   In file included from arch/um/include/asm/tlb.h:9:
   include/asm-generic/tlb.h:375:16: error: use of undeclared identifier 'TIF_ADDR32'
     375 |                 tlb->start = TASK_SIZE;
         |                              ^
   arch/x86/include/asm/page_64_types.h:75:38: note: expanded from macro 'TASK_SIZE'
      75 | #define TASK_SIZE               (test_thread_flag(TIF_ADDR32) ? \
         |                                                   ^
   fs/exec.c:1481:22: error: use of undeclared identifier 'TIF_ADDR32'
    1481 |         me->mm->task_size = TASK_SIZE;
         |                             ^
   arch/x86/include/asm/page_64_types.h:75:38: note: expanded from macro 'TASK_SIZE'
      75 | #define TASK_SIZE               (test_thread_flag(TIF_ADDR32) ? \
         |                                                   ^
   22 warnings and 2 errors generated.
..


vim +/PAGE_SIZE +11 arch/x86/include/asm/page_types.h

51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08   8  
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08   9  /* PAGE_SHIFT determines the page size */
5394f1e9b687bc Arnd Bergmann       2024-02-26  10  #define PAGE_SHIFT		CONFIG_PAGE_SHIFT
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08 @11  #define PAGE_SIZE		(_AC(1,UL) << PAGE_SHIFT)
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  12  #define PAGE_MASK		(~(PAGE_SIZE-1))
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  13  
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  14  #define __VIRTUAL_MASK		((1UL << __VIRTUAL_MASK_SHIFT) - 1)
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  15  
82328227db8f0b Pasha Tatashin      2022-05-16  16  /* Cast P*D_MASK to a signed type so that it is sign-extended if
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  17     virtual addresses are 32-bits but physical addresses are larger
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  18     (ie, 32-bit PAE). */
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  19  #define PHYSICAL_PAGE_MASK	(((signed long)PAGE_MASK) & __PHYSICAL_MASK)
82328227db8f0b Pasha Tatashin      2022-05-16  20  #define PHYSICAL_PMD_PAGE_MASK	(((signed long)PMD_MASK) & __PHYSICAL_MASK)
82328227db8f0b Pasha Tatashin      2022-05-16  21  #define PHYSICAL_PUD_PAGE_MASK	(((signed long)PUD_MASK) & __PHYSICAL_MASK)
832102671855f7 Toshi Kani          2015-09-17  22  
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  23  #define HPAGE_SHIFT		PMD_SHIFT
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  24  #define HPAGE_SIZE		(_AC(1,UL) << HPAGE_SHIFT)
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  25  #define HPAGE_MASK		(~(HPAGE_SIZE - 1))
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  26  #define HUGETLB_PAGE_ORDER	(HPAGE_SHIFT - PAGE_SHIFT)
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  27  
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  28  #define HUGE_MAX_HSTATE 2
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  29  
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08 @30  #define PAGE_OFFSET		((unsigned long)__PAGE_OFFSET)
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  31  
c62da0c35d5851 Anshuman Khandual   2020-04-10 @32  #define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_TSK_EXEC
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  33  
a02150610776f6 Kees Cook           2013-07-08  34  #define __PHYSICAL_START	ALIGN(CONFIG_PHYSICAL_START, \
a02150610776f6 Kees Cook           2013-07-08  35  				      CONFIG_PHYSICAL_ALIGN)
a02150610776f6 Kees Cook           2013-07-08  36  
a02150610776f6 Kees Cook           2013-07-08  37  #define __START_KERNEL		(__START_KERNEL_map + __PHYSICAL_START)
a02150610776f6 Kees Cook           2013-07-08  38  
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  39  #ifdef CONFIG_X86_64
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  40  #include <asm/page_64_types.h>
5d72b4fba40ef4 Toshi Kani          2015-04-14 @41  #define IOREMAP_MAX_ORDER       (PUD_SHIFT)
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  42  #else
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  43  #include <asm/page_32_types.h>
5d72b4fba40ef4 Toshi Kani          2015-04-14  44  #define IOREMAP_MAX_ORDER       (PMD_SHIFT)
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  45  #endif	/* CONFIG_X86_64 */
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  46  

:::::: The code at line 11 was first introduced by commit
:::::: 51c78eb3f0eb033f9fb4f2316851df1d9b07b953 x86: create _types.h counterparts for page*.h

:::::: TO: Jeremy Fitzhardinge <jeremy@goop.org>
:::::: CC: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
