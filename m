Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040BE55774
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 11:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712922651; cv=none; b=kxmwnWPabK4o0zUB6rv069En7JEYCPJaeLalr/C8vmYeUfZ3m6PEbprC+4SIlr2dvOzv1YQpbyIsUnPuk72iYdt2yaViBPykKOFSuxGnafRrrHBpj5qwm1uQc2LRzDbUVQ3946YOCOM0IaZbURZef73QQreUbR1qEdLw1Ecn6II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712922651; c=relaxed/simple;
	bh=b/V6Wy+avvW3EE/TlSCiY8mldRj75Z2fIbUz8PJEoY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LfcTkxIveEB4D+QqeONDdqJG02xqx+yT6qAZ7dYWxJC2n8mI9op88hfL01s0DRaVftCe3cDaMSCJBCMnzntWhIUKle/Ns/acWlsv6obvNBzN7b4CqyWfmMiSRV+we7n1A97RoNHStwYm/9VWbTK2DZh6LrRiW5y2z4yEun4AOKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T5r+h1sB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5r+h1sB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712922646; x=1744458646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b/V6Wy+avvW3EE/TlSCiY8mldRj75Z2fIbUz8PJEoY0=;
  b=T5r+h1sBxTzyfsvfXzUrA95wxfMchhftVVqY49reG5X5mUDahrTYpb6/
   wNWYebWVXY9QH8NmAGZ7p/Myz4wShloVivtZhNf1FryGo3ps18PSpL0Eb
   /C/Yku5/zDhPy8Yjl2MQySwK4vMtbXyzG8WOL9y95Qbw4YG+0M8pW2nc4
   uqla1caKh0QOU227abnoj9zrbxX+ANLK30fVbXWm6F+E/Y0OZ5YhO6E8u
   Lw/+ivye0OlRvETaqKTZ/c9pj+Cexrt/SXHmyc4/ltuJJYzvoNEwABcV6
   J3sDbIwfNbRz4AbfXzIh1E63WbweDW+7TT7AxD6UFwZXimrS3dGWyM5Kl
   A==;
X-CSE-ConnectionGUID: uI7OM0igQb6v8PpAKArhHA==
X-CSE-MsgGUID: 8hymgKgaTyq+Dp/LqwCXJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8551311"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8551311"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 04:50:45 -0700
X-CSE-ConnectionGUID: iG+6yfl6Sm+oTW1bHVMekQ==
X-CSE-MsgGUID: XvNx5WQAS2Cb0QKzCKMFmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="21253835"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Apr 2024 04:50:44 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvFQX-0009j7-2S;
	Fri, 12 Apr 2024 11:50:41 +0000
Date: Fri, 12 Apr 2024 19:50:40 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 22/46] lib/spdm/req-sysfs.c:176:55: warning:
 omitting the parameter name in a function definition is a C23 extension
Message-ID: <202404121959.MPL2hsYV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   04f0af4bcc5b52f17682de7c27eb469f6f794197
commit: f94b1e338bc3a4fc1bdc262899734d0699b9a747 [22/46] PCI/CMA: Expose in sysfs a log of received signatures
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240412/202404121959.MPL2hsYV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404121959.MPL2hsYV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404121959.MPL2hsYV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/spdm/req-sysfs.c:13:
   In file included from include/linux/pci.h:37:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/spdm/req-sysfs.c:13:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from lib/spdm/req-sysfs.c:13:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from lib/spdm/req-sysfs.c:13:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
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
>> lib/spdm/req-sysfs.c:176:55: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     176 | static ssize_t spdm_read_combined_prefix(struct file *, struct kobject *,
         |                                                       ^
   lib/spdm/req-sysfs.c:176:73: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     176 | static ssize_t spdm_read_combined_prefix(struct file *, struct kobject *,
         |                                                                         ^
   19 warnings generated.


vim +176 lib/spdm/req-sysfs.c

   175	
 > 176	static ssize_t spdm_read_combined_prefix(struct file *, struct kobject *,
   177						 struct bin_attribute *attr,
   178						 char *buf, loff_t off, size_t count)
   179	{
   180		struct spdm_log_entry *log = attr->private;
   181	
   182		/*
   183		 * SPDM 1.0 and 1.1 do not add a combined prefix to the hash
   184		 * before computing the signature, so return an empty file.
   185		 */
   186		if (log->version <= 0x11)
   187			return 0;
   188	
   189		void *tmp __free(kfree) = kmalloc(SPDM_COMBINED_PREFIX_SZ, GFP_KERNEL);
   190		if (!tmp)
   191			return -ENOMEM;
   192	
   193		spdm_create_combined_prefix(log->version, log->spdm_context.var, tmp);
   194		memcpy(buf, tmp + off, count);
   195		return count;
   196	}
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
