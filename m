Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DE72629D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 14:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771683374; cv=none; b=AgklWVDHyW8rEvP8/yJnn0M4UwJ+uYzL7P27Y/hboncECENKQCyFY4gBJHnnYh9UdnfdAvGtZUlcFGw4JRuFuJumiHvR6nzaMn3O4pVEa07RQqbcHSKuJtowKgBpkybk7gkPBzEIwjTQZs/qBvlFm0/C/EAFpQArq7Uunuo1UN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771683374; c=relaxed/simple;
	bh=iv+wl5S8GMBKsfMadNR67SuYBnnFKiyhZHKRp4P+gEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGzCR7CoVmhD9H557W2IK3QkDIA/sGPMyVuXBDrjCihWNX/9jCrODlU0haiNw+n1a6y5N4bi0LN3rABmC0OBJg78L5K+TxR/iHuyb72izkRcVoqAFZ0OFK75ZYG2Vds9ODg1rQ2g8hPXG8iReigIhUfPwxP1myUOlNfkORiIVNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A2jLKPcJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2jLKPcJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771683372; x=1803219372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iv+wl5S8GMBKsfMadNR67SuYBnnFKiyhZHKRp4P+gEU=;
  b=A2jLKPcJ8dYdPxcTGkDNA2g95CAj/YhILPaDxAZPX1oqWmu6reeiwRu6
   dMLKyr8bcEWjS64ZpA2sZtLAVYAUw0Ipzb8wtWwoxRtBWKOv9y7oSAooy
   rUr34EZXECMhdhuYpHkXZ3oEJyB6BBo6xBau0Dft5sOtw8XLDqCQ9TNN6
   ntwgyRQXVV6J1tOwRqx3GcGP8Ms7vXmCWrCVzjSN4ijHKCBzmHDQC8+Q0
   5JIFh6DH0O5nJNfQuhx+TwILLYhFnkh8ltrNWXGtkQe6e1pAKNL522aOI
   usqp7YLgMVWoQt2PIr/JtNAFVjoLbpraqbgU+L8LI9ZpM5TljbVFJUW9I
   A==;
X-CSE-ConnectionGUID: kwJ9sE4/TvyrP7rzC0aIJw==
X-CSE-MsgGUID: Pcgkp9UnTiqThFsue8ocyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="95366849"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="95366849"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 06:16:11 -0800
X-CSE-ConnectionGUID: M0H7iOt8SCCXLakT/kPJPw==
X-CSE-MsgGUID: NnlVnJ2/RJ+r86aAjnjpXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="214090902"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Feb 2026 06:16:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtnmA-000000014xo-3YIC;
	Sat, 21 Feb 2026 14:16:06 +0000
Date: Sat, 21 Feb 2026 22:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	phasta@mailbox.org, matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/8] dma-buf: protected fence ops by RCU v7
Message-ID: <202602212248.xPSr8tt8-lkp@intel.com>
References: <20260219160822.1529-2-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260219160822.1529-2-christian.koenig@amd.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-xe/drm-xe-next linus/master v6.19 next-20260220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-detach-fence-ops-on-signal-v2/20260220-010804
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260219160822.1529-2-christian.koenig%40amd.com
patch subject: [PATCH 1/8] dma-buf: protected fence ops by RCU v7
config: hexagon-randconfig-r121-20260221 (https://download.01.org/0day-ci/archive/20260221/202602212248.xPSr8tt8-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602212248.xPSr8tt8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602212248.xPSr8tt8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma-buf/dma-fence-array.c: note: in included file (through include/linux/dma-fence-array.h):
>> include/linux/dma-fence.h:721:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:721:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:721:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:721:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:721:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const *
   include/linux/dma-fence.h:732:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:732:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:732:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:721:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:721:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:721:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const *
>> include/linux/dma-fence.h:721:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const *
--
   drivers/dma-buf/dma-resv.c: note: in included file (through include/linux/dma-resv.h):
>> include/linux/dma-fence.h:721:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:721:27: sparse:    struct dma_fence_ops const *
   include/linux/dma-fence.h:732:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/dma-fence.h:732:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   include/linux/dma-fence.h:732:27: sparse:    struct dma_fence_ops const *
--
   drivers/dma-buf/dma-fence.c:1043:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __rcu *timeline @@     got char * @@
   drivers/dma-buf/dma-fence.c:1043:38: sparse:     expected char const [noderef] __rcu *timeline
   drivers/dma-buf/dma-fence.c:1043:38: sparse:     got char *
   drivers/dma-buf/dma-fence.c:1044:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __rcu *driver @@     got char * @@
   drivers/dma-buf/dma-fence.c:1044:36: sparse:     expected char const [noderef] __rcu *driver
   drivers/dma-buf/dma-fence.c:1044:36: sparse:     got char *
   drivers/dma-buf/dma-fence.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/dma_fence.h):
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of noderef expression
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of noderef expression

vim +721 include/linux/dma-fence.h

976b6d97c62347 Christian König 2022-01-19  712  
976b6d97c62347 Christian König 2022-01-19  713  /**
976b6d97c62347 Christian König 2022-01-19  714   * dma_fence_is_array - check if a fence is from the array subclass
976b6d97c62347 Christian König 2022-01-19  715   * @fence: the fence to test
976b6d97c62347 Christian König 2022-01-19  716   *
976b6d97c62347 Christian König 2022-01-19  717   * Return true if it is a dma_fence_array and false otherwise.
976b6d97c62347 Christian König 2022-01-19  718   */
976b6d97c62347 Christian König 2022-01-19  719  static inline bool dma_fence_is_array(struct dma_fence *fence)
976b6d97c62347 Christian König 2022-01-19  720  {
976b6d97c62347 Christian König 2022-01-19 @721  	return fence->ops == &dma_fence_array_ops;
976b6d97c62347 Christian König 2022-01-19  722  }
976b6d97c62347 Christian König 2022-01-19  723  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
