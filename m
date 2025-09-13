Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836E72E2667
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 10:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757760154; cv=none; b=fRSSsZDiBD9Gi0xpZNbPh4xO9abdZ6MjZCsMybvWc/J82ZZFM7DTlF7v9+1e80WTBR2+3YxSJQku0zkWEP5RdO6f3OZH+JrMLqFXhWo6XaX7QqIc6VpTJJkafuHoWgnmPdiVl3YYVmAPFqwLK03BqDbEBaiDF9ASIPjlSYulAiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757760154; c=relaxed/simple;
	bh=L03JCd+cgD+GyqaBSJ0aqtVbPF6f1cVxW6JqC5RCO5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E35aQGu+0eHibIlvo7SiKmwW1X+Fl2Q9Yq9HQ6+rv3OtYKznyMGfDqxUEZaKVKRpW9ORcv/wL1rLO72RyBzTAiMb1whDsh+JLGBe5wzZc07CHACCUmUA0a4/+xxT6L7kW+IxTgXo86SKnoAUEdBwkYjwMqb+L1uU71UqmnpkAgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVXSRu7X; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVXSRu7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757760153; x=1789296153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L03JCd+cgD+GyqaBSJ0aqtVbPF6f1cVxW6JqC5RCO5c=;
  b=iVXSRu7X2be+PoEuzRwg5tIY6oPWQfEZG96gHzEXv0oUE6QPOwXBvLka
   5maDh/UUcNCcu4yWKylLzw1TwYkpsXwKqqu37sWJ9OsGPBuYUoKyYRtv5
   lRlsGNrUk9QtMv201iAMUzw3OcXn0+PN2iBEcOqrvU5K/jMNvLXsy9btU
   NcLf/3Z7larMGG71dbzaD3wkxMb4Fi+W5LUGbV5ES0P8HOVIfq9hTm4lG
   ntdoCj1F8TwNsQEYCJ8hgkxsVfYSu96OxitJt/OAB0boiwqGda5zou1rK
   MwnFJPPenjvNc0gEzBzz6cKE+dx+CnzsGcRznbCMlInqFvXUWOOvZlomY
   w==;
X-CSE-ConnectionGUID: b63UuNxJTi2MczFWMhrZrA==
X-CSE-MsgGUID: LBJI/w4FTX2WU/rtmJpdtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="59787624"
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="59787624"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 03:42:32 -0700
X-CSE-ConnectionGUID: lPP2CcwwTQi4hbogBbz6rA==
X-CSE-MsgGUID: uhHGZ5ctRCW+MMbZpMQu5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="178558783"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 13 Sep 2025 03:42:30 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uxNi8-000000001bH-2lN2;
	Sat, 13 Sep 2025 10:42:28 +0000
Date: Sat, 13 Sep 2025 12:41:44 +0200
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [aegl:rdt-aet-v10 61/61] htmldocs:
 Documentation/filesystems/resctrl.rst:526: WARNING: Inline emphasis
 start-string without end-string. [docutils]
Message-ID: <202509131227.pXo5yK6u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git rdt-aet-v10
head:   89f7ddfa06e19e9b7acd666c1ae7e04034bc2636
commit: 89f7ddfa06e19e9b7acd666c1ae7e04034bc2636 [61/61] x86,fs/resctrl: Update Documentation for package events
reproduce: (https://download.01.org/0day-ci/archive/20250913/202509131227.pXo5yK6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509131227.pXo5yK6u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/jbd2.h
   ERROR: Cannot find file ./include/linux/jbd2.h
   WARNING: No kernel-doc for file ./include/linux/jbd2.h
   ERROR: Cannot find file ./include/linux/netfs.h
   WARNING: No kernel-doc for file ./include/linux/netfs.h
>> Documentation/filesystems/resctrl.rst:526: WARNING: Inline emphasis start-string without end-string. [docutils]
   ERROR: Cannot find file ./include/linux/pipe_fs_i.h
   ERROR: Cannot find file ./include/linux/pipe_fs_i.h
   WARNING: No kernel-doc for file ./include/linux/pipe_fs_i.h
   WARNING: ./drivers/gpu/drm/amd/display/dc/dc.h:254 struct member 'num_rmcm_3dluts' not described in 'mpc_color_caps'
   ERROR: Cannot find file ./include/linux/backlight.h


vim +526 Documentation/filesystems/resctrl.rst

   518	
   519	"mon_data":
   520		This contains directories for each monitor domain. One set for
   521		each instance of an L3 cache, another set for each processor
   522		package. The L3 cache directories are named "mon_L3_00",
   523		"mon_L3_01" etc. The package directories "mon_PERF_PKG_00",
   524		"mon_PERF_PKG_01" etc.
   525	
 > 526		Within each directory there is one file per event. For
   527		example the L3 directories may contain "llc_occupancy", "mbm_total_bytes",
   528		and "mbm_local_bytes". The PERF_PKG directories may contain "core_energy",
   529		"activity", etc. The info/*/mon_features files provide the full
   530		list of event/file names.
   531	
   532		"core energy" reports a floating point number for the energy (in Joules)
   533		consumed by cores (registers, arithmetic units, TLB and L1/L2 caches)
   534		during execution of instructions summed across all logical CPUs on a
   535		package for the current RMID.
   536	
   537		"activity" also reports a floating point value (in Farads).
   538		This provides an estimate of work done independent of the
   539		frequency that the CPUs used for execution.
   540	
   541		Note that these two counters only measure energy/activity
   542		in the "core" of the CPU (arithmetic units, TLB, L1 and L2
   543		caches, etc.). They do not include L3 cache, memory, I/O
   544		devices etc.
   545	
   546		All other events report decimal integer values.
   547	
   548		In a MON group these files provide a read out of the current
   549		value of the event for all tasks in the group. In CTRL_MON groups
   550		these files provide the sum for all tasks in the CTRL_MON group
   551		and all tasks in MON groups. Please see example section for more
   552		details on usage.
   553	
   554		On systems with Sub-NUMA Cluster (SNC) enabled there are extra
   555		directories for each node (located within the "mon_L3_XX" directory
   556		for the L3 cache they occupy). These are named "mon_sub_L3_YY"
   557		where "YY" is the node number.
   558	
   559		When the 'mbm_event' counter assignment mode is enabled, reading
   560		an MBM event of a MON group returns 'Unassigned' if no hardware
   561		counter is assigned to it. For CTRL_MON groups, 'Unassigned' is
   562		returned if the MBM event does not have an assigned counter in the
   563		CTRL_MON group nor in any of its associated MON groups.
   564	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
