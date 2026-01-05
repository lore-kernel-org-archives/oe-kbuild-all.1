Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3CB31ED6B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 03:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767582157; cv=none; b=ug0/u7VnUm2X2xNFWtQG8i2/pWHU4EQvgsK8Jtn427TFPRXe/Z/TWPWGiF7yRXx4257ZFiKccB+N//ZTgwNxUR4oEUg8Qq9oH4bbEMRq8CnYBNRgEKawSI2nMylPhliv//V/aPIWxXl/VXUDI7hrZ9SkisLmX/nupiwMW4nLNqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767582157; c=relaxed/simple;
	bh=iDscETH6ehFZEKfah0lShGHS2UG3isrTmk5VZvqCRGU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uw/mbtC37UsmMqDDFD0ATRXkEpcAbAqP/2e/CY+b3I1YV3ey82oBULycT3yyraejcygVE2gV2Qn2dG3j7Lmj+D1Zfou6Ic/K0AF+HjdgnUCwp9bn3D/FW2gix1RxyEOBNTeBIlHnQ7tVMJHtPPTwp80iv2BuAhXgAWj5nyzv/BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z029Kgls; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z029Kgls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767582155; x=1799118155;
  h=date:from:to:cc:subject:message-id;
  bh=iDscETH6ehFZEKfah0lShGHS2UG3isrTmk5VZvqCRGU=;
  b=Z029KglszVR/b7vsfxYqVuLX1IpXx1LLT/Kb36qMLFICYkd6JCmLy3+L
   p3YkPm70rkO46HnkIPhgm8EInRwJUVZKKlGZcnvL3dxnieAqxlvNOo+79
   tgsEUQhFZk0/5vSVIegzBGiZ3oOS3wUzbbK1iYcFuBY794nfZgoVFSsS6
   ylkv+9Un/tKuLmX9qvmziR7FE1Et8D5upC6XOnvqPgZQF0ZobIgE8Dnmk
   o+S2guS5lD7X/QkixeYin+NsAACqrIzZYyADXfKtJM4lszwA6nfzHExof
   YzdV7emkhkdSOFOXOv0gXWPIDI0dHiT20I7pqK60znJ+CQQUAcYekvGLg
   A==;
X-CSE-ConnectionGUID: SuCNU9ExQhmBQhyN5UVRAw==
X-CSE-MsgGUID: KjN4H3jKSMyJ6+o088qI3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="67961201"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="67961201"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 19:02:34 -0800
X-CSE-ConnectionGUID: 4IGo8p5DQMWX5UPPwX2m4Q==
X-CSE-MsgGUID: qBUWRGo3SvW2WvJkQ+1P5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="239753393"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 04 Jan 2026 19:02:33 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcarW-0000000011R-3Ukg;
	Mon, 05 Jan 2026 03:02:30 +0000
Date: Mon, 05 Jan 2026 04:02:03 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/pcpu-blkd-rcutorture-exp-testing 17/18]
 kernel/rcu/tree.c:228:12: warning: 'rcu_exp_gp_in_progress' defined but not
 used
Message-ID: <202601050434.eR5n0ETb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/pcpu-blkd-rcutorture-exp-testing
head:   93b7149fabee79b3970d81a57b4e48fb140bb0d5
commit: b9933b786d19c3dae9303bbf3f28546b6f58d4ac [17/18] rcu: Add rcu_exp_gp_in_progress() to check expedited GP state
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260105/202601050434.eR5n0ETb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601050434.eR5n0ETb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601050434.eR5n0ETb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/rcu/tree.c:228:12: warning: 'rcu_exp_gp_in_progress' defined but not used [-Wunused-function]
     228 | static int rcu_exp_gp_in_progress(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/rcu_exp_gp_in_progress +228 kernel/rcu/tree.c

   223	
   224	/*
   225	 * Return true if an expedited RCU grace period is in progress.
   226	 * Similar to rcu_gp_in_progress() but checks the expedited sequence.
   227	 */
 > 228	static int rcu_exp_gp_in_progress(void)
   229	{
   230		return rcu_seq_state(rcu_seq_current(&rcu_state.expedited_sequence));
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
