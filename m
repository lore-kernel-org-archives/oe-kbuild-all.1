Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D4020B218
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 19:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731441185; cv=none; b=MDuQX609zg8PhlayXETd4So6t3stjKg6R2mkIud1ZjxPsEhTrwooMtG+LPB7MRLX1bHxqbylEDWQzRre++9m0XBScNURLqOErRXDerT+pyHvuXuV+F0p+x/Hrj+4NJqnKDA/Pfhyu4d1Ip8jSpOLnvZzd32gDSiVoidQjZnupLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731441185; c=relaxed/simple;
	bh=0i0YaITbSuYQp2Cw+eze4jZMM7HsvKD7wS8MGPgjYyQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IvdgoMopwea1JQND8IyUMt3mCWisWkRjKObtyb7yt6rzkYIRHQRUiuPSUvEPP6N7wMaffmnTebYj/NSfGwHWm7PLBFwE10RsC6dOsiatkv8w2SQ8vUNl7Y0kTkL8QAGjxMzLQooQGDP3mXdytTvuut0gPYNoEiVuiqN/vnC7D8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGSuQ5aN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGSuQ5aN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731441182; x=1762977182;
  h=date:from:cc:subject:message-id:mime-version;
  bh=0i0YaITbSuYQp2Cw+eze4jZMM7HsvKD7wS8MGPgjYyQ=;
  b=iGSuQ5aNobgzpdmqMAVw69VkcVrdf3c60Vx/zpeg2fFskbUUy7Yq7lWJ
   L28IZA2zUu4m08QWLHu1jQhPcli+y6R2ZfH+DPGYEitr+3w5Buz1/m9CS
   ujZ1FMnP+1j5sAkGvIyIJ2uE8nAeT8THmmEYmTmilP71I+6YRXwsCYQeQ
   y9nTYdhsjCiPkLa9h/IVS3COTa6HJohX90Oubpc3kNdzWUrkO2A9VvzDd
   1sMwJ1cuemcQ9j9aO8e1lwjwSByj63x1fCVMWbR6pdnok9oVhfTlxbUkD
   Doqm9Yoki78DQPvy2zAvH/bKk5+QH59hJLCxhK0KOiADXY8y5QxUNS4TY
   w==;
X-CSE-ConnectionGUID: jBfi7NwGQb2k8+hrMm1WEA==
X-CSE-MsgGUID: Cbxse2ASRl2sJW7IWBPRtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42405088"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="42405088"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 11:53:02 -0800
X-CSE-ConnectionGUID: ggLA9V6SQW6H1B2EjPnkrg==
X-CSE-MsgGUID: VFdjJoi9ShikmUVVvnBX4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="87388338"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Nov 2024 11:53:01 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAwwd-0001gr-19
	for oe-kbuild-all@lists.linux.dev;
	Tue, 12 Nov 2024 19:52:59 +0000
Date: Wed, 13 Nov 2024 03:52:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/dovetail-xenomai 3781/13313] kernel/irq_work.c:79:13:
 warning: no previous prototype for 'irq_local_work_raise'
Message-ID: <202411130328.KZRsR7PA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/dovetail-xenomai
head:   8025dd14d72f1eee946ab67036c7a3a569861654
commit: f229f1f2bd2e196c234ad6abe6edaba2ed10ecfd [3781/13313] genirq: irq_pipeline: add IRQ pipeline core
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241113/202411130328.KZRsR7PA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130328.KZRsR7PA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130328.KZRsR7PA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq_work.c:79:13: warning: no previous prototype for 'irq_local_work_raise' [-Wmissing-prototypes]
      79 | void __weak irq_local_work_raise(void)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/irq_local_work_raise +79 kernel/irq_work.c

    78	
  > 79	void __weak irq_local_work_raise(void)
    80	{
    81		arch_irq_work_raise();
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
