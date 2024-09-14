Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E00A1CF29F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 17:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726334836; cv=none; b=h7OMUF+4dBa37OvZ7uCdgtUa7izseEKJvpznb7tsXrbWWIJ6U3tUw4IxhXUVdjtf5t7oom+z8JK7tCSIz1KIaFhd06/gmIfrp5JcLMBhw1/TMK7Frwvi5M57p5k3XDhbO6lVQlStpw6PsU0aXHl9AP54NLVraNzXddcpQ0NchQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726334836; c=relaxed/simple;
	bh=YUbsjSjhYZ4uX9Hfg8bm2IPQmkPdg6KR8h+0jHf/+mg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eO7ujxG32xYE0tmjPz6KS9eZFrBX3q0co9I1Y2U9c2CE9EyanLu+Zt0bC/4vA5oDGVsh8YJPGg9QRxcTefN9OFUkG5juJ6806OAWh1RT6fRE4HpearpIm4a3WssXUvDwz7S39XvORUFqhG9NHcN1+eUpkeiPY74ILhcpU866NVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YqGKrhy7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YqGKrhy7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726334834; x=1757870834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YUbsjSjhYZ4uX9Hfg8bm2IPQmkPdg6KR8h+0jHf/+mg=;
  b=YqGKrhy7GmGjViOkNTY9NAEia0zHKctKkcYztlphcKxA4UfCSNJSKldd
   caZopXQgTpXoSiPJTJC2Ckr6S5/oHZgSE/vk0BvSONuDc6UAYk7T2NRS5
   7a66icqaeHCYsobR28PpElSGnoq/YcOaT5jXQvC1nC5aNm/W6EU3P19Ga
   T1ibdfzjkUwLA1YRMzZBsusck94ujropp9kv5u30GdWthwNZEcu0Acbv/
   xWwY1vO0MJ1cMuTcG690i4goDVdxtLckHFa6IyPAZ3ypHpUWYcU0XbeVk
   wFzensWGevjRLCWGbmEwQvxDJi7BojIvxOZAX2pIN98YexrmjsuYD2yyp
   Q==;
X-CSE-ConnectionGUID: YQCMgdjhQASvj4b6KJUO0Q==
X-CSE-MsgGUID: LrNxpk1ATyqdPrX8pRUjiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="36358629"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="36358629"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 10:27:14 -0700
X-CSE-ConnectionGUID: gwpgJJBwQB60fLtOZPRj2w==
X-CSE-MsgGUID: IPLCau2ZSu6lx8auSERTMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="72825546"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Sep 2024 10:27:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spWYA-00080M-0l;
	Sat, 14 Sep 2024 17:27:10 +0000
Date: Sun, 15 Sep 2024 01:26:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 1/2]
 drivers/virtio/virtio_pvclock.c:76: undefined reference to
 `timekeeping_inject_sleeptime64'
Message-ID: <202409150106.y7SYDi64-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   b41e3369a8f2bf2fc08e19da3d8c061981f4db89
commit: 04f660d6724f5df1b07f8cf9e1c55f70fb43d1d2 [1/2] ANDROID: virtio: virtio_pvclock: initial driver impl
config: i386-randconfig-062-20240914 (https://download.01.org/0day-ci/archive/20240915/202409150106.y7SYDi64-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409150106.y7SYDi64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150106.y7SYDi64-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/virtio/virtio_pvclock.o: in function `update_suspend_time':
>> drivers/virtio/virtio_pvclock.c:76: undefined reference to `timekeeping_inject_sleeptime64'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DMA_VIRTUAL_CHANNELS
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]

sparse warnings: (new ones prefixed by >>)
   drivers/virtio/virtio_pvclock.c:294:9: sparse: sparse: mixing declarations and code
>> drivers/virtio/virtio_pvclock.c:48:6: sparse: sparse: symbol 'update_suspend_time' was not declared. Should it be static?

vim +76 drivers/virtio/virtio_pvclock.c

    47	
  > 48	void update_suspend_time(struct work_struct *work)
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
