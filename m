Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468D31C9EC3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 19:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726428184; cv=none; b=rbb04YvDScRUK0gTql4DCwXApwICpCcTEN796SCHQb6tfem/FvRyrTc7kEyfL/raRLQyeNw7z7z5rjeEREu2HoaR9jvI8ClxxxmldvphhgMTYD4MkCLyuu0AYl/I0cYlExMApAiiMOCjIV+AjtLAZqqFgByUEq0563K1bNYgyd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726428184; c=relaxed/simple;
	bh=apYGgkanqqwyMd//HA4EZB3zifAcgR5/67XVH4ftqZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g/JQjMOV7bynfIKsaoCnWTII3eDY5rctcPFZKtRzriFllmX4bTiVpfAI+hrnUm5Xi/Z8QZF8tLrIfEbSpwi5CxvaCkWMgt2n6qtjPuNdRJgyeFTdvnxhP8qlYernf9OkTrdYHxM3l+YXdpqi3qf/SZzA5VTfyEizypqFrr8cYv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMeQbyRn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMeQbyRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726428182; x=1757964182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=apYGgkanqqwyMd//HA4EZB3zifAcgR5/67XVH4ftqZE=;
  b=TMeQbyRnnct9iHZSbd9TG2h6xYCi8mXFbEow7uBjrw+GktRrs3b20gHi
   j09rPC4/pKeQuIRg9PwGEypwMCkoNXbSiTL6SCCeK3dEF2xcJ9aSaYPOh
   iifbkBes7CaQbiOUWVCjlOENSMeERFrh8uVvZknOOIihbnl9nRLiW5l3q
   EkxhfWMbr10AU261VNXStxXc0k6yGvOdFqj2fLHlmoS8RI30F6nvytjw2
   MCnZTizB6QwkbZs7c6rkpZ5ANCf2H3eAz3LZxXOI1020jSIHCQFa3ZlZz
   QTpBt2fFS1sZ6C7+ArnjlaM4xkvKYYz39hMlUlk6gx8L0iCjYn6q3D5Zt
   w==;
X-CSE-ConnectionGUID: mnlVZrzhTNi8hAN+SRPM/g==
X-CSE-MsgGUID: 0JvEZEA5QryzmDN2igi8zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25415389"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="25415389"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 12:23:01 -0700
X-CSE-ConnectionGUID: hD9elVN0Q9W4oOqbsaAbOQ==
X-CSE-MsgGUID: h75puaxGROy+kfQgBpMDmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="73508813"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Sep 2024 12:23:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spupm-0008ya-0Y;
	Sun, 15 Sep 2024 19:22:58 +0000
Date: Mon, 16 Sep 2024 03:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2413/13950] mm/mem_reliable.c:345:2: error: call
 to undeclared function 'mem_reliable_ctrl_bit_disable'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202409160318.lnCckgr9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ma,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   84404f248a61323e09909849803ea4efce81742f
commit: 425771499c0742a996ab28df143d7a5123102686 [2413/13950] mm: mem_reliable: Introduce proc interface to disable memory reliable features
config: arm64-randconfig-003-20240916 (https://download.01.org/0day-ci/archive/20240916/202409160318.lnCckgr9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160318.lnCckgr9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160318.lnCckgr9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mem_reliable.c:5:
   In file included from include/linux/mm.h:2181:
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
>> mm/mem_reliable.c:345:2: error: call to undeclared function 'mem_reliable_ctrl_bit_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     345 |         mem_reliable_ctrl_bit_disable(idx);
         |         ^
   mm/mem_reliable.c:345:2: note: did you mean 'mem_reliable_ctrl_bit_disabled'?
   mm/mem_reliable.c:320:13: note: 'mem_reliable_ctrl_bit_disabled' declared here
     320 | static void mem_reliable_ctrl_bit_disabled(int idx) {}
         |             ^
   mm/mem_reliable.c:376:45: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     376 |                 num += global_node_page_state(NR_LRU_BASE + LRU_ACTIVE_FILE);
         |                                               ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
   mm/mem_reliable.c:377:45: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     377 |                 num += global_node_page_state(NR_LRU_BASE + LRU_INACTIVE_FILE);
         |                                               ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   6 warnings and 1 error generated.


vim +/mem_reliable_ctrl_bit_disable +345 mm/mem_reliable.c

   322	
   323	static void mem_reliable_feature_disable(int idx)
   324	{
   325		char *str = NULL;
   326	
   327		switch (idx) {
   328		case MEM_RELIABLE_FALLBACK:
   329			reliable_allow_fallback = false;
   330			str = "fallback";
   331			break;
   332		case MEM_RELIABLE_SHMEM:
   333			shmem_reliable = false;
   334			str = "shmem";
   335			break;
   336		case MEM_RELIABLE_PAGECACHE:
   337			pagecache_reliable = false;
   338			str = "pagecache";
   339			break;
   340		default:
   341			pr_err("unknown index: %d", idx);
   342			return;
   343		}
   344	
 > 345		mem_reliable_ctrl_bit_disable(idx);
   346		pr_info("%s is disabled\n", str);
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
