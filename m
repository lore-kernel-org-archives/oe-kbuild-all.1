Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8CF56452
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 22:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720479278; cv=none; b=aGKojE62FwBb+WPfNH7CixM7mSqzyGx2Bs9dQpEHIXSwj/uupXFlR4zCRIO0uEwSlu/kLkck8YXRT2OzudaV2TDPZz7dqy80gRgMkv8Dof2KdT24FES7YDFx9yESsz29X/vmxd34xS0c6g4MtRCoje+xRmE7wM9hccPsAUsyrDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720479278; c=relaxed/simple;
	bh=sr8xqLf8Eb4p9NInwGmIHBMefEn6kbp4oVbByDQPv14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LZ689DOSNgJ2UAx+CNNQQH2gV1KmZBUdEq+S5vOBsa6FiOZz+3/fVmIsI9zACri56KyZo9XTgtmgTxVoRiY99mY6XcsZccwHDmyfSZ8UHIOAk3R1BO9513+MUrF3Y+YUdb2FA6F2CVuge8Kg0MUKKayKv99Yb2+bDIJ9aJVOOVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aob+MO5R; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aob+MO5R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720479277; x=1752015277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sr8xqLf8Eb4p9NInwGmIHBMefEn6kbp4oVbByDQPv14=;
  b=aob+MO5R5J0IJ7SnUbKhge1cP/gqbo+fwtzO/1W2CRqsGT1gZWidOMke
   81b6NNbdUW3i+23tR2Hv6Kj4XPzopi//qieD3sCCKVtlLg0T4b3s7NPUd
   RuFx1CmLragv/viuKgj+WjKsXx3gOgqYW3U+ZanEUzamneUJHN/xOYgO0
   W+NZLuxuRprtO6kuKpnGmjtxViaYk+ia0f4yvTVOtWIpkZIp5b/JyrsEH
   buphIpl5VqGigL14NgSvkWzBLZ1f9T2Pe4z28jfGLMTvnOLYWhrGdDnAy
   dR/R+ugAYTm+iFL97jaau33J1sFL+FHSN69KHxf1S3CPBqXg1KODGb7Dx
   A==;
X-CSE-ConnectionGUID: EyKBuFQnSvaVwOBaYXkyCQ==
X-CSE-MsgGUID: o66Oei1FSHySIFOvgCZtDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17658072"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="17658072"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 15:54:36 -0700
X-CSE-ConnectionGUID: lg+XLFRoQnCwktJkbH4/3A==
X-CSE-MsgGUID: RWHX0LoCQWibHwxjtgChkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="78802646"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jul 2024 15:54:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQxFf-000W6I-0A;
	Mon, 08 Jul 2024 22:54:31 +0000
Date: Tue, 9 Jul 2024 06:54:07 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Burton <paulburton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [daniel-lezcano:timers/drivers/next 4/7]
 drivers/clocksource/mips-gic-timer.c:176:25: error: implicit declaration of
 function 'read_gic_redir_counter'; did you mean 'read_gic_counter'?
