Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A47F1E489
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 14:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745418649; cv=none; b=EdnbG/GyXypiWjq6wPAspwLqpAQzJvwLpQ9tolSmIU8IcpreSGZXSNl3qnhPs+eyPTRoXXyUkyh33Q3j2hq1dkZxuuknVvJzTSU2q3uFC8WArAdLzE9Eup5PBzaykkh/GSUT79xUb4zoot2o9OiGfuOjNi3pyC4UxHg4tK4+1vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745418649; c=relaxed/simple;
	bh=ycZ14+LKWdk/d134AO+cJzEX1FxFtpxwVK7vdUIKCvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdRYTqV6H7K4PX/xDsUksvShYm029RfuGEznF412oNmA3nsMGGWD6w6tlF/gALFtf8tetMUgbCl93i7cf43iBk9DzwJsYToh2eti5xOAdX/5dOqyGVqIsrmR5gZvs+uQHz0KOBONTvJnRJK8/CWCG8KDsUElTquNvCxW4fv7Fpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhUik1fq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhUik1fq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745418647; x=1776954647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ycZ14+LKWdk/d134AO+cJzEX1FxFtpxwVK7vdUIKCvE=;
  b=FhUik1fqk6SzbP+OT7UXy/hOjsvO0CmyRa7Kpo/oiuwHgx+Jh+lDh9yT
   JwESBKnGjlO3SpwTDzCmaTPLmC8XpvE4AK2UgdFebltAWfqgirMQe3PRN
   je9HjTmJA5aVWKH6uJYG8C5tVMZmcInkgzQR/XsR3EGXwsOlJuyC6nC2Q
   l21D3WsoEZzRKdviCgIDJlQa6Dx274Z4OSWikafR2f6AJjzWkBr3SOoSC
   Fs4piSuplBqS7iS4JzT2p1/daKqBUHcNem8voPuvyWoz5NQYIVB1sBBcl
   QKd/jBxqBSEdw5xBPmLowfN11wEqPnqB2a+extGImaI8cmWPNPn69YuSQ
   A==;
X-CSE-ConnectionGUID: vGgqN14bR7CBjwKd6jwpCA==
X-CSE-MsgGUID: CcU6B+7MR/6AfeffxHnDCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="50816130"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="50816130"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 07:30:46 -0700
X-CSE-ConnectionGUID: 4MTuNcKBRUSXGOA09Q+idA==
X-CSE-MsgGUID: K1/C9GrqQaqKOM3+NDtsDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132079733"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Apr 2025 07:30:47 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7b7c-00028h-0m;
	Wed, 23 Apr 2025 14:30:44 +0000
Date: Wed, 23 Apr 2025 22:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH 02/14] kmemdump: introduce kmemdump
Message-ID: <202504232249.XUk48Mfh-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on tip/sched/core lwn/docs-next linus/master v6.15-rc3 next-20250423]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugen-Hristev/Documentation-add-kmemdump/20250422-193638
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20250422113156.575971-3-eugen.hristev%40linaro.org
patch subject: [RFC][PATCH 02/14] kmemdump: introduce kmemdump
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250423/202504232249.XUk48Mfh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504232249.XUk48Mfh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504232249.XUk48Mfh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/debug/kmemdump.c: In function 'kmemdump_register':
   drivers/debug/kmemdump.c:28:35: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
      28 |         struct kmemdump_zone *z = kzalloc(sizeof(*z), GFP_KERNEL);
         |                                   ^~~~~~~
>> drivers/debug/kmemdump.c:28:35: warning: initialization of 'struct kmemdump_zone *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/debug/kmemdump.c: In function 'kmemdump_unregister':
   drivers/debug/kmemdump.c:88:9: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
      88 |         kfree(z);
         |         ^~~~~
   cc1: some warnings being treated as errors


vim +28 drivers/debug/kmemdump.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
