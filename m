Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B5F37141
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 16:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714928380; cv=none; b=fVTRdyR/PUVV04hJ0ePBlq2zqKtddjQB9My9avj1MObx/hIekQfvXuu5c53ypcms3ZcSgtzBbGUZCUkGkx1Carve5xj1ZVtL4CB7qRwhrsiAH8JNq3Pm8JBPThGwnO8jglXJLDKJUVREpHWGZeAywM2hmTObaCvGsOOttyW4c2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714928380; c=relaxed/simple;
	bh=OLP46K1Ww/syyy5ypvlkXdV5OkhWnPJzgTZRRYU9Wic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S4Jj6tgC6gstPAoQPuAWnd8AxTPkZFiC6tDiGop1LNne2HRG5KsBuVwkBsZJDPf968xhzWBGGzD1zDEce+HjQrSyhwGwcNumCujS12DGky/bO2+Ds7l7ZyGFiF3vqIxY/n3gcXW5ZSAaopcmDbXD9moCAJZASDGoa5ZPv+p+Dc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tv+/vpjG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tv+/vpjG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714928379; x=1746464379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OLP46K1Ww/syyy5ypvlkXdV5OkhWnPJzgTZRRYU9Wic=;
  b=Tv+/vpjG3SeZDMB9JHdNFDEPk+3pcKC022BoQ/kLjpzE0IGqC39OM4Da
   dj5iOALfLpIa+pHpqVmrW56Q4/vhJXIlQINbCiap2bkgNtkzNKL12Ala6
   SzaG//kcCz5b/qP/2SKw4nEuTuPLHnDoE0IHTl/BbJqeqOPlcz7iMMWIK
   yz4JldSRhzTzWyFmc8/Q16SNfPc7SCeSBE75vyO3y7WwG0Aulzl4fgkjB
   TCmrv7bJgZ4IVNCI0pxZzHnx8Y4wcVSKndy1UDS7b9xKFb2eKP1MACeat
   IPbPzkVK2sArOtbsbVWm4sQSjNWnfulwF4CjSjdvmfEEOHb/mdcxEc5KW
   A==;
X-CSE-ConnectionGUID: LSzgcYItTzSyUZvU4kUR4A==
X-CSE-MsgGUID: lQghleEwTeq+8KHFTNZ9JQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14460034"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="14460034"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 09:59:39 -0700
X-CSE-ConnectionGUID: JRMZYXqTSXWgZiXUektJPQ==
X-CSE-MsgGUID: wjnPSzIkTayiUYg4q3znwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="32550273"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 May 2024 09:59:37 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3fD5-00004u-0E;
	Sun, 05 May 2024 16:59:35 +0000
Date: Mon, 6 May 2024 00:58:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rt-devel:linux-6.9.y-rt 6/7] kernel/printk/nbcon.c:1540
 nbcon_cpu_emergency_exit() warn: unsigned '*cpu_emergency_nesting' is never
 less than zero.
Message-ID: <202405060043.ebkIgviR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.9.y-rt
head:   9993211977da796baf6f8a20b1c1e1f6058fe052
commit: c846b5e155da0350d8069a87b63d6c46745f320c [6/7] printk: Update the printk queue.
config: i386-randconfig-141-20240505 (https://download.01.org/0day-ci/archive/20240506/202405060043.ebkIgviR-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060043.ebkIgviR-lkp@intel.com/

smatch warnings:
kernel/printk/nbcon.c:1540 nbcon_cpu_emergency_exit() warn: unsigned '*cpu_emergency_nesting' is never less than zero.
kernel/printk/printk.c:3981 unregister_console_locked() error: uninitialized symbol 'flags'.

vim +1540 kernel/printk/nbcon.c

  1509	
  1510	/**
  1511	 * nbcon_cpu_emergency_exit - Exit an emergency section and flush the
  1512	 *				stored messages
  1513	 *
  1514	 * Flushing only occurs when exiting all nesting for the CPU.
  1515	 *
  1516	 * Context:	Any context. Enables preemption.
  1517	 */
  1518	void nbcon_cpu_emergency_exit(void)
  1519	{
  1520		unsigned int *cpu_emergency_nesting;
  1521		bool do_trigger_flush = false;
  1522	
  1523		cpu_emergency_nesting = nbcon_get_cpu_emergency_nesting();
  1524	
  1525		/*
  1526		 * Flush the messages before enabling preemtion to see them ASAP.
  1527		 *
  1528		 * Reduce the risk of potential softlockup by using the
  1529		 * flush_pending() variant which ignores messages added later. It is
  1530		 * called before decrementing the counter so that the printing context
  1531		 * for the emergency messages is NBCON_PRIO_EMERGENCY.
  1532		 */
  1533		if (*cpu_emergency_nesting == 1) {
  1534			nbcon_atomic_flush_pending();
  1535			do_trigger_flush = true;
  1536		}
  1537	
  1538		(*cpu_emergency_nesting)--;
  1539	
> 1540		if (WARN_ON_ONCE(*cpu_emergency_nesting < 0))
  1541			*cpu_emergency_nesting = 0;
  1542	
  1543		preempt_enable();
  1544	
  1545		if (do_trigger_flush)
  1546			printk_trigger_flush();
  1547	}
  1548	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
