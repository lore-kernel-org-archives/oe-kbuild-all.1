Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383791C5F3F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 02:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736476166; cv=none; b=jbJE1pohlO4MmS0/LRKNWS+7i3+pnoTlwVSDKm+tC+WldoQqDwdk4xwsZ3BF6K6pSxAjMxAp5hzDS3oASlac9DnWDl7wmroeDWjIFFFtBuqOuQqBbYL6B6moCXylpu/kC4a9ttSxcYRyAQdos0vxlcUnpih8nkGCloauICaGJSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736476166; c=relaxed/simple;
	bh=53O0v/6qejdpBVF+3FIeafCJY4tJv/lAdq4JfToWPw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RyJF5fGcF+tqS/+PNqHPvKEMfR5aKFhm1X2icyW/9s5rHzAZeB13MK0Bd99DYwI8/Fpl3YHGbcDzPZYz6Jn2hFDs7fsmfO/PnFWkksiEZVa7p56QnNzJ/jmCbbsNbiABCtXcrb8VzgI9+nap61jhJfH2zaNQkcKtUPLzt+VsB7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVHHKyhX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVHHKyhX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736476164; x=1768012164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=53O0v/6qejdpBVF+3FIeafCJY4tJv/lAdq4JfToWPw4=;
  b=iVHHKyhXa/bq7d1C2Vz1WlFePTNCz02KLC5WeWE1T9lG0spLknh26bU8
   H+QiELUEuFylNRgrrjVKSsP9//QbfiZo54nMhvRYi4GAS3z9gFBaXRUyQ
   SEzz7wyA0HmO7OFIUnbcVgVmi1sBUNJpD9xBjerTypycCjfSNnMX9QRec
   EX6LHeOd02BNFpBHjBKFF4FScLPH5s369TUmD8fKWSPKQqpZ9E2Vqiu0X
   /Si/Fo1MEpTBBEhOBZskN2D00K7vybp+MFo7100kBFclgU0MOnbR8orWO
   anapP/fJUrzuPIQemFcnzeaF69RCyWuoLk6oUnD74zJpW0T0rkIu1jnzU
   w==;
X-CSE-ConnectionGUID: swiUQPXFS/WtipD1QgXt5Q==
X-CSE-MsgGUID: x5+WkT4iRAuxgrg3UJHvNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36048683"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="36048683"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 18:29:24 -0800
X-CSE-ConnectionGUID: 75nkWsI4S6GSS86GMaQbDg==
X-CSE-MsgGUID: sV965HSQSt6WBRS13i6CXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="103405340"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jan 2025 18:29:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW4lx-000IQJ-2G;
	Fri, 10 Jan 2025 02:29:17 +0000
Date: Fri, 10 Jan 2025 10:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ahmed Zaki <ahmed.zaki@intel.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, intel-wired-lan@lists.osuosl.org,
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
	horms@kernel.org, pabeni@redhat.com, davem@davemloft.net,
	michael.chan@broadcom.com, tariqt@nvidia.com,
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
	jdamato@fastly.com, shayd@nvidia.com, akpm@linux-foundation.org,
	shayagr@amazon.com, kalesh-anakkur.purayil@broadcom.com,
	Ahmed Zaki <ahmed.zaki@intel.com>
Subject: Re: [Intel-wired-lan] [PATCH net-next v4 3/6] net: napi: add CPU
 affinity to napi_config
Message-ID: <202501101042.2q2geY9c-lkp@intel.com>
References: <20250109233107.17519-4-ahmed.zaki@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109233107.17519-4-ahmed.zaki@intel.com>

Hi Ahmed,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-Zaki/net-move-ARFS-rmap-management-to-core/20250110-073339
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250109233107.17519-4-ahmed.zaki%40intel.com
patch subject: [Intel-wired-lan] [PATCH net-next v4 3/6] net: napi: add CPU affinity to napi_config
config: s390-randconfig-001-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101042.2q2geY9c-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101042.2q2geY9c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101042.2q2geY9c-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/dev.c: In function 'netif_napi_affinity_release':
>> net/core/dev.c:6795:42: error: 'struct net_device' has no member named 'rx_cpu_rmap'
    6795 |         struct cpu_rmap *rmap = napi->dev->rx_cpu_rmap;
         |                                          ^~
>> net/core/dev.c:6797:23: error: 'struct napi_struct' has no member named 'napi_rmap_idx'
    6797 |         rmap->obj[napi->napi_rmap_idx] = NULL;
         |                       ^~


vim +6795 net/core/dev.c

064d6072cac4f49 Ahmed Zaki 2025-01-09  6789  
064d6072cac4f49 Ahmed Zaki 2025-01-09  6790  static void
064d6072cac4f49 Ahmed Zaki 2025-01-09  6791  netif_napi_affinity_release(struct kref *ref)
064d6072cac4f49 Ahmed Zaki 2025-01-09  6792  {
064d6072cac4f49 Ahmed Zaki 2025-01-09  6793  	struct napi_struct *napi =
064d6072cac4f49 Ahmed Zaki 2025-01-09  6794  		container_of(ref, struct napi_struct, notify.kref);
064d6072cac4f49 Ahmed Zaki 2025-01-09 @6795  	struct cpu_rmap *rmap = napi->dev->rx_cpu_rmap;
064d6072cac4f49 Ahmed Zaki 2025-01-09  6796  
064d6072cac4f49 Ahmed Zaki 2025-01-09 @6797  	rmap->obj[napi->napi_rmap_idx] = NULL;
064d6072cac4f49 Ahmed Zaki 2025-01-09  6798  	cpu_rmap_put(rmap);
064d6072cac4f49 Ahmed Zaki 2025-01-09  6799  }
064d6072cac4f49 Ahmed Zaki 2025-01-09  6800  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
