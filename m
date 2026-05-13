Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7625E33DEF7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 20:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778705251; cv=none; b=uQACsLL7eYcGeoJ5z9FMhf4k9Q8ycNoEoVRY3aAq4PQmCm97BeNTRufmS7m56alkImGlNKevVJQwzF8X9hKLQZk2dd2FrjU0LmgFAFhJ8mZSDiAEvfs+z0rOkAxlh+sIbkzOV22fu9gkHj11qitfrhOwW9sATmWl6QcM5+/lSkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778705251; c=relaxed/simple;
	bh=hqM6ZNM3jNtpvv+g5MS2/AWj9NOe8t6BVcNiHz9cQ+c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UPaBaOzX+d0TZAVYdIkk1Myz7Wm1vz9sY2y2N+SD2Ke+l2u0Fb0nlPQYdyhXwh7gDY2DLJMsrPMYCJJK5zK3c2ENm+JGP2V5uuoEYyXlz+pV9q0+a0GvkEvgTeKGHje6QZZyK2gEBVUjWJVE6nJeWulsG9l7uO46dHmQT21g2pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgAvDthS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgAvDthS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778705251; x=1810241251;
  h=date:from:to:cc:subject:message-id;
  bh=hqM6ZNM3jNtpvv+g5MS2/AWj9NOe8t6BVcNiHz9cQ+c=;
  b=bgAvDthSDEY3hLmBfg2tPY6a0iTAqvSAsa4ZtPuGPoxdgpREhCpD7nxP
   nSAixRnIKYntZM0WYqZeowM8pvXZkQJDfiuVU1q/ckjk5fqK/WLjn3EMk
   i/5pheMLAxRMne1FK4w9PxcZELu0wnnXFEhfloO65jtGGvE/BR4/FQ58+
   /W+ARsW14xRJyqeSayTbcoOebsIjcfskvQ9SyOq7lZ0VBmbMJ/qGbIfSN
   BRqT1GbTQMGzpF1cX37D9tpBElFsD91ykgakW4WeAV8EtTdd/jiBvS5JE
   nlTlXYO3wDFoOroyRRFfrnDVyfzfpXYxWOxMEMLNcBQiZCF/3OJ9WkSVO
   g==;
X-CSE-ConnectionGUID: 1ngMLKHXRNSzi6DK2Uhfbw==
X-CSE-MsgGUID: 30LX6ea9RKe86ZddzQQ1oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91028270"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="91028270"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:47:30 -0700
X-CSE-ConnectionGUID: lQf89KfgTZilE+aHMOQXuQ==
X-CSE-MsgGUID: IJdYlBZqStq5r8PeEMsbnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="233917631"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 May 2026 13:47:28 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNGUI-0000000053P-05tm;
	Wed, 13 May 2026 20:47:26 +0000
Date: Thu, 14 May 2026 04:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kajol Jain <kjain@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: arch/powerpc/perf/vpa-dtl.c:254:30: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202605140420.wSw9E6s1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: 4708fba19adee9ba14ef28af6face4ab043d9cd6 powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf
date:   8 months ago
config: powerpc64-randconfig-r131-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140420.wSw9E6s1-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140420.wSw9E6s1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4708fba19ade ("powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140420.wSw9E6s1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/perf/vpa-dtl.c:254:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/perf/vpa-dtl.c:254:30: sparse:     expected unsigned int [usertype]
   arch/powerpc/perf/vpa-dtl.c:254:30: sparse:     got restricted __be32 [usertype]

vim +254 arch/powerpc/perf/vpa-dtl.c

   241	
   242	static int vpa_dtl_event_add(struct perf_event *event, int flags)
   243	{
   244		int ret, hwcpu;
   245		unsigned long addr;
   246		struct vpa_dtl *dtl = &per_cpu(vpa_dtl_cpu, event->cpu);
   247	
   248		/*
   249		 * Register our dtl buffer with the hypervisor. The
   250		 * HV expects the buffer size to be passed in the second
   251		 * word of the buffer. Refer section '14.11.3.2. H_REGISTER_VPA'
   252		 * from PAPR for more information.
   253		 */
 > 254		((u32 *)dtl->buf)[1] = cpu_to_be32(DISPATCH_LOG_BYTES);
   255		dtl->last_idx = 0;
   256	
   257		hwcpu = get_hard_smp_processor_id(event->cpu);
   258		addr = __pa(dtl->buf);
   259	
   260		ret = register_dtl(hwcpu, addr);
   261		if (ret) {
   262			pr_warn("DTL registration for cpu %d (hw %d) failed with %d\n",
   263				event->cpu, hwcpu, ret);
   264			return ret;
   265		}
   266	
   267		/* set our initial buffer indices */
   268		lppaca_of(event->cpu).dtl_idx = 0;
   269	
   270		/*
   271		 * Ensure that our updates to the lppaca fields have
   272		 * occurred before we actually enable the logging
   273		 */
   274		smp_wmb();
   275	
   276		/* enable event logging */
   277		lppaca_of(event->cpu).dtl_enable_mask = event->attr.config;
   278	
   279		vpa_dtl_start_hrtimer(event);
   280	
   281		return 0;
   282	}
   283	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
