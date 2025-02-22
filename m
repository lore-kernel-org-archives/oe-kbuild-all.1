Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31A8208961
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 10:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740221535; cv=none; b=uTGh0QLVU3oomstlB3UC68kLpAuJiq/oU7Yn8OCOwCM9acR01p3QqeZAZ/uR1tFjo4SsNiFks68+/Ao4p2vvAn+luqjGCOTTB12uv5mbQg2JO+qKeRkME1Puym6rOPOHMaXpkwnpTepfqCE8Z8fpQbbtMeG/+Il79iCDaaW0DBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740221535; c=relaxed/simple;
	bh=04xGm1MbMRTXfFqYgavGQuEoCCuS3zYSDVCu13hytGQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ssViysNemC1qzSlilN5XRi0cItvXBbiU1GSuRSWWVmyu2F1nKTmeYnBgEEyVZHpHqIcR2BeBWlNrd5RT36dGDxw32yy/e02AX4qPx8fB/a89wCNHIPM8y8Rcw0V64LtNdzaRLL0NcL46T2lfT149HHxwNgHIesnzkie/SXJ2FNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+S1Nui+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+S1Nui+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740221534; x=1771757534;
  h=date:from:cc:subject:message-id:mime-version;
  bh=04xGm1MbMRTXfFqYgavGQuEoCCuS3zYSDVCu13hytGQ=;
  b=e+S1Nui+RJnwDkevvw7Zr16ugQ39e8iBRwchngxEyvJQGhUb4I0xY1sR
   umOIUL0VzJhQZtAfD/rUbYHUiEwzmB6vDSkSKzaNuYuV2jJsEtsbdiYyW
   epZ6pwnAq3QvjIBpZpelA8ApYsJohXMD22uuDBYm+vVBa0Qf83Z/fVeuP
   LHSQ6X2x4BJNTWX4CzlnfdRe1F7OcUMZU+Y4JGjndTsnaTF4Z2KuWxLOL
   j2E3myVIWIIvMyQwoXHWPrxvjO8GlfiANzPIjYDgeyyDTTjNbwoaKIk9w
   vwTRygoDkhVn4obM4OSZVg2yLwC7b+t2cPdmGJYWKgaQtiFF/Wie9Ubb3
   w==;
X-CSE-ConnectionGUID: W0Jn2vdjSCmKVTmgn6WkVQ==
X-CSE-MsgGUID: 2WeIVM3nSteZYvPVmnx05A==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44813957"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="44813957"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 02:52:14 -0800
X-CSE-ConnectionGUID: wBNd9ANWSAmJ2mHbqj6hkg==
X-CSE-MsgGUID: cMXXLfhUQXOW6TK0iYJyYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="120571944"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Feb 2025 02:52:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tln7B-0006Up-1W
	for oe-kbuild-all@lists.linux.dev;
	Sat, 22 Feb 2025 10:52:09 +0000
Date: Sat, 22 Feb 2025 18:51:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.12/dovetail-xenomai 5/5] arch/x86/kernel/irq.c:55:9:
 error: implicit declaration of function '__apic_eoi'; did you mean
 'apic_eoi'?
Message-ID: <202502221818.c1Fo91XF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/dovetail-xenomai
head:   96c9aceb59d0ff2f4ac73415eeee24969ba6fa8f
commit: 0261c1973ea02eb7a596dda743b1c1a212662aa2 [5/5] x86: irq_pipeline: add IRQ pipeline core
config: i386-buildonly-randconfig-003-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221818.c1Fo91XF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221818.c1Fo91XF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221818.c1Fo91XF-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/irq.c: In function 'ack_bad_irq':
>> arch/x86/kernel/irq.c:55:9: error: implicit declaration of function '__apic_eoi'; did you mean 'apic_eoi'? [-Werror=implicit-function-declaration]
      55 |         __apic_eoi();
         |         ^~~~~~~~~~
         |         apic_eoi
   cc1: some warnings being treated as errors


vim +55 arch/x86/kernel/irq.c

    36	
    37	/*
    38	 * 'what should we do if we get a hw irq event on an illegal vector'.
    39	 * each architecture has to answer this themselves.
    40	 */
    41	void ack_bad_irq(unsigned int irq)
    42	{
    43		if (printk_ratelimit())
    44			pr_err("unexpected IRQ trap at vector %02x\n", irq);
    45	
    46		/*
    47		 * Currently unexpected vectors happen only on SMP and APIC.
    48		 * We _must_ ack these because every local APIC has only N
    49		 * irq slots per priority level, and a 'hanging, unacked' IRQ
    50		 * holds up an irq slot - in excessive cases (when multiple
    51		 * unexpected vectors occur) that might lock up the APIC
    52		 * completely.
    53		 * But only ack when the APIC is enabled -AK
    54		 */
  > 55		__apic_eoi();
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
