Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B3036492C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 02:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792377008; cv=none; b=FX8ZxL1siR/F+PItjzTJaKjhaWszfBlSQmJo2uElvg29DgJ+w62NLEP1zMNZgm/neC4pp6xXnHyStwm3VzCVNOLLRjBpGwKYdP7EF8WfK1nXj8hQdb9p+wDyXJi/xacgBt5nASDkJLunuMaqPJBClsxQvtyw47FbexyDMlO5dIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792377008; c=relaxed/simple;
	bh=cjieU0I0mCrut1hZQET/1ljCXevIs/Up2CaY+buY55I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gzs1Mw7hxRNRWnFkl5X440QM8/NMcybCBynsWoKc4TVhkCRqscQqnuMd8vTvAvgI5I+6q2L7ulu9HmITMqhsCz+2swIhgRmn+p95b54NNF8mL8fkPYeZjAe/KGVxil4sjolC2NU0NFpkeboerHTcX3jkGmzuONk6dgMGFXLnxBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdwbTGUI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdwbTGUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792377008; x=1823913008;
  h=date:from:to:cc:subject:message-id;
  bh=cjieU0I0mCrut1hZQET/1ljCXevIs/Up2CaY+buY55I=;
  b=AdwbTGUIzDdevj4Ko2NtUBaKLiDeuhLU90sg2h2DENVyz3t2AEnC36gn
   69f3S0kdMspMKtHt9Ew9ahskUPonO47xWeQ0YGF9yB4jkRItqZ/rB3nLq
   22criMaznUuakIkHk1sT3qhxShNSMs1OAecG16ohwARJ3l3GvKcCprcaY
   IgqjM87p2cUg4BBBe35P4ST8rMP+iksCEY1q+ygXaU2tLl/FT+VRQA3LT
   5jj5JN7oiVbc1cWI85zyc5OpjZ6WcquutBGwvbUDy0Wceyx3oeKKg8grm
   qZwp2dNLSUbc1EUmDb8qvtTf57T176e7nLRfRz3x7yurBXChN8AXvoNoE
   w==;
X-CSE-ConnectionGUID: 2FwstitQQ12le28qxLrsyg==
X-CSE-MsgGUID: sDZ6Er1wRESyiLLMxeB3OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1064169"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1064169"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 19:30:05 -0700
X-CSE-ConnectionGUID: W7QcKzrgSDGJRRB7AIPBsA==
X-CSE-MsgGUID: E3c/2kPARmSsn+s0zLiVCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2416185"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Oct 2026 19:30:04 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xId8T-00000000L7s-1Zfw;
	Mon, 19 Oct 2026 02:30:01 +0000
Date: Mon, 19 Oct 2026 10:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:core/hotplug 45/49]
 kernel/irq_work.c:184:27: error: parameter name omitted
Message-ID: <202610191017.ZCssl1uj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git core/hotplug
head:   6cbb08c40db1f93e15aaef964883729494f3a478
commit: 8b3cdb229529280585c5ac39daa446e735bce900 [45/49] irq_work: Introduce irq_work_kick_cpu()
config: nios2-randconfig-1000-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191017.ZCssl1uj-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191017.ZCssl1uj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191017.ZCssl1uj-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/irq_work.c: In function 'irq_work_kick':
>> kernel/irq_work.c:184:27: error: parameter name omitted
     184 | static void irq_work_kick(struct irq_work *)
         |                           ^~~~~~~~~~~~~~~~~


vim +184 kernel/irq_work.c

   183	
 > 184	static void irq_work_kick(struct irq_work *)
   185	{
   186		/*
   187		 * Kick the CPU, typically so that it takes action:
   188		 * * On IRQ exit (nohz_full dependency changed and tick must be restarted)
   189		 * * On the idle path so that the next tick is re-evaluated.
   190		 */
   191	}
   192	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
