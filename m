Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1643438B5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 May 2026 03:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779678895; cv=none; b=q2WzYN1xLbBV1uYFn5bKAFawhP4ZtkiVaOEaY1c6n6ILAowB0xdQwpeUPmXZ3IU+y0qgepqpPAoxW1fzuCSixg0aU/Gtfo2mXS4DskXZCXEUxfeOem+XdfmrTIlnHfDVVjBKri6Ai/6PuueEdZLilnD4YFXQK+EyhTkp38R2cps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779678895; c=relaxed/simple;
	bh=+BKif4Emq/CHerD5Xpg7+D2gLgPzGs9oDSF3KeiHxNM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uMvk34P9g0oKIP8hA/ODrjGfSZNj+J7cZnSHmVWa7GKH0O+7GoUg6Ffm+wU6EudXwCX4Kw/5lhmntrZPjYs3itjjXKmOEFjOU47SHj0tla4VdvMqaF7fs8pspcrpESZxkcb6boWCbAnm+NGeKllspwhGv6Cw3Yr/Sk9ofhP1BU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8vtk3iM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8vtk3iM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779678894; x=1811214894;
  h=date:from:to:cc:subject:message-id;
  bh=+BKif4Emq/CHerD5Xpg7+D2gLgPzGs9oDSF3KeiHxNM=;
  b=b8vtk3iMsUeUwk3U8vV8qfQbK8/0VYSu/HkGTcsclMDmWJgtbdd87XDA
   gD0A4A2PsVd98w4pUzQU46VqwnOLMqjpzpqygFBNbAwdMRN7hxQlpeydG
   Zs6vQHoBDzL2trzm8VkVFYxA3vF1UYXHVq67hvohYBS5jadVuWpmy7FVY
   LuqPv/FSFwNoBOlSEX8MQxEMV5tK6QVl0ieq16tA1/q26e+XNOhc2irkl
   gKLnnXYVcrrFvO+ilqtt1Fy0iUCHUF8f0Ol/6UFj/KKSMSpaCi8FeIAfx
   ymok402eK8SVWkQjxQIEqqWkXjo5AinuJXCLwCXEH07zazE2shnaZGVz4
   Q==;
X-CSE-ConnectionGUID: S+9qmXSpT6qoEkmXOv91hQ==
X-CSE-MsgGUID: XgUie3fwR2SYWXbFWT/dSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="90798693"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="90798693"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 20:14:53 -0700
X-CSE-ConnectionGUID: BIg4na6bR2SyZtUaOO1wBg==
X-CSE-MsgGUID: J6NM3TF5QMOFkGAJZrsx7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="238908758"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 May 2026 20:14:52 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRLmD-000000000vt-3H6X;
	Mon, 25 May 2026 03:14:49 +0000
Date: Mon, 25 May 2026 11:13:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/ptp/timekeeping 25/25]
 drivers/ptp/ptp_ocp.c:1495:22: error: 'struct ptp_system_timestamp' has no
 member named 'post_ts'; did you mean 'post_sts'?
Message-ID: <202605251147.Ib6oQ1cb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/ptp/timekeeping
head:   d9d5595e7f34acb2b685e7a24823be9e8ee2f771
commit: b6cd536db6489b8027324ebbf6a5c8377bda36ed [25/25] ptp: Switch to ktime_get_snapshot_id() for pre/post timestamps
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260525/202605251147.Ib6oQ1cb-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260525/202605251147.Ib6oQ1cb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605251147.Ib6oQ1cb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ptp/ptp_ocp.c: In function '__ptp_ocp_gettime_locked':
>> drivers/ptp/ptp_ocp.c:1495:22: error: 'struct ptp_system_timestamp' has no member named 'post_ts'; did you mean 'post_sts'?
    1495 |                 sts->post_ts.sys -= bp->ts_window_adjust;
         |                      ^~~~~~~
         |                      post_sts


vim +1495 drivers/ptp/ptp_ocp.c

  1474	
  1475	static int
  1476	__ptp_ocp_gettime_locked(struct ptp_ocp *bp, struct timespec64 *ts,
  1477				 struct ptp_system_timestamp *sts)
  1478	{
  1479		u32 ctrl, time_sec, time_ns;
  1480		int i;
  1481	
  1482		ptp_read_system_prets(sts);
  1483	
  1484		ctrl = OCP_CTRL_READ_TIME_REQ | OCP_CTRL_ENABLE;
  1485		iowrite32(ctrl, &bp->reg->ctrl);
  1486	
  1487		for (i = 0; i < 100; i++) {
  1488			ctrl = ioread32(&bp->reg->ctrl);
  1489			if (ctrl & OCP_CTRL_READ_TIME_DONE)
  1490				break;
  1491		}
  1492		ptp_read_system_postts(sts);
  1493	
  1494		if (sts && bp->ts_window_adjust)
> 1495			sts->post_ts.sys -= bp->ts_window_adjust;
  1496	
  1497		time_ns = ioread32(&bp->reg->time_ns);
  1498		time_sec = ioread32(&bp->reg->time_sec);
  1499	
  1500		ts->tv_sec = time_sec;
  1501		ts->tv_nsec = time_ns;
  1502	
  1503		return ctrl & OCP_CTRL_READ_TIME_DONE ? 0 : -ETIMEDOUT;
  1504	}
  1505	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
