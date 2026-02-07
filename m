Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8932B136E3F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 06:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770445233; cv=none; b=QVObSHEbMJ+72ywsaqEBYDvpo7x5ScBbgKqAgdCvI2PdDQoBYD57HvNCTZsqzXLeFZyZ1fUeGjWAXfJwO/bY4yawwqUbRjiE20a0vN2EFBKsx2o8EPZ1hTf+xtpZvjw4dLplUc26S0dqcA++D9vvSycSjwOk/sm9X6AMXmj4uwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770445233; c=relaxed/simple;
	bh=i4mhmkIrV1Rus1pkTDg+sywVx9+Q9ZOgPT3gHX+Wrug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnafoDnPKRzBEAFNI9Aj/8s64vVOzjRoJvSEz2sYHOosFiZWcsxm5XACug+QXHPJZFd3d4/bzOAlb0ceGeNHb23SuOU1un+GVoz22gEQlqEzMFyjLwwCz9qfaLbOgD0J1RxzZTPdUYupuz1SzqEuJURKQBh6LOzp096MBIUp1Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0rJd8V7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0rJd8V7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770445233; x=1801981233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i4mhmkIrV1Rus1pkTDg+sywVx9+Q9ZOgPT3gHX+Wrug=;
  b=P0rJd8V7bLHhcJpm7Q99pc9+D1OwRlK4xfgaqHBI9P1WJj4EdmNeaUho
   Fp1sNuPzWi740N9GGJkUYpUFt4zlcZFgtmbNrGhPsXxtpfZ8d1okbxlUC
   WzK2v/TAd6tAZl39JpaoEIwn98mzE4wvqPT9bWlmHMPq2V3fs9U2KCVSm
   blYFUcW1UnXRrplfrLPF4exKU2KohLl0zbw4RfYOoiLFhdy942kSyGhqH
   GmgKR2Hgy6hFZarK/rF9HNR+Y/v68hoD2fbRtMC1OictCDLkncQc6+Tni
   PU6ePIhKCXyRDfJvplJ0bhDCQjfsvgdeR3+WQjC/piAKUaT6hZthBqtoQ
   A==;
X-CSE-ConnectionGUID: hmkvFgwsQji+d4x/ZlK8Iw==
X-CSE-MsgGUID: eFfgLk78QQuLMsOXeg2FMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71538304"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71538304"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 22:20:32 -0800
X-CSE-ConnectionGUID: OpALwzO5SyKgzhAV54ZiVQ==
X-CSE-MsgGUID: nFi+zvy+T/6aMM6M4AHZkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="248692753"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Feb 2026 22:20:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vobgD-00000000lS4-36ZJ;
	Sat, 07 Feb 2026 06:20:29 +0000
Date: Sat, 7 Feb 2026 14:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: Qiliang Yuan <realwujing@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 07/12] workqueue: Dynamic housekeeping mask update
 support
Message-ID: <202602071435.cfEvAHd3-lkp@intel.com>
References: <20260206-feature-dynamic_isolcpus_dhei-v1-7-00a711eb0c74@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-feature-dynamic_isolcpus_dhei-v1-7-00a711eb0c74@gmail.com>

Hi Qiliang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 1f97d9dcf53649c41c33227b345a36902cbb08ad]

url:    https://github.com/intel-lab-lkp/linux/commits/Qiliang-Yuan/sched-isolation-Remove-__init-restriction-from-housekeeping-cores/20260206-150801
base:   1f97d9dcf53649c41c33227b345a36902cbb08ad
patch link:    https://lore.kernel.org/r/20260206-feature-dynamic_isolcpus_dhei-v1-7-00a711eb0c74%40gmail.com
patch subject: [PATCH RFC 07/12] workqueue: Dynamic housekeeping mask update support
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260207/202602071435.cfEvAHd3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071435.cfEvAHd3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071435.cfEvAHd3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/workqueue.c:7917 function parameter 'nb' not described in 'wq_housekeeping_reconfigure'
>> Warning: kernel/workqueue.c:7917 function parameter 'action' not described in 'wq_housekeeping_reconfigure'
>> Warning: kernel/workqueue.c:7917 function parameter 'data' not described in 'wq_housekeeping_reconfigure'
>> Warning: kernel/workqueue.c:7917 expecting prototype for workqueue_init(). Prototype was for wq_housekeeping_reconfigure() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
