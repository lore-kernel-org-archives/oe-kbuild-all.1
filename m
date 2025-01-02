Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5065192B81
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 23:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735859734; cv=none; b=LL6+60w6DoSn08+jYIQDTqiBJSEsNsI2TdtyVxfoiUaAF+Q5ZVHcoGMMBoUTD/V5/HxUXQbj2VXJziZ22eC40tesqZjkGiBzLjT345ERfdtoZUBRyptypWc9KEA6UHLbcIFQH6m4m4zC/CRRXmYH8JHJkfDY8Gn/5NPQEpAQoEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735859734; c=relaxed/simple;
	bh=hsYTgr8Nh9w62pZEYAEzQTNSuQEQ54UxRkqVJxnicz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PXtQcgAm2Gboapnnv6FK/YsCRD7FS+ozkJA2+JyHf2r2sBUmyirsiYOcCXe2cGUU6EeBQNGQPBNmOYwIa5D0oZdyRvFygDm9Vbqa9Yu8Ou63ECU44IwuLGOhOZLEEix7Nc74qnfEoH9uOsQijI/V/Hgdyf6nh+M1jKlDQptcsmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6QWibzu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6QWibzu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735859733; x=1767395733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hsYTgr8Nh9w62pZEYAEzQTNSuQEQ54UxRkqVJxnicz0=;
  b=e6QWibzuIA9lWSb4ynfuYHWJ9hYGzEXilTISXVIlqXMjwNCCvCVJ+PL7
   AUEdKNHbxn3mzdRP8inZ6OvK8IeFKthqjejdJvHUHZIKIrZOGG9i31hLP
   qLj6VyqKmAqmRsUnNXBElwT0NEVOqlYrYFITQK3hprIIyneEOuP0spman
   DAFmOeAihwHs5E9gKd/2FKeix3lxgO5Y/EN4/PMdkedgltS21tHXkI7m1
   cSnOIcptsicIYRi5eq4t+3iXFRCwJMELAmBVd1kBpTlVwDwqJ/tt/TdYa
   Qy839jkOsKthLgrD/9i332kjOvbR9/cxAlt5Rg/CScln7302V0o00q+mR
   A==;
X-CSE-ConnectionGUID: ejIJSWVKRla7Ddt27RsdqA==
X-CSE-MsgGUID: lemshYFcQYWn5dKGfauplQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="40033021"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="40033021"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 15:15:32 -0800
X-CSE-ConnectionGUID: 4OjKn6X2TtKZ3zdbh1UNlQ==
X-CSE-MsgGUID: HTzwqC0fRsiDib+TkUsGOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101708346"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Jan 2025 15:15:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTUPY-0008x7-2R;
	Thu, 02 Jan 2025 23:15:28 +0000
Date: Fri, 3 Jan 2025 07:15:13 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v10-wip 24/26] include/net/page_pool/types.h:162:63:
 warning: 'struct sk_buff' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202501030743.PL4d8Zzu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v10-wip
head:   1e1214d152c4b21b5bc3e9b37e26cd60ed14632b
commit: 26d3d6fd0fa6f3e197318e94775a218dbbc91047 [24/26] [NOT-FOR-UPSTREAM] veth: add support for io_uring zc rx
config: i386-buildonly-randconfig-006-20250103 (https://download.01.org/0day-ci/archive/20250103/202501030743.PL4d8Zzu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030743.PL4d8Zzu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030743.PL4d8Zzu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/io_uring/net.h:5,
                    from io_uring/uring_cmd.c:6:
>> include/net/page_pool/types.h:162:63: warning: 'struct sk_buff' declared inside parameter list will not be visible outside of this definition or declaration
     162 |         int (*nl_report)(const struct page_pool *pool, struct sk_buff *rsp);
         |                                                               ^~~~~~~


vim +162 include/net/page_pool/types.h

c11536b904730c Pavel Begunkov 2024-12-11  156  
1245218831784d Jakub Kicinski 2024-10-01  157  struct memory_provider_ops {
1245218831784d Jakub Kicinski 2024-10-01  158  	netmem_ref (*alloc_netmems)(struct page_pool *pool, gfp_t gfp);
1245218831784d Jakub Kicinski 2024-10-01  159  	bool (*release_netmem)(struct page_pool *pool, netmem_ref netmem);
1245218831784d Jakub Kicinski 2024-10-01  160  	int (*init)(struct page_pool *pool);
1245218831784d Jakub Kicinski 2024-10-01  161  	void (*destroy)(struct page_pool *pool);
674f3cef08654a Pavel Begunkov 2024-12-11 @162  	int (*nl_report)(const struct page_pool *pool, struct sk_buff *rsp);
c11536b904730c Pavel Begunkov 2024-12-11  163  	void (*uninstall)(void *mp_priv, struct netdev_rx_queue *rxq);
1245218831784d Jakub Kicinski 2024-10-01  164  };
1245218831784d Jakub Kicinski 2024-10-01  165  

:::::: The code at line 162 was first introduced by commit
:::::: 674f3cef08654ae4da4c3a6bf1dfd0673bead172 net: page_pool: add mp op for netlink reporting

:::::: TO: Pavel Begunkov <asml.silence@gmail.com>
:::::: CC: Pavel Begunkov <asml.silence@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
