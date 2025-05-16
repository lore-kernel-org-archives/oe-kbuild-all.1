Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A997923C4F3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 17:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747416432; cv=none; b=Svtc2ujZD05EcPYYZxa0EW4e5wYd9xaD3r/9wgVmDCGuAZOr1LCSMOxf7Ckc8FRzzubkIKrSkf8NaKVhOPAqATQQLhjKTOUqsHvgYfmxiKgM9mUZsASydWbIgYwQkei7RuV6U0yrpDnIVYZvSeUsGyPoTAZdBpPATTGkCXMMiOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747416432; c=relaxed/simple;
	bh=AUIHLhy7m412DYKMf0vqbh+85q4hdyCsUSjo6zre8Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SkrJresbnQgprOvtt4FiXA2SyCDUld0dKmM3zA9sLxK/iiN7/Gnhe7ko2Uiaj+CRoD+mO4DlWQKvG2Aw0gWFTTiZptzE5R1rH3BKTD1kskq8h07KzaAV0NXBjT8WCh9ZqnMcoflT7Wt+FpDg9NQFNproKlnp9vB8aJTQtUl7m5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AW7rXt5z; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AW7rXt5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747416431; x=1778952431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AUIHLhy7m412DYKMf0vqbh+85q4hdyCsUSjo6zre8Xo=;
  b=AW7rXt5z5FZuspWBEDXeHKNo90Y+Mt5P7NncPbfjUSI4l5VYleB1R9G6
   metOvsPauylpIHg4V+uO7mX+/EHNM0p7IpOq7/l7AdPu3Bhq6kKKBwkza
   NSsQRAWOlZEV+/amYXAAi7RSk1L/wuxfIalTs+NHrvT5TWqj5MQlX2nFd
   QcFpvRELabb/DrdKZyDWIdZUlo/QgCqCQmZQqGBVIZNeJiwh7JK9XCHIl
   cfTNKztW2a2aPyaJ6W4zRoh44IpLbJIemlYLFMpdLtLZ1wU4oLMIAozbx
   E2a1r/1Lejrd4PYcZdj7SW1H2WHXDEkzVbAX/3x//o63YVaKZLZGaX4Wi
   g==;
X-CSE-ConnectionGUID: caBUsteESIudZuSgH6uYxg==
X-CSE-MsgGUID: D01oVUSxTYyKWhWeHVgCVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="52022162"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="52022162"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 10:27:10 -0700
X-CSE-ConnectionGUID: pdm2e4b0SFmpqOKiZjGALw==
X-CSE-MsgGUID: zAbIU6WfTM+UUn9GmfXaHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="143725371"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 May 2025 10:27:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFypu-000JZN-2D;
	Fri, 16 May 2025 17:27:06 +0000
Date: Sat, 17 May 2025 01:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 141/141]
 include/linux/blkdev.h:1699:17: error: field 'req_list' has incomplete type
Message-ID: <202505170131.7Sur58SY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0690b3438b4acb24f7ecfd946cf9a9ac5954ef20
commit: 24f685a927c5a41df01d66069493bee40a5fb60e [141/141] UPSTREAM: block: add a rq_list type
config: arm-randconfig-002-20250517 (https://download.01.org/0day-ci/archive/20250517/202505170131.7Sur58SY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170131.7Sur58SY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170131.7Sur58SY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:41:
>> include/linux/blkdev.h:1699:17: error: field 'req_list' has incomplete type
     struct rq_list req_list;
                    ^~~~~~~~
   kernel/sched/core.c:4005:21: warning: no previous prototype for 'find_exec_ctx' [-Wmissing-prototypes]
    struct task_struct *find_exec_ctx(struct rq *rq, struct task_struct *p)
                        ^~~~~~~~~~~~~
   kernel/sched/core.c:4098:6: warning: no previous prototype for 'move_queued_task_locked' [-Wmissing-prototypes]
    void move_queued_task_locked(struct rq *src_rq, struct rq *dst_rq, struct task_struct *task)
         ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +/req_list +1699 include/linux/blkdev.h

  1697	
  1698	struct io_comp_batch {
> 1699		struct rq_list req_list;
  1700		bool need_ts;
  1701		void (*complete)(struct io_comp_batch *);
  1702	};
  1703	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
