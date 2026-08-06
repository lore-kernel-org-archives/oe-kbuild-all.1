Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83B7352009
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 11:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017501; cv=none; b=nH5p0WDgO44x3u0TFVA360VPj1erpdpPel2XzWR6w+TdzwXlbEuIcMs26p/Q2bTt0t5rp4AGjrGA8Z0KCEYYIlHNWRJgBvhut9IU7S4nsm6mtzrnLrzWvGUFGa34pjucC/d1kheuRUFmDxIHWUGsOqiYgbvNHzvwRIQw1DYzhIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017501; c=relaxed/simple;
	bh=e7T0Gkqq4CXKx+8OJLcJp9iWwWwJGFdyISlkyK2pJOg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OXCijtFgTPTLsLMOwAm3+9q4/pN52vLtHjQP59Yjr3yMZAP4nvb59e754o8pJgACSwCU5r3bnTUmRpcmgC3m6NzWGwT9SHNvrOo78nspCQqNUyZYRDtTaZ17uR1ItwW+NYkH2xnB3IxEb/VSCRTELvUt0UXPDk0zT0JhnxayJSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSW/t20U; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSW/t20U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786017500; x=1817553500;
  h=date:from:to:cc:subject:message-id;
  bh=e7T0Gkqq4CXKx+8OJLcJp9iWwWwJGFdyISlkyK2pJOg=;
  b=MSW/t20U/ufvR79TBmFD09dwN2eiuQpjHL7dQlZM0cS0XCj62cm6O2ns
   K14YbvKv/KRk8yUpIG5zxriWgA1KRfWIRTRhp6pH18InMmhUkAEt50S1Q
   ZpD7mUlOkk1CABDdzrcRuqfpDcVpoY/hSaywwV9Jmb9Ta0FJP9i2FRGEu
   WEmMHwHDUMLALTFa1Vnyx4/wdJB3jaAZ86+6QjRWob307KaXxMrglXBvm
   yYGcX2mn/VUMexUgPcSoE1qSHL5iCrCpovvwamUg7BJKL091BfHbGotv2
   IHT+wmz2QANiU/aq7EimSqdr9mbW1g5UsgE/uYaUgYDMUllofTrx2JVKY
   A==;
X-CSE-ConnectionGUID: 3iFWDwy3TOq0jCZdn1S/pg==
X-CSE-MsgGUID: u4/O41mbQ5yS5BOcDPT32Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="90426583"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="90426583"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 04:58:19 -0700
X-CSE-ConnectionGUID: fLXF40ycR0+QUriuW/OL+w==
X-CSE-MsgGUID: M344nubxR6Se5Y7PSYoQSw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Aug 2026 04:58:18 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrwjn-00000000F4R-2azq;
	Thu, 06 Aug 2026 11:58:15 +0000
Date: Thu, 06 Aug 2026 19:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:pfncache-rcu-debug 9/9] ERROR: modpost: "__divdi3"
 [arch/x86/kvm/kvm.ko] undefined!
Message-ID: <202608061921.wi5vsOkl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi David,

First bad commit (maybe != root cause):

tree:   git://git.infradead.org/users/dwmw2/linux pfncache-rcu-debug
head:   8c4982ab129843cd9340cb055dfb6947aba11b78
commit: 8c4982ab129843cd9340cb055dfb6947aba11b78 [9/9] [NOT-FOR-UPSTREAM] debug: measure GPC per-mutation grace period cost
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260806/202608061921.wi5vsOkl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061921.wi5vsOkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608061921.wi5vsOkl-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__divdi3" [arch/x86/kvm/kvm.ko] undefined!
ERROR: modpost: "__umoddi3" [arch/x86/kvm/kvm.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
