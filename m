Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457F212BF31
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 20:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709670364; cv=none; b=CGPJ+OIvANKr1X1pV3pYs8o05UySCu5G5iewj2HBONHOARXuFbhgdXD6uZal/RrxnpTVjlQmy8DKClsRkppsZxsEDSrF7rFdczJNuolCkrV9EpF232g4q0Ait4ef4vbI5kwi+I9VCd/P+VS3Xx9MngxzmP1WysmOyMIZV0b4srA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709670364; c=relaxed/simple;
	bh=xGdf1RX98NMoYccHraNc+22tsSC/TsFar+/KknTmFuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gid4f3ZeAADUxe3wTaBV9//aLwZcUkNGp+lOArgCfxTZJOxga8JiHnhYHnB5UUJ7PICRt/reXlnxUOL1Qvesbh2rtfCZZzWzuIE6KsWCcHYVPXwTP8VUwDqTCmUe1n3XQ4SzhBROxlLmpeW6xXlpaj4SjLnf/l28PDF3+kFgkiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONrhTHyK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONrhTHyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709670361; x=1741206361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xGdf1RX98NMoYccHraNc+22tsSC/TsFar+/KknTmFuk=;
  b=ONrhTHyKg7Cm2ikOjerYjZHTCri9y/cyvG0KN9puwsoGvcHuop0mCwa9
   +TQnFO6YX0Wp2BxkPDACX+GpTBR/CcUpap2NihK5pZl+n4+XDVEUgvnHQ
   WS5cx1QfU0SQvA99L4PKtcww0B/nmFXX9UcGPUyAoehP4ihkX33egTVvz
   bwqGvb4G8O3fufjNHxMcat64PzPO6oRndLYxHaiYc4NPnDCjAEhA/fevy
   BoKzpUmmclv+dkM3+SSZmtTyj+AYr+JNDRDd5JOdoEEujC+nZj3sYBEoN
   2WDA0AXkFrVF2gZ5dVM5v8HqyKru1SzasAdQlHH2LB5K9vXKJSq9q27Kj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4424303"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="4424303"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 12:26:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="9571609"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Mar 2024 12:25:59 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhbMK-0003dP-1p;
	Tue, 05 Mar 2024 20:25:56 +0000
Date: Wed, 6 Mar 2024 04:25:37 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-latest 20/43] net/core/page_pool.c:1129:10: error:
 incompatible pointer to integer conversion returning 'void *' from a
 function with result type 'netmem_ref' (aka 'unsigned long')
Message-ID: <202403060411.0y4luk7N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-latest
head:   5af93e6de5f9e457b5ee2106ddaa3dd019b6a6f2
commit: ebc235d4b0ca4c83c2ebdfee849c63ca0c8d0642 [20/43] memory-provider: dmabuf devmem memory provider
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240306/202403060411.0y4luk7N-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060411.0y4luk7N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060411.0y4luk7N-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/page_pool.c:1129:10: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'netmem_ref' (aka 'unsigned long') [-Wint-conversion]
    1129 |                 return NULL;
         |                        ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   net/core/page_pool.c:1146:9: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'netmem_ref' (aka 'unsigned long') [-Wint-conversion]
    1146 |         return NULL;
         |                ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   2 errors generated.


vim +1129 net/core/page_pool.c

  1118	
  1119	static netmem_ref mp_dmabuf_devmem_alloc_pages(struct page_pool *pool,
  1120						       gfp_t gfp)
  1121	{
  1122		struct netdev_dmabuf_binding *binding = pool->mp_priv;
  1123		netmem_ref netmem;
  1124		struct net_iov *niov;
  1125		dma_addr_t dma_addr;
  1126	
  1127		niov = netdev_alloc_dmabuf(binding);
  1128		if (!niov)
> 1129			return NULL;
  1130	
  1131		dma_addr = net_iov_dma_addr(niov);
  1132	
  1133		netmem = net_iov_to_netmem(niov);
  1134	
  1135		page_pool_set_pp_info(pool, netmem);
  1136	
  1137		if (page_pool_set_dma_addr_netmem(netmem, dma_addr))
  1138			goto err_free;
  1139	
  1140		pool->pages_state_hold_cnt++;
  1141		trace_page_pool_state_hold(pool, netmem, pool->pages_state_hold_cnt);
  1142		return netmem;
  1143	
  1144	err_free:
  1145		netdev_free_dmabuf(niov);
  1146		return NULL;
  1147	}
  1148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
