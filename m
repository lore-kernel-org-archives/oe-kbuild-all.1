Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2353BEA4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 01:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708220677; cv=none; b=G8MY4650EtESZytGEZCwEBI4DYDqugvYrggKRtS6umhZjlFRAlHw0aM1F2KFoVfCDrgi2DViVyACFCVjODWdgvT1Tm4OJJ9AznHHSNXN1Q0ef5Y1AZa/tS/iuZQ7tSbiC6ug19EoezV7Tf9jJmrOLDs3FV8oBu75LQHBPw8DtNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708220677; c=relaxed/simple;
	bh=Ju1NbFNbEiSrTWVJ2ypzforOKSkxPfhQ3DjVDyAw5vk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s6622d/DFHmccfPAp0GjHBPIUIFpMgZLxy25TD11NHAv758pFITV/ATtfP4GgxXcr8Wc9hzK2kcsZSfGYLKtbckWoAJPLxeMp93S0Qrgxd2Kv6g8M/ngtPC4hxPIIJ1HmUBj7O6HmQkkveU+J40DVzSucbSo0Y1UFLUHa8MGVp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3VSpUTD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3VSpUTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708220675; x=1739756675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ju1NbFNbEiSrTWVJ2ypzforOKSkxPfhQ3DjVDyAw5vk=;
  b=G3VSpUTDyZqNjMr7LLT7njcXmAH7u5AAMV5rGaFug82XF9S2X0FL1EKN
   3ZaZAsvbyCaKG7FnliRTM49WlK2clcBcQZtMI9tcJLr+3sKA1qtqN+86x
   bsQ0CBJ37cu8aRI3OWs1CKnX3If605BwqFUOOdOKiUXWH1G9HC0VtgiEU
   cJylqfISlLczHRIlSlbBkCQxeiBvMNtISqucWGqt5RxY3HmI0V/rmhiw9
   4VSc+URCzOqL4D34G3ETmfokJAQIVp0UD0iNpfWcgb4UC9u9XTTUSl414
   HBl0m1v1Jj330gHXqyxDbZmz7ntjCiN+xxR6XU0TZzF67T5Gy15Ikx8OM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2196717"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="2196717"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 17:44:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="4318798"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 17 Feb 2024 17:44:33 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbWEI-0002gM-2N;
	Sun, 18 Feb 2024 01:44:30 +0000
Date: Sun, 18 Feb 2024 09:43:49 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Nagalla <hnagalla@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 5/22]
 drivers/remoteproc/ti_k3_dsp_remoteproc.c:40: warning: Function parameter or
 member 'core' not described in 'is_core_in_wfi'
Message-ID: <202402180929.RTjyopeO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   77aa27cbdca359bf0735b36ada464ec65b520943
commit: a2313a78eb2ed03046aae3ac604a49c0556ac839 [5/22] remoteproc: k3-dsp: Introduce PM suspend/resume handlers
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240218/202402180929.RTjyopeO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402180929.RTjyopeO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402180929.RTjyopeO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/ti_k3_dsp_remoteproc.c:40: warning: Function parameter or member 'core' not described in 'is_core_in_wfi'
>> drivers/remoteproc/ti_k3_dsp_remoteproc.c:40: warning: Excess function parameter 'kproc' description in 'is_core_in_wfi'


vim +40 drivers/remoteproc/ti_k3_dsp_remoteproc.c

    31	
    32	/**
    33	 * is_core_in_wfi - local utility function to check core status
    34	 * @kproc: remote core pointer used for checking core status
    35	 *
    36	 * This utility function is invoked by the shutdown sequence to ensure
    37	 * the remote core is in wfi, before asserting a reset.
    38	 */
    39	static int is_core_in_wfi(struct k3_rproc *core)
  > 40	{
    41		int ret;
    42		u64 boot_vec;
    43		u32 cfg, ctrl, stat;
    44	
    45		ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl, &stat);
    46	
    47		if (ret < 0)
    48			return 0;
    49	
    50		return (stat & PROC_BOOT_STATUS_FLAG_CPU_WFI);
    51	}
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
