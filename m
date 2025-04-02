Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655B423BD1D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 15:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607080; cv=none; b=Up1YHsMM2wd/2L0r6zT6Bh1AufjvJDic8Vxb3CPTFaaEPvUUrwmxlFZVgnWHlmP52wwubGqwHgJc873yVYvEO1Q1zxPA6UDqbGPat0U3LJ0MOX/72Us8iunPBdcxYqs28ed6wCBI2RCNU4YsIYNR7NWJzVE3vnw7my/rKyDC6L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607080; c=relaxed/simple;
	bh=SS5/lgPNDcWkM2yFY/YPkN1J8eFtxxD7kqxovl6ihfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTismO/BfVQVm5tmgq9ZyTbiid9MMs5n8xSM1P77Xouo5FV7mnN47N7nY9cCSbskWqENBK4dUlmlUsquA8UGfUAVF1+E3Ar1L6GddePVA247Ui0+rYBeOC9bQsCgNnWgyRylvDaj7AV+VjB4m4ve91hYkoliegNDMzoZUocMCVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JY35Cy00; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JY35Cy00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743607078; x=1775143078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SS5/lgPNDcWkM2yFY/YPkN1J8eFtxxD7kqxovl6ihfM=;
  b=JY35Cy003fxnfi/GqqKzNfbPD4+M4saLSvAzHFs0+o8h3+mCUAB3ugDZ
   bpz6ik6cSoUzTymWqmJZ2DRVVI9npO1UBJ46QogBJmwjQNlVcTwEwivP/
   PMNY5Hbc3kiFHslBdWYjj2bo0pWqqOGSkPGtfnWGaPdsBNHxootFboLkO
   J0S6cc6jFl3mYSzfz9FzFyLPkH3P2UNv4OdTopirhrvYTGUId75CX6E1k
   UZ47hzq/n6dhgkFhYupPkU4v24lkwf3Qy/K51eKv3H7+k3HxQDmoFvVhS
   fDVhzBIp3pnckKFL7jUsVHNR8ea0PlLJc4AZ0sSbcSbVe3Ps+Wnkjs0ZW
   Q==;
X-CSE-ConnectionGUID: z+Mk/aMvT6+Pebh1C9XBeg==
X-CSE-MsgGUID: 3wQVCn0UQI+MiL5HRHPGSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="70344050"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="70344050"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 08:17:58 -0700
X-CSE-ConnectionGUID: xSJXvwciQl6fZYq7wbg6CA==
X-CSE-MsgGUID: a/cvrNn3TcGDJtoMklmjmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="131598193"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Apr 2025 08:17:57 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzzqg-000Apq-0p;
	Wed, 02 Apr 2025 15:17:51 +0000
Date: Wed, 2 Apr 2025 23:16:50 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Machado <luis.machado@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] sched: Improving scheduler debugging/tracing interfaces
Message-ID: <202504022333.QjrYV1tq-lkp@intel.com>
References: <20250402122607.2982523-1-luis.machado@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402122607.2982523-1-luis.machado@arm.com>

Hi Luis,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 328802738e1cd091d04076317f3c2174125c5916]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Machado/sched-Improving-scheduler-debugging-tracing-interfaces/20250402-203041
base:   328802738e1cd091d04076317f3c2174125c5916
patch link:    https://lore.kernel.org/r/20250402122607.2982523-1-luis.machado%40arm.com
patch subject: [RFC] sched: Improving scheduler debugging/tracing interfaces
config: i386-buildonly-randconfig-001-20250402 (https://download.01.org/0day-ci/archive/20250402/202504022333.QjrYV1tq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504022333.QjrYV1tq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504022333.QjrYV1tq-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/sched/core.o: in function `rq_cpu_current_capacity':
>> core.c:(.text+0x73): undefined reference to `cpu_scale'
>> ld: core.c:(.text+0x78): undefined reference to `arch_freq_scale'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
