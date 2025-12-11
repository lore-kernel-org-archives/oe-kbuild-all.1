Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04A429B8C7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 06:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765436029; cv=none; b=tgQST6ghd1AfZ+zzs6UYjYZhXo8JWpLN20eA4IC+WxbG1XSHgnH80F9VsVfT5lyTrG3CgXGT1fyNJDixqPGRzIWxmMMKf1AU2kgtvqErtO0Ofpw7z+46DN5PmLqw0dIiAj+xoD609LdY5Crfdtb/+rMFe1cJhzhz8a95t+DJYsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765436029; c=relaxed/simple;
	bh=os/noEFtAWigib2G8Shd5x1PmZPyd5hMWfFZc7my3xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XVYlcnjAFie1gj09EPE9umJhfQGzsSM0m3PovBZsaVB4wleaDwptzwrvUmrpIlsigY922Xwtu+Ye4nV5vppYoFPSDx4eUaP5xQmbN7NqnUuLqTKsfq3EQfq3GjoN67vQBj28Q3Pzw44ne+wXtMzFiwYddr62PB8HkWfB0h4Cj3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lrbt3Oqd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lrbt3Oqd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765436028; x=1796972028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=os/noEFtAWigib2G8Shd5x1PmZPyd5hMWfFZc7my3xg=;
  b=Lrbt3OqdaPevvjH1khoEQIyg/UUP6bM/Fl/DD+LoxdlSai//i5bqw9RN
   2ukrw7hdAkgT37Alisla4QFQLAPkBqBphwsgJftDKss7UeksY+p5S9i5F
   tI6hlfasAyb+ZrsF039zFhi9R983534suh8RJdwin++n42n7iBHtZo3NX
   iTE8/X3AzKHpwIcYj9jg3/pAJV9dgaNeA+nEkysnjpnLBCwVOb5UF53Pr
   GY20qLgmN7egSrA6DhPi5jnlPmDMhLf4DdYhIhDjXp3MRT5IlM2TEFTsb
   TPzas93tWoE+G1Dga2mvG9xfEtyxO+APt8HQrJKPtO6LxZglEkDcTzNzf
   w==;
X-CSE-ConnectionGUID: qpIJRHV8Qj67Q9SLkD937Q==
X-CSE-MsgGUID: 4Fb0lFXvTam7f4X5QQWslw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="92891530"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="92891530"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 22:53:45 -0800
X-CSE-ConnectionGUID: obAhHA0dRdmM3xwVpyZQXQ==
X-CSE-MsgGUID: Cjs/VrlsRSq7jHNoU0vAPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201641844"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Dec 2025 22:53:45 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTaYY-000000004Kw-2XVi;
	Thu, 11 Dec 2025 06:53:42 +0000
Date: Thu, 11 Dec 2025 14:53:25 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/5] kernel/sched/fair.c:9181:6:
 warning: no previous prototype for 'id_can_stop_tick'
Message-ID: <202512111441.9xWHJO2L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   38743d2d77ee27e7fe97c7ef81b8643365903536
commit: 4093033106109a3d632b6fec20885521c94cdeb0 [0/5] anolis: sched: push expellee tasks to a runnable cpu when expel starts
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251211/202512111441.9xWHJO2L-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111441.9xWHJO2L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111441.9xWHJO2L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c:4264:6: warning: no previous prototype for 'set_group_prefer_node' [-Wmissing-prototypes]
    4264 | void set_group_prefer_node(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'set_group_prefer_node':
   kernel/sched/fair.c:4293:33: error: implicit declaration of function 'cpu_load'; did you mean 'cpu_of'? [-Wimplicit-function-declaration]
    4293 |                         load += cpu_load(cpu_rq(cpu));
         |                                 ^~~~~~~~
         |                                 cpu_of
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:7451:22: error: conflicting types for 'cpu_load'; have 'long unsigned int(struct rq *)'
    7451 | static unsigned long cpu_load(struct rq *rq)
         |                      ^~~~~~~~
   kernel/sched/fair.c:4293:33: note: previous implicit declaration of 'cpu_load' with type 'int()'
    4293 |                         load += cpu_load(cpu_rq(cpu));
         |                                 ^~~~~~~~
>> kernel/sched/fair.c:9181:6: warning: no previous prototype for 'id_can_stop_tick' [-Wmissing-prototypes]
    9181 | bool id_can_stop_tick(struct rq *rq)
         |      ^~~~~~~~~~~~~~~~


vim +/id_can_stop_tick +9181 kernel/sched/fair.c

  9172	
  9173	#if defined(CONFIG_NO_HZ_FULL) && defined(CONFIG_SMP)
  9174	bool id_can_stop_tick(struct rq *rq)
  9175	{
  9176		if (!sched_feat(ID_PUSH_EXPELLEE))
  9177			return true;
  9178		return !sched_idle_rq(rq);
  9179	}
  9180	#else
> 9181	bool id_can_stop_tick(struct rq *rq)
  9182	{
  9183		return true;
  9184	}
  9185	#endif
  9186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
