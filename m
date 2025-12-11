Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2875721CA0D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 04:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765425815; cv=none; b=DELY8S/HEHJq2zMmlbdr7VE5bIQTLErjQT4TuYCueZcMMUhJKkoy1csgu2s25daF6ilAUcBYeztv7/qRBFpbVW4xkAoNG3s4cgwIDnb04Gu1zlnjCy0/slbv/NEAyMlep3G/lZC4aZrr5i2+PxmNFO+Ty21jDCXU2yTawt2fJUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765425815; c=relaxed/simple;
	bh=8tl31TuE3faPm94M5reX7MHAtxutTvlprd5vXyPjWTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lgyhage1aH85W2VN8LHvDpB/AxnHsfUQcAddRMXdBofAjvbE4RTorw5lHveSiv2pK2w2UaR3witKSCc56b/jNkvd3+0rFvFDqD4AiGjjPImMkk4jA7MkJkaPo+yO9sDhhiaH3w8qm2gmhy4AMuOuMPuVozXLSHwQ1jMZGz99Nm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E43/NstJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E43/NstJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765425814; x=1796961814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8tl31TuE3faPm94M5reX7MHAtxutTvlprd5vXyPjWTU=;
  b=E43/NstJx9Z3PB1qE4Wrp7KMPEWY3mYRzcXJBAiVNRySv9SnNjeaFgNQ
   2ASMWmZMWK2A1ka8XqGXzUhEgHCB1CXzCsCQEyGLKya0yeWulYLN4glWt
   zhxlGpA84p73Talr81OzgfUWIopKlVwQHzfqcw86jkWjb99AQLOrlHKY9
   sGORJ+v+88qNAdC4NH2jAkgVxNMRIOJbxTbvKarLqDC+gAEaJ9ThkacF6
   sGtxaqqWuO0VJdp8C75HpHrUO/0ihmso2o4llc81KTzDOV6fgmveOsOzA
   1lbFUxfPXGH4A5A4xEANcw14A5I6ZhPo2zifi0wsfk7XZ7wWl0XuGXaHo
   A==;
X-CSE-ConnectionGUID: jnR+/AmyRRa920i5kerRcg==
X-CSE-MsgGUID: xvhfI4boQLu6jgzFPKntBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="85011451"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="85011451"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 20:03:33 -0800
X-CSE-ConnectionGUID: 7dVw88TMTcSvSqt0CZkM/Q==
X-CSE-MsgGUID: Kucsm++VTvu7QCObLvL4Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201787123"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Dec 2025 20:03:32 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTXtp-0000000048D-344q;
	Thu, 11 Dec 2025 04:03:29 +0000
Date: Thu, 11 Dec 2025 12:02:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 kernel/sched/pelt.c:497:5: warning: no previous prototype for
 'sched_pelt_multiplier'
Message-ID: <202512111216.m2RRDz2Q-lkp@intel.com>
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
commit: 2cfadc71a6ece9c1fc4a17475547d1a0692687d1 [1/1] FROMLIST: sched/pelt: Introduce PELT multiplier
config: x86_64-buildonly-randconfig-005-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111216.m2RRDz2Q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111216.m2RRDz2Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111216.m2RRDz2Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:56:
>> kernel/sched/pelt.c:497:5: warning: no previous prototype for 'sched_pelt_multiplier' [-Wmissing-prototypes]
     497 | int sched_pelt_multiplier(const struct ctl_table *table, int write, void *buffer,
         |     ^~~~~~~~~~~~~~~~~~~~~


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
