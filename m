Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6943279DC2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 05:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774416981; cv=none; b=ZaEA79HvKtdRWIZvfnpbnVy8kzBMi1GUBCS0tmwWLH6QX9qYS1O/KSONymV6gBKJDkDLzxwO0DKnI+RMej0tWwlmliaoPSVVNmOcOHbyZ0GbSyby/Gmyyl3sJ1LGL2pJBrscq3rMvU4NSyr3HpqPxuPCznQ89OyJz2enLIOZwt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774416981; c=relaxed/simple;
	bh=QSq+ysLGbXtgtJT5x2i4zONoJE/DNQLaMZwbKr5svM0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fdh4bynxgB7LWEpj/DkxuDJXTCYWFULebc1XT7y/JbKOU6XTf29lMtCMJ23OprmyLgW0nPPi9hchbQRVSrxUY77CvepTGYzdONKK6wo8NITWX7wrC3bVeoQK1qAUEB+e7gzCW0zaRkzNE72j5lTws9a7ngyO1J8VZPrrOC7uit0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atI5Penj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atI5Penj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774416978; x=1805952978;
  h=date:from:to:cc:subject:message-id;
  bh=QSq+ysLGbXtgtJT5x2i4zONoJE/DNQLaMZwbKr5svM0=;
  b=atI5Penj/5mjnXwYI7qabVLT+uQaGjH4rtZkRbmOCt7gTChit1uAag5v
   gtx1aKxitFrD2664OAs8APMufNqh6oEVjQ7w5vNMwSlhkdbAQyfZbTEy1
   YOyLtk9xgoXvg3E1DSv6iZy1cLCDMCQLnTWzpZMuCi/b18Uug50N9h1WF
   ihQQzTO2V2OmOdBcm46T5idocO/WcSFfcE/Et3CyahOzd7aWY8//5jq88
   7ZU61oUdv2X2Q7l065kwmd+ORJ1QMPWXlEViA/GgR6CQcF0NOoeywT5jS
   HecSpaQrA8VqJ7VHSGRmhTl9klH+Zp9G5eQoVpy9pw+IyRhJehnDQ38K9
   w==;
X-CSE-ConnectionGUID: DXGg1hY/ROGanoVUv5VCPA==
X-CSE-MsgGUID: vI6PBrJaQWGUaGYijr8PzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75471954"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75471954"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 22:36:18 -0700
X-CSE-ConnectionGUID: FaIuAVCfT+iNZeqGTCXctA==
X-CSE-MsgGUID: vms/xDBYTv6dOnjC/Nnmng==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Mar 2026 22:36:16 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Guc-000000006FN-0txA;
	Wed, 25 Mar 2026 05:36:14 +0000
Date: Wed, 25 Mar 2026 13:35:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 218/218]
 drivers/virtio/virtio_pvclock.c:49:6: warning: no previous prototype for
 'update_suspend_time'
Message-ID: <202603251335.a4z2YOJ3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Colin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   11d64ee60c8304d3468e4ced34971775c95e3429
commit: 029865ac9555743665dd106b4bbefb2f371849e9 [218/218] ANDROID: virtio: virtio_pvclock: initial driver impl
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260325/202603251335.a4z2YOJ3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251335.a4z2YOJ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251335.a4z2YOJ3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_pvclock.c:49:6: warning: no previous prototype for 'update_suspend_time' [-Wmissing-prototypes]
      49 | void update_suspend_time(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_pvclock.c: In function 'virtpvclock_validate':
   drivers/virtio/virtio_pvclock.c:295:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     295 |         uint32_t rating =
         |         ^~~~~~~~


vim +/update_suspend_time +49 drivers/virtio/virtio_pvclock.c

    48	
  > 49	void update_suspend_time(struct work_struct *work)
    50	{
    51		u64 suspend_ns, suspend_time_delta = 0;
    52		struct timespec64 inject_time;
    53		struct virtio_pvclock *vp;
    54	
    55		vp = container_of(work, struct virtio_pvclock,
    56				  update_suspend_time_work);
    57	
    58		virtio_cread(vp->vdev, struct virtio_pvclock_config, suspend_time_ns,
    59			     &suspend_ns);
    60	
    61		mutex_lock(&vp->inject_suspend_lock);
    62		if (suspend_ns > vp->injected_suspend_ns) {
    63			suspend_time_delta = suspend_ns - vp->injected_suspend_ns;
    64			vp->injected_suspend_ns = suspend_ns;
    65		}
    66		mutex_unlock(&vp->inject_suspend_lock);
    67	
    68		if (suspend_time_delta == 0) {
    69			dev_err(&vp->vdev->dev,
    70				"%s: suspend_time_ns is less than injected_suspend_ns\n",
    71				__func__);
    72			return;
    73		}
    74	
    75		inject_time = ns_to_timespec64(suspend_time_delta);
    76	
    77		timekeeping_inject_sleeptime64(&inject_time);
    78	
    79		dev_info(&vp->vdev->dev, "injected sleeptime: %llu ns\n",
    80			 suspend_time_delta);
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
