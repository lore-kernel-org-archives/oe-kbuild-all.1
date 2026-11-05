Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839292;
	b=MI6u7qHngjUQ88sOPRcEhpGWUwFYjjcL0kTHFQgfBL2YIBHW/z67AsvePt+C+FeLcXNF
	 S4gUQ9/8xkgLNtdFO9f5Q9aoIPV5BBxtW8x50z+pk5elkRM/onfHgeR380iCFNVf2YB+p
	 bnN9NrgISp9U3IvrmKiFhh7Mvc7pDJEaXIzJ3stUnqIxGhJOAvsfceW9kBQBaIh+dFbXz
	 d7nwNZ6hkcyWtlUBt3yFu47USKVY+uCqa/ZK8MZfWAQu9itv8x49lfmVJTg2tUmPirfUH
	 vvTgYYyJk+M/6Q5qNdFWq8KmbSpsFyFhddriAGm9hOEpVApA8fMd3BE9ZpMVm1L8OcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839292;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=l6T4Rh1hHMth2PWZ0gODFzau/s3sh59SIjwdFPDSoj0=;
	b=nFu2WI58C3OwCAvSTplcmaVX2+AhpA9cQjeHS45+UqJeUrjySon72z+UathvhGP98U3s
	 v4SLhDjyeWrwvrXqGwyXJhlR5ONQij82lQWwk7KN8l2NWI9AI0oBt9HYLC2DQasB2E+EQ
	 22o414LN/eZEPpFmW/mfimZl6B92E6//DPdStWXicGqLl9EpI4oH3NQfwM/u0G3nI4+uW
	 xfLLzY9roacAXqunsUnwPHw45ha8D9/s2cIFLY+mGDIXa6n4rX2MiA8Ts6StdyqAsn9JK
	 nrGFlYO+FbRUmRr1/vBYgCPg9WQSckKADFxis3HS7ywq/urIBR/J5r5AhGkokiWcUhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ewUuK6ts;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043DF606A31B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 00:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 043DF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ewUuK6ts
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793839291; x=1825375291;
  h=date:from:to:cc:subject:message-id;
  bh=68nEDSsY9Oq2u2u4W0Phsnw9S+r4rGSN7Ucaa8rkVn4=;
  b=ewUuK6tsA8ZxHTW8nymCtkC8JN1zbRYpgaBoC5KmlNSe7NWhMK7F0VkX
   rPv/0mqQnUzfLQdKQNjhOrSwvuOO/FJNmO8V0zlax7Jq/F83M2f335Se3
   oC+mqaPQObq4uAPXhhRhVPY8pLP8717syVEasmGlO7r1xbw7m4kW9DRYU
   a4KoLMdypi/vb05Gcor9g9WeNqHrnuiAprsTNXwJ5pBJx7fPn+s/SwfuV
   yXfSTIhQLWMryTcOwXYXpr1PbpXd3WtqqqO0BqRrr1F5HLKcvxFgtrS1j
   I9LNoIOKVaxKtXzOUPmvu825bYw80QoQhW5Tt2Iw5P+kz9MCaRsqV1TM9
   A==;
X-CSE-ConnectionGUID: wl6ucdRVR+W0Sh+GXeWqpg==
X-CSE-MsgGUID: fuTI9fpJR4WpP6FMScaJrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2512668"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2512668"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 16:41:30 -0800
X-CSE-ConnectionGUID: nQ95HATsT/WSRE4IC2GNHA==
X-CSE-MsgGUID: vts0H//vRlCcnEgdwfUntA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7192738"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 Nov 2026 16:41:29 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOlXi-000000009Pf-45GM;
	Thu, 05 Nov 2026 00:41:26 +0000
Date: Thu, 05 Nov 2026 01:41:22 +0100
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.procfs.cleanup 59/159] Warning:
 fs/proc/proc_net.c:241 function parameter 'key' not described in
 '__proc_create_net_single_write'
Message-ID: <202611050116.5h49OFgP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.procfs.cleanup
head:   f445e4492022fee8fcf28abe412e5011f62fa08a
commit: c6553fbd9d8fee3e5d07dc6596e02f7289dbfbf6 [59/159] proc: let lockdep check the pin
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261105/202611050116.5h49OFgP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050116.5h49OFgP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050116.5h49OFgP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/proc/proc_net.c:241 function parameter 'key' not described in '__proc_create_net_single_write'
>> Warning: fs/proc/proc_net.c:241 expecting prototype for proc_create_net_single_write(). Prototype was for __proc_create_net_single_write() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
