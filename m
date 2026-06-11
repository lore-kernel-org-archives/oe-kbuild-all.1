Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9006E3DB309
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 12:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179760; cv=none; b=RlJvK5An/9VUwZFpKtZ1llX/3subBwsu90AwDHxJFWNbiDAXPPco/8ynlZ/EH8Nk35OHJEQMHlrlfBVp4ODZPsbji+bOf+vSAmU1kjhLzuDjWX9wG6or24eVexPUHcABE65C5n8Vit4Ig5Ko1LGT037jwdU3jAlqy/Au5GhQ0Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179760; c=relaxed/simple;
	bh=z02zKOUAM011rlRifBtAHj4Oz13KMIanIKb2FPSgAT0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sknB9a3vVOAr66CXg1vCOa9wfw1WuLPd/4iKI+0YAhav98B2rBCzRoHgZgeDuQA3cKKUdPdKE0x5+0DKr/tZSeouMeZDZGKseppqlAiHJ8qn3pKr52w0eZT0sq/HqJJA1qnX+68sOEgl0RghJmtOlAF3tLKGkgHSxxX1Y2VpDgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZqwtbUq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZqwtbUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781179760; x=1812715760;
  h=date:from:to:cc:subject:message-id;
  bh=z02zKOUAM011rlRifBtAHj4Oz13KMIanIKb2FPSgAT0=;
  b=MZqwtbUqDuxY29bSWI0Cz+2qhmESeMizQepcaPcKp0Jx2fuIMMEyxywg
   aGzKn0d7NhttM8n40NMil8+9qjT8xUnGnO06rZcnMX3uWr9stFKlIS63h
   s1C4JeG0Xu4Q2KxhFQSQatp3wySSo6qQAWUOflp6c9yKgoOAKZhqbfFYP
   dnax0u2JIUDx7VDopM5E6koJvGYtkfwjtY1LCu7vBvpQMOdNBvwKmTlYb
   /L5NccvMf63j808UusB1WDFKqVTul17Oh0RkBeo9dmVAmQ4F590gtLfOd
   uoi2oIj5EGXAwzispifYn/xyQJJo2JPFuPyJeF+TzkwYkrPpg7xN0DvJw
   Q==;
X-CSE-ConnectionGUID: P4QgtfF6Tyeavg4L19BUhg==
X-CSE-MsgGUID: dGGK/kx3S8WHd0qk0MsI8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99413137"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="99413137"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:09:20 -0700
X-CSE-ConnectionGUID: ZXN8icLOTXOYc+7U+v6pEA==
X-CSE-MsgGUID: O3FTVRnBQ2SYPXJsGzMNSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="240118084"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jun 2026 05:09:18 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXeDj-00000000MvC-2fWu;
	Thu, 11 Jun 2026 12:09:15 +0000
Date: Thu, 11 Jun 2026 20:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:timekeeping 5/6] Warning: kernel/time/ntp.c:94 struct
 member 'time_adjust_frac' not described in 'ntp_data'
Message-ID: <202606112009.As8Zolp9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux timekeeping
head:   de2e38ca82065d19ba9156b254f29db16d5b347e
commit: 95a18e0285ccbd4594e477ca8bf728c505e629af [5/6] timekeeping: deliver adjtime() time_adjust via skew_delta
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260611/202606112009.As8Zolp9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112009.As8Zolp9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606112009.As8Zolp9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/time/ntp.c:94 struct member 'skew_delta' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:94 struct member 'time_adjust_frac' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:94 struct member 'skew_delta' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:94 struct member 'time_adjust_frac' not described in 'ntp_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
