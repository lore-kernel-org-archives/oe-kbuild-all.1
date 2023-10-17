Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D2EBE58
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 05:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+iBX9ly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697521178; x=1729057178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S9i5YuFUAETCmg5pwlWcss8hTud7Y6QUDJ9On2Wm6Rw=;
  b=g+iBX9lyDZdWalzdr457l7QQkj+mvm9GQldQvE4ghP4iO0Kak/uKjFXS
   M283ggm+vlrfN1Elvgjs58qV70M/5dF2QgjTX8Na6chYe42q6OVI5Pcjg
   Q4GvXtHztY5FsLYnovZycE845BFKly2LvRtXhh6FicwpS0haXx44mtU+m
   FWwT30OGqIvYBCFOfbOtGdhm1IU/dkUXmuhB9zLPJnrMOLhAYOgZ8LTw+
   6X/VvjmjXU4nTnH4IClY2OMu8G8N9H/vDOZk7vjswW1w+yP/ZH++dm1I8
   Hcnpft5fBIuApoOg8qeJnawNduWG8CEDSP97YeTHamyG+DlrzjWgR0wcr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="365055881"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="365055881"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 22:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1087362338"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="1087362338"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Oct 2023 22:39:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qscmv-00093j-0V;
	Tue, 17 Oct 2023 05:38:51 +0000
Date: Tue, 17 Oct 2023 13:37:48 +0800
From: kernel test robot <lkp@intel.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] ALSA: virtio: use copy and fill_silence callbacks
Message-ID: <202310171314.QoUXP6Dh-lkp@intel.com>
References: <ZSgMeoMx6NX2zCx/@fedora>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSgMeoMx6NX2zCx/@fedora>

Hi Matias,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa]

url:    https://github.com/intel-lab-lkp/linux/commits/Matias-Ezequiel-Vara-Larsen/ALSA-virtio-use-copy-and-fill_silence-callbacks/20231017-111230
base:   8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
patch link:    https://lore.kernel.org/r/ZSgMeoMx6NX2zCx%2F%40fedora
patch subject: [RFC PATCH] ALSA: virtio: use copy and fill_silence callbacks
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231017/202310171314.QoUXP6Dh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171314.QoUXP6Dh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171314.QoUXP6Dh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/virtio/virtio_pcm_ops.c: In function 'virtsnd_pcm_trigger':
>> sound/virtio/virtio_pcm_ops.c:334:34: warning: variable 'queue' set but not used [-Wunused-but-set-variable]
     334 |         struct virtio_snd_queue *queue;
         |                                  ^~~~~


vim +/queue +334 sound/virtio/virtio_pcm_ops.c

