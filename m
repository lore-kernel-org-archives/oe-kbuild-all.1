Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1743ABE4F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 01:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737508139; cv=none; b=KP5UTkVJ5qRgcYgqW7H4XoRDgL6aD7x7cQYyzPfuhM33BiLZzzxsQrwU2jWRSQChN5m8Kz3E841wz/ld8PL7kPv/048MOf0zxju+GRguujteQTehuzceZ8YlB9kC8zyINz5zqtfiyfv7ezo/z9DHrVZTjT2i0HvhfRCAOeCcaxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737508139; c=relaxed/simple;
	bh=+Nqkmm1fNQRNGMLy+G/82+gsf4u/NUmkPQsds99cpEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=josIc44+en2zXJZF98dYWjWHyi7UkjKbOyuv53jM7O/0oc1ixlc5Xy0Ebpni/VfdpAmYtZZq2dZN/421E9gUCzpYy1PFgVoBMNj+1QinSIhZf9jGRFgkRFi9O09ILKAz5p0/RiUct37w7qVzzwlQZWWpUz9vpXlnx9aIeH/fVog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwSarmDE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwSarmDE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737508137; x=1769044137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Nqkmm1fNQRNGMLy+G/82+gsf4u/NUmkPQsds99cpEo=;
  b=DwSarmDELLJpQj1VKUDMZp3md4PF4qbEbX68Pmc6Rdh/vVVchSznpo0y
   WvVhCEdYWXyrBtsEMPUH6FYLwSuSC3lM0M3IcvyEy840OXPZZeHZrEX6n
   Rz9ZO1YFkODg1l7zRUtVp7Hphnfu3AIkKFWzKgA74S7RF/x8r3ObCBspR
   0Gt7MgHy0gCmVoqyJjgkqe42oxtUmGd08dV2/ukl1FeytORi3ewiLB1Kk
   u/itUok0HcAzxoJ+/GnraqUC+bhGHyFLV+2y/Lv+fp1caDFAUpsPYVeNp
   UYccaXHdm3aZNJk2nIGTszFt4GkBn3QLyzBJJMU32ZvgZVgl/A6zzFWOJ
   g==;
X-CSE-ConnectionGUID: kW9So6WpTSS1bel8oEn9Xg==
X-CSE-MsgGUID: OBelV6BiT2azPEmKhwdoEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49364821"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49364821"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 17:08:56 -0800
X-CSE-ConnectionGUID: EKwVTDb9TcSzmhO4H9pZeA==
X-CSE-MsgGUID: V4cgdo0jSSyBkPfxFcrVQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="106896074"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Jan 2025 17:08:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taPEj-000ZDq-1T;
	Wed, 22 Jan 2025 01:08:53 +0000
Date: Wed, 22 Jan 2025 09:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiajingze <xiajingze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1834/1834]
 drivers/net/can/spi/mcp251xfd/mcp251xfd-core.o: warning: objtool:
 mcp251xfd_chip_softreset+0x2fd: unreachable instruction
Message-ID: <202501220937.KjMFVpWd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   75c81bcddd82381fbd4cef477a5b56eb2fe56697
commit: 241ad43fe7e9c24d5ba4cdd1ec22e731cdd22d14 [1834/1834] Compiler: Add clang's PGO support for kernel.
config: x86_64-randconfig-101-20250122 (https://download.01.org/0day-ci/archive/20250122/202501220937.KjMFVpWd-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501220937.KjMFVpWd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501220937.KjMFVpWd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:24:
   In file included from drivers/net/can/spi/mcp251xfd/mcp251xfd.h:14:
   In file included from include/linux/can/core.h:18:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> drivers/net/can/spi/mcp251xfd/mcp251xfd-core.o: warning: objtool: mcp251xfd_chip_softreset+0x2fd: unreachable instruction
>> drivers/net/can/spi/mcp251xfd/mcp251xfd-core.o: warning: objtool: mcp251xfd_chip_wait_for_osc_ready+0x32a: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
