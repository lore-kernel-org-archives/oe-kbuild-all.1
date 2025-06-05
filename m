Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8397082D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 01:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749087840; cv=none; b=dqdW2dXA6HUNW85TAmkPP88uleQ1lpPcPzBXEdug71lCj7F8MxV5shUqf5qxTXiOOd9+bjh9UOYzoE2qKl3xKQWe9BhbH29K3dVtlA15SrA+7vCm1y17BWxMNU88Ti06vP/I57FXYn3LXiUSfJeXdjKnBTMSzJwYTTrcDHUTgto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749087840; c=relaxed/simple;
	bh=H64dmfxYbqzW/+6Ob/ONrlq5Yxzv9set2bt5I2vH3nI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kd2oDY7az965AfwoCwMeUsRANi6rh+EZGilYfCE+W+IoT04DFbWpfxG1pre2QG9SGr320oAIXcg7xQ0YhT6hIAy6Zho+/L5+gF4e64AFjwwuijXsOwGA+GSAmPgkRqh4FLvcKYvjJbxMi8Dmiwf6wBJ2cBmCeW5GRGjfKBpDD0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eb+0eHA8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eb+0eHA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749087839; x=1780623839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H64dmfxYbqzW/+6Ob/ONrlq5Yxzv9set2bt5I2vH3nI=;
  b=eb+0eHA88KGOydFw8kkxkMeadsi0YlF8lbHtrjo47NX9z1DrYzgYGWR8
   Km7tSRoHU+gcEgSz0C9mI6lH5YhVjc21/ah7Zp9HNoT+asorEqPqMkaGZ
   851dVru8u8yqrkWI1g7JsPzd8MyB9Xh8ucpCuUpEA8R5j8lud5EhAMKWV
   2wffxs+LI/lPO2t3egiQCiIYAZ/O0SqYs9Jf9lLZu3GrCHKMMzFpjGapT
   bEQeFzcWZfdUysyquwo/wIW3zKLCl6AhtSxofY1fhPF23uPwPvkW5vpLX
   SfYSCWEEunpHSZ9qLhD9qw8XHK9ME0TM6gzyPbchKznFQ19hD6qzWBgcn
   A==;
X-CSE-ConnectionGUID: SHXF+4SLS0uQwaIeGH8XRw==
X-CSE-MsgGUID: d7MnXztAQxWXaKx2bG2UNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50307303"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="50307303"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 18:43:58 -0700
X-CSE-ConnectionGUID: s3k4HLLoSsm8R5M+/180YQ==
X-CSE-MsgGUID: Sxk4HzCbQIuRmfE57Pm7gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="145697666"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Jun 2025 18:43:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMze7-0003bN-00;
	Thu, 05 Jun 2025 01:43:55 +0000
Date: Thu, 5 Jun 2025 09:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-ptp 33/34] kernel/time/vsyscall.c:139:6:
 error: redefinition of 'update_vsyscall_aux'
Message-ID: <202506050936.bXT2AdmQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-ptp
head:   07453cfef5683be5805a70316b1345e7fbeb716b
commit: ebd243e4711bd78d33d6814c8addde1ef40cda4f [33/34] vdso: Add support for auxiliary clocks
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20250605/202506050936.bXT2AdmQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506050936.bXT2AdmQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050936.bXT2AdmQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/vsyscall.c:139:6: error: redefinition of 'update_vsyscall_aux'
     139 | void update_vsyscall_aux(struct timekeeper *tk, u8 clock_index)
         |      ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/time/vsyscall.c:11:
   include/linux/timekeeper_internal.h:196:20: note: previous definition of 'update_vsyscall_aux' with type 'void(struct timekeeper *, u8)' {aka 'void(struct timekeeper *, unsigned char)'}
     196 | static inline void update_vsyscall_aux(struct timekeeper *tk, u8 clock_index)
         |                    ^~~~~~~~~~~~~~~~~~~


vim +/update_vsyscall_aux +139 kernel/time/vsyscall.c

   137	
   138	#ifdef CONFIG_POSIX_AUX_CLOCKS
 > 139	void update_vsyscall_aux(struct timekeeper *tk, u8 clock_index)
   140	{
   141		struct vdso_time_data *vdata = vdso_k_time_data;
   142		struct vdso_timestamp *vdso_ts;
   143		struct vdso_clock *vc;
   144		s32 clock_mode;
   145		u64 nsec;
   146	
   147		vc = &vdata->aux_clock_data[clock_index];
   148		vdso_ts = &vc->basetime[VDSO_BASE_AUX];
   149		clock_mode = tk->tkr_mono.clock->vdso_clock_mode;
   150		if (unlikely(!tk->clock_valid))
   151			clock_mode = VDSO_CLOCKMODE_NONE;
   152	
   153		/* copy vsyscall data */
   154		vdso_write_begin(vdata);
   155	
   156		vc->clock_mode = clock_mode;
   157	
   158		if (clock_mode != VDSO_CLOCKMODE_NONE) {
   159			fill_clock_configuration(vc, &tk->tkr_mono);
   160	
   161			vdso_ts->sec	= tk->xtime_sec;
   162	
   163			nsec = tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
   164			nsec += tk->offs_aux;
   165			vdso_ts->sec += __iter_div_u64_rem(nsec, NSEC_PER_SEC, &nsec);
   166			nsec = nsec << tk->tkr_mono.shift;
   167			vdso_ts->nsec = nsec;
   168		}
   169	
   170		__arch_update_vsyscall(vdata);
   171	
   172		vdso_write_end(vdata);
   173	
   174		__arch_sync_vdso_time_data(vdata);
   175	}
   176	#endif
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
