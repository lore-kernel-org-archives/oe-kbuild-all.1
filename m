Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FE31B85DB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 11:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769933; cv=none; b=J+amf1kb914jbTnhjMufYMTJq2GLD861fh/e0S/kR6nlSlDWjhKigW4vs/UhQX6D3Z7QFa7AXOprnzgRLrTf02Jr/RnzgHKqoCEgHeFnG+ylLmPvkyQYEekKmuZDF61A+G8m0MDI0yBcxaetVXt+PEmzguklqkwfxWTAV9f/6VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769933; c=relaxed/simple;
	bh=XkVnsVICr5GMjb1l55oUPB9jxpNQsgQgPsXFVglunDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kiM+ksFeu+T67uecrIFPDthogiHmTFjhhkDA/UioUorbpucPQFf7plJzhuTvwJqz3bIoiITJMdgZPp86wyJ04OgW1pNYvIs3RolKoaBd9LTjCerOZVKrcnZa3sXzpBmUrpAbIN9vOa6I24iWHRlxIHVrM3FYVUQflJfs6S7N7y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qy3AeNzi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qy3AeNzi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729769931; x=1761305931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XkVnsVICr5GMjb1l55oUPB9jxpNQsgQgPsXFVglunDs=;
  b=Qy3AeNziuzt4ykqQz6KQB4/CHbaTFVo+jeqKNxmwggKrF37Qx7VaVV7F
   J7Q1YG3cAvjZFNYuFUnufZQxFmvEu+W6RQnMmipRs/PYvzK+7k8ahYQDO
   C9zYTo7qsVNQOlYXmJv7emOfaWPcI3T5z4i59cZbrnPJIv8W8gsyJqi4N
   xGIEOD2angL3LuPug+11zWc77bt9NTyji9x5MAgsOeC2GdD5xQeYI6xC7
   OVtnoWyLednADaZchIBMKlPjj0U6DpcEzwzoynHJ02S4T341IjtVfBTan
   FDn85JTi500DRt9mkG3l0l9KE94vYCLa6QCHamG3xPA8xILwGlaxgWgms
   Q==;
X-CSE-ConnectionGUID: 3SqO6T5zQKyOxy/B+lK5IA==
X-CSE-MsgGUID: brJXmzJ9SRmfpxEDO+fsjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="28852858"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="28852858"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 04:38:50 -0700
X-CSE-ConnectionGUID: WNmnMiwuQDqL+u9pE0XKZg==
X-CSE-MsgGUID: YZNeLB6PT9yFeLgr8Jg1FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80656804"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Oct 2024 04:38:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3wAx-000WLQ-1q;
	Thu, 24 Oct 2024 11:38:47 +0000
Date: Thu, 24 Oct 2024 19:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "Carrie.Cai" <carrie.cai@montage-tech.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 24524/30000]
 drivers/crypto/montage/tsse/tsse_dev.h:85:6: warning: variable 'cpu' set but
 not used
Message-ID: <202410241950.tFucKzUb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   52e62ae625fcfe934330b24239cf61af5b5ce33f
commit: d55c499d1e3a11eef5557afc31af5ef6baa44b8e [24524/30000] add support for Mont-TSSE Driver
config: x86_64-randconfig-r064-20241024 (https://download.01.org/0day-ci/archive/20241024/202410241950.tFucKzUb-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410241950.tFucKzUb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241950.tFucKzUb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/montage/tsse/tsse_dev_mgr.c:13:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1581:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/crypto/montage/tsse/tsse_dev_mgr.c:15:
>> drivers/crypto/montage/tsse/tsse_dev.h:85:6: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
      85 |         int cpu, node;
         |             ^
   2 warnings generated.
--
   In file included from drivers/crypto/montage/tsse/tsse_vuart.c:25:
   In file included from drivers/crypto/montage/tsse/tsse_dev.h:13:
   In file included from include/linux/pci.h:1499:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1581:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/crypto/montage/tsse/tsse_vuart.c:25:
>> drivers/crypto/montage/tsse/tsse_dev.h:85:6: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
      85 |         int cpu, node;
         |             ^
   drivers/crypto/montage/tsse/tsse_vuart.c:77:13: warning: unused function 'vuart_wait_for_xmitr' [-Wunused-function]
      77 | static void vuart_wait_for_xmitr(struct uart_port *port)
         |             ^~~~~~~~~~~~~~~~~~~~
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/cpu +85 drivers/crypto/montage/tsse/tsse_dev.h

    82	
    83	static inline int tsse_get_cur_node(void)
    84	{
  > 85		int cpu, node;
    86	
    87		cpu = get_cpu();
    88		node = topology_physical_package_id(cpu);
    89		put_cpu();
    90	
    91		return node;
    92	}
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
