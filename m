Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF0386657
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 19:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716665340; cv=none; b=SkTJVOEzHhF6IuBuuvg9tcRKbtZqCwhAA9atMl1alfvUexkNIywXXTY/yNga9TXgWhGqqMCwUzN2ZlzMyodjCOphVFB5TLQVU/7SmsV7OIGSE1cvXmzt2l0syxasqty5Hgh8lIOy8cY4uDVK+IcQtL18FF4aeeN9fzbQzZb6q6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716665340; c=relaxed/simple;
	bh=uFLGVEs7pMszMX9F8YVkpWkNtEZuHxzzCSSm7Y36mWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NU70qK1nbhAaHv6iQdpjuWlnonu/uljgMsWwZ6eDeVBybnkYgFf/ucc0VTgsbPEnkHDrsthCl5nH3VlMqG7j1Ax9a0f0dj3evRm7itEHH8FJ3mnYXWzYq2uK298ZZT5RnVm6mw0NRAJaV+IvFbnc45fWUiLqtGePcZIK2oq5DI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxG3KSkL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxG3KSkL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716665339; x=1748201339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uFLGVEs7pMszMX9F8YVkpWkNtEZuHxzzCSSm7Y36mWk=;
  b=lxG3KSkL5o3Noy6jEZam2+8mJzkTqv6BCz3XywNqEVdVMsQprjGPKRHK
   8YnAPWhiBebihThdusWx7AT3x7fHM6Tryjz//PeRpZ3RCVBXjghDRpIIP
   TqW/2ItxCTe453G3NtoVnLu7p2YGWaMV7xpnvzI5n8Lhedjp9zdiEqnio
   7D4BSYjas1Bi8/tO1szoKMy+3HZ9qqk9+WztOtMSFQYh5rwZuWmxRubhu
   sMk0MQyKoNNFTi6Mz4lss8bHPS49WyZ/n7n22WjYKf95CRd7h+ZXc+HtX
   4asi7ZEhSOfqJ2TlHl7aBFEIffDoxV9klpQuYloDYpM1s840Kpaf801HD
   A==;
X-CSE-ConnectionGUID: l+ABAwcISCaaXXf/s/dcvQ==
X-CSE-MsgGUID: 0NBVILOTSnepV2EQfBYxJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="30537365"
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="30537365"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 12:28:56 -0700
X-CSE-ConnectionGUID: fnZIodKVRViYsw2fCj3axA==
X-CSE-MsgGUID: Y+BpkBw6RzGpmqGwvWxQVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="34942024"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 25 May 2024 12:28:54 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAx4V-0007MB-1q;
	Sat, 25 May 2024 19:28:51 +0000
Date: Sun, 26 May 2024 03:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask-types 1/3] arch/s390/kernel/smp.c:749:3: error:
 expected expression
Message-ID: <202405260325.2LXHgqUW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask-types
head:   04d10bebce942cfc9871eca228852a351b276a06
commit: d5eb3dc501e35703d699513beb178aa90ce49a13 [1/3] cpumask: introduce assign_cpu() macro
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240526/202405260325.2LXHgqUW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405260325.2LXHgqUW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405260325.2LXHgqUW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/smp.c:22:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/s390/kernel/smp.c:22:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from arch/s390/kernel/smp.c:22:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from arch/s390/kernel/smp.c:22:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
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
>> arch/s390/kernel/smp.c:749:3: error: expected expression
     749 |                 else
         |                 ^
   13 warnings and 1 error generated.


vim +749 arch/s390/kernel/smp.c

8b646bd759086f Martin Schwidefsky 2012-03-11  723  
72a81ad9d6d62d Heiko Carstens     2019-11-17  724  static int smp_add_core(struct sclp_core_entry *core, cpumask_t *avail,
72a81ad9d6d62d Heiko Carstens     2019-11-17  725  			bool configured, bool early)
08d07968277cd8 Heiko Carstens     2008-01-26  726  {
8b646bd759086f Martin Schwidefsky 2012-03-11  727  	struct pcpu *pcpu;
72a81ad9d6d62d Heiko Carstens     2019-11-17  728  	int cpu, nr, i;
10ad34bc76dfbc Martin Schwidefsky 2015-01-14  729  	u16 address;
08d07968277cd8 Heiko Carstens     2008-01-26  730  
8b646bd759086f Martin Schwidefsky 2012-03-11  731  	nr = 0;
72a81ad9d6d62d Heiko Carstens     2019-11-17  732  	if (sclp.has_core_type && core->type != boot_core_type)
72a81ad9d6d62d Heiko Carstens     2019-11-17  733  		return nr;
72a81ad9d6d62d Heiko Carstens     2019-11-17  734  	cpu = cpumask_first(avail);
72a81ad9d6d62d Heiko Carstens     2019-11-17  735  	address = core->core_id << smp_cpu_mt_shift;
72a81ad9d6d62d Heiko Carstens     2019-11-17  736  	for (i = 0; (i <= smp_cpu_mtid) && (cpu < nr_cpu_ids); i++) {
72a81ad9d6d62d Heiko Carstens     2019-11-17  737  		if (pcpu_find_address(cpu_present_mask, address + i))
8b646bd759086f Martin Schwidefsky 2012-03-11  738  			continue;
8b646bd759086f Martin Schwidefsky 2012-03-11  739  		pcpu = pcpu_devices + cpu;
72a81ad9d6d62d Heiko Carstens     2019-11-17  740  		pcpu->address = address + i;
72a81ad9d6d62d Heiko Carstens     2019-11-17  741  		if (configured)
72a81ad9d6d62d Heiko Carstens     2019-11-17  742  			pcpu->state = CPU_STATE_CONFIGURED;
72a81ad9d6d62d Heiko Carstens     2019-11-17  743  		else
72a81ad9d6d62d Heiko Carstens     2019-11-17  744  			pcpu->state = CPU_STATE_STANDBY;
50ab9a9a60fc83 Heiko Carstens     2012-09-04  745  		smp_cpu_set_polarization(cpu, POLARIZATION_UNKNOWN);
8b646bd759086f Martin Schwidefsky 2012-03-11  746  		set_cpu_present(cpu, true);
72a81ad9d6d62d Heiko Carstens     2019-11-17  747  		if (!early && smp_add_present_cpu(cpu) != 0)
8b646bd759086f Martin Schwidefsky 2012-03-11  748  			set_cpu_present(cpu, false);
08d07968277cd8 Heiko Carstens     2008-01-26 @749  		else
8b646bd759086f Martin Schwidefsky 2012-03-11  750  			nr++;
72a81ad9d6d62d Heiko Carstens     2019-11-17  751  		cpumask_clear_cpu(cpu, avail);
72a81ad9d6d62d Heiko Carstens     2019-11-17  752  		cpu = cpumask_next(cpu, avail);
72a81ad9d6d62d Heiko Carstens     2019-11-17  753  	}
72a81ad9d6d62d Heiko Carstens     2019-11-17  754  	return nr;
72a81ad9d6d62d Heiko Carstens     2019-11-17  755  }
72a81ad9d6d62d Heiko Carstens     2019-11-17  756  

:::::: The code at line 749 was first introduced by commit
:::::: 08d07968277cd898c88bf12b7720d89c02c4f139 [S390] Standby cpu activation/deactivation.

:::::: TO: Heiko Carstens <heiko.carstens@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
