Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4593057333
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 22:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717454268; cv=none; b=iwwFDNi59F/1fcRSbvxGSqo4QR4xNlZEe6/lDHbIqc11VBTQeqxcQMuaDpqi6t9B3JI3bSoyeiSvmpPIHZmsX6HbalbTOQxfe2M31uJxY1ntz+THYIR1QNDve6R/1h/fKvEOI6rPMsypTg7KEOftAFHTImklfVMfZNf9E1Aum5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717454268; c=relaxed/simple;
	bh=68S0DCTPTvLM5/IXL4t+uPBOLkve+gSpSVhJTT9o2mE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MhsiZ0bBymX/bTJH2ScZsBZ2ur4yIygdwGRpfPADVPPu1CT9O7xsVq3Rc/I9pnw0TT7nNSdVLakMcy+GFJlklVSKlVKbarg2QfT6nuhItQ2769nS30ior+iXSf+9kZiPxDS7Btg8Yg1CTiSy97xGXhY6FLIb1FVghwQBBf2j/k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhkQuQ5k; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhkQuQ5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717454266; x=1748990266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=68S0DCTPTvLM5/IXL4t+uPBOLkve+gSpSVhJTT9o2mE=;
  b=BhkQuQ5ksVRWe0e49nP7X6KWVEJf9MzAI7Ffst5WopgC/4bwQtYRrl3N
   May/iY8BFntV7gJjXf4hD1N1N9Z6zubjqm9pvIXiq7oYCkj3fwJZEjoy7
   HMbHXQIz2s4AHHIChr9qhduq/v18UqHUzhKFoRxGtahoxHCmsr1i5pLz8
   Uyrj7Ti0XX6sLljVAgWVOGvLAggRqovGwmkBqLlq3yvPdG6x8sXA/TaD3
   R66dLi7ODaV0EKVi57tBI76oLmUD6Ll12GqLd0V2VlrdSXRY1/G4EUSUc
   QEVRtJ7EtFU9GBK7G0BOUIq33gM70RpLaGEbyOnINOPtUg5IqmnsDIPiU
   g==;
X-CSE-ConnectionGUID: LLKJmWufQu+T3YT5fn+enA==
X-CSE-MsgGUID: d1GF7WFHQduK9Swd4hF5sg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13918115"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="13918115"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 15:37:46 -0700
X-CSE-ConnectionGUID: gf6v5QQ6T1qWv/64HyvEOw==
X-CSE-MsgGUID: DfbfLihpScCh07NE3d7tvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="37082763"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 03 Jun 2024 15:37:45 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEGIn-000MGt-06;
	Mon, 03 Jun 2024 22:37:23 +0000
Date: Tue, 4 Jun 2024 06:36:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 1/2]
 drivers/virtio/virtio_pvclock.c:76:undefined reference to
 `timekeeping_inject_sleeptime64'
Message-ID: <202406040653.Xy6Gwsa3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   d43590185cdff3bcaa12ac03fe7087f587ade366
commit: 04f660d6724f5df1b07f8cf9e1c55f70fb43d1d2 [1/2] ANDROID: virtio: virtio_pvclock: initial driver impl
config: i386-randconfig-054-20240604 (https://download.01.org/0day-ci/archive/20240604/202406040653.Xy6Gwsa3-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406040653.Xy6Gwsa3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406040653.Xy6Gwsa3-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/virtio/virtio_pvclock.o: in function `update_suspend_time':
>> drivers/virtio/virtio_pvclock.c:76:(.text+0x375): undefined reference to `timekeeping_inject_sleeptime64'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +76 drivers/virtio/virtio_pvclock.c

    47	
    48	void update_suspend_time(struct work_struct *work)
    49	{
    50		u64 suspend_ns, suspend_time_delta = 0;
    51		struct timespec64 inject_time;
    52		struct virtio_pvclock *vp;
    53	
    54		vp = container_of(work, struct virtio_pvclock,
    55				  update_suspend_time_work);
    56	
    57		virtio_cread(vp->vdev, struct virtio_pvclock_config, suspend_time_ns,
    58			     &suspend_ns);
    59	
    60		mutex_lock(&vp->inject_suspend_lock);
    61		if (suspend_ns > vp->injected_suspend_ns) {
    62			suspend_time_delta = suspend_ns - vp->injected_suspend_ns;
    63			vp->injected_suspend_ns = suspend_ns;
    64		}
    65		mutex_unlock(&vp->inject_suspend_lock);
    66	
    67		if (suspend_time_delta == 0) {
    68			dev_err(&vp->vdev->dev,
    69				"%s: suspend_time_ns is less than injected_suspend_ns\n",
    70				__func__);
    71			return;
    72		}
    73	
    74		inject_time = ns_to_timespec64(suspend_time_delta);
    75	
  > 76		timekeeping_inject_sleeptime64(&inject_time);
    77	
    78		dev_info(&vp->vdev->dev, "injected sleeptime: %llu ns\n",
    79			 suspend_time_delta);
    80	}
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
