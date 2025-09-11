Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BD033CE9F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601085; cv=none; b=NQnWtwRAATQc7HzQQVcDjk3Tlik0PJ/C1IxRfh/R5X7fZXl0s6+D2ARocH0OgySD7LoXh1XiZDbH8MIdFsuoxiT8DHTxykMvYldjiK/HcD1lguoRT3x5ad0ImlAaGNQrXvXVGwe7IB453so9wjIfHZ+PsYHha1JLber1AKyUwAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601085; c=relaxed/simple;
	bh=xbrEJ1Q8hBPm43kZImK8oOBq7xhibs4AV6VLphMspmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nbp4D7MubqBfAHLhh9ziyI2Hhawr4h6MANr6ZHICSdiqpU5UNj5kwFjsjvr2tsYvMd+EYTbrObgWlDwEG8PAaV42oZJdOb763fYYQKj2oH/PXZkZMcgB4bf+3S9py8FNPp98N8jyOStRvg5bxvnyMa0hqryCj09n86g1iwU6anA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qfdz6gdY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qfdz6gdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757601084; x=1789137084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xbrEJ1Q8hBPm43kZImK8oOBq7xhibs4AV6VLphMspmU=;
  b=Qfdz6gdYSdjqCamKz8rxKuMad6RuqCwPlCM46dcor2TJLvsIS32UPx4g
   4f0jsKdKaEPANbIoaJykr9K60oeFSfOIrgthmne4WvGuxSz7HKJ4o3xKN
   mZ+NJmpjVMHLDfXjaNQFG1yT63BO1va//OaQRLDrbF7ZNTkeXkkksItER
   DWL2mFWG7KDya3RiV+dVJ93dsiPFYBeUi6i00IqYNB/UFHZw6FZzMcIl3
   4+ua0jVwl8FW35oCNd13fvY4lII5K9Bwy2v48Radb5A2OKp8EQ5SV4P/X
   MI5ZMtHVYdl6Ido+bGoO/FrjHvOYod1SsS7h6isObl465s4rj7tR3hHA6
   A==;
X-CSE-ConnectionGUID: QcrUxkZaSiefXE6Im97Zbg==
X-CSE-MsgGUID: VrCBItoBSN+4yApoJyF45Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77389541"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="77389541"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 07:31:24 -0700
X-CSE-ConnectionGUID: RpNqzc2VQYKKnK8DdNRdZw==
X-CSE-MsgGUID: r8Owbwn4QZ+uuQ9SO5bWRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="197387441"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Sep 2025 07:31:23 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwiKW-0000O4-29;
	Thu, 11 Sep 2025 14:31:20 +0000
Date: Thu, 11 Sep 2025 22:30:48 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 7975/8263] mm/slub.c:3922:28: sparse: sparse:
 non-ANSI function declaration of function 'flush_all_rcu_sheaves'
Message-ID: <202509112222.EQkEhLyH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f21d9da46702c4d6951ba60ca8a05f42870fe8f
commit: a065a5a2bc82133fafbc4f33978dd3d84f0e57ec [7975/8263] slab: add sheaf support for batching kfree_rcu() operations
config: alpha-randconfig-r133-20250911 (https://download.01.org/0day-ci/archive/20250911/202509112222.EQkEhLyH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250911/202509112222.EQkEhLyH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509112222.EQkEhLyH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/slub.c:3922:28: sparse: sparse: non-ANSI function declaration of function 'flush_all_rcu_sheaves'
   mm/slub.c:3654:55: sparse: sparse: context imbalance in '__put_partials' - unexpected unlock
   mm/slub.c:5260:47: sparse: sparse: context imbalance in '__slab_free' - unexpected unlock

vim +/flush_all_rcu_sheaves +3922 mm/slub.c

  3919	
  3920	
  3921	/* needed for kvfree_rcu_barrier() */
> 3922	void flush_all_rcu_sheaves()
  3923	{
  3924		struct slub_percpu_sheaves *pcs;
  3925		struct slub_flush_work *sfw;
  3926		struct kmem_cache *s;
  3927		bool flushed = false;
  3928		unsigned int cpu;
  3929	
  3930		cpus_read_lock();
  3931		mutex_lock(&slab_mutex);
  3932	
  3933		list_for_each_entry(s, &slab_caches, list) {
  3934			if (!s->cpu_sheaves)
  3935				continue;
  3936	
  3937			mutex_lock(&flush_lock);
  3938	
  3939			for_each_online_cpu(cpu) {
  3940				sfw = &per_cpu(slub_flush, cpu);
  3941				pcs = per_cpu_ptr(s->cpu_sheaves, cpu);
  3942	
  3943				if (!pcs->rcu_free || !pcs->rcu_free->size) {
  3944					sfw->skip = true;
  3945					continue;
  3946				}
  3947	
  3948				INIT_WORK(&sfw->work, flush_rcu_sheaf);
  3949				sfw->skip = false;
  3950				sfw->s = s;
  3951				queue_work_on(cpu, flushwq, &sfw->work);
  3952				flushed = true;
  3953			}
  3954	
  3955			for_each_online_cpu(cpu) {
  3956				sfw = &per_cpu(slub_flush, cpu);
  3957				if (sfw->skip)
  3958					continue;
  3959				flush_work(&sfw->work);
  3960			}
  3961	
  3962			mutex_unlock(&flush_lock);
  3963		}
  3964	
  3965		mutex_unlock(&slab_mutex);
  3966		cpus_read_unlock();
  3967	
  3968		if (flushed)
  3969			rcu_barrier();
  3970	}
  3971	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
