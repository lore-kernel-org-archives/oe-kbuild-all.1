Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CCC36AF8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 05:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727761858; cv=none; b=sLcf53K+uWIMiiZEpi3oDl7jyikzKEytz+Jh8K2fXoyUdP4Z8gL3MESthEn3WHCAYzkLsGmofEGsq6xL7MpvmEC/KG0mPNEg6Etkgr5d2rW5zuOHvuwFB38yZnQ1LmyvH0pjZ4aE5yMzrhP957Uh3LicLPYPGnxaSi6yQWnRjxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727761858; c=relaxed/simple;
	bh=LD9AdJhyvaZaqlhnCCBrK3fpEpmbTR3JQtsXMTckvHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jho17q78uga511A38vnmEv4uzRot58QxS0P4fPM3TpHbQ4KxLVO91MTCE1pPfEmtw+/hvjAwrS0yRIxunqDESIkGwEhBUoRt4tf97Hx2/4UjwVVD7SHUaEXxMsfFXl22m+4WABSekOY4E1aO2p9rJrqO1Ntiw2ilUDR2+VNiTNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qp8bL4Oh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qp8bL4Oh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727761857; x=1759297857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LD9AdJhyvaZaqlhnCCBrK3fpEpmbTR3JQtsXMTckvHw=;
  b=Qp8bL4Oh4ry9hhnH8ot1Mj3XQtmrOC2WFUuryBBhAkn8Qh1zQ72xhbVy
   /C6oWvSjnCQUe+2qrgayHoAIpVzm8SEz8Ex2zBgB/J6YnlDNpPI092Pac
   evnJuot+pypcIFdVCVfhOezYcMybb9xFh67dKwfkP4qSylZBXHxCImvK5
   0RcdwFj8qSFzToe//p4B1DVWZsDv/S26xZGsP0MIfCtGlOJhG9VSqMxgF
   Y+SgM+G1PnQs+injOSScfgLhu3m2N4zqt1Lc40qi7pi601flt2+wCzEW/
   nFhxjHwL84MHQkt1316ddPSsFefocLcY20e+Y8CRPxrqDiQ/+sx2hou29
   Q==;
X-CSE-ConnectionGUID: 1kR2W2FeQMi1oVTJG8D95Q==
X-CSE-MsgGUID: NJEZPWqoQ9m3MaWdArP8Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26828713"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="26828713"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 22:50:56 -0700
X-CSE-ConnectionGUID: EJhiS/drQsmYmQY5tPVCJQ==
X-CSE-MsgGUID: fJO8d+TbTYC7ZqEZz05VFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73672525"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Sep 2024 22:50:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svVmf-000QIY-0S;
	Tue, 01 Oct 2024 05:50:53 +0000
Date: Tue, 1 Oct 2024 13:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 1/2]
 drivers/virtio/virtio_pvclock.c:48:6: sparse: sparse: symbol
 'update_suspend_time' was not declared. Should it be static?
Message-ID: <202410011350.AXIF805p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   1dd4a498c91aa13a5f4e61fd40a88aebb5bca367
commit: 04f660d6724f5df1b07f8cf9e1c55f70fb43d1d2 [1/2] ANDROID: virtio: virtio_pvclock: initial driver impl
config: i386-randconfig-061-20241001 (https://download.01.org/0day-ci/archive/20241001/202410011350.AXIF805p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011350.AXIF805p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011350.AXIF805p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/virtio/virtio_pvclock.c:294:9: sparse: sparse: mixing declarations and code
>> drivers/virtio/virtio_pvclock.c:48:6: sparse: sparse: symbol 'update_suspend_time' was not declared. Should it be static?

vim +/update_suspend_time +48 drivers/virtio/virtio_pvclock.c

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
    76		timekeeping_inject_sleeptime64(&inject_time);
    77	
    78		dev_info(&vp->vdev->dev, "injected sleeptime: %llu ns\n",
    79			 suspend_time_delta);
    80	}
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