da76e9f3e43a71 Anton Yakovlev              2021-03-02  320  
da76e9f3e43a71 Anton Yakovlev              2021-03-02  321  /**
da76e9f3e43a71 Anton Yakovlev              2021-03-02  322   * virtsnd_pcm_trigger() - Process command for the PCM substream.
da76e9f3e43a71 Anton Yakovlev              2021-03-02  323   * @substream: Kernel ALSA substream.
da76e9f3e43a71 Anton Yakovlev              2021-03-02  324   * @command: Substream command (SNDRV_PCM_TRIGGER_XXX).
da76e9f3e43a71 Anton Yakovlev              2021-03-02  325   *
da76e9f3e43a71 Anton Yakovlev              2021-03-02  326   * Context: Any context. Takes and releases the VirtIO substream spinlock.
da76e9f3e43a71 Anton Yakovlev              2021-03-02  327   *          May take and release the tx/rx queue spinlock.
da76e9f3e43a71 Anton Yakovlev              2021-03-02  328   * Return: 0 on success, -errno on failure.
da76e9f3e43a71 Anton Yakovlev              2021-03-02  329   */
da76e9f3e43a71 Anton Yakovlev              2021-03-02  330  static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
da76e9f3e43a71 Anton Yakovlev              2021-03-02  331  {
da76e9f3e43a71 Anton Yakovlev              2021-03-02  332  	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
da76e9f3e43a71 Anton Yakovlev              2021-03-02  333  	struct virtio_snd *snd = vss->snd;
da76e9f3e43a71 Anton Yakovlev              2021-03-02 @334  	struct virtio_snd_queue *queue;
da76e9f3e43a71 Anton Yakovlev              2021-03-02  335  	struct virtio_snd_msg *msg;
da76e9f3e43a71 Anton Yakovlev              2021-03-02  336  	unsigned long flags;
da76e9f3e43a71 Anton Yakovlev              2021-03-02  337  	int rc;
da76e9f3e43a71 Anton Yakovlev              2021-03-02  338  
da76e9f3e43a71 Anton Yakovlev              2021-03-02  339  	switch (command) {
da76e9f3e43a71 Anton Yakovlev              2021-03-02  340  	case SNDRV_PCM_TRIGGER_START:
da76e9f3e43a71 Anton Yakovlev              2021-03-02  341  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
da76e9f3e43a71 Anton Yakovlev              2021-03-02  342  		queue = virtsnd_pcm_queue(vss);
da76e9f3e43a71 Anton Yakovlev              2021-03-02  343  
fa8b73879cefe5 Matias Ezequiel Vara Larsen 2023-10-12  344  		// The buffers should be exposed first during capturing so that
fa8b73879cefe5 Matias Ezequiel Vara Larsen 2023-10-12  345  		// the device can consume them. Capturing cannot begin
fa8b73879cefe5 Matias Ezequiel Vara Larsen 2023-10-12  346  		// otherwise.
fa8b73879cefe5 Matias Ezequiel Vara Larsen 2023-10-12  347  		if (vss->direction == SNDRV_PCM_STREAM_CAPTURE) {
fa8b73879cefe5 Matias Ezequiel Vara Larsen 2023-10-12  348  			rc = virtsnd_pcm_msg_send_locked(vss, false);
da76e9f3e43a71 Anton Yakovlev              2021-03-02  349  			if (rc)
da76e9f3e43a71 Anton Yakovlev              2021-03-02  350  				return rc;
fa8b73879cefe5 Matias Ezequiel Vara Larsen 2023-10-12  351  		}
fa8b73879cefe5 Matias Ezequiel Vara Larsen 2023-10-12  352  
fa8b73879cefe5 Matias Ezequiel Vara Larsen 2023-10-12  353  		spin_lock_irqsave(&vss->lock, flags);
fa8b73879cefe5 Matias Ezequiel Vara Larsen 2023-10-12  354  		vss->xfer_enabled = true;
fa8b73879cefe5 Matias Ezequiel Vara Larsen 2023-10-12  355  		spin_unlock_irqrestore(&vss->lock, flags);
da76e9f3e43a71 Anton Yakovlev              2021-03-02  356  
da76e9f3e43a71 Anton Yakovlev              2021-03-02  357  		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_START,
da76e9f3e43a71 Anton Yakovlev              2021-03-02  358  						GFP_KERNEL);
da76e9f3e43a71 Anton Yakovlev              2021-03-02  359  		if (!msg) {
da76e9f3e43a71 Anton Yakovlev              2021-03-02  360  			spin_lock_irqsave(&vss->lock, flags);
da76e9f3e43a71 Anton Yakovlev              2021-03-02  361  			vss->xfer_enabled = false;
da76e9f3e43a71 Anton Yakovlev              2021-03-02  362  			spin_unlock_irqrestore(&vss->lock, flags);
da76e9f3e43a71 Anton Yakovlev              2021-03-02  363  
da76e9f3e43a71 Anton Yakovlev              2021-03-02  364  			return -ENOMEM;
da76e9f3e43a71 Anton Yakovlev              2021-03-02  365  		}
da76e9f3e43a71 Anton Yakovlev              2021-03-02  366  
da76e9f3e43a71 Anton Yakovlev              2021-03-02  367  		return virtsnd_ctl_msg_send_sync(snd, msg);
575483e90a3292 Anton Yakovlev              2021-03-02  368  	case SNDRV_PCM_TRIGGER_SUSPEND:
575483e90a3292 Anton Yakovlev              2021-03-02  369  		vss->suspended = true;
575483e90a3292 Anton Yakovlev              2021-03-02  370  		fallthrough;
da76e9f3e43a71 Anton Yakovlev              2021-03-02  371  	case SNDRV_PCM_TRIGGER_STOP:
da76e9f3e43a71 Anton Yakovlev              2021-03-02  372  		vss->stopped = true;
da76e9f3e43a71 Anton Yakovlev              2021-03-02  373  		fallthrough;
da76e9f3e43a71 Anton Yakovlev              2021-03-02  374  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
da76e9f3e43a71 Anton Yakovlev              2021-03-02  375  		spin_lock_irqsave(&vss->lock, flags);
da76e9f3e43a71 Anton Yakovlev              2021-03-02  376  		vss->xfer_enabled = false;
da76e9f3e43a71 Anton Yakovlev              2021-03-02  377  		spin_unlock_irqrestore(&vss->lock, flags);
da76e9f3e43a71 Anton Yakovlev              2021-03-02  378  
da76e9f3e43a71 Anton Yakovlev              2021-03-02  379  		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_STOP,
da76e9f3e43a71 Anton Yakovlev              2021-03-02  380  						GFP_KERNEL);
da76e9f3e43a71 Anton Yakovlev              2021-03-02  381  		if (!msg)
da76e9f3e43a71 Anton Yakovlev              2021-03-02  382  			return -ENOMEM;
da76e9f3e43a71 Anton Yakovlev              2021-03-02  383  
da76e9f3e43a71 Anton Yakovlev              2021-03-02  384  		return virtsnd_ctl_msg_send_sync(snd, msg);
da76e9f3e43a71 Anton Yakovlev              2021-03-02  385  	default:
da76e9f3e43a71 Anton Yakovlev              2021-03-02  386  		return -EINVAL;
da76e9f3e43a71 Anton Yakovlev              2021-03-02  387  	}
da76e9f3e43a71 Anton Yakovlev              2021-03-02  388  }
da76e9f3e43a71 Anton Yakovlev              2021-03-02  389  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
