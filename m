Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF975B664
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Mar 2024 05:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711085599; cv=none; b=XU/YymLt6WTfg+FN/aH9WGvwUQqBtyeIcL5vAIXBQyj2Ih3GXArYxUIgTG7rrgYbVj5FNQ7/X0G34iHGibIO9YAV7a4nPO6ADE9wJrry4eQP5F1L23ZLDqq9WSUGLJTytiry8FE5KELRO5XG07JwgY8+4hr3/6kcXltpcmYESRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711085599; c=relaxed/simple;
	bh=0d6pz3O/HT+SLEXXETCD037cHs8vxKA+h+NlGW/yhLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A2a+kC+HKcbG4GeWFxqN2KLFqO8vY9dxoc7ioKSe1WZTrTQlTrQYdxMqrxWfCTU3eI4cfzQPR55+0Fh/W9ba0h3d3Zmy/t31tNA37me41gym9mpvdS8YdPbZKxpvcyDWarG2jEKIdg8aQm8vyXQyrZLE4Mgn0lPWpOtPXlhmOk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azxxytPJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azxxytPJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711085594; x=1742621594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0d6pz3O/HT+SLEXXETCD037cHs8vxKA+h+NlGW/yhLs=;
  b=azxxytPJJjQY28xB+OgP8ptoMaTSAI7uCnzFBBun6jUz3sv0AUSWr90f
   g7zboBZLkckYfpEZ9d8fu3K/i/8P0BVm0V12JGSXimo02XZVR7K+yaa0Y
   3thz3sQs1yIWwORzZ2VeTc35Im/16+krby8I/MBujnSamgPrT/e7rFTTC
   nV0wueXAYDgrpljt5XRqd3VgCQhAaJMP7sZKADQ/UdtCpGG9tTeggEclU
   gU9+DEQloRQc2ABzeMmq31wf4nwmKjb1y0XyYg+r0SzQ0sKIhIWEMPjr+
   rPetHJ/sjh334q28e9q15Y1nqeyR+CqFw99ziGkCJvvkA0RSG/o6TjvoZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9921099"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="9921099"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 22:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="15183636"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Mar 2024 22:33:14 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnXWh-000K4B-0Y;
	Fri, 22 Mar 2024 05:33:11 +0000
Date: Fri, 22 Mar 2024 13:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@redhat.com>
Subject: powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data526'
 from `drivers/mtd/nand/raw/diskonchip.o' being placed in section
 `.bss..Lubsan_data526'
Message-ID: <202403221309.j81X2735-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8e938e39866920ddc266898e6ae1fffc5c8f51aa
commit: ce3467af6bded1c0018ca67ea1599f45fbb8100b mm: constify testing page/folio flags
date:   2 weeks ago
config: powerpc-randconfig-r024-20221201 (https://download.01.org/0day-ci/archive/20240322/202403221309.j81X2735-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240322/202403221309.j81X2735-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403221309.j81X2735-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data526' from `drivers/mtd/nand/raw/diskonchip.o' being placed in section `.bss..Lubsan_data526'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data526' from `drivers/mtd/nand/raw/diskonchip.o' being placed in section `.bss..Lubsan_data526'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data526' from `drivers/mtd/nand/raw/diskonchip.o' being placed in section `.bss..Lubsan_data526'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ADB_CUDA
   Depends on [n]: MACINTOSH_DRIVERS [=n] && (ADB [=n] || PPC_PMAC [=y]) && !PPC_PMAC64 [=n]
   Selected by [y]:
   - PPC_PMAC [=y] && PPC_BOOK3S [=y] && CPU_BIG_ENDIAN [=y] && POWER_RESET [=y] && PPC32 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
