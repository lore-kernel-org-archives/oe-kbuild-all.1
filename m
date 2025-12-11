Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CED728CF41
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765435367; cv=none; b=r6uO6yG2Y4V6oLnsrU7AwMpzbl3MpTPQhqcsg/YFNZqrlLvh4OE0OA+UhqfeQui4zSBKFJas9SC/mc8CxfAdX2qDcomPaU+6djOUUUV+h2SxJFdQmzEL8qjsOt37uidj1GBF9/wu+4ozU6hSyFfoJCJN9hyL3F8X3e0ontZNR4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765435367; c=relaxed/simple;
	bh=GS4ce0QFdYy3fNhkY1XD4kFtxR2EyllM7/XMqe8vDhg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iGde8QkF2UH+SG+DGd9siSVQPo9kyvYc5KusIeM7gE69mahFUPB1ijKBM8bwDzO2EZqKbOBCmIh71lcnWG7jo1bflY/3ymdZx1JU3gvKHeJJSDRQlMMMCqpzwhPHsn3g8q4rDKuIz8yXQUjQHPsSkCzYALy+rFCNdDOsIKC+Fws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kK4qR919; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kK4qR919"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765435365; x=1796971365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GS4ce0QFdYy3fNhkY1XD4kFtxR2EyllM7/XMqe8vDhg=;
  b=kK4qR919f8dikeqq+06/k9AqIHGHAAu2ZKV/8yh+pnXUXKc1XLG47ymn
   e8XuhtZNwskqpHQ2xj8pzZInuD+2g9m6POpRP1JlVZtw/GZm7he9sgdjh
   QZlaah4QTzAwup9xNvMekaNlfxM7GgYGRyUv4+2J2kh9Ny9TnBZVqfQtJ
   XbE8pvr3RjO5y2vmRicsbcTREhb+g5STD/cMxi+ok4PgtHYqJaLg82DdN
   A95CiOduqH1cbAWcifFiNV/yoKh2snYoRQdpG8GixQBKX73uZHFto9yBL
   vMgVT8Vinwvlr7UeYra1/Rw99LT5ROTpyVx57kMALxPv04c8YdBzX9zJN
   g==;
X-CSE-ConnectionGUID: ue6Dk0HGRAabPZcF7DUSBA==
X-CSE-MsgGUID: rO+dmWRuTGmaqX+d7VZMEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67451075"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67451075"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 22:42:45 -0800
X-CSE-ConnectionGUID: QBMLfPETRdG76kjqHpLMSQ==
X-CSE-MsgGUID: lCGLyf2XT9WAzVjBL9wsTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196324493"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Dec 2025 22:42:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTaNt-000000004Jl-3DuW;
	Thu, 11 Dec 2025 06:42:41 +0000
Date: Thu, 11 Dec 2025 14:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 2/2]
 kernel/sched/pelt.c:497:5: warning: no previous prototype for function
 'sched_pelt_multiplier'
Message-ID: <202512111407.8qRtVqPy-lkp@intel.com>
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
commit: 2cfadc71a6ece9c1fc4a17475547d1a0692687d1 [2/2] FROMLIST: sched/pelt: Introduce PELT multiplier
config: i386-randconfig-141-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111407.8qRtVqPy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111407.8qRtVqPy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111407.8qRtVqPy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:56:
>> kernel/sched/pelt.c:497:5: warning: no previous prototype for function 'sched_pelt_multiplier' [-Wmissing-prototypes]
     497 | int sched_pelt_multiplier(const struct ctl_table *table, int write, void *buffer,
         |     ^
   kernel/sched/pelt.c:497:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     497 | int sched_pelt_multiplier(const struct ctl_table *table, int write, void *buffer,
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]


vim +/sched_pelt_multiplier +497 kernel/sched/pelt.c

   496	
 > 497	int sched_pelt_multiplier(const struct ctl_table *table, int write, void *buffer,
   498				  size_t *lenp, loff_t *ppos)
   499	{
   500		static DEFINE_MUTEX(mutex);
   501		unsigned int old;
   502		int ret;
   503	
   504		mutex_lock(&mutex);
   505		old = sysctl_sched_pelt_multiplier;
   506		ret = proc_dointvec(table, write, buffer, lenp, ppos);
   507		if (ret)
   508			goto undo;
   509		if (!write)
   510			goto done;
   511	
   512		switch (sysctl_sched_pelt_multiplier)  {
   513		case 1:
   514			fallthrough;
   515		case 2:
   516			fallthrough;
   517		case 4:
   518			WRITE_ONCE(sched_pelt_lshift,
   519				   sysctl_sched_pelt_multiplier >> 1);
   520			goto done;
   521		default:
   522			ret = -EINVAL;
   523		}
   524	
   525	undo:
   526		sysctl_sched_pelt_multiplier = old;
   527	done:
   528		mutex_unlock(&mutex);
   529	
   530		return ret;
   531	}
   532	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
