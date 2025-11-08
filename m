Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4747D1AC44D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 19:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762631923; cv=none; b=W8CvlkvsOJpYixeeJZPeJ0snNmMQNcY20g58V9WD2bph0IUqBVtpzAb5rjI6/q/8DJeLt/XK+KD72UaNGaibAOUb9ksJ2cQDFN+93BoSrhFEt4SfFYCsZxrdyQM9CKZ2+BG1OzNFb6ncXnEcG7JfOBmSDt9ZtW2FbkXCW2qChuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762631923; c=relaxed/simple;
	bh=plhVHEBXm7QJOKf+WRWk8aQuYSGYHx8t6uD1XGz/MU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WJD16H481VLegcUhqgRFMZPnKnJj6vHu0aq5FUB5213irLebC3btOw/RN35pP06C/WGoYWFL52RAUjc14aRSNfkDGZFgdEhtClzUKnYVrB3qZQA9I7BrXKx5q1UQszltL6Q89xEOx/SjTm2ic9+csHGgkLZTyrIdkj8ofMVq3PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/N4HMJb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/N4HMJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762631922; x=1794167922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=plhVHEBXm7QJOKf+WRWk8aQuYSGYHx8t6uD1XGz/MU4=;
  b=g/N4HMJbi/uc4+qJr2lWYACIQAe1ucPDjGFXk7bacuro7DBPwM8xWJ8h
   86yP28ISiEcObfgSbhU47uE+p25aWUC8zE8mA4yTxodCVRQo9WZaix6bJ
   TLFlPD/nR0n4x3CjMZS8UpdfJraOIVCD7BAoKSma/dT2T9TfAEC+aoQNE
   ri+x19nsr0ycko3kodfEWLPzjbaNTp3u/96+zo7vJkXCdldhfpmbtfm0Y
   cK+qhYXnuVKQ5Qs9z2DHLX8f3nVU3FmfV95jmsTT4lowwzobnjPRcJSs4
   bNop9xxvvn8evxxSvXB7u+Gp4jLKtvth9OJjFD9P/EfNCuWk9ymMjiP8h
   A==;
X-CSE-ConnectionGUID: /+O9joWQSKuQmY41eLhQkQ==
X-CSE-MsgGUID: paH8EFQtR3iV7u3XRyN52Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="52306466"
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="52306466"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 11:58:41 -0800
X-CSE-ConnectionGUID: jS2iGeBtTd+y52CBSdpldg==
X-CSE-MsgGUID: Rx0/F1j6Tuumq1wHZHbvIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="188496410"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Nov 2025 11:58:40 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHp53-0001Oh-1h;
	Sat, 08 Nov 2025 19:58:37 +0000
Date: Sun, 9 Nov 2025 03:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/parisc/kernel/perf_regs.c:30:2-3: Unneeded semicolon
Message-ID: <202511090323.OwYsZkev-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7bb4d6512545a792a6cd8d6c8be5718920b9b11a
commit: 610cb23bcc75bcd9fead3e41cbd867cccd0eb229 parisc: Add initial kernel-side perf_event support
date:   5 weeks ago
config: parisc-randconfig-r062-20251109 (https://download.01.org/0day-ci/archive/20251109/202511090323.OwYsZkev-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511090323.OwYsZkev-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/parisc/kernel/perf_regs.c:30:2-3: Unneeded semicolon

vim +30 arch/parisc/kernel/perf_regs.c

     8	
     9	u64 perf_reg_value(struct pt_regs *regs, int idx)
    10	{
    11		switch (idx) {
    12		case PERF_REG_PARISC_R0 ... PERF_REG_PARISC_R31:
    13			return regs->gr[idx - PERF_REG_PARISC_R0];
    14		case PERF_REG_PARISC_SR0 ... PERF_REG_PARISC_SR7:
    15			return regs->sr[idx - PERF_REG_PARISC_SR0];
    16		case PERF_REG_PARISC_IASQ0 ... PERF_REG_PARISC_IASQ1:
    17			return regs->iasq[idx - PERF_REG_PARISC_IASQ0];
    18		case PERF_REG_PARISC_IAOQ0 ... PERF_REG_PARISC_IAOQ1:
    19			return regs->iasq[idx - PERF_REG_PARISC_IAOQ0];
    20		case PERF_REG_PARISC_SAR:	/* CR11 */
    21			return regs->sar;
    22		case PERF_REG_PARISC_IIR:	/* CR19 */
    23			return regs->iir;
    24		case PERF_REG_PARISC_ISR:	/* CR20 */
    25			return regs->isr;
    26		case PERF_REG_PARISC_IOR:	/* CR21 */
    27			return regs->ior;
    28		case PERF_REG_PARISC_IPSW:	/* CR22 */
    29			return regs->ipsw;
  > 30		};
    31		WARN_ON_ONCE((u32)idx >= PERF_REG_PARISC_MAX);
    32		return 0;
    33	}
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
