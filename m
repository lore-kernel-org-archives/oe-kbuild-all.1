Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17A65C8B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Feb 2024 02:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708138210; cv=none; b=QuDpeoGenQi46h3kjDPHWbZ2PkBifce1CQp3In3vpnINzRLKnDrfYOsDn+QNzRrgTsMReSMYHmrC7JavyzBbUS/PI59U7z3Hcj1YO07hFZBJoJcOJ6z0ByJS+ndKjNXcJrUM5mrdfAxf9Ex4kT4NWmNYgnDLLeUUyKuKGYiGLVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708138210; c=relaxed/simple;
	bh=VuDppPAUNtX1j29VKSzG6ODDaqd/cRIRfsZfupW0opc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tUypdTTRvlMmrFpXeO+sOH+NLh/2vsd2OGSF64wuEicfFZZ79G7QpIAjiAlG6TWnX5tn/82whkea1hWBHLOU3qFgAf4mfEGMyH/AH68Ahid0Y9A+X/MqKGjwvjlzBkbPvfV+JqHveH4TaKoX4lTh4BAT2JNRXlEunE716qD84t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lABFO7cx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lABFO7cx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708138209; x=1739674209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VuDppPAUNtX1j29VKSzG6ODDaqd/cRIRfsZfupW0opc=;
  b=lABFO7cxXLMSXsrr3YR4X+1vFe0rkZTeHd2uEyNmYWch4mElZlVBpuIP
   W3nTqJ+TlQaBtCaUSXukAOMRvY+exRA2UQFy2AC3RzcERosikU/R2SuzC
   DEY8PI+0FoSdDemEgf4xMesBfeDke234+4viVnFxVJ7G7n6xbEJ9QcB7p
   ssEnIleQH/FfkRfEOi7BEVTOPbTpEuMN7Gh5W6afVriyCzn9SwCl77IL7
   qLRHdXNuz5RfV+rGa29wsSW3f+2HPOJn97fAcviq3OUaIyXwD/uhNShlc
   i0kuJe5bWKWDH/Si0YrTswepKBO7bE15JEj7cPY7D/ANI8DA3n38fgCLx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="6109866"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="6109866"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 18:50:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="8595059"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Feb 2024 18:50:07 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbAmC-0001mS-2K;
	Sat, 17 Feb 2024 02:50:04 +0000
Date: Sat, 17 Feb 2024 10:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/anna 31/31] rcutorture.c:undefined
 reference to `timers_dump_cpu'
Message-ID: <202402171032.TI97azTh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/anna
head:   95fabd0a7b41bc9964fa8486b31b17bdd309afa5
commit: 95fabd0a7b41bc9964fa8486b31b17bdd309afa5 [31/31] test
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240217/202402171032.TI97azTh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402171032.TI97azTh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402171032.TI97azTh-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/rcu/rcutorture.o: in function `rcu_torture_stats_print':
>> rcutorture.c:(.text+0xa3e): undefined reference to `timers_dump_cpu'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
