Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717262E3711
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 03:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753585315; cv=none; b=HzPsMZo6iHJpgGDhQGR9j32q2t/DdFAN7KeMdvr8CBhEM6OUnmhKAHpIHmC1qjwyFtNb6KJ5hNGCzH2D2U/K/En9dc7ipi2qxPmGw/iKBpxCRlpeRgKxmWsJNKs81GfIcpihL5nN/ReYhSvsFScx3meUc6LaUmfaNOPma/HXUI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753585315; c=relaxed/simple;
	bh=Gi8wsCKwvJ+c12OsxUYMFovujjBBrJeYse9l4k7WjYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nb4qER9LprvAIf3hMyzoSHk5JdfGO+4fR3ByzAHU0lSC5y0R94pKbt2xtpUigbqzTGzEiNjKUHOg7Y0cF/tEVoAK+7ZnGcP5Yu5C48t/0Mfu1rpr4jAv+j4qEfMlYFBEDi46nS4AKSjb1AweLbxHPd1BCh92B950L1X/+fr7RHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kznCZ/ik; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kznCZ/ik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753585313; x=1785121313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gi8wsCKwvJ+c12OsxUYMFovujjBBrJeYse9l4k7WjYo=;
  b=kznCZ/ikLwZJKJ2fH+cC84UGABgjQP/grhdhGl5w3E1rY98/YD/IZQnI
   /rVUglO7X81LhncqLK499LNMpM3DOumX+eAsjdU9BZRIme/oldA7E6BzN
   JYfEGuoLv+83dOuS9EIz6T4W/OQJi853ktYgYmsuLHMGHbpErHR39VV1v
   K3fw1dnXTT5B+W79D35nc8U+u4OUuCS21dGfq7he6MHxU6zzTWIzH8tQC
   vWIcP0ffirrVCMBdOdHZMS4Dbo5NrworPz/8HyYPe47cgKsA5FwCeIEox
   btxFNhnnJ6CdMzfCohqiNuvZX8wuZ0wP/wM+v+8IrL70JC44pydKk+F6p
   w==;
X-CSE-ConnectionGUID: F0ae2rxeRniqJMWDRBei8A==
X-CSE-MsgGUID: SsxP5jGIRbu4VuMs8oJYmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="59521884"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="59521884"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 20:01:53 -0700
X-CSE-ConnectionGUID: rkGrZcWsTieZkD3AsRu9xg==
X-CSE-MsgGUID: hObFvCpzRySVlVRqviwqNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162403838"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Jul 2025 20:01:52 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufre1-000MR9-2a;
	Sun, 27 Jul 2025 03:01:49 +0000
Date: Sun, 27 Jul 2025 11:01:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 150/150]
 kernel/events/ring_buffer.c:22:9: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202507271026.GRbBtLtQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   abfe558647e08f17fd86aeabc57ff9143386d34c
commit: ef0398cf5cf150364839ffea0b0dd7c71edf2e62 [150/150] perf/ring_buffer: Allow the EPOLLRDNORM flag for poll
config: arm-randconfig-r133-20250727 (https://download.01.org/0day-ci/archive/20250727/202507271026.GRbBtLtQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250727/202507271026.GRbBtLtQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507271026.GRbBtLtQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/events/ring_buffer.c:22:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected int volatile @@     got restricted __poll_t @@
   kernel/events/ring_buffer.c:22:9: sparse:     expected int volatile
   kernel/events/ring_buffer.c:22:9: sparse:     got restricted __poll_t
   kernel/events/ring_buffer.c:170:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer *
   kernel/events/ring_buffer.c:170:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer *
   kernel/events/ring_buffer.c:170:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer *

vim +22 kernel/events/ring_buffer.c

    19	
    20	static void perf_output_wakeup(struct perf_output_handle *handle)
    21	{
  > 22		atomic_set(&handle->rb->poll, EPOLLIN | EPOLLRDNORM);
    23	
    24		handle->event->pending_wakeup = 1;
    25		irq_work_queue(&handle->event->pending);
    26	}
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
