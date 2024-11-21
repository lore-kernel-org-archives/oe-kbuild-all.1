Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B8A19A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 01:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732153275; cv=none; b=RuaA87a4+5GAk+BPjZb0hp1SEiqmgMYlYSdJVbn8jTJa2BQSXIY0WPHnWphbVNQqQulvzvWKCYNNJFHaEtSf4jood9A5OvXmE3vZOAs0/HhHCr2rkCASn6Ir965NGqUxTdhMxPby0WnzjZ/0C9nHXj6Cdltr/KKDuVW8qre3SEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732153275; c=relaxed/simple;
	bh=f48C7j7z8xDK2xNoIJ8OcOAKAwyr17qrPgvmmAkifvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gu1/pVBUEbSPj89l8T7hTSbU+HXTv01T2PlPrk6fCC50iV+OIsy0CS0q1qOwgSzd5SK+ApIiU0wobeb2Cxok5vaPzr6hJtOkl7JYllBLa3V8sXjQjJ0d7LmOecruDmzAoX+SxgGMZBHmh/lwzqbFbFVYgKzFTkJiCIR8UCl2vFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWtiFzrN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWtiFzrN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732153273; x=1763689273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f48C7j7z8xDK2xNoIJ8OcOAKAwyr17qrPgvmmAkifvQ=;
  b=cWtiFzrNkoR29Usb4rLq68Wtry3RlCP+3liC8FMGYTT1LHVrsLtcKgUo
   2R9TQFfN4pd+1SBtSa66Qt4r+mE91YCYTPbWfRJhw6YjH+Abom4+0jrOi
   mAaj+sRV/xORRWOj4FOtbxdrkMebAyXnezBHSKvKUznkgPCf8eeNSAJnK
   n7crvsRlbm8+ESo1dzbAsfS9yyxxwDq6S43eOC21R2g/+4s12buIgC0HL
   3ezOF4zkqr8D3s/tQ9lQohNZxmw0MhY2T/bT3qhHQ4ntZcRPNb/Ng2AMJ
   NLwNxu4SuBhpWWPaM6tPbacMMAFg/k2rM+2Ij5fLZYzj0uO/+MJxBj6YJ
   g==;
X-CSE-ConnectionGUID: wLyb2TAhRoO1yX0fV8LyYg==
X-CSE-MsgGUID: kRAi4p7URg2NrCBPjrhFYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="36024170"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="36024170"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 17:41:10 -0800
X-CSE-ConnectionGUID: 7lxgLjg9Q3qf8dZNdvqQvA==
X-CSE-MsgGUID: 7tmCXe+eSGOWN+7LsfPAcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="95160708"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Nov 2024 17:41:09 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDwBu-0001MB-10;
	Thu, 21 Nov 2024 01:41:06 +0000
Date: Thu, 21 Nov 2024 09:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jyri Sarha <jyri.sarha@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:probes_ipc4_get_config 6/6]
 sound/soc/sof/sof-client-probes-ipc3.c:164:32: warning: omitting the
 parameter name in a function definition is a C23 extension
Message-ID: <202411210958.GUndNaE1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux probes_ipc4_get_config
head:   b3d76a472b0c079cfaaabf5a227a3eef8663148d
commit: b3d76a472b0c079cfaaabf5a227a3eef8663148d [6/6] ASoC: SOF: sof-client-probes: Add available points_info(), IPC4 only
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241121/202411210958.GUndNaE1-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210958.GUndNaE1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210958.GUndNaE1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/sof/sof-client-probes-ipc3.c:12:
   In file included from include/sound/soc.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/sof/sof-client-probes-ipc3.c:12:
   In file included from include/sound/soc.h:37:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
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
   In file included from sound/soc/sof/sof-client-probes-ipc3.c:12:
   In file included from include/sound/soc.h:37:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from sound/soc/sof/sof-client-probes-ipc3.c:12:
   In file included from include/sound/soc.h:37:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
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
>> sound/soc/sof/sof-client-probes-ipc3.c:164:32: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     164 |                                    enum sof_probe_info_type)
         |                                                            ^
   17 warnings generated.


vim +164 sound/soc/sof/sof-client-probes-ipc3.c

   150	
   151	/**
   152	 * ipc3_probes_points_info - retrieve list of active probe points
   153	 * @cdev:		SOF client device
   154	 * @desc:	Returned list of active probes
   155	 * @num_desc:	Returned count of active probes
   156	 *
   157	 * Host sends PROBE_POINT_INFO request to obtain list of active probe
   158	 * points, valid for disconnection when given probe is no longer
   159	 * required.
   160	 */
   161	static int ipc3_probes_points_info(struct sof_client_dev *cdev,
   162					   struct sof_probe_point_desc **desc,
   163					   size_t *num_desc,
 > 164					   enum sof_probe_info_type)
   165	{
   166		return ipc3_probes_info(cdev, SOF_IPC_PROBE_POINT_INFO,
   167					(void **)desc, num_desc,
   168					PROBES_INFO_ACTIVE_PROBES);
   169	}
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
