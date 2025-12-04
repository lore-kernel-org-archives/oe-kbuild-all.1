Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11F11531C1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 03:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764820012; cv=none; b=GALeOQd5JT5i0DVyp30PRnvm3VVkyjbLANKtil9cdnVm1sZ9UiD8hCUcfM1QbhWysm9UgJZ0wLrv1p0BoFT7xS6gTsJHeHMBc35Ne8jYsJeou6NsAjlEIBBRv2khEqd9LKA6mdKp/pw5uWjeh46C1X/UPd5dWAW7oSrfos2AH4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764820012; c=relaxed/simple;
	bh=Z46c9xfTiSoqUanyjuvWdzx1pQpiDRbQGwz5724AKaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VLfm5C9TO2Ah9zv0lwzlzvBUaB/GsT6KTMz0pRByD7R5/wUZ2hHek0Djk+l4M5wZbG+vjp537STOwhrU2LvaX9ZdF2iZPjbxLTDU+6i5somEq+wVT21JTdDJBV+jaeK/shRSDkWKCe7p8DG34nAv6RIa/CEC0Z21ZdaeC9sP/js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1shznhZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1shznhZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764820011; x=1796356011;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Z46c9xfTiSoqUanyjuvWdzx1pQpiDRbQGwz5724AKaA=;
  b=O1shznhZEJLlXbbnLQGavExHn/HFZgGoZH7wRkBLEm55Lk5GR3TwTwVB
   neWgTeoBsTiRM0Dk3s/oPeZ2rm0HcCK8pO0nUWAAmsFpFyQwWgZX83txg
   RRdfe5AuSmgd8NUC6BslLirHCJrDhTOfbwcqE/TRVOjXnhMz/LD1+Vo7F
   XujpqZg3wcoIiw3fTyVEcIGfXmXXZdBdFQ7K7WFtimaIQV6Bz9GvhGkAb
   qABL2inQzLf+8BWp2HMmJy2eNNv504JQLYpbaHHbpySh3r0+0r9Op8PKA
   TNitjZGnlN5lbbuyl+lWVEv3rWmQBcQFA0Dkn7BVhKrA81X/PwmqWPb76
   Q==;
X-CSE-ConnectionGUID: Oga82UkJTAm2cLZW/0R6Tg==
X-CSE-MsgGUID: dQ7vBW/9Qk6dGpdaBfmbSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78183358"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="78183358"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 19:46:46 -0800
X-CSE-ConnectionGUID: 3UZKMLRjTHGVuUtpiD7H9w==
X-CSE-MsgGUID: b5IcaGFUTn61dQWbcJBMCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="195665203"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Dec 2025 19:46:45 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR0Il-00000000DPp-2QsH;
	Thu, 04 Dec 2025 03:46:43 +0000
Date: Thu, 4 Dec 2025 11:46:14 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.18/zen-sauce 2/29] include/asm-generic/io.h:1209:55: error:
 performing pointer arithmetic on a null pointer has undefined behavior
Message-ID: <202512041135.sRSsITpW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/zen-kernel/zen-kernel 6.18/zen-sauce
head:   669f0096c96eda5618f4e42766c665f3ed341e92
commit: 64164f0372696265baef02378f2ce21a82a6c8ab [2/29] ZEN: Add VHBA driver
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20251204/202512041135.sRSsITpW-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512041135.sRSsITpW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512041135.sRSsITpW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/vhba/vhba.c:27:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
>> include/asm-generic/io.h:1209:55: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   drivers/scsi/vhba/vhba.c:192:23: error: variable 'vhost' set but not used [-Werror,-Wunused-but-set-variable]
     192 |     struct vhba_host *vhost;
         |                       ^
   2 errors generated.
--
   In file included from vhba.c:27:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
>> include/asm-generic/io.h:1209:55: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   vhba.c:192:23: error: variable 'vhost' set but not used [-Werror,-Wunused-but-set-variable]
     192 |     struct vhba_host *vhost;
         |                       ^
   2 errors generated.


vim +1209 include/asm-generic/io.h

7c566bb5e4d5fb Hector Martin    2021-02-11  1201  
ce816fa88cca08 Uwe Kleine-König 2014-04-07  1202  #ifdef CONFIG_HAS_IOPORT_MAP
3f7e212df82ca0 Arnd Bergmann    2009-05-13  1203  #ifndef CONFIG_GENERIC_IOMAP
9216efafc52ff9 Thierry Reding   2014-10-01  1204  #ifndef ioport_map
9216efafc52ff9 Thierry Reding   2014-10-01  1205  #define ioport_map ioport_map
3f7e212df82ca0 Arnd Bergmann    2009-05-13  1206  static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
3f7e212df82ca0 Arnd Bergmann    2009-05-13  1207  {
500dd232449e7c Andrew Murray    2018-09-13  1208  	port &= IO_SPACE_LIMIT;
500dd232449e7c Andrew Murray    2018-09-13 @1209  	return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
3f7e212df82ca0 Arnd Bergmann    2009-05-13  1210  }
316e8d79a0959c Linus Torvalds   2021-09-19  1211  #define ARCH_HAS_GENERIC_IOPORT_MAP
9216efafc52ff9 Thierry Reding   2014-10-01  1212  #endif
3f7e212df82ca0 Arnd Bergmann    2009-05-13  1213  

:::::: The code at line 1209 was first introduced by commit
:::::: 500dd232449e7c07500e713dc6970aa713f8e4f1 asm-generic: io: Fix ioport_map() for !CONFIG_GENERIC_IOMAP && CONFIG_INDIRECT_PIO

:::::: TO: Andrew Murray <andrew.murray@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
