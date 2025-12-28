Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083991A285
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Dec 2025 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766920102; cv=none; b=Wb9Tc+2V7VEMljzqpDzpVNNi/ZSvJ6vZv5frbAPv4sjTdchrzzQkFgS4fnIwxFTGX87A7GdEYRPBN310QgsxkeEOAhmAnfHhtlnmDdLcf7F9vRX8FD14VpKCJFIAwo3kMJEKjb6BpzMkhZnJS70DRV72UhaOAmFWcCnSyxDXNJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766920102; c=relaxed/simple;
	bh=ccp7IyR9sF/fHYZec/2SGVHcAnC4LJkEIDPlyBXjo5I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=he+YSrqCShXBJVW0POXEOp3MCWe8kOMe1EINMTObstcGMiMDNK61KVITW4VxaxShhL9xmI3g4bUzwEuVprHKja7juZT/6VmibGVlHNX6CBzvdLFfQjhUcHvO7XcI2YX0YocKXH3YyeLZ78ptet4M2WsVjT82Z52u3xabboYqt2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yrfe8/+M; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yrfe8/+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766920100; x=1798456100;
  h=date:from:to:cc:subject:message-id;
  bh=ccp7IyR9sF/fHYZec/2SGVHcAnC4LJkEIDPlyBXjo5I=;
  b=Yrfe8/+MrQYXg30/Dfh4qvl6ePSgl018aQLsv2jSNtxBCeMxid2Fv5B9
   dXJLYpfISOpijpjUyGRQZhwvdjz3xbp3uM5KYxHzyXXTLh520YYyHwc2V
   WtqSqmn3fn9IILqYQpN0tpjqFJO5Pt1nAGwNeCh7d2RVs/Uf7NFGd+Ls8
   jpGvIxB9Up8b4YA3JK3fdHIzONSGsoKJjjc3PGZvhX8jAVyC/COwi2gB0
   RgW0sR9fZdXTmJ9Yaj9D4G4gg9lNJNWZH2Ai9q7hDa9EiZkIL7YFG6og+
   5E4+H+SixfpbSyUKwfjOMb80tJTcQ2JyGPYY492WprV81H79Mc7oGWzgG
   w==;
X-CSE-ConnectionGUID: cEihQVPBTxuy4awNjKJSWw==
X-CSE-MsgGUID: VckOls2ETaqs1SCAsFhX9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="79936316"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="79936316"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 03:08:20 -0800
X-CSE-ConnectionGUID: 68oshb9FSNytn9FTO7V3Gw==
X-CSE-MsgGUID: tLg8dsafS5axgyE0lM0O3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="201166457"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 28 Dec 2025 03:08:18 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZodD-000000006Qz-3BOE;
	Sun, 28 Dec 2025 11:08:15 +0000
Date: Sun, 28 Dec 2025 19:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 4/4]
 drivers/virtio/virtio_pvclock.c:244:42: error: invalid application of
 'sizeof' to incomplete type 'struct pvclock_vsyscall_time_info'
