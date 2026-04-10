Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56CA2E62A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 21:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856556; cv=none; b=I+AKxE3iFU+DooswnjhACsTwnTvisyYYEvtRhlMFV4p91FfpyvqRLKp5oQXhejW8QfX+ZTdf/0tSAJJtf6RC5M5GVXMBEe6TMfrl5wvD3Q6i4G7/9MZXJpK3kt7lrA0Y21RPC2Ng4Srr+gTmYLrLDTje4wzIiv6aEb05kQ76h+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856556; c=relaxed/simple;
	bh=uzQTAFfbVYNhbMRXCWdb/qqdtaA60hYT8XzDW6u+yr4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DhqprmTb95DdJnyYIn9WJJ9NIzhaXTTZC6NMMJJcxCWgzwG1ntdpe+vtyMrxFib6LXUR3fxFqaKKfAqAKAYOR/HxVj/kNTmbnQm5ZXkcfK0MK1TkMNmDly41fAEYPG+8mUQjmltNTdIFUcnq2ReaoLcTJw+lR+kn4Pn+rPXJVaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuNIYALY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuNIYALY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775856555; x=1807392555;
  h=date:from:to:cc:subject:message-id;
  bh=uzQTAFfbVYNhbMRXCWdb/qqdtaA60hYT8XzDW6u+yr4=;
  b=OuNIYALYg8oF59XADGaLpk491g5vAOBtkXkuCDoZmWD3J/df3JT1G2bs
   HjPhTCZQi8xKNUYQUFRbyVoGnq8V+TcMc+v98e9Agxgu1/8r2ls72FyEY
   jv48o5y4KoiyxbPtczTyEmxlxgtyKSEgKXGI+hWfyAFXW0cEUuCbj86ue
   ONeArBV/uKvwO7jPNhzYCl/rhLIJprKFtGFYg8QAW9VIqOEy9ptCkOT/A
   +aFkC28jCArI+J++ULD1SaOATun9JRaK+eW9sQ9vQ9ZQcAYw0E7NCQIwU
   TazyKAqTdHEczXNXIngULrJGsi6/xQ0qcNt3jW6iciyBl5eTLlB/QxRto
   Q==;
X-CSE-ConnectionGUID: LG8jzp0VRwq0KJ6gp4kaMw==
X-CSE-MsgGUID: rFexpoMTSUiRGCXhWJL3Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76955411"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76955411"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 14:29:14 -0700
X-CSE-ConnectionGUID: ut9p8HimSzuL4ZJNoKk+yw==
X-CSE-MsgGUID: u3q+2wiMSyGW0Cvw/9V/9A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Apr 2026 14:29:13 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBJPa-000000000DV-3ibO;
	Fri, 10 Apr 2026 21:29:10 +0000
Date: Sat, 11 Apr 2026 05:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lindholm-alpha:entry 5/6]
 arch/alpha/kernel/irq_alpha.c:114:14: warning: no previous prototype for
 'lockdep_on_restore'
Message-ID: <202604110547.sxQTTk0m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git entry
head:   dd381ec93e43e70caf8dcc4bbad69a43aefb11cb
commit: 19708bb960275d5bbdda1444322df23928485a72 [5/6] alpha: implement lockdep hardirq state tracking
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260411/202604110547.sxQTTk0m-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110547.sxQTTk0m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110547.sxQTTk0m-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/alpha/kernel/irq_alpha.c:114:14: warning: no previous prototype for 'lockdep_on_restore' [-Wmissing-prototypes]
     114 | void notrace lockdep_on_restore(unsigned long ps,
         |              ^~~~~~~~~~~~~~~~~~
--
>> arch/alpha/kernel/signal.c:45:6: warning: no previous prototype for 'alpha_schedule_user_work' [-Wmissing-prototypes]
      45 | void alpha_schedule_user_work(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/lockdep_on_restore +114 arch/alpha/kernel/irq_alpha.c

   113	
 > 114	void notrace lockdep_on_restore(unsigned long ps,
   115					unsigned long ip)
   116	{
   117	#ifdef CONFIG_PROVE_LOCKING
   118		/* Restoring IPL==7 means interrupts remain disabled. */
   119		if ((ps & 7) == 7)
   120			return;
   121	
   122		/*
   123		 * If hardware IRQs are already enabled here, then emitting a
   124		 * hardirqs-on transition is redundant.
   125		 */
   126		if (!irqs_disabled())
   127			return;
   128	
   129		/*
   130		 * Only emit the transition if lockdep currently believes
   131		 * hardirqs are off.
   132		 */
   133		if (lockdep_hardirqs_enabled())
   134			return;
   135	
   136		lockdep_hardirqs_on_prepare();
   137		lockdep_hardirqs_on(ip);
   138	#endif
   139	}
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
