Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4625A1C84DC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 14:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771684035; cv=none; b=K049B7zxfehNWtbOGv7ADk/WYaDgRYqL6NWdjXW3ay8pzmaLwK6WtfMrX7RXS5gxCK4Wbl/WtzRGQBeykP6NUMkTkervJkBZlJiaP7T9hpOxhV4wW2rnPG1RTSFQBKO2j7SRx3LPA5p/pzNgB2bMeYK0MGEoESwIpWYVRNwHCDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771684035; c=relaxed/simple;
	bh=7qmlvR0Yq0nrTCBBuGiyvxnV7w579oImjS5HrfNKpuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOkRl+2DL63DPTyOX8rmcgrNZvKNG0LeP16tnJtgLjTQLP7SULeKv2PWBqmNjw05aDOlr5KeIIyt8TmP2bz8i/DUiyTsHf7n7TW6C0OEzwuZfOdGh+WqvFN1Lka6sb8QlWHM1vfIMdADIu6/m34ybT7aKVCEMuOZJXMUeFscmSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9UsJ3Qv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9UsJ3Qv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771684033; x=1803220033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7qmlvR0Yq0nrTCBBuGiyvxnV7w579oImjS5HrfNKpuQ=;
  b=n9UsJ3Qvnr0FgWcHRcfUIvjbj/LzO7+Bm6EAPFf6epKQFykxYPsFhTIX
   Xd7xm0gPEHMFTSA1dpTbb07QKEes5Bl1MI0ktLFSdHGqrWL3jRLPeg0Y5
   tUQJWN05M2QwOPWix2mTsCqVBnmsOi+CmU3jr+MsD3VhyrOVc2ILBBb5y
   ZUkxpkdC07arH7DxQXQlaaArDmE3Dyq/6cz5Vhgi3oHH+RUo5qfEy2WJc
   K09Ge7UaCxh93IQBzyfmTwdoZdwU4EBn6gufrmpzyHgncTQJ33KvjYxi8
   lcE0lT1CsIZ9SRLosySq+7KuPUXvC2zoL+C2RLoDBHEw2SEWjVy/TxoJ3
   g==;
X-CSE-ConnectionGUID: OHk5EEWXQJ2g64JichOUVQ==
X-CSE-MsgGUID: ljmpNU6SQZaeEK1MajOp7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="60322789"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="60322789"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 06:27:11 -0800
X-CSE-ConnectionGUID: 0rvlshFARF2eV5jB7Xv0XQ==
X-CSE-MsgGUID: lFBHB36jS8WwZ9Rzjgyl8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="214217038"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Feb 2026 06:27:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtnwo-000000014xw-3qfK;
	Sat, 21 Feb 2026 14:27:06 +0000
Date: Sat, 21 Feb 2026 22:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	phasta@mailbox.org, matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/8] dma-buf: protected fence ops by RCU v7
Message-ID: <202602212224.vH1Jr91w-lkp@intel.com>
References: <20260219160822.1529-2-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
config: m68k-randconfig-r111-20260221 (https://download.01.org/0day-ci/archive/20260221/202602212224.vH1Jr91w-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602212224.vH1Jr91w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602212224.vH1Jr91w-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_crtc.c:161:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/drm_crtc.c:161:9: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/drm_crtc.c:161:9: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/scheduler/sched_fence.c:241:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/scheduler/sched_fence.c:241:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/drm/scheduler/sched_fence.c:242:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/scheduler/sched_fence.c:242:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
>> drivers/gpu/drm/scheduler/sched_fence.c:198:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/scheduler/sched_fence.c:198:20: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/scheduler/sched_fence.c:198:20: sparse:    struct dma_fence_ops const *
   drivers/gpu/drm/scheduler/sched_fence.c:201:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/scheduler/sched_fence.c:201:20: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/scheduler/sched_fence.c:201:20: sparse:    struct dma_fence_ops const *

vim +161 drivers/gpu/drm/drm_crtc.c

35f8cc3b9a92c6 Gustavo Padovan 2016-12-06  158  
6d6003c4b613c9 Gustavo Padovan 2016-11-15  159  static struct drm_crtc *fence_to_crtc(struct dma_fence *fence)
6d6003c4b613c9 Gustavo Padovan 2016-11-15  160  {
6d6003c4b613c9 Gustavo Padovan 2016-11-15 @161  	BUG_ON(fence->ops != &drm_crtc_fence_ops);
6d6003c4b613c9 Gustavo Padovan 2016-11-15  162  	return container_of(fence->lock, struct drm_crtc, fence_lock);
6d6003c4b613c9 Gustavo Padovan 2016-11-15  163  }
6d6003c4b613c9 Gustavo Padovan 2016-11-15  164  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
