Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C421B10A0C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 23:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721603074; cv=none; b=Nop46jibRcTYCWYwkBtAh1tILaqbsXZP1cmN6cDgsyhuBhuAXe5DzNUwDcc7qhC+HpcsuT+IxOohZVzbuPBagUzrrVswpaTGUDLsdVunsVShJdUCKH0pfOCVl3Q5Zv26Efc3dW34dmji6Hp9f4rocHWFoE0WvHgrg4imjvb1774=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721603074; c=relaxed/simple;
	bh=3zjd7qlrcnfMFK49YFf3AHHXmn/+0wJtw2OqxEKZyOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JIRdVVC4rXbse/2g7k8C20EGQVyHC7q9Lq3D0Y7II80IRUCuSG/KIrUwi5bB5V6j3fpNrUBicz71t0+CAAlGDnPNiLcHLtU+qYEWa3BzLyOUL6p8v32AROWYeTQKQB1AUQJMSEWj9IGhQLrFPglXkFTZgrVcNXv8y6Z1zN5Lu/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f023IggC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f023IggC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721603072; x=1753139072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3zjd7qlrcnfMFK49YFf3AHHXmn/+0wJtw2OqxEKZyOI=;
  b=f023IggCkyG+k18+7MAgSvow/YESwUogmojpZeK4QKyVyZoEMoRi5N6I
   eHlwNsvGiGxi2D4tuXSLcBRlNYvQRyFVV4eBP97YN+CQ680ZcLLqdWiPe
   nyJGMWKtUCYBxXZCRzIdeSEmQa1IoB/gQQZi/4QMn/7T5efbJ017qaGlf
   WiAjFF6CRwz5AEtyob92AgNMrtdADIskgRxwsOhApM+0/sA/gp/bgtYSO
   D63GW3NbMHQ8+AjEaBaA5HSHesDf0aWtlq+7BEzhZVjSBziHmJ7DnRAhx
   IctoqD/Zlqgjdzf9L29qvsrq9/uF6hh17r9X536HgTq5U5qNgWws/Azie
   A==;
X-CSE-ConnectionGUID: 8VC1e38KSUCeqc7Ki8Yt0Q==
X-CSE-MsgGUID: if8Mb1fkRV+GCb+kFrUQgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="18999323"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="18999323"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 16:04:31 -0700
X-CSE-ConnectionGUID: byqN9yIaQ9aZSaj/BnPl5Q==
X-CSE-MsgGUID: ap9VBclSQQuxQRAYfdiycQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="51410399"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Jul 2024 16:04:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVfbQ-000khi-0I;
	Sun, 21 Jul 2024 23:04:28 +0000
Date: Mon, 22 Jul 2024 07:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 1/2]
 drivers/virtio/virtio_pvclock.c:48:6: sparse: sparse: symbol
 'update_suspend_time' was not declared. Should it be static?
Message-ID: <202407220641.riLTyn05-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   1386767cf46d3f5556ed81a7fe8736520d0cf6c4
commit: 04f660d6724f5df1b07f8cf9e1c55f70fb43d1d2 [1/2] ANDROID: virtio: virtio_pvclock: initial driver impl
config: i386-randconfig-r111-20240722 (https://download.01.org/0day-ci/archive/20240722/202407220641.riLTyn05-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407220641.riLTyn05-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407220641.riLTyn05-lkp@intel.com/

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
