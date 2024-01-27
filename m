Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471291E51D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 13:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706362739; cv=none; b=A/Fmx0wx4WVytjDcBWYkZq/cnjqRBU3hd8YMqeFZkQPay8Y0HmXAgSzNs6Y8MlPoQqctJXjySfr7IL+FCQ3JPP7povRNgKIm8orfTSt3+0rimj1OjLvTX4/Gm9Np71bQZmN2UDuO2MwW75DY2ORcGk6qRWXMQDw/Y9AVInPtUUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706362739; c=relaxed/simple;
	bh=CXd+iZH8kQe59wZ8iM4UYeuMK0I7ldrCkUfoERbg/wA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Le+A70VxjjVy/42AWK+a0gSnLEgyFm9BwoXSTRnLy/QcAA4ufFw4Z171Vnyus4YdLcpMAI+MJIsKMJhZyKEdgdjJ6VVrbaIYjCblW71TbbFqyBV/vKMhHaPJ14SEg7kOP2bIK71NoWprZc6g4rq23QDGvcaaAI7ZZxwRdE5Nu7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIN0TtyE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIN0TtyE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706362737; x=1737898737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CXd+iZH8kQe59wZ8iM4UYeuMK0I7ldrCkUfoERbg/wA=;
  b=BIN0TtyET/Cbd65Ji+kl69cGF/kU1RBX/EqnuFgRR6knEIz+G80Sgc6N
   wa5yfIEsGfIaRIknLGMEH4MhH7/+9g98z40FMBNM+GZaIcoHA/OL7wQ4c
   NqnA1Ekc7BJf1GFbRlQfx6bJu8HfEVYqijFa3Yg2Yr6bsxOSOiwdhXAqk
   qyIoCKyW7AUE4e4jpyEdhomfk3+2bGST01FejLsclSm8Gwut5mX/KqS37
   WLlJzYgkuhFF7L6TS21bcuLLCo23JwnMyc2EjxI4dr0z/V3M6gZAPD5FK
   VR/3BDq1tpkgN3t43Xs8U5r150vEeiV8G06lmXC4hGSNJVXWooQszlNzG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="24146198"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="24146198"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 05:38:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="787387482"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="787387482"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Jan 2024 05:38:55 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTitY-0002MU-2T;
	Sat, 27 Jan 2024 13:38:52 +0000
Date: Sat, 27 Jan 2024 21:38:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-for-sev-v2a 13/17] arch/x86/kernel/sev-shared.c:92:1:
 warning: 'inline' is not at beginning of declaration
Message-ID: <202401272110.FZLWZpmV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v2a
head:   dd108b463dbdd73234b6bc533a0cfac2441bd38f
commit: 83f306426e8464e9a9d0734d96b6e23b80d1fb2b [13/17] x86/sev: Make all code reachable from 1:1 mapping __pitext
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240127/202401272110.FZLWZpmV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401272110.FZLWZpmV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401272110.FZLWZpmV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/sev.c:555:
>> arch/x86/kernel/sev-shared.c:92:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
      92 | static void __always_inline __noreturn sev_es_terminate(unsigned int set,
         | ^~~~~~
--
>> arch/x86/mm/mem_encrypt_identity.c:503: warning: expecting prototype for strncmp(). Prototype was for __strncmp() instead


vim +/inline +92 arch/x86/kernel/sev-shared.c

    91	
  > 92	static void __always_inline __noreturn sev_es_terminate(unsigned int set,
    93								unsigned int reason)
    94	{
    95		u64 val = GHCB_MSR_TERM_REQ;
    96	
    97		/* Tell the hypervisor what went wrong. */
    98		val |= GHCB_SEV_TERM_REASON(set, reason);
    99	
   100		/* Request Guest Termination from Hypervisor */
   101		sev_es_wr_ghcb_msr(val);
   102		VMGEXIT();
   103	
   104		while (true)
   105			asm volatile("hlt\n" : : : "memory");
   106	}
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
