Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6373628D839
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421064; cv=none; b=p3WT+V67jbbej462EqqFeSywpNVre4JVdKgbAQ8ppzdAB4b1Nm8dGp/kI8P0Z6sclRQpCRFJxODgKPLqhBTTl8bi8cpfF4skD5Tqq1cpG3aKYqNEVRczsK2azGsP7HHmiYbwWKSfzKs8kJjCQymuEBU8GzDn8lcKRPlfpjA1Qf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421064; c=relaxed/simple;
	bh=0qpQK2hCvzxvE4v/ll1qFgNXgDF1zv6tK1DYcPiYxgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0r3fS62jJvXG/C63dHuJqLjXojhCikH4I6mRZEFbicPlrSJ3v9KEXjNBIiRtami37JfjdfGzL5WF6B+/89XurvsoODUSYbraBkRcWLmZVFGwb0eUTcsqMeCcRxvW2YdMVqDIpz+CMs4MHZGd16LieeQ3l0Waer/pxPXCYw6oXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTHCHawL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTHCHawL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745421063; x=1776957063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0qpQK2hCvzxvE4v/ll1qFgNXgDF1zv6tK1DYcPiYxgA=;
  b=bTHCHawLXnacuWmDTfj5QysksyZPRtnDvI2yvk6enmkZOgc3SC8oMT41
   3Pi1Y3OMRFvF5DMQbE+U4pbls98JwCHezcWciuZOOq9/v4NFD41MVhxNW
   5v70QJhWTXu+9MzKmqTtpYd1kdhz8kbSTzbXb5lXnzXHiHONkWpAFud59
   3R9A/Er8h53KEb7kcFavrljQEohH6QjF5qk0v90qa/1Hxdldki50aOl+I
   Wv9clJJb/LhcR6li257RIs0kHLdhnQxK0/MZAQ76NKlrStWZe6ub12gu8
   /VGbYjECNvWUXFFgUmV2L6aoSVsbWEQL6ub5AG1pUChULEdw2lRXCfNvp
   g==;
X-CSE-ConnectionGUID: r6KUmdZzSxeXRRalDar6Tw==
X-CSE-MsgGUID: fHjsY0EUQMmWi6W/2Pyvcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46724901"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46724901"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 08:11:02 -0700
X-CSE-ConnectionGUID: 96Nv8DRjQA2STSPDaAGTqA==
X-CSE-MsgGUID: gHwFP+/BTn63YddbYlun6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137509260"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Apr 2025 08:11:01 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7bkY-0002bT-0f;
	Wed, 23 Apr 2025 15:10:58 +0000
Date: Wed, 23 Apr 2025 23:10:48 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH 02/14] kmemdump: introduce kmemdump
Message-ID: <202504232203.1QaVbTYy-lkp@intel.com>
References: <20250422113156.575971-3-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422113156.575971-3-eugen.hristev@linaro.org>

Hi Eugen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on tip/sched/core lwn/docs-next linus/master v6.15-rc3 next-20250423]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugen-Hristev/Documentation-add-kmemdump/20250422-193638
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20250422113156.575971-3-eugen.hristev%40linaro.org
patch subject: [RFC][PATCH 02/14] kmemdump: introduce kmemdump
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250423/202504232203.1QaVbTYy-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504232203.1QaVbTYy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504232203.1QaVbTYy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/debug/kmemdump.c: In function 'kmemdump_register':
>> drivers/debug/kmemdump.c:28:35: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
      28 |         struct kmemdump_zone *z = kzalloc(sizeof(*z), GFP_KERNEL);
         |                                   ^~~~~~~
>> drivers/debug/kmemdump.c:28:35: error: initialization of 'struct kmemdump_zone *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/debug/kmemdump.c: In function 'kmemdump_unregister':
>> drivers/debug/kmemdump.c:88:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
      88 |         kfree(z);
         |         ^~~~~


vim +/kzalloc +28 drivers/debug/kmemdump.c

    15	
    16	/**
    17	 * kmemdump_register() - Register region into kmemdump.
    18	 * @handle: string of maximum 8 chars that identifies this region
    19	 * @zone: pointer to the zone of memory
    20	 * @size: region size
    21	 *
    22	 * Return: On success, it returns an allocated unique id that can be used
    23	 *	at a later point to identify the region. On failure, it returns
    24	 *	negative error value.
    25	 */
    26	int kmemdump_register(char *handle, void *zone, size_t size)
    27	{
  > 28		struct kmemdump_zone *z = kzalloc(sizeof(*z), GFP_KERNEL);
    29		int id;
    30	
    31		if (!z)
    32			return -ENOMEM;
    33	
    34		mutex_lock(&kmemdump_lock);
    35	
    36		id = idr_alloc_cyclic(&kmemdump_idr, z, 0, MAX_ZONES, GFP_KERNEL);
    37		if (id < 0) {
    38			mutex_unlock(&kmemdump_lock);
    39			return id;
    40		}
    41	
    42		if (!backend)
    43			pr_debug("kmemdump backend not available yet, waiting...\n");
    44	
    45		z->zone = zone;
    46		z->size = size;
    47		z->id = id;
    48	
    49		if (handle)
    50			strscpy(z->handle, handle, 8);
    51	
    52		if (backend) {
    53			int ret;
    54	
    55			ret = backend->register_region(id, handle, zone, size);
    56			if (ret) {
    57				mutex_unlock(&kmemdump_lock);
    58				return ret;
    59			}
    60			z->registered = true;
    61		}
    62	
    63		mutex_unlock(&kmemdump_lock);
    64		return id;
    65	}
    66	EXPORT_SYMBOL_GPL(kmemdump_register);
    67	
    68	/**
    69	 * kmemdump_unregister() - Unregister region from kmemdump.
    70	 * @id: unique id that was returned when this region was successfully
    71	 *	registered initially.
    72	 *
    73	 * Return: None
    74	 */
    75	void kmemdump_unregister(int id)
    76	{
    77		struct kmemdump_zone *z;
    78	
    79		mutex_lock(&kmemdump_lock);
    80	
    81		z = idr_find(&kmemdump_idr, id);
    82		if (!z)
    83			return;
    84		if (z->registered && backend)
    85			backend->unregister_region(z->id);
    86	
    87		idr_remove(&kmemdump_idr, id);
  > 88		kfree(z);
    89	
    90		mutex_unlock(&kmemdump_lock);
    91	}
    92	EXPORT_SYMBOL_GPL(kmemdump_unregister);
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
