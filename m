Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5FA315D29
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 20:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763067011; cv=none; b=fthL2e8rAapueORGfwbhsEUguC1pK2Qv6th3k+QthyvgoJtV/kn2PlaYY+GK3J9ozoy45V72xFLaPF9OsAe2ix2mGj3xGL15uKddebAbuWIvFqHhzAmRQ/VPRcmqIRx8sXBF9Wa/qCdUOi3rIAX1NQQjcJx76i8yOthHv3h41Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763067011; c=relaxed/simple;
	bh=c14Im5Ycw0cJ83G30ozwTETFt4r0l7bFAsL/iOYSZDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NY7BhMH01eTIEOqgJQrSgFbioR55N1OkzVJtPSYj04KFat/uPgLpAevChnOXDBdXl6Sw+MCuk6keZpqT3TqYxRbFocS38EeRZaKzwuCy/43qikC7KEZKbcZkBm1bL4YWuhsuaPhc3CPYJmApNE/kXg9vMYNLrVcVs8IyjTKuoks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIW7k8kd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIW7k8kd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763067010; x=1794603010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c14Im5Ycw0cJ83G30ozwTETFt4r0l7bFAsL/iOYSZDY=;
  b=BIW7k8kdqIjmxylY2yOCkgYljbvxExqX87EfnZzYn4sexAG5T8zWGtev
   M7IJLle4iBVU1BOh3vC2SiLwSGK2eoLlSdS3y2JH3xWVwGaplbBbRxjb7
   XBdQ7C9f8xjKAqvlY1PabgG21R2n25EjwOfOqIUF75yhDMPxYuqDAVK/2
   iCOMouQBMUAcZ307yaWr3n86wPxUEnOjSRzpwhXcRH+psMjsZxyoEmONN
   IqoaDDvUgsq79rh92Mz1TVmkZLfHkAkObn5s3Uaelc0HVbbnsyKIqzaVC
   u5i4BjSjDbMiVI/BQRgyKQCKxPStpMQibSMiYXTShw/ggXC2Gx11HhAHN
   A==;
X-CSE-ConnectionGUID: BBnYNeZbQsCrZ1DZ4CBfVQ==
X-CSE-MsgGUID: RrELJgKuSIGs46vivzyKuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64165037"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="64165037"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 12:50:09 -0800
X-CSE-ConnectionGUID: zCf4xlQuQzOoYE5SoOHg8Q==
X-CSE-MsgGUID: kOJv2nQJTP+JB47h3uDyxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="194044028"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Nov 2025 12:50:05 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJeGY-0005qx-0p;
	Thu, 13 Nov 2025 20:50:02 +0000
Date: Fri, 14 Nov 2025 04:49:30 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
	tursulin@ursulin.net, matthew.brost@intel.com,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 04/18] dma-buf: inline spinlock for fence protection v2
Message-ID: <202511140459.HpT5i7v9-lkp@intel.com>
References: <20251113145332.16805-5-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113145332.16805-5-christian.koenig@amd.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251113]
[also build test ERROR on v6.18-rc5]
[cannot apply to drm-xe/drm-xe-next linus/master v6.18-rc5 v6.18-rc4 v6.18-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-protected-fence-ops-by-RCU-v3/20251113-235209
base:   next-20251113
patch link:    https://lore.kernel.org/r/20251113145332.16805-5-christian.koenig%40amd.com
patch subject: [PATCH 04/18] dma-buf: inline spinlock for fence protection v2
config: openrisc-randconfig-r072-20251114 (https://download.01.org/0day-ci/archive/20251114/202511140459.HpT5i7v9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140459.HpT5i7v9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140459.HpT5i7v9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dma-buf/st-dma-fence.c: In function '__wait_for_callbacks':
>> drivers/dma-buf/st-dma-fence.c:454:24: error: 'struct dma_fence' has no member named 'lock'
     454 |         spin_lock_irq(f->lock);
         |                        ^~
   drivers/dma-buf/st-dma-fence.c:455:26: error: 'struct dma_fence' has no member named 'lock'
     455 |         spin_unlock_irq(f->lock);
         |                          ^~


vim +454 drivers/dma-buf/st-dma-fence.c

2989f6451084ae Chris Wilson 2019-08-19  451  
2989f6451084ae Chris Wilson 2019-08-19  452  static void __wait_for_callbacks(struct dma_fence *f)
2989f6451084ae Chris Wilson 2019-08-19  453  {
2989f6451084ae Chris Wilson 2019-08-19 @454  	spin_lock_irq(f->lock);
2989f6451084ae Chris Wilson 2019-08-19  455  	spin_unlock_irq(f->lock);
2989f6451084ae Chris Wilson 2019-08-19  456  }
2989f6451084ae Chris Wilson 2019-08-19  457  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
