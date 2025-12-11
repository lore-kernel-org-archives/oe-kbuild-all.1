Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E117F26A1B9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 06:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765436027; cv=none; b=hXo5cHVn+mOMNvmspw0RhnHMpfhnqlCY1P0e74m4wapO6EnwJ+uzGVcblc/vxdEzTtakCAPfrKWwrT3A5NwkHYoF1qK6e7EZIg6pMbwiwUgvl78gcXtJAYy8MXUGJR/1FOn8VG8RRkDPcbjTH52P0mFmOoMn42DOiASNymL6ROg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765436027; c=relaxed/simple;
	bh=O6K2a92pGyOezdhJQPDrLWXZ31MBVx6GWNnle811yHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PrWePYXlHRVAkcdtyZTWbp2FIIKqXInCcLWbV+GEjMP8AoIW+qE0Ycy/OBCaloLP/1vY+URgH0zCfjSq1fjKJcFfQB3N4mKmviU/1a6ulRtwwQzEGL1Qyupiy7+8/62YiQIDNkl2sHaUwmWD7NTkxAn84zuRLUa0d+B/Gcu2aw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRqUl1wf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRqUl1wf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765436026; x=1796972026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O6K2a92pGyOezdhJQPDrLWXZ31MBVx6GWNnle811yHs=;
  b=DRqUl1wfFtsEadUzoOF4pgadLhrPuotTqjcp9QDwJYGr4MuzoaoJIJXS
   7LBRO/L8Kt9lfcu9sJVXR61yYAfj3SCjDfP8qCm2R3+j9hvP3ZDEQB4/x
   zb2N0g7oEWOit8Rz7oJvmGcGXMly9WwEZIcDnMJ3Pnk97cBOyCCVoSZtr
   8LL3b4ttd8cy1bfb8yaO7FAwd7auU6qH4ytLaBSUV6M6RYDfyAioZi0i3
   PRW+JY84wM7YT4ZoesrOCB+FS5lTRbT7ixFAhwINjYTprXrhKmDLcmXlt
   UPD8u1nl8FI6eE3gW59zWSBJQ28NBR0vjaYSna2BzgejpX8pFSLy6O6SY
   g==;
X-CSE-ConnectionGUID: tvp1F9YqRM2D7YkkLz7Qvw==
X-CSE-MsgGUID: q38taD7ySlioCqo1r23JMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="92891529"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="92891529"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 22:53:45 -0800
X-CSE-ConnectionGUID: smiaqBwfTmijosGyQyFn2w==
X-CSE-MsgGUID: W7r8VsX5Se+SSLYx29ZjAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201641843"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Dec 2025 22:53:45 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTaYY-000000004Kt-2TEz;
	Thu, 11 Dec 2025 06:53:42 +0000
Date: Thu, 11 Dec 2025 14:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 kernel/sched/core.c:5125:6: warning: no previous prototype for
 '__balance_callbacks'
Message-ID: <202512111450.Gy1oD1yI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1594e8fdf0af3790482e1d7e4d4dd3e5166f4f22
commit: e1d313a431d2c0588f2404486c32057fdd278aa2 [1/1] ANDROID: GKI: vendor code needs __balance_callbacks access
config: x86_64-buildonly-randconfig-005-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111450.Gy1oD1yI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111450.Gy1oD1yI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111450.Gy1oD1yI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:5125:6: warning: no previous prototype for '__balance_callbacks' [-Wmissing-prototypes]
    5125 | void __balance_callbacks(struct rq *rq)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/__balance_callbacks +5125 kernel/sched/core.c

  5124	
> 5125	void __balance_callbacks(struct rq *rq)
  5126	{
  5127		do_balance_callbacks(rq, __splice_balance_callbacks(rq, false));
  5128	}
  5129	EXPORT_SYMBOL_GPL(__balance_callbacks);
  5130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
