Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7741D3A9631
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 23:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774911955; cv=none; b=aZfMFiI6wtPdVN9V7GiXkjinb2I7bs0MquIyJ/+jbCCsqLIUwgk5VqAWJFjyeVRAC+9EBc1iyvDGsLSlq2Jx2jctK7T3NToE2hzLEIe3WxpZ7Nhuy2CZwEymerL8z3duM/oK/Sj4XRea1lLU0fVue3lMNnjMW7PvtK4NzFKX760=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774911955; c=relaxed/simple;
	bh=DfU+GBW7Cjwhyx0G9UFYCada93ySbscC08FmJyzvEpY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JnYk+7BBEhZ2AyzTfo4LfuQaUeDElp/s+OrCB8hc3ZlUv/3DPwz415Ntf7f+1rOxehkdXvmg4VzEx0sisM7LHxN6atcxrlSYioa9HgykRtVd3YNg7yeqJV08qtsL8nW4bUlunQskqjeITKzt4MmdbGnDjOZCo54EqhCweLwm7pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dh7A6a2m; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dh7A6a2m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774911953; x=1806447953;
  h=date:from:to:cc:subject:message-id;
  bh=DfU+GBW7Cjwhyx0G9UFYCada93ySbscC08FmJyzvEpY=;
  b=dh7A6a2mE5+if3Awl5sZ/FoNu5N61d4apiTga81T7bXek371X1pHfFcg
   1/rD/ohaKWoH7Jknbf1BODYGcgas3D11nJzcW1z5HU2FW9uf8tdJTo7FN
   VoUtssQNS14Nd3eZst9+HVC4U+QKQXkk/19klYwdRnnPOuOVp1ZAi87Xo
   5IMHZm6QobwWlwGs9XVJEZG+seeiObPvC9Q6JmCJsy7ucwn1GoNJurXQt
   eHe0Lcxy9OqqJ8eHztOJrXQvXi/NT0BgE4l4BZoU6QVq46iy4pP6Qy1iX
   AFj56R2nkOmzyOb0MqrhWgsUMjNcNbQnAP+3ZllGs0XuK1LlTdOIsoSqZ
   Q==;
X-CSE-ConnectionGUID: QWEvTUMpR8ezBOBmOadU5Q==
X-CSE-MsgGUID: e7Zi/ov6QJqbtE9MKcxXLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="93297873"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="93297873"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 16:05:53 -0700
X-CSE-ConnectionGUID: v8zRWPSiSbSDM0HwiyqDCQ==
X-CSE-MsgGUID: xl02CUtsS8ioT2VAXmdp9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="256688174"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Mar 2026 16:05:52 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Lg5-000000001pe-2rro;
	Mon, 30 Mar 2026 23:05:49 +0000
Date: Tue, 31 Mar 2026 07:05:01 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:trace/for-next 13/16]
 kernel/trace/trace_snapshot.c:395:20: error: redefinition of
 'latency_fsnotify'
Message-ID: <202603310604.lGE9LDBK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   e197453eb0c110d3d83fd1d2b324a93d5fcfa314
commit: bade44fe546212e142befb69ba22f34944030a99 [13/16] tracing: Move snapshot code out of trace.c and into trace_snapshot.c
config: i386-buildonly-randconfig-005-20260331 (https://download.01.org/0day-ci/archive/20260331/202603310604.lGE9LDBK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310604.lGE9LDBK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310604.lGE9LDBK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace_snapshot.c:395:20: error: redefinition of 'latency_fsnotify'
     395 | static inline void latency_fsnotify(struct trace_array *tr) { }
         |                    ^~~~~~~~~~~~~~~~
   In file included from kernel/trace/trace_snapshot.c:6:
   kernel/trace/trace.h:852:20: note: previous definition of 'latency_fsnotify' with type 'void(struct trace_array *)'
     852 | static inline void latency_fsnotify(struct trace_array *tr) { }
         |                    ^~~~~~~~~~~~~~~~


vim +/latency_fsnotify +395 kernel/trace/trace_snapshot.c

   382	
   383	void latency_fsnotify(struct trace_array *tr)
   384	{
   385		if (!fsnotify_wq)
   386			return;
   387		/*
   388		 * We cannot call queue_work(&tr->fsnotify_work) from here because it's
   389		 * possible that we are called from __schedule() or do_idle(), which
   390		 * could cause a deadlock.
   391		 */
   392		irq_work_queue(&tr->fsnotify_irqwork);
   393	}
   394	#else
 > 395	static inline void latency_fsnotify(struct trace_array *tr) { }
   396	#endif /* LATENCY_FS_NOTIFY */
   397	static const struct file_operations tracing_max_lat_fops;
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
