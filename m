Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAA53115B5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 15:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625326; cv=none; b=SYqIT+KkY2kUMze+kr1vSMGJUway40r+b/QfQrYqtVfiPHrHo7AcD9u22nBzTbomPxzjaMA5CnAhZ9q6lWhVW5c3VFJ+eu6IvQqZvqdn0rlkzDhTGj+MLxz03M5u7gJdges8OvrLw+dc0b+YEiqYEqrjyBzpzEWWNUadeGtSBGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625326; c=relaxed/simple;
	bh=NBADwtXyFUwnAoGMLCNHUofqlvFufoXNDnGeZ+Ah6Xs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dT++ILmswAQ3//J5OOLViNVOzLAvGJo7Q8+4Gwu+CBv8ItHSWbTcsFqJF0ykvvde7ouUX1sO9XUxz+UyzXjO9eP1WZVkTX9Vz3LMSAOtaY2CVVHSmWkpdTT7hGpmCgZZejYH016QxIYVXBdeQroqotrbnawWj9MBSE92auDKc5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWr/928Y; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWr/928Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774625324; x=1806161324;
  h=date:from:to:cc:subject:message-id;
  bh=NBADwtXyFUwnAoGMLCNHUofqlvFufoXNDnGeZ+Ah6Xs=;
  b=IWr/928Y6mWUYu4szxR0GzovO2tw61EOmrLmzaqWh5YuJ7Yscd0/LIub
   mwp9CIr8vxQ/DrcIXqbeQEGS7oYhI8JpLo/xax/s/QOFLe7wOrfh5E6QG
   nG9I0TqyOwQDlURBIgtGuAyav/k1SwCJ9mHTvCZ6V1vFaWSk4vY6MjNvM
   inCMSGTADm4Yoz8h6UBaOFtsKDT8luLiTQq9+0xZspOUUlAyV8fb2eMQd
   SM9ewtqGVaaxsYNwT/xz3/EgpT5GBiq8QiWM9PysWEYm8mJYejoT1CqHC
   ymMzuGS7vD0rw5vnTPt7fQHIFvtc/BFF+MsRBSLimljtvpttaZnUygTCO
   Q==;
X-CSE-ConnectionGUID: NLwsdGjFT8CLfAT6AYmuzw==
X-CSE-MsgGUID: W1lHG4nNTyq23kwXwmdJkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="74730870"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="74730870"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 08:28:43 -0700
X-CSE-ConnectionGUID: whcraDcqTXuUkjFiYQCUZA==
X-CSE-MsgGUID: Y672aX7hTQe/SHMfkjw1Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="218725153"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Mar 2026 08:28:42 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6972-00000000AOv-0VPw;
	Fri, 27 Mar 2026 15:28:40 +0000
Date: Fri, 27 Mar 2026 23:28:31 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:stacklive 10/31] {standard input}:1994: Error:
 register save offset not a multiple of 4
Message-ID: <202603272329.8ayKpuc0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git stacklive
head:   3bfe8407f4ebe161109091b311ebb12de347bff8
commit: fe8a7815581b0b97d5f38fd0ddd5b7cb26681e29 [10/31] bpf: Add per-subprog arg tracking analysis
config: m68k-randconfig-r123-20260327 (https://download.01.org/0day-ci/archive/20260327/202603272329.8ayKpuc0-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603272329.8ayKpuc0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603272329.8ayKpuc0-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:1994: Error: register save offset not a multiple of 4
   {standard input}:1995: Error: register save offset not a multiple of 4
   {standard input}:1996: Error: register save offset not a multiple of 4
   {standard input}:1997: Error: register save offset not a multiple of 4
   {standard input}:1998: Error: register save offset not a multiple of 4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
