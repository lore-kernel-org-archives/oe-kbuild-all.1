Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CA11759F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 09:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710495548; cv=none; b=feBYAjVT7nrVGXuN1pOe8CFhNtGG4FGm6/Fdm7wwSQxw/8Z7+LqAE8Ey1syOgIspATtEwSyhk4qVxoCJ2YUWXeqL7YAq+iiswteGC79BpNBrD0xjaIzHTuginJbZoHYirN5fP2/Y5THbMPL8K9wA/F8XMzBy4ZdAHjb2E3yz4+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710495548; c=relaxed/simple;
	bh=ZUdUcdlA4N5sm1sPUsqHVFZF2nfUQ0OIRVSsukiBmVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gqsyv9SD1FF+uziRsngVnDHsnilIKeUto3NGOfSHq6g/uTn1fkgr3gUCC/58u0DdHZYr08ycShguvG4/y3jLv2ONC/Vaq1srqCO4bGNS/Nbf2GC/bpQpH04kKEN2mgjhoDpWql/Nh/D8Ukf8gULVUHluInfRpetnO1MFU+4zmMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxvIlkDN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxvIlkDN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710495546; x=1742031546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZUdUcdlA4N5sm1sPUsqHVFZF2nfUQ0OIRVSsukiBmVU=;
  b=HxvIlkDNYAdkf59bRUB/g1hEOXVIU/sx7i1hTEAiRcT3pIU/kHvZ7JXx
   7bfg/dZ2Nz74j2bJ0OZuRYZPl93n/J0NCKYSvsfrHJQ+Op4NAWV/f0gm6
   BiLXVrPnDT91DoOWChv5bLoJBbsUZBtk21gPbka7yloOXxN466ek/2q0A
   5U5f71Wi7mUMKpNRLhOeuMmTcQtaMYOWAsLlYu4/6qfX/Ut3gj3yfgQTG
   Vm+hjANeccFBdQRtHq8Rrw96U8Vb7NKYYtNbQS7B6SkS9p0nJn4L+NYbG
   6InrLpdRokg5xpMWS5zdBYY+XS3Hg9xQodAOrRF2C3/iOyer+WPOIlV1J
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16001102"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="16001102"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 02:39:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="12533569"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Mar 2024 02:39:04 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl41l-000EJF-21;
	Fri, 15 Mar 2024 09:39:01 +0000
Date: Fri, 15 Mar 2024 17:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>,
	Vineeth Pillai <vineethrp@google.com>,
	Suleiman Souhlal <suleiman@chromium.org>
Subject: [jfern:sched/dlserver.debug.mar8.2024 8/27]
 kernel/time/hrtimer.c:990:6: sparse: sparse: symbol 'hrtimer_switch_to_lres'
 was not declared. Should it be static?
Message-ID: <202403151725.EAK4sqXB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel sched/dlserver.debug.mar8.2024
head:   b423f6e8e50a770e9a7ab159a942f86f8ac45499
commit: b9937f09c9e0ab857c06ec9360be17f860be5d42 [8/27] CHROMIUM: hrtimer: Add a sysctl to lower resolution of timers
config: alpha-randconfig-r122-20240315 (https://download.01.org/0day-ci/archive/20240315/202403151725.EAK4sqXB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240315/202403151725.EAK4sqXB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151725.EAK4sqXB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/time/hrtimer.c:990:6: sparse: sparse: symbol 'hrtimer_switch_to_lres' was not declared. Should it be static?
   kernel/time/hrtimer.c:176:33: sparse: sparse: context imbalance in 'lock_hrtimer_base' - wrong count at exit
   kernel/time/hrtimer.c:256:37: sparse: sparse: self-comparison always evaluates to false
   kernel/time/hrtimer.c:266:37: sparse: sparse: self-comparison always evaluates to false
   kernel/time/hrtimer.c:1320:28: sparse: sparse: context imbalance in 'hrtimer_start_range_ns' - unexpected unlock
   kernel/time/hrtimer.c:1355:28: sparse: sparse: context imbalance in 'hrtimer_try_to_cancel' - unexpected unlock
   kernel/time/hrtimer.c:1476:9: sparse: sparse: context imbalance in '__hrtimer_get_remaining' - unexpected unlock

vim +/hrtimer_switch_to_lres +990 kernel/time/hrtimer.c

   986	
   987	/*
   988	 * Switch to low resolution mode
   989	 */
 > 990	void hrtimer_switch_to_lres(void)
   991	{
   992		struct hrtimer_cpu_base *base = this_cpu_ptr(&hrtimer_bases);
   993	
   994		if (!__hrtimer_hres_active(base))
   995			return;
   996	
   997		tick_nohz_hres_to_lres();
   998		base->hres_active = 0;
   999		hrtimer_resolution = LOW_RES_NSEC;
  1000	}
  1001	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
