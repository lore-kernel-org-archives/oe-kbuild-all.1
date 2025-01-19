Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A559F1946A2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 10:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737281308; cv=none; b=RgmdtSsTk8YHi46IBZV/EDkLAtubohZkJIsrlj5khm9W2NBUykBlBc2MV+GvOKwRKcWTiOgYTxPisHpcyNOpl3k8tbk2ZG6QsYV+eFgdlowuGWRZhu6j9zUkNp1EOEiSpQZX4WOJf9gAXM59RPpeP1j2Q/6dXdmbQTjpJgWwQrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737281308; c=relaxed/simple;
	bh=DqupDNn1V4Bws2Y/lJ5DTURd5wAhwBuvXh/qARyL5Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eNRmuH52WsS7u6DuU2YtRwqWzIHjrwcbmbRjPehi3T3kmYB+Q+xKcmYPtqk8B1tgZfsKEhQCX9h3zOnlt8jMgKhvaiZfecNu+RB+bcVFj2VI9t3L2/MQlobjxhDTdH8vdrCAp86nKWJa9gcL55JuA/edkcSOEVkrOSFA9OePOO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zf73yDWy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zf73yDWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737281307; x=1768817307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DqupDNn1V4Bws2Y/lJ5DTURd5wAhwBuvXh/qARyL5Ww=;
  b=Zf73yDWyXpAba4gA3ym8F8f42NZnKBLrQWOy2rgl4Orybku8+ctVAN7m
   /AjUv21rTS+zd7i7eEJG1OlvWcT0fudaw0l2CzwqAykvLds3q0ue9c73z
   2YaOLkST1FAmrhH+Yh9xj5HxmEQg4Rco4Ar8hoekhj2IUZoRuuwzzk9/+
   DoNo1RaMQMDeAl8ZVCm8qsOajGplbPzO8/RMr8QlXGJsGleCEBf9vEz99
   O1GUPEnmlDiuxT3UOuuUDRyusRlE5Rr3uFarRUu7VwGUNhtKL9uU7FtUR
   dQlmYcLbn8zfZNqfnrfx+GvCTsuum3K4hTDtCPPlotcjSgG6Hb1E6KAp3
   A==;
X-CSE-ConnectionGUID: WtM2B6zuRiaNlnFTY/Xvww==
X-CSE-MsgGUID: mBVmqaYsQf6pGfDvHr3pvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="36880494"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="36880494"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 02:08:23 -0800
X-CSE-ConnectionGUID: eOswhTNuSp6nmLhKaZszcQ==
X-CSE-MsgGUID: LKJSIy0USlmDmzQLSgArNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110830368"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jan 2025 02:08:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZSE8-000VLm-17;
	Sun, 19 Jan 2025 10:08:20 +0000
Date: Sun, 19 Jan 2025 18:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1327/1327] mm/vmscan.c:3257:21: error:
 implicit declaration of function 'kernel_swap_enabled'
Message-ID: <202501191820.CX3a1XfY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liubo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   52349611d09c6a9a2b558b3ce1cb1dca0d47dbe8
commit: 44983705e56ab22fda801d66e2a6bd0d1be7ca0b [1327/1327] etmem: add original kernel swap enabled options
config: x86_64-buildonly-randconfig-005-20241216 (https://download.01.org/0day-ci/archive/20250119/202501191820.CX3a1XfY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501191820.CX3a1XfY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501191820.CX3a1XfY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vmscan.c:23:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/vmscan.c:33:
   include/linux/mm_inline.h:32:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      32 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:34:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      34 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:350:64: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     350 |                 lru_size = node_page_state(lruvec_pgdat(lruvec), NR_LRU_BASE + lru);
         |                                                                  ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:240:60: note: expanded from macro 'node_page_state'
     240 | #define node_page_state(node, item) global_node_page_state(item)
         |                                                            ^~~~
   mm/vmscan.c:363:29: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     363 |                                        NR_ZONE_LRU_BASE + lru);
         |                                        ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1776:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1776 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:127:34: note: expanded from macro '__count_zid_vm_events'
     127 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2734:17: warning: variable 'node_lru_pages' set but not used [-Wunused-but-set-variable]
    2734 |                 unsigned long node_lru_pages = 0;
         |                               ^
   mm/vmscan.c:3066:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    3066 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:127:34: note: expanded from macro '__count_zid_vm_events'
     127 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
>> mm/vmscan.c:3257:21: error: implicit declaration of function 'kernel_swap_enabled' [-Werror,-Wimplicit-function-declaration]
    3257 |         if (sc != NULL && !kernel_swap_enabled())
         |                            ^
   mm/vmscan.c:3257:21: note: did you mean 'kernfs_ns_enabled'?
   include/linux/kernfs.h:309:20: note: 'kernfs_ns_enabled' declared here
     309 | static inline bool kernfs_ns_enabled(struct kernfs_node *kn)
         |                    ^
   8 warnings and 1 error generated.


vim +/kernel_swap_enabled +3257 mm/vmscan.c

  3250	
  3251	/*
  3252	 * Check if original kernel swap is enabled
  3253	 * turn off kernel swap,but leave page cache reclaim on
  3254	 */
  3255	static inline void kernel_swap_check(struct scan_control *sc)
  3256	{
> 3257		if (sc != NULL && !kernel_swap_enabled())
  3258			sc->may_swap = 0;
  3259	}
  3260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
