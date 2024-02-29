Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C2B7D3FF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709211166; cv=none; b=l5Qlgcl+BccLbDh01N+WR5kqvvVYs3XmWWCkkdlW9fsely/yINt7I2H/04y9LoNb4RnUj45YtMJlNa1rLr2fn9IlyZMu6Rl98TFqIZY/Ds5l8qI7+kOY3550mOOVEXfDWwvsCpd1bTTi36VzYyHWWMv25KzMw12VCNdv9NJh9y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709211166; c=relaxed/simple;
	bh=TtHJqBAb77cX9li6eWiBfR65kgr0d0S+c25PM1fzaMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m3AROrMuffGqdFf0xmPeXHWFl0TQO/RUllEHKWcA2uv1dHASGcyXMpOOFugVyK8t3Eg+jB/pZxmy9XYlf0ElH35O7Jb4sMHW6vlAuWbay3lddBvTdQz7Wh775jtoqX3piAfw0izTn8fb+UfvWET9EhStJTEvP7BeG7NhtwJAYx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUjrphoh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUjrphoh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709211164; x=1740747164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TtHJqBAb77cX9li6eWiBfR65kgr0d0S+c25PM1fzaMQ=;
  b=bUjrphohNDbCyjVYLEWMQpexaWYXWVK/b2msHzUNarYea3bnLWPG1Ccf
   pImIXanjWWBiTU/dnmIYd60Zo25IFgL2f6V0LgT4iEPoskqWPIj+KnQzm
   1+z+kivj+oB4cTW0KTOkL+vm4ah1iIuMxy5Yt5QnK+BYcP6vELb+evgwl
   TMfSaGHIJG9nTljNckVXygMeKkFJsqojQLgMXQHNc7gQgLqFcXhKHvSQ6
   Ukk99FZi/z5ghQg6TGgtprbMxxbkcYBUFZ8P6CIv7oKhxlPRpDGEo6aS0
   +tinNzYFYtR+tj14nyXCmuzrraxR77U1JgTKXsYtWZhwCk9AsjUNEIFGY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3843518"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3843518"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 04:52:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12466079"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 29 Feb 2024 04:52:44 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rffta-000Cwd-39;
	Thu, 29 Feb 2024 12:52:29 +0000
Date: Thu, 29 Feb 2024 20:51:58 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-v4 900/922] net/core/page_pool.c:1129:10: error:
 incompatible pointer to integer conversion returning 'void *' from a
 function with result type 'netmem_ref' (aka 'unsigned long')
Message-ID: <202402292053.nlU6W7MK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-v4
head:   c13f97bb45f13d99fc22c4452f9926dd4a53d6ce
commit: efbfe3177536b21b6ad8117b9f90bd0f46634d98 [900/922] memory-provider: dmabuf devmem memory provider
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240229/202402292053.nlU6W7MK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402292053.nlU6W7MK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402292053.nlU6W7MK-lkp@intel.com/

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