Message-ID: <202407090637.CQkE1Tv9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   http://git.linaro.org/people/daniel.lezcano/linux timers/drivers/next
head:   008addaf6139ac2f0a913d8d49a3fa2525cb10db
commit: 0fa128b58eb848fdfd62b08ba072cbe80f05ba41 [4/7] clocksource/drivers/mips-gic-timer: Always use cluster 0 counter as clocksource
config: mips-malta_kvm_defconfig (https://download.01.org/0day-ci/archive/20240709/202407090637.CQkE1Tv9-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090637.CQkE1Tv9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407090637.CQkE1Tv9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clocksource/mips-gic-timer.c: In function 'gic_hpt_read_multicluster':
>> drivers/clocksource/mips-gic-timer.c:176:25: error: implicit declaration of function 'read_gic_redir_counter'; did you mean 'read_gic_counter'? [-Werror=implicit-function-declaration]
     176 |                 count = read_gic_redir_counter();
         |                         ^~~~~~~~~~~~~~~~~~~~~~
         |                         read_gic_counter
>> drivers/clocksource/mips-gic-timer.c:180:14: error: implicit declaration of function 'read_gic_redir_counter_32h'; did you mean 'read_gic_counter_32h'? [-Werror=implicit-function-declaration]
     180 |         hi = read_gic_redir_counter_32h();
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |              read_gic_counter_32h
>> drivers/clocksource/mips-gic-timer.c:182:22: error: implicit declaration of function 'read_gic_redir_counter_32l'; did you mean 'read_gic_counter_32l'? [-Werror=implicit-function-declaration]
     182 |                 lo = read_gic_redir_counter_32l();
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      read_gic_counter_32l
   drivers/clocksource/mips-gic-timer.c: In function '__gic_clocksource_init':
>> drivers/clocksource/mips-gic-timer.c:233:13: error: implicit declaration of function 'mips_cps_multicluster_cpus'; did you mean 'mips_cps_numclusters'? [-Werror=implicit-function-declaration]
     233 |         if (mips_cps_multicluster_cpus()) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |             mips_cps_numclusters
   cc1: some warnings being treated as errors


vim +176 drivers/clocksource/mips-gic-timer.c

   167	
   168	static u64 gic_hpt_read_multicluster(struct clocksource *cs)
   169	{
   170		unsigned int hi, hi2, lo;
   171		u64 count;
   172	
   173		mips_cm_lock_other(0, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
   174	
   175		if (mips_cm_is64) {
 > 176			count = read_gic_redir_counter();
   177			goto out;
   178		}
   179	
 > 180		hi = read_gic_redir_counter_32h();
   181		while (true) {
 > 182			lo = read_gic_redir_counter_32l();
   183	
   184			/* If hi didn't change then lo didn't wrap & we're done */
   185			hi2 = read_gic_redir_counter_32h();
   186			if (hi2 == hi)
   187				break;
   188	
   189			/* Otherwise, repeat with the latest hi value */
   190			hi = hi2;
   191		}
   192	
   193		count = (((u64)hi) << 32) + lo;
   194	out:
   195		mips_cm_unlock_other();
   196		return count;
   197	}
   198	
   199	static struct clocksource gic_clocksource = {
   200		.name			= "GIC",
   201		.read			= gic_hpt_read,
   202		.flags			= CLOCK_SOURCE_IS_CONTINUOUS,
   203		.vdso_clock_mode	= VDSO_CLOCKMODE_GIC,
   204	};
   205	
   206	static void gic_clocksource_unstable(char *reason)
   207	{
   208		if (gic_clock_unstable)
   209			return;
   210	
   211		gic_clock_unstable = true;
   212	
   213		pr_info("GIC timer is unstable due to %s\n", reason);
   214	
   215		clocksource_mark_unstable(&gic_clocksource);
   216	}
   217	
   218	static int __init __gic_clocksource_init(void)
   219	{
   220		unsigned int count_width;
   221		int ret;
   222	
   223		/* Set clocksource mask. */
   224		count_width = read_gic_config() & GIC_CONFIG_COUNTBITS;
   225		count_width >>= __ffs(GIC_CONFIG_COUNTBITS);
   226		count_width *= 4;
   227		count_width += 32;
   228		gic_clocksource.mask = CLOCKSOURCE_MASK(count_width);
   229	
   230		/* Calculate a somewhat reasonable rating value. */
   231		gic_clocksource.rating = 200 + gic_frequency / 10000000;
   232	
 > 233		if (mips_cps_multicluster_cpus()) {
   234			gic_clocksource.read = &gic_hpt_read_multicluster;
   235			gic_clocksource.vdso_clock_mode = VDSO_CLOCKMODE_NONE;
   236		}
   237	
   238		ret = clocksource_register_hz(&gic_clocksource, gic_frequency);
   239		if (ret < 0)
   240			pr_warn("Unable to register clocksource\n");
   241	
   242		return ret;
   243	}
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
