Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853673E3C6F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 15:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775834371; cv=none; b=PH1A2JHqEiTEsCfUCt0KEd7QORJKT6FtniA4WiktloUYhXWG9d4pyhbEX+DNLPhorFXaCO0ycd7grnDjOtnbNh7ARAgp+Mlmzc6R8TvrWiSvyvR6iNhKlN7U7Z93yR6Iby/rS2GsHp7XCxpbXuAKwaCgC+1NuuD5xC7NaxDkhWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775834371; c=relaxed/simple;
	bh=5bti6v6L78QbD8k5984GHRETR0Z8hc2xi5kIDEyzRGQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uRhiq+SszkGdND7Oy06DHWwirMqyex6CTGjSeyRnMlnF2Ij6MuR/p7arCi1j9RKTWZX4yi5Jkd50xxmcDu0Pji/8v0MRfD06WSViCWlK7cNT5SthqY4mOlNHsotaaLvP+N9cen5gk4nhCn7RGrf0jE62t6I4tzWCCSZpcom3g1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUtENZt0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUtENZt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775834371; x=1807370371;
  h=date:from:to:cc:subject:message-id;
  bh=5bti6v6L78QbD8k5984GHRETR0Z8hc2xi5kIDEyzRGQ=;
  b=VUtENZt0sUqmWPtTWjXw6Fk4bvIBFdvsKzGe2V0UwrYGTQH3wzYeJ+zd
   YbElrXYYqMgx2XSL/NAU+CaqKcrkrwv+bIeTNQNBdQ7sn3s+wxacGC7vN
   FjLCOcN1Hbaku6shgTLV5d26euGK2XXdrPCKY4Vkr4yqhmAIc1EaT2tZ8
   BYsdMvIlnm5p4RAYbx9el4bLtrK4itlFhEJW+LKEudRPAoZAODoGQ84oo
   jYMp/IYBYPg5xV6bAFlrFjD3/rsRjrWw3QK1/NXA4cibi1IJVytgyKSIf
   5FRCq1EW67Oj6v0EuwjuutBcBO+I94/6exk4RV/sq1AzoNKSuZQS0gskt
   w==;
X-CSE-ConnectionGUID: cF68rSGwQqefk48KWriFYQ==
X-CSE-MsgGUID: Z1QoE91VRwGxTsRYrLsegw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76874464"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76874464"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 08:19:13 -0700
X-CSE-ConnectionGUID: Th2so8CvS/OVLGI1L7cRhw==
X-CSE-MsgGUID: lkMPPZg/TvuLBhDsPOMJlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="259565584"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 10 Apr 2026 08:19:10 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBDdU-00000000Auv-2vCp;
	Fri, 10 Apr 2026 15:19:08 +0000
Date: Fri, 10 Apr 2026 17:18:11 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 11/38]
 drivers/misc/sgi-gru/gruhandles.c:65:21: error: 'GRU_OP_TIMEOUT_NSEC'
 undeclared; did you mean 'GRU_OPERATION_TIMEOUT_NSEC'?
Message-ID: <202604101734.qw9p7cYr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   4334f669c43ca5506bf51471e81f18deb659410f
commit: d324f04a261f5eb89704d0b076a8759d24b23859 [11/38] misc: sgi-gru: Remove get_cycles() [ab]use
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260410/202604101734.qw9p7cYr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101734.qw9p7cYr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101734.qw9p7cYr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/misc/sgi-gru/gruhandles.c: In function 'wait_instruction_complete':
>> drivers/misc/sgi-gru/gruhandles.c:65:21: error: 'GRU_OP_TIMEOUT_NSEC' undeclared (first use in this function); did you mean 'GRU_OPERATION_TIMEOUT_NSEC'?
      65 |                 if (GRU_OP_TIMEOUT_NSEC < (ktime_get() - start_time)) {
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     GRU_OPERATION_TIMEOUT_NSEC
   drivers/misc/sgi-gru/gruhandles.c:65:21: note: each undeclared identifier is reported only once for each function it appears in


vim +65 drivers/misc/sgi-gru/gruhandles.c

    54	
    55	static int wait_instruction_complete(void *h, enum mcs_op opc)
    56	{
    57		ktime_t start_time = ktime_get();
    58		int status;
    59	
    60		while (1) {
    61			cpu_relax();
    62			status = GET_MSEG_HANDLE_STATUS(h);
    63			if (status != CCHSTATUS_ACTIVE)
    64				break;
  > 65			if (GRU_OP_TIMEOUT_NSEC < (ktime_get() - start_time)) {
    66				report_instruction_timeout(h);
    67				start_time = ktime_get();
    68			}
    69		}
    70		if (gru_options & OPT_STATS)
    71			update_mcs_stats(opc, (unsigned long)(ktime_get() - start_time));
    72		return status;
    73	}
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
