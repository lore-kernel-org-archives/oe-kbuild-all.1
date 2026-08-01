Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF322175A81
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 20:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785615015; cv=none; b=Tt4DwXaS4OVESmXOIGvvSRiCUSM8F4yEJOmLzjsOe/DY7uaAJVld8c3XHhN9v9CM/9lvF1MGy70zPE8jk/59M3phM02Wv5cOKNdWGzMY0r2kmVffCK3xxEKEjTtcNxjEponZSPmdjAVImCE5Bn1Wijk1dXxLPSikbBZsMsdzars=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785615015; c=relaxed/simple;
	bh=FP3A1jTXkw3qJ0sCgWilY9/V5UsU70k4m99FYEcFRJs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L/hIQWcHzpJaBN2G8h2Trle7f8Ai4Gp6zsqvD7xVN+4CSQEVM1HXTfso7I5r0tgYVzEh1mMOYBI7dAU5OTT4F9aGSieJQ4LYx/8cTvSQSJhYIEtaSMU80MWeqMBZkRHZxsrqaGiDc6JmE5NemMHDq5aNj+t4ectiTc97B+bLlnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lSiuD7F3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lSiuD7F3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785615013; x=1817151013;
  h=date:from:to:cc:subject:message-id;
  bh=FP3A1jTXkw3qJ0sCgWilY9/V5UsU70k4m99FYEcFRJs=;
  b=lSiuD7F3y3JRikiOKQMoejXIHeSN9ZdcVjufBLUslnh7MvrM9bXbVab3
   kJxUTsBaximfd+iO21pukaRGD2wpVNxM9l4Sxssc3FNv1K2ex8a4Y9VKn
   jNtH0RWib97x46ivvCeMqTvraqVymXnMYL81aRZ2XZbh0n8N+ZGHllNKY
   DHsZmRiEpfCijhzeCBEqR40QdT+CoX85BxX14Dw8yiI7ZmqlyHrq431rD
   A1V2g/Li6Zs5XHLf56AVDPyV1LFMvuZ4wflAuWxIKJNpeEAICHZjAt8T1
   VF7TBX9Qpd54V77JJJzrlIAEqXd5FyqZZtc+SMaI+m4I/DGn/28UbvXxH
   g==;
X-CSE-ConnectionGUID: zVTHzbKwRgOozYGh6AF5jg==
X-CSE-MsgGUID: wUtWnLtkQTOM3PsneJBgfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="85977331"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="85977331"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 13:10:09 -0700
X-CSE-ConnectionGUID: CvqTmGR3QG+1pw0zDBhjOg==
X-CSE-MsgGUID: o/qItK9rQduJhvA9jNYAZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="299086741"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Aug 2026 13:09:57 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqG1q-000000003qT-1EfX;
	Sat, 01 Aug 2026 20:09:54 +0000
Date: Sun, 02 Aug 2026 04:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Nam Cao <namcao@linutronix.de>
Subject: [trace:latency/for-next 33/38] ERROR: modpost: "__udivdi3"
 [kernel/trace/rv/rv_monitors_test.ko] undefined!
Message-ID: <202608020311.hYjqOG5k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace latency/for-next
head:   984b5a36fd12d1849511a45fda32036fe2b0d004
commit: 8da2a88383658dac97769ed8f807ef6100a69480 [33/38] rv: Add KUnit tests for some DA/HA monitors
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260802/202608020311.hYjqOG5k-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608020311.hYjqOG5k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608020311.hYjqOG5k-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [kernel/trace/rv/rv_monitors_test.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
