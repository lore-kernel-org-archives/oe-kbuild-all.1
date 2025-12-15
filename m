Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2452253AB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 07:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765782348; cv=none; b=E7havx2RoC5PtInBAS7g06ZBYeqsr2FamRwkOp4ZSCUtVy4xdiU3S43zE2IQcKVjVBq8m/D75ihMBOoAVrDYL/v9IbqROQwXPR+WLV+w0vIDh4Zi87md3jHICW+K1+2qFgeHVaEvSZoCSgzWbx3w4LbeAa3qym67eGmFNrZ/sAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765782348; c=relaxed/simple;
	bh=tTYw5IVkDFdPeHQexrX7DB4yRpQGTvAHGX5I4QwSHXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hxunzZGpV+nCLjSW2bURr0DgIyH+xtJGSBoCiV/gg/egKYyUpz8F4UzkB2BNKoOfHQrJidEQRkzmBqiGs/TJqInhTAs7vEaGuJZHpgtXu4bzQdflaD6J9erXnHvyJz3KqJxrJoIrmnX5KpaKXnO7TYx7o8j25YJCFpQIo9WhaxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWImx4WJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWImx4WJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765782345; x=1797318345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tTYw5IVkDFdPeHQexrX7DB4yRpQGTvAHGX5I4QwSHXQ=;
  b=RWImx4WJrm0l7r9p5WNAVaWlpB0Tg7H6ORX5VlfQxmYbk04NWP21iRGr
   QbiCK8yCajd8UrYCQ9GjQ59PN5/Rd+VBzFvErC3nrI5ri27axmTQwqaCG
   0+Pj1JK/6Jibrf/Ey4a1MPI3DulL6DrM6Gt2Yi2YJ+F4OgGk72iwXQv/p
   h26zI71Dfqnic8tqnwhYLuYs1in5/DMxPADoIr94RCHFdLTHHhT1vntbY
   IOc+jPgcrFw0zcKY+j6VCNi/r++SOVV3Qs/8f0sxZsbRFPPNOIfC+TCKb
   s6+hVmd5TYW+ik3JIRP3WG3oGXz4sffBMS0zYNGgAwWCjqwoT50aQZnTY
   g==;
X-CSE-ConnectionGUID: U2AuApL5Q7mcgsE2RPpFyA==
X-CSE-MsgGUID: muJWZsUGQIqG5upyRZnEZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78316945"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="78316945"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 23:05:44 -0800
X-CSE-ConnectionGUID: Ui/rugkoRumGzu+GeWPnhA==
X-CSE-MsgGUID: /yxMdZf1Q4mdS+5HhWML+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="202152281"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 14 Dec 2025 23:05:42 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV2eK-0000000001n-2sM5;
	Mon, 15 Dec 2025 07:05:40 +0000
Date: Mon, 15 Dec 2025 15:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kajol Jain <kjain@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: arch/powerpc/perf/vpa-dtl.c:254:30: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202512151425.cwUtLbPF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 4708fba19adee9ba14ef28af6face4ab043d9cd6 powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf
date:   3 months ago
config: powerpc64-randconfig-r133-20251215 (https://download.01.org/0day-ci/archive/20251215/202512151425.cwUtLbPF-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151425.cwUtLbPF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151425.cwUtLbPF-lkp@intel.com/

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
