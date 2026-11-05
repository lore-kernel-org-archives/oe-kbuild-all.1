Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793861466;
	b=UHKJhaPe5VIAbKyqzZnNTyVD8oKAO4Ev0oWGMcsLhw/Hiz3bpfBmTTZVw4dkXahbL1I3
	 WmwrGRo/RnChQF/tpZIYUwMF1xEYXAUdvLmAazzfJDYLnww7vinyrGZYvpLAtXHY8xskk
	 ohOyjJjprPtqXtgFloi1Pxu+zsiMCSbNKd4wsZ5vZnLv+7GzWY5JFs4sGGYEzitfLL5dU
	 ck86teV09WQlLwPMqiMRrwZfcfV2m+MtEChzb5vxUfxMwFjQbbGOMztAQwqY7i0QreDnA
	 upotbKfKPg/jSfgxFrKrXXE7igsyiWtuvoW6ZJexRPB7YvP8L65ur/ZHoMWK32yyhGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793861466;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=hXcYMT9X3bTIxQ3oQxBX4Fb1MyhYg2Zkt/vjSBJ8qD8=;
	b=GXvuivpizZ3T1Fjtcf1/nNUF1n/0SWm8Tp/QjmqDJk1uxviBDlTdj2ogUpQPp1G1h6dL
	 +XkTsl1NNoXzPgGq71ygqmzyV1F08XCjit07RrIWc/M8KIZ9GTJsld2E3PPPgnE7ynmN1
	 BtmEkVU3OQ0OoWoCQIKQqgQCfT707WFi0+fKQEF+Zjw3tje4qSE+HFNs/HmQ4vyMQKl3f
	 ZS8SG0XNp0EPZ7xOD/bjSaP1BrIR0OxcACYC5vMeTmd8YjnwEgQybc46rVgF5VAQX4ns3
	 VfwUqxtRfg61gKBE9Or6TJrl/bTnekZCgrvbHcW6oXuvevp6wuTOxZVngfymhE9YCcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SWQF68hB;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B320A606A331
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 06:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B320A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SWQF68hB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793861464; x=1825397464;
  h=date:from:to:cc:subject:message-id;
  bh=uExuA/PzhtE/ufJAohAXkwasvravfPzeyfWX1L31lm8=;
  b=SWQF68hB9aWMYSwGM9ByXJ6WBVYCg2HsdxdLI1rsIb79OcC+j5IJyg4e
   wet4Ps+Q4h9UKrohnD5JKjdzu9Qcd+e5cRCtutxiNoUGy5fHylT4LGNLC
   HN1UQY6zPy/ph/G+8l7u+UyH0WY4P/0CZabKq51kfPS1paAlY6yFDfc3i
   24/fw0ptZJbcR8P0deLhporO4ntz+aZ7kuNEYRtmSkf7O7kryhvlcXui3
   AH0rybF4EOawuTnVWxs7DvHiqIel9u0Bw4Xz0P6FZITfX3XSvp9Sg5Mnl
   dUMgS+PYQi8R9s+AnlH4/vAhNlWyI3P4EBxXy/mEDV9HamZ3g/QHF753d
   w==;
X-CSE-ConnectionGUID: VXwxNkZXSjGsgMJ6tG/0ew==
X-CSE-MsgGUID: RYEePFtPTaWWEECaJ7S0xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2511586"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2511586"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 22:51:03 -0800
X-CSE-ConnectionGUID: jSgJv0k9Qk+Oe6XtqdCC5g==
X-CSE-MsgGUID: XFtK9CQjR/qjD/T5+9L7GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7038766"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2026 22:51:02 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOrJL-00000000loR-1klg;
	Thu, 05 Nov 2026 06:50:59 +0000
Date: Thu, 05 Nov 2026 14:50:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.procfs.cleanup 72/172] Warning:
 fs/proc/proc_net.c:241 function parameter 'key' not described in
 '__proc_create_net_single_write'
Message-ID: <202611051439.F4ELEYVP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/brauner/linux.git work.procfs.cleanup
head:   f445e4492022fee8fcf28abe412e5011f62fa08a
commit: 8128bae57a57e1229b2169d88e7a7254d68955cb [72/172] proc: let lockdep check the pin
config: sh-kfr2r09-romimage_defconfig (https://download.01.org/0day-ci/archive/20261105/202611051439.F4ELEYVP-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051439.F4ELEYVP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051439.F4ELEYVP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/proc/proc_net.c:241 function parameter 'key' not described in '__proc_create_net_single_write'
>> Warning: fs/proc/proc_net.c:241 expecting prototype for proc_create_net_single_write(). Prototype was for __proc_create_net_single_write() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
