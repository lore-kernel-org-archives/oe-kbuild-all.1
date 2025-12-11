Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E4129A30E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 02:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765421853; cv=none; b=j7FhwEMHvNtROvxGjpDv6IUTrHYzBF+Uo2lUS5NJG8epwZbyxd6Fpi6nD4Yl3HI13YakWtPZkDKs3dQgcVbXxzz4/IuqZhoPeZ1rlQV67waFcY7zMfVITGq2lVTfpfu6fDgsW1nDwARFKq9CYlEVoGWqQkZFXIKGqxcW9wXipxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765421853; c=relaxed/simple;
	bh=2w/TrpUFAMbHVTCV9AudCO7E62kyPHgnXSv8FpTGr94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WaML45RmFFcxro81DIs5J65OFYxETrICSuun4VdpI9ks83PJwbi5qUWlehkvWdSIWxT5VfsRUOoChr25pjq3z/iQgMBoCc3jHgnrtInIYPFA07iKJ/HSvVG20TwMlEJkjrP7Bxd63PRIWT2XwykUaZygAwX8kbdxTr6IRlOM2vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WkBwbQ7j; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WkBwbQ7j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765421851; x=1796957851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2w/TrpUFAMbHVTCV9AudCO7E62kyPHgnXSv8FpTGr94=;
  b=WkBwbQ7jgjLMjAsMwLBxaVXEm9ahGPJSxOVhqfHsREB2V1x725cg1erE
   wRJ3VKBD2v7apd47/UkDA76n3RVoHT2vadKFOafsiYG9ZGXlFuRwXHkWX
   rus7R3vbRbo471QvDdxWNC6EM+GSDaybuHCwspa4UccU/nnGY5529pNUl
   gZxbXUWNYIyS5/ai37EVUF0zvLKRuCLFdDT8f8zH5vLU7EJMaLXc+em/w
   I7Cj0JaegbqfI8H8zqHpCyiLOOrethCcEfQBuNmNtDIxqxrL/u/bSQdM2
   FWZ8/yUk1g5SvkfrDIaPhN75bLcfiWcona9bmm5jC7VXjW4fWtoCRbSGE
   A==;
X-CSE-ConnectionGUID: 8smD/sJkQ6qQ1CCDeXx2lw==
X-CSE-MsgGUID: JY2cizPhTnmtt+rd9uJ95A==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="54947190"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="54947190"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 18:57:30 -0800
X-CSE-ConnectionGUID: +pmdu+WDSGeerFROhCOyJQ==
X-CSE-MsgGUID: 1ZgapRBTTiewK0d7ZqeEYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196447649"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Dec 2025 18:57:29 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTWru-0000000044i-3F5F;
	Thu, 11 Dec 2025 02:57:26 +0000
Date: Thu, 11 Dec 2025 10:56:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] kernel/dma/contiguous.c:209:13:
 warning: no previous prototype for function 'is_zhaoxin_kh40000'
Message-ID: <202512111016.FVDarhlL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   423fccda72fc2b78107cc119a1755d968c2c36de
commit: 8eaba08b2d72718a40cafe3402ab4f26b0dc62eb [3534/3534] x86/cpu/zhaoxin: Encapsulate access to global variables within functions
config: x86_64-randconfig-015-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111016.FVDarhlL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111016.FVDarhlL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111016.FVDarhlL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/dma/contiguous.c:48:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2235:
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
>> kernel/dma/contiguous.c:209:13: warning: no previous prototype for function 'is_zhaoxin_kh40000' [-Wmissing-prototypes]
     209 | bool __weak is_zhaoxin_kh40000(void)
         |             ^
   kernel/dma/contiguous.c:209:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     209 | bool __weak is_zhaoxin_kh40000(void)
         | ^
         | static 
   kernel/dma/contiguous.c:73:26: warning: unused variable 'size_bytes' [-Wunused-const-variable]
      73 | static const phys_addr_t size_bytes __initconst =
         |                          ^~~~~~~~~~
   7 warnings generated.


vim +/is_zhaoxin_kh40000 +209 kernel/dma/contiguous.c

   208	
 > 209	bool __weak is_zhaoxin_kh40000(void)
   210	{
   211		return false;
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
