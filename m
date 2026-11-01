Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793517072;
	b=QQ5M91bBjlHQuo1mEZztjOWqrGwgo2265+Fx0EGp8AWGITfBYR7QjYBqIvckiSOBTe3y
	 Kbu5aEi75uH5OCoafc5MNyZuzb6akgK12rD61oj8ImL5Veajp74jChzm7wETR+aK3vcvm
	 EtK2pq9S7Gtv3ffmRX5IiFRRReviRjv383zvDATGr5glqAUBLkp22W5aUFsW4AZoY+Ewe
	 bT9FZuHhIcnFtIuygSAXnKDEuTj5xdGmQyyvCMK9zXpfneU2EBqQFMnpxV7T+/rjtdNS+
	 Ur3UfNOt4Q15QaffahA0gmaakJ0D59IMdWymf7TBAvCTyo460mhAba8v8vqYfYbVmsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793517072;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NxfeZR6+yMNxqHDn43WbYt+DjqgrmL6fmos76O9GxjQ=;
	b=c28ftVsgbGajuwBCIdkdTRJBQVAWvFwX+ai2NADlynT+JhKgzsFqWxnW7VRzDc/MROsS
	 6uNSc/kJE66LnbeBhpgiJ6aDmQyRzSI2ECXYfNBGdQ8KvCPbwtstAENA3qSNDKQUpX7sS
	 ueQT1MI7NOGKvwuTfJmKtne2SRbm+l+2OVhMgW/uhzX865F4cZR1+XQXUJoESnCvxgksi
	 Yw5S58m20016J3QGYVQG+9CiZI+iAhIU9H4FqB8eWVwjqy94c4jDq6O8irUXflLbTgwYV
	 ZNX0YKEKG7tt9J4fj9WXHun93R1tnxKyw+SxdM9XRXMQbmuVaMK6vKoX1+gCBIC9Jrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iwfVluAF;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51373606A325
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 07:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51373606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iwfVluAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793517071; x=1825053071;
  h=date:from:to:cc:subject:message-id;
  bh=Y3OezPQ7dNIy4Kkdw1MrIZy6KXawjQoNN+K8zzHU/1o=;
  b=iwfVluAFjtIs5uAQyozUINvbxT2IUGUDCsiSpYhbD9eH+weQOqpznd5f
   7p84PJop3RF8fC59+cv+j5GUa4SvBRXdDNe5b8LB4cEj6qFkxNZ+o0o/S
   btazjTY3/pY8RYuPiTrai4ywwVRfrylPP3OUJx6MsZWj/UAhTJKwmHqsU
   4TedZ9GofMMnW36x+mNzJx9hm5QhXqFf0kngz9sQALmlZ0coy1zxq4sp1
   Iigk8XZmqqs38+VmHOl4twzSFQ3zA/E9jUz6ZaOcKHV0jRLyobDLLq0YX
   AFdSbRBdndFD1mNuhalFzDsQIbRtY7J9Or5jGRhN5tXm1n62hjYtVtopE
   Q==;
X-CSE-ConnectionGUID: FPSHvvvDQ4CZLfaxxGyqoA==
X-CSE-MsgGUID: gajlIuOATj2hEPT/lRrDKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2221072"
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="2221072"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 00:11:10 -0700
X-CSE-ConnectionGUID: gWCcZlYCRzyUDlEoWeyKNg==
X-CSE-MsgGUID: fc9p731tTROCuI+9iuZizA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="6188754"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 01 Nov 2026 00:11:08 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNPiY-000000006OR-1DWf;
	Sun, 01 Nov 2026 07:11:02 +0000
Date: Sun, 01 Nov 2026 08:10:10 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 842/842] kismet: WARNING:
 unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE_VF
Message-ID: <202611010818.wzeYzYAJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   72211702f642336d084c9cb7a986b6c351449c6f
commit: 2ce56273e0cf23f5fc1b079bf9a8e574ba6bc36d [842/842] anolis: net: supports linkdata ethernet controllers
config: x86_64-kismet-CONFIG_PTP_1588_CLOCK-CONFIG_SXE_VF-0-0 (https://download.01.org/0day-ci/archive/20261101/202611010818.wzeYzYAJ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261101/202611010818.wzeYzYAJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611010818.wzeYzYAJ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE_VF
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
     Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
     Selected by [y]:
     - SXE_VF [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
     Selected by [m]:
     - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