Message-ID: <202512281805.adMl5ikK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Suleiman,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   500d05631d89314552da084e17819640507698bf
commit: 5f974515fd4a128e7c07fe36db373f468d31ef36 [4/4] CHROMIUM: virtio-pvclock driver for arm64.
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251228/202512281805.adMl5ikK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512281805.adMl5ikK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512281805.adMl5ikK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virtio/virtio_pvclock.c:69:6: warning: no previous prototype for 'update_suspend_time' [-Wmissing-prototypes]
      69 | void update_suspend_time(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_pvclock.c: In function 'virtpvclock_probe':
>> drivers/virtio/virtio_pvclock.c:244:42: error: invalid application of 'sizeof' to incomplete type 'struct pvclock_vsyscall_time_info'
     244 |                                    sizeof(*virtio_pvclock_page),
         |                                          ^
   drivers/virtio/virtio_pvclock.c:270:51: error: invalid application of 'sizeof' to incomplete type 'struct pvclock_vsyscall_time_info'
     270 |         dma_free_coherent(vdev->dev.parent, sizeof(*virtio_pvclock_page),
         |                                                   ^
   drivers/virtio/virtio_pvclock.c: In function 'virtpvclock_remove':
   drivers/virtio/virtio_pvclock.c:293:51: error: invalid application of 'sizeof' to incomplete type 'struct pvclock_vsyscall_time_info'
     293 |         dma_free_coherent(vdev->dev.parent, sizeof(*virtio_pvclock_page),
         |                                                   ^


vim +244 drivers/virtio/virtio_pvclock.c

2b1ff8683a4370 Hikaru Nishida   2023-02-28   68  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  @69  void update_suspend_time(struct work_struct *work)
2b1ff8683a4370 Hikaru Nishida   2023-02-28   70  {
2b1ff8683a4370 Hikaru Nishida   2023-02-28   71  	u64 suspend_ns, suspend_time_delta = 0;
2b1ff8683a4370 Hikaru Nishida   2023-02-28   72  	struct timespec64 inject_time;
2b1ff8683a4370 Hikaru Nishida   2023-02-28   73  	struct virtio_pvclock *vp;
2b1ff8683a4370 Hikaru Nishida   2023-02-28   74  
2b1ff8683a4370 Hikaru Nishida   2023-02-28   75  	vp = container_of(work, struct virtio_pvclock,
2b1ff8683a4370 Hikaru Nishida   2023-02-28   76  			  update_suspend_time_work);
2b1ff8683a4370 Hikaru Nishida   2023-02-28   77  
2b1ff8683a4370 Hikaru Nishida   2023-02-28   78  	virtio_cread(vp->vdev, struct virtio_pvclock_config, suspend_time_ns,
2b1ff8683a4370 Hikaru Nishida   2023-02-28   79  		     &suspend_ns);
2b1ff8683a4370 Hikaru Nishida   2023-02-28   80  
2b1ff8683a4370 Hikaru Nishida   2023-02-28   81  	mutex_lock(&vp->inject_suspend_lock);
2b1ff8683a4370 Hikaru Nishida   2023-02-28   82  	if (suspend_ns > vp->injected_suspend_ns) {
2b1ff8683a4370 Hikaru Nishida   2023-02-28   83  		suspend_time_delta = suspend_ns - vp->injected_suspend_ns;
2b1ff8683a4370 Hikaru Nishida   2023-02-28   84  		vp->injected_suspend_ns = suspend_ns;
2b1ff8683a4370 Hikaru Nishida   2023-02-28   85  	}
2b1ff8683a4370 Hikaru Nishida   2023-02-28   86  	mutex_unlock(&vp->inject_suspend_lock);
2b1ff8683a4370 Hikaru Nishida   2023-02-28   87  
2b1ff8683a4370 Hikaru Nishida   2023-02-28   88  	if (suspend_time_delta == 0) {
2b1ff8683a4370 Hikaru Nishida   2023-02-28   89  		dev_err(&vp->vdev->dev,
2b1ff8683a4370 Hikaru Nishida   2023-02-28   90  			"%s: suspend_time_ns is less than injected_suspend_ns\n",
2b1ff8683a4370 Hikaru Nishida   2023-02-28   91  			__func__);
2b1ff8683a4370 Hikaru Nishida   2023-02-28   92  		return;
2b1ff8683a4370 Hikaru Nishida   2023-02-28   93  	}
2b1ff8683a4370 Hikaru Nishida   2023-02-28   94  
2b1ff8683a4370 Hikaru Nishida   2023-02-28   95  	inject_time = ns_to_timespec64(suspend_time_delta);
2b1ff8683a4370 Hikaru Nishida   2023-02-28   96  
2b1ff8683a4370 Hikaru Nishida   2023-02-28   97  	timekeeping_inject_sleeptime64(&inject_time);
2b1ff8683a4370 Hikaru Nishida   2023-02-28   98  
2b1ff8683a4370 Hikaru Nishida   2023-02-28   99  	dev_info(&vp->vdev->dev, "injected sleeptime: %llu ns\n",
2b1ff8683a4370 Hikaru Nishida   2023-02-28  100  		 suspend_time_delta);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  101  }
2b1ff8683a4370 Hikaru Nishida   2023-02-28  102  
5f974515fd4a12 Suleiman Souhlal 2024-04-08  103  #ifdef CONFIG_X86
2b1ff8683a4370 Hikaru Nishida   2023-02-28  104  static u64 virtio_pvclock_clocksource_read(struct clocksource *cs)
2b1ff8683a4370 Hikaru Nishida   2023-02-28  105  {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  106  	u64 ret;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  107  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  108  	preempt_disable_notrace();
2b1ff8683a4370 Hikaru Nishida   2023-02-28  109  	ret = pvclock_clocksource_read(&virtio_pvclock_page->pvti);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  110  	preempt_enable_notrace();
2b1ff8683a4370 Hikaru Nishida   2023-02-28  111  	return ret;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  112  }
2b1ff8683a4370 Hikaru Nishida   2023-02-28  113  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  114  static int virtio_pvclock_cs_enable(struct clocksource *cs)
2b1ff8683a4370 Hikaru Nishida   2023-02-28  115  {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  116  	if (cs->vdso_clock_mode == VDSO_CLOCKMODE_PVCLOCK)
2b1ff8683a4370 Hikaru Nishida   2023-02-28  117  		vclocks_set_used(VDSO_CLOCKMODE_PVCLOCK);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  118  	return 0;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  119  }
2b1ff8683a4370 Hikaru Nishida   2023-02-28  120  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  121  static struct clocksource virtio_pvclock_clocksource = {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  122  	.name = "virtio-pvclock",
2b1ff8683a4370 Hikaru Nishida   2023-02-28  123  	.rating = 200, /* default rating, updated by virtpvclock_validate */
2b1ff8683a4370 Hikaru Nishida   2023-02-28  124  	.read = virtio_pvclock_clocksource_read,
2b1ff8683a4370 Hikaru Nishida   2023-02-28  125  	.mask = CLOCKSOURCE_MASK(64),
2b1ff8683a4370 Hikaru Nishida   2023-02-28  126  	.flags = CLOCK_SOURCE_IS_CONTINUOUS,
2b1ff8683a4370 Hikaru Nishida   2023-02-28  127  	.enable = virtio_pvclock_cs_enable,
2b1ff8683a4370 Hikaru Nishida   2023-02-28  128  };
5f974515fd4a12 Suleiman Souhlal 2024-04-08  129  #endif
2b1ff8683a4370 Hikaru Nishida   2023-02-28  130  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  131  static void set_pvclock_page_callback(struct virtqueue *vq)
2b1ff8683a4370 Hikaru Nishida   2023-02-28  132  {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  133  	struct virtio_pvclock *vp = vq->vdev->priv;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  134  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  135  	if (vp->set_page_request.status != VIRTIO_PVCLOCK_S_OK) {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  136  		dev_err(&vq->vdev->dev,
2b1ff8683a4370 Hikaru Nishida   2023-02-28  137  			"%s: set_pvclock_page req status is %u\n", __func__,
2b1ff8683a4370 Hikaru Nishida   2023-02-28  138  			vp->set_page_request.status);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  139  		return;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  140  	}
2b1ff8683a4370 Hikaru Nishida   2023-02-28  141  
5f974515fd4a12 Suleiman Souhlal 2024-04-08  142  #ifdef CONFIG_X86
2b1ff8683a4370 Hikaru Nishida   2023-02-28  143  	/*
2b1ff8683a4370 Hikaru Nishida   2023-02-28  144  	 * Create the actual clocksource via a work queue because we're in an
2b1ff8683a4370 Hikaru Nishida   2023-02-28  145  	 * interrupt handler right now.
2b1ff8683a4370 Hikaru Nishida   2023-02-28  146  	 */
2b1ff8683a4370 Hikaru Nishida   2023-02-28  147  	schedule_work(&vp->create_clocksource_work);
5f974515fd4a12 Suleiman Souhlal 2024-04-08  148  #endif
2b1ff8683a4370 Hikaru Nishida   2023-02-28  149  }
2b1ff8683a4370 Hikaru Nishida   2023-02-28  150  
5f974515fd4a12 Suleiman Souhlal 2024-04-08  151  #ifdef CONFIG_X86
2b1ff8683a4370 Hikaru Nishida   2023-02-28  152  static void create_clocksource(struct work_struct *work)
2b1ff8683a4370 Hikaru Nishida   2023-02-28  153  {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  154  	struct virtio_pvclock *vp;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  155  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  156  	vp = container_of(work, struct virtio_pvclock, create_clocksource_work);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  157  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  158  	/*
2b1ff8683a4370 Hikaru Nishida   2023-02-28  159  	 * VDSO pvclock can only be used if the TSCs are stable. The device also
2b1ff8683a4370 Hikaru Nishida   2023-02-28  160  	 * must set PVCLOCK_TSC_STABLE_BIT in the pvclock flags field.
2b1ff8683a4370 Hikaru Nishida   2023-02-28  161  	 */
2b1ff8683a4370 Hikaru Nishida   2023-02-28  162  	if (virtio_has_feature(vp->vdev, VIRTIO_PVCLOCK_F_TSC_STABLE)) {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  163  		pvclock_set_pvti_cpu0_va(virtio_pvclock_page);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  164  		virtio_pvclock_clocksource.vdso_clock_mode =
2b1ff8683a4370 Hikaru Nishida   2023-02-28  165  			VDSO_CLOCKMODE_PVCLOCK;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  166  	}
2b1ff8683a4370 Hikaru Nishida   2023-02-28  167  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  168  	clocksource_register_hz(&virtio_pvclock_clocksource, NSEC_PER_SEC);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  169  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  170  	dev_info(&vp->vdev->dev, "registered clocksource\n");
2b1ff8683a4370 Hikaru Nishida   2023-02-28  171  }
5f974515fd4a12 Suleiman Souhlal 2024-04-08  172  #endif
2b1ff8683a4370 Hikaru Nishida   2023-02-28  173  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  174  static void virtpvclock_changed(struct virtio_device *vdev)
2b1ff8683a4370 Hikaru Nishida   2023-02-28  175  {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  176  	struct virtio_pvclock *vp = vdev->priv;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  177  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  178  	schedule_work(&vp->update_suspend_time_work);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  179  }
2b1ff8683a4370 Hikaru Nishida   2023-02-28  180  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  181  static int set_pvclock_page(struct virtio_pvclock *vp)
2b1ff8683a4370 Hikaru Nishida   2023-02-28  182  {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  183  	struct scatterlist sg;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  184  	int err;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  185  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  186  	vp->set_page_request.pvclock_page_pa = vp->pvclock_page_dma_addr;
5f974515fd4a12 Suleiman Souhlal 2024-04-08  187  #ifdef CONFIG_X86
2b1ff8683a4370 Hikaru Nishida   2023-02-28  188  	vp->set_page_request.system_time = ktime_get();
2b1ff8683a4370 Hikaru Nishida   2023-02-28  189  	vp->set_page_request.tsc_timestamp = rdtsc_ordered();
5f974515fd4a12 Suleiman Souhlal 2024-04-08  190  #endif
2b1ff8683a4370 Hikaru Nishida   2023-02-28  191  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  192  	sg_init_one(&sg, &vp->set_page_request, sizeof(vp->set_page_request));
2b1ff8683a4370 Hikaru Nishida   2023-02-28  193  	err = virtqueue_add_outbuf(vp->set_pvclock_page_vq, &sg, 1, vp,
2b1ff8683a4370 Hikaru Nishida   2023-02-28  194  				   GFP_KERNEL);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  195  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  196  	if (err) {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  197  		dev_err(&vp->vdev->dev, "%s: failed to add output\n", __func__);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  198  		return err;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  199  	}
2b1ff8683a4370 Hikaru Nishida   2023-02-28  200  	virtqueue_kick(vp->set_pvclock_page_vq);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  201  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  202  	return 0;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  203  }
2b1ff8683a4370 Hikaru Nishida   2023-02-28  204  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  205  static int init_vqs(struct virtio_pvclock *vp)
2b1ff8683a4370 Hikaru Nishida   2023-02-28  206  {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  207  	vq_callback_t *callbacks[VIRTIO_PVCLOCK_VQ_MAX];
2b1ff8683a4370 Hikaru Nishida   2023-02-28  208  	struct virtqueue *vqs[VIRTIO_PVCLOCK_VQ_MAX];
2b1ff8683a4370 Hikaru Nishida   2023-02-28  209  	const char *names[VIRTIO_PVCLOCK_VQ_MAX];
2b1ff8683a4370 Hikaru Nishida   2023-02-28  210  	int err;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  211  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  212  	callbacks[VIRTIO_PVCLOCK_VQ_SET_PVCLOCK_PAGE] =
2b1ff8683a4370 Hikaru Nishida   2023-02-28  213  		set_pvclock_page_callback;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  214  	names[VIRTIO_PVCLOCK_VQ_SET_PVCLOCK_PAGE] = "set_pvclock_page";
2b1ff8683a4370 Hikaru Nishida   2023-02-28  215  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  216  	err = vp->vdev->config->find_vqs(vp->vdev, VIRTIO_PVCLOCK_VQ_MAX, vqs,
2b1ff8683a4370 Hikaru Nishida   2023-02-28  217  					 callbacks, names, NULL, NULL);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  218  	if (err)
2b1ff8683a4370 Hikaru Nishida   2023-02-28  219  		return err;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  220  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  221  	vp->set_pvclock_page_vq = vqs[VIRTIO_PVCLOCK_VQ_SET_PVCLOCK_PAGE];
2b1ff8683a4370 Hikaru Nishida   2023-02-28  222  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  223  	return set_pvclock_page(vp);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  224  }
2b1ff8683a4370 Hikaru Nishida   2023-02-28  225  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  226  static int virtpvclock_probe(struct virtio_device *vdev)
2b1ff8683a4370 Hikaru Nishida   2023-02-28  227  {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  228  	struct virtio_pvclock *vp;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  229  	int err;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  230  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  231  	if (!vdev->config->get) {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  232  		dev_err(&vdev->dev, "%s: config access disabled\n", __func__);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  233  		return -EINVAL;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  234  	}
2b1ff8683a4370 Hikaru Nishida   2023-02-28  235  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  236  	vp = kzalloc(sizeof(*vp), GFP_KERNEL);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  237  	if (!vp) {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  238  		err = -ENOMEM;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  239  		goto out;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  240  	}
2b1ff8683a4370 Hikaru Nishida   2023-02-28  241  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  242  	virtio_pvclock_page =
2b1ff8683a4370 Hikaru Nishida   2023-02-28  243  		dma_alloc_coherent(vdev->dev.parent,
2b1ff8683a4370 Hikaru Nishida   2023-02-28 @244  				   sizeof(*virtio_pvclock_page),
2b1ff8683a4370 Hikaru Nishida   2023-02-28  245  				   &vp->pvclock_page_dma_addr, GFP_KERNEL);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  246  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  247  	if (!virtio_pvclock_page) {
2b1ff8683a4370 Hikaru Nishida   2023-02-28  248  		err = -ENOMEM;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  249  		goto out_free_vp;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  250  	}
2b1ff8683a4370 Hikaru Nishida   2023-02-28  251  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  252  	INIT_WORK(&vp->update_suspend_time_work, update_suspend_time);
5f974515fd4a12 Suleiman Souhlal 2024-04-08  253  #ifdef CONFIG_X86
2b1ff8683a4370 Hikaru Nishida   2023-02-28  254  	INIT_WORK(&vp->create_clocksource_work, create_clocksource);
5f974515fd4a12 Suleiman Souhlal 2024-04-08  255  #endif
2b1ff8683a4370 Hikaru Nishida   2023-02-28  256  	mutex_init(&vp->inject_suspend_lock);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  257  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  258  	vp->vdev = vdev;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  259  	vdev->priv = vp;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  260  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  261  	err = init_vqs(vp);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  262  	if (err)
2b1ff8683a4370 Hikaru Nishida   2023-02-28  263  		goto out_free_pvclock_page;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  264  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  265  	virtio_device_ready(vdev);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  266  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  267  	return 0;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  268  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  269  out_free_pvclock_page:
2b1ff8683a4370 Hikaru Nishida   2023-02-28  270  	dma_free_coherent(vdev->dev.parent, sizeof(*virtio_pvclock_page),
2b1ff8683a4370 Hikaru Nishida   2023-02-28  271  			  virtio_pvclock_page, vp->pvclock_page_dma_addr);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  272  
2b1ff8683a4370 Hikaru Nishida   2023-02-28  273  out_free_vp:
2b1ff8683a4370 Hikaru Nishida   2023-02-28  274  	kfree(vp);
2b1ff8683a4370 Hikaru Nishida   2023-02-28  275  out:
2b1ff8683a4370 Hikaru Nishida   2023-02-28  276  	return err;
2b1ff8683a4370 Hikaru Nishida   2023-02-28  277  }
2b1ff8683a4370 Hikaru Nishida   2023-02-28  278  

:::::: The code at line 244 was first introduced by commit
:::::: 2b1ff8683a4370ea8c1b01d801f8369ebd777e19 CHROMIUM: virtio_pvclock: port driver impl from Android

:::::: TO: Hikaru Nishida <hikalium@chromium.org>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
