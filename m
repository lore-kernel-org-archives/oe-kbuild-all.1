Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4294717D346
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 11:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742212227; cv=none; b=tsTNAWoBgixNdvmfNcfYYBBfSpJ9Us+B4m1ehtJrGP3qnZjJ4auf3XmwaKjLMn8y+92agYHooCoLxmIf7uJIPRxkQn6dP5FeVaU+02L2Kr8A0SPuCjWuDOfRcnMmxcVC1aPbFJAMMioS+F2Lo4otGrPnxgF13t4KUK7M7uQBQWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742212227; c=relaxed/simple;
	bh=pYlh3qWGBvYE8DjR/ysPcaeBDSgUnTQX1Tcz8M67fhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ioOMIuOTvnURumGFS3b1WyZE4efdhkb0EVF6OfvHNWOxP/7HmlGfKxUddauXm+PhRly2Z/Vqu80TboadJ16VRzs34YRwfvO9NQbCN1Ci0ANQcYUPM+3E6QtrvHN7i4/PMo2uzrjXymk4Ie24moPWCM8PSlWhOhPMfwBh5/oHwfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APUXPORH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APUXPORH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742212225; x=1773748225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pYlh3qWGBvYE8DjR/ysPcaeBDSgUnTQX1Tcz8M67fhw=;
  b=APUXPORHmVgk/93oey+9TKffxm6c5yCzqSy0ZhOKos2FBa+OOkHhBuCC
   eKHiKllY3MkKgX6wieBo7tfDVfPTtMNZuj2BgMLE3m9UNR5d32NWQySSJ
   FCOgoblKBDVDMGhZvZEmQEwVMsWE6OnnhfTVj7iti9Si8/IhTNxsw2Ado
   PdYoA+8Wpm+YAH7Nkt/RgUKlGNXrBq7r8qaINMP8/Fh6EfVvrVUmesUtL
   BOSl8pzJcXJVgMhUIjhHqsJjGER9eT4Qf4z033Wv6Bz5h1U7j/0CLz+5a
   Pjz8ALLC3t3Op/pPrccBkrAi2vHTWT00HNmZN9Fw1NH/7hq2v1F/66v/a
   g==;
X-CSE-ConnectionGUID: H5pSUbLtTnmhR5btKpBPEA==
X-CSE-MsgGUID: A6MKu079Tge8/8dA2vkcCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="46068527"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="46068527"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 04:50:25 -0700
X-CSE-ConnectionGUID: 78vQO9H5QDiCXrbAr4MZRQ==
X-CSE-MsgGUID: 8iznc4VNRV+P1VEIrbOpuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="121928699"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Mar 2025 04:50:24 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu8z3-000Ci8-1V;
	Mon, 17 Mar 2025 11:50:19 +0000
Date: Mon, 17 Mar 2025 19:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1497/1497] kernel/sched/.tmp_debug.o:
 warning: objtool: missing symbol for section .text.unlikely
Message-ID: <202503171950.PEaY4TuS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qiang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a91497a471caf8cc4af64a68492be62ec9568f7e
commit: acfa0f545c7dd43f959c28e8ab4b139c927ba387 [1497/1497] svm: reduce log of run queue and atomic->atomic64
config: x86_64-buildonly-randconfig-005-20250317 (https://download.01.org/0day-ci/archive/20250317/202503171950.PEaY4TuS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503171950.PEaY4TuS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503171950.PEaY4TuS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/debug.c:797:6: warning: no previous prototype for 'sysrq_sched_debug_tidy' [-Wmissing-prototypes]
     797 | void sysrq_sched_debug_tidy(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/.tmp_debug.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
