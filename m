Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B8829AAFA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766239203; cv=none; b=CxnVmONWMsxjuBlJ8YdZnNJnNow9w/8weaZM45nNUn9K+D3SJFzMdg6sOzwh6JLhJpTYicJzuu0nsLCV5I6mJ4H6HtpG/vY7+Crh1QORP5FJ2DLXUWc3Sw8v6SPufW1aqMIEUy3psXjosBkx8sQagECw+k65yoxxKWtC7YwPUFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766239203; c=relaxed/simple;
	bh=Aob41hppuSt3e8tk+MZpnGXazQIW6KIrrVOUYQbW3dk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uDQhP260flddZttvOcqPJ1DicSWGstkB4IQL3k110w0koVvpQP/gCMx9o1pRU6uBoN8gR46IoU+4mSEES06h9pxiprdtm2J29tPWrZpUueBdIj0yrlkyq08rUKHF9PvkjDxZRwQCYEMLhbmVvP0mo3aWOtPj5FUZfhz3NmhPd9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eh8lQZTy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eh8lQZTy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766239198; x=1797775198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aob41hppuSt3e8tk+MZpnGXazQIW6KIrrVOUYQbW3dk=;
  b=eh8lQZTyLDhRU9NpgT+tvAeiQWpVvHzXDgu78fYAERANDHwNb+aWitgA
   DSpOHoIFz979WiF5wDuajMWooFU8soVCxSv+V5lclOeMhdP6FTLG+Ywe0
   Vg2yx2nT2I5w7c4hWp8ONdgU5EOc7pl+YHGMwAUvlXAYGkLbJvhRLJiF0
   bYS47uSJ3O+orWSiYfB8I1oyfmFC1ZHMkxZLO1ttafZXGS2j4IV2vkDI6
   iQAQKaqNvJ6KfU4QgZEXlksTZIZ1vYvRhDDZ+H9m6lEbvpnVw3KwGWJPS
   zUBOwbdrIuHoHm2sPe/yLn/+1+A6V9RNLjoftW0HOemFrU41RQbVsEiaU
   A==;
X-CSE-ConnectionGUID: 1ruHZrTPTw6W2bBM3sx1CA==
X-CSE-MsgGUID: E2zEuj2GRzGO4dYoE8bOpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85759181"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85759181"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 05:59:57 -0800
X-CSE-ConnectionGUID: JvewSxKpSimBdyx40HAf5w==
X-CSE-MsgGUID: F5dM0JJSQ/eueQdI57P3dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199093297"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Dec 2025 05:59:56 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWxUv-000000004b7-463b;
	Sat, 20 Dec 2025 13:59:53 +0000
Date: Sat, 20 Dec 2025 21:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3547/3547] kernel/crash_core.c:749:1: sparse:
 sparse: symbol '__crash_hotplug_lock' was not declared. Should it be static?
Message-ID: <202512202121.96JSWGZX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: e2a8f20dd8e9df695f736e51cd9115ae55be92d1 [3547/3547] Crash: add lock to serialize crash hotplug handling
config: x86_64-randconfig-122-20251217 (https://download.01.org/0day-ci/archive/20251220/202512202121.96JSWGZX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202121.96JSWGZX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202121.96JSWGZX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/crash_core.c:749:1: sparse: sparse: symbol '__crash_hotplug_lock' was not declared. Should it be static?

vim +/__crash_hotplug_lock +749 kernel/crash_core.c

   741	
   742	/*
   743	 * Different than kexec/kdump loading/unloading/jumping/shrinking which
   744	 * usually rarely happen, there will be many crash hotplug events notified
   745	 * during one short period, e.g one memory board is hot added and memory
   746	 * regions are online. So mutex lock  __crash_hotplug_lock is used to
   747	 * serialize the crash hotplug handling specifically.
   748	 */
 > 749	DEFINE_MUTEX(__crash_hotplug_lock);
   750	#define crash_hotplug_lock() mutex_lock(&__crash_hotplug_lock)
   751	#define crash_hotplug_unlock() mutex_unlock(&__crash_hotplug_lock)
   752	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
