Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA69DF55
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 06:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709792451; cv=none; b=UhnW6ck1JuBuQKUD+hzTFqPncqnGD3I1+VBXCD8EZEvESEpQzCW9DRqZkHIsIsTP2yY/xYumQmmqRO0omqvACaa14E8KXL8OByj6zZWxQeCm2Nb70OY+gQRspeNG5yRhOq5XvnAxncaJZrfJySivh044pm9+RDtxgT8fNrZ1ug0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709792451; c=relaxed/simple;
	bh=VdG4kbk7fTWWmYTN2b43PiGMDcz4M1EVWHfF9cc6Exw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aui9FDEnJWB2tlD/WshfWwLj45fOlENYdT/wcSQeyRr/0hlO1vaIpI+PuofrBM4Y1ZMC9W7mbkZLZnI/ooMaclnAIgrDLqujLtT2MeDzVLTzy3QIvvC6CfpatvYhAVS/h1i8ofHkQRp/ZAFqxqYjjtkGjGQq/wQzqhcxI0+s0IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hLZ+kKme; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLZ+kKme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709792449; x=1741328449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VdG4kbk7fTWWmYTN2b43PiGMDcz4M1EVWHfF9cc6Exw=;
  b=hLZ+kKmeILhYIt920ghUFLfilUuJdIS8RBdJnFjywv4S083nfvW1taCs
   OqFb58KfchP/78nZ9UOhenm33Mi6FK9ajZpOaFxcabFRO924D1ktqThxs
   rHs/HsUcMkjFZfA5dZbpyjGeju6coQ5WoC7vHu3e/2pCzsJ3bAHAmVJLz
   gYZp3xctXyHfZFXYA+5uUFqM+jdmS3MsxF9ZeFiYgFJVbTNd6PSFipn8h
   P3udzpkmSgGW186KuXjRMDftdUZbetv/JF3ubxj+UWIdroHmw41fkwmlt
   m+jCeOg4bLydd3DA1O3uP/jv94cCqb4LgvUFWWahY4wncSrcSbhBgaNeY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15092013"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="15092013"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 22:20:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="14665974"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Mar 2024 22:20:47 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri77U-0004tL-0x;
	Thu, 07 Mar 2024 06:20:44 +0000
Date: Thu, 7 Mar 2024 14:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] sched/fair: Introduce per-task io util boost
Message-ID: <202403071415.olRuAaBL-lkp@intel.com>
References: <20240304201625.100619-2-christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304201625.100619-2-christian.loehle@arm.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on rafael-pm/linux-next peterz-queue/sched/core linus/master v6.8-rc7 next-20240306]
[cannot apply to rafael-pm/acpi-bus rafael-pm/devprop]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Loehle/sched-fair-Introduce-per-task-io-util-boost/20240305-042115
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20240304201625.100619-2-christian.loehle%40arm.com
patch subject: [RFC PATCH 1/2] sched/fair: Introduce per-task io util boost
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240307/202403071415.olRuAaBL-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403071415.olRuAaBL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403071415.olRuAaBL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:6703:22: warning: 'io_boost_rq' defined but not used [-Wunused-function]
    6703 | static unsigned long io_boost_rq(struct cfs_rq *cfs_rq)
         |                      ^~~~~~~~~~~


vim +/io_boost_rq +6703 kernel/sched/fair.c

  6702	
> 6703	static unsigned long io_boost_rq(struct cfs_rq *cfs_rq)
  6704	{
  6705		int i;
  6706	
  6707		for (i = IO_BOOST_LEVELS; i > 0; i--)
  6708			if (atomic_read(&cfs_rq->io_boost_tasks[i - 1]))
  6709				return i * IO_BOOST_UTIL_STEP;
  6710		return 0;
  6711	}
  6712	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
