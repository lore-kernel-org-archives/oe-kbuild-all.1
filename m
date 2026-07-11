Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7201FD4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 04:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783745360; cv=none; b=GIAx3rOuFlEYNtz1I1+R7Iy6hRfzFtNoqoY5l80Z6M31U4kUPQhQDSGd+lmdjqu3Tm3KjRBLG7mq3W57qZDAvO/z3MhPZrpxAqE7kmFvypMUwcS4UrVrKracEwFfGvvbMR9PExAqDGQjutEFn5Htx9n7N0yHRVS/DbX43Mx7JjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783745360; c=relaxed/simple;
	bh=DC1IrI+H/fSzfrWVtqGmuZdCzMzJUMSWlHqLdZuRYhA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AHaz4vIVwrlRo8pMPX+zq0AWXbPsqKB0gKl2bXgVbq3Uew1+iRdcwa8r2jr++Kvr4tZ8c9Sd4hDSAWJ3SfGfS6vSWyu8ppTEyKxCJR2uut9BktVqfhL8OaGAmlCb6b77wlqfnF+TYYVUxr2xoIG1v574CAiMUjSqgoEhLrR39JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPHu+uH3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPHu+uH3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783745359; x=1815281359;
  h=date:from:to:cc:subject:message-id;
  bh=DC1IrI+H/fSzfrWVtqGmuZdCzMzJUMSWlHqLdZuRYhA=;
  b=CPHu+uH3VzNANPdAFZLOZf4NOmHDyqKyWdMqndgE9YIAzPZ3HoCIBXVD
   /tnudXDPPPC3XLbNUJHhTq04PRRBLwXFfsgMeLXiHKIE7fdyI7r4K2F4G
   YMTQUcJbLvuB4jsvbPsQG6Zr6l9RL4y+JVuJaZ4qFB70IcSQ1sAWiDD7/
   Wo98QvIKbJAZGDSPflgbuVe+l6qRz4/X7XKuvoAVWHebx/EU62vXk0/gD
   f6ouJSpUwVrii0X/+8TYn6o1s0bZdRlWJo/5K52QPMkirIMwZUUvHJjdw
   YIDpCMivKWa5Aqp8JFUFNtCm9JBiKGmMvIGssRcvy9elDXiugR/TCgdJF
   A==;
X-CSE-ConnectionGUID: RgarTCpvQrSKbcvxTjLJkA==
X-CSE-MsgGUID: xtmmWfN9TW+9gjMNO4X0IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83559575"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83559575"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 21:49:18 -0700
X-CSE-ConnectionGUID: /x380vkPSnyr5cglr1w3ng==
X-CSE-MsgGUID: lxkYeqaNQY6sf8CyXzFBmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="285150310"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 10 Jul 2026 21:49:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiPeL-00000000JkV-1u6e;
	Sat, 11 Jul 2026 04:49:13 +0000
Date: Sat, 11 Jul 2026 12:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 264/264]
 drivers/virtio/virtio_pvclock.c:49:6: warning: no previous prototype for
 'update_suspend_time'
Message-ID: <202607111245.1VKIfyly-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Colin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   3ca916c6fe6ce53501541ce826747ff8bb77fb23
commit: 029865ac9555743665dd106b4bbefb2f371849e9 [264/264] ANDROID: virtio: virtio_pvclock: initial driver impl
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260711/202607111245.1VKIfyly-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607111245.1VKIfyly-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607111245.1VKIfyly-lkp@intel.com/

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
