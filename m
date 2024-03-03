Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19B2BA26
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 11:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709466530; cv=none; b=Xgm8xR2z5LG7wHLpBNJ8y2xIS9/6WK5EPK07so32g+FbZDgwjigtcAkW4oG8antnAvgSCrqjyZGJT4MdJrdIrRNjVAA3KSwXzu1VpaghZOBvj88VEFWldj2wBOvEOHbf6nXRt1nuY3s3yjDjDoGUuVx6wI23bzgOp7RqMYH11Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709466530; c=relaxed/simple;
	bh=aAnlNphlh1AJV/Qtj5hO6xmXb+I8FCMCTXKpdr6yJww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mBLWEHWuoxZZyXE6XU2a2Wwo05Yin3wXP6dxcGbY2kVt7Q35kl2CPYRaVOH71pW2Bj2grEceeKdLlrEEJC6h5WOMLzd5L3REQoHKsSIRKFS5e9Xueyx2FQ2+QB2tTtnWEYEYjA8EHsY9opvsTeKG9Gf5l9GhuApKg65P5/5Q8Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6U4xbPn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6U4xbPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709466529; x=1741002529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aAnlNphlh1AJV/Qtj5hO6xmXb+I8FCMCTXKpdr6yJww=;
  b=a6U4xbPnevw2q/03SyxLMFnPooUoT0PncMXYcukHraN1jPsxsVuNtxpr
   Ju/om8eWwFfCDhxLIHsa9/YNvJPK0YbRK9eaPB118W959+d9sDywgN8Nf
   +H8AoMGxuXVyRP2AAB7b0nG3yGAhy9qK63gyTSVzKW7e8wT1Ei21r9LIf
   tZXWKMGoQbVOSW419/CmPTk80ulQyGkz/fvt5PheGhVGVuCX01HEdP9Lm
   sUG2LuihSewU/i1EjZJXJwHd4nxYvZ6kfqLDO/CJYnY3Qc75C7lYLCnel
   NAI5x4W1jjHvSX9/K069PvihHOspGaHvmqjDystvzxpdGQ1E9Rrot06DG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="14539846"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="14539846"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 03:48:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="8574978"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Mar 2024 03:48:47 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgkKi-0001k8-1q;
	Sun, 03 Mar 2024 11:48:44 +0000
Date: Sun, 3 Mar 2024 19:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Galbraith <umgwanakikbuti@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Wagner <wagi@monom.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [cip:linux-4.19.y-cip-rt 1980/30000]
 drivers/connector/cn_proc.c:58:30: warning: 'send_msg_lock' defined but not
 used
Message-ID: <202403031935.OmHC8R5h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt
head:   dcbd51e7744fcf9baa3ea87a028b574fda95d428
commit: aeafc2f2c66c50bc05d537e6638bca7aff765ddb [1980/30000] connector/cn_proc: Protect send_msg() with a local lock on RT
config: i386-buildonly-randconfig-006-20240303 (https://download.01.org/0day-ci/archive/20240303/202403031935.OmHC8R5h-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031935.OmHC8R5h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031935.OmHC8R5h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/connector/cn_proc.c:35:
>> drivers/connector/cn_proc.c:58:30: warning: 'send_msg_lock' defined but not used [-Wunused-const-variable=]
      58 | static DEFINE_LOCAL_IRQ_LOCK(send_msg_lock);
         |                              ^~~~~~~~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~
   drivers/connector/cn_proc.c:343: warning: Function parameter or member 'msg' not described in 'cn_proc_mcast_ctl'
   drivers/connector/cn_proc.c:343: warning: Function parameter or member 'nsp' not described in 'cn_proc_mcast_ctl'
   drivers/connector/cn_proc.c:343: warning: Excess function parameter 'data' description in 'cn_proc_mcast_ctl'


vim +/send_msg_lock +58 drivers/connector/cn_proc.c

    55	
    56	/* proc_event_counts is used as the sequence number of the netlink message */
    57	static DEFINE_PER_CPU(__u32, proc_event_counts) = { 0 };
  > 58	static DEFINE_LOCAL_IRQ_LOCK(send_msg_lock);
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
