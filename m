Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793155640;
	b=qIeXF3BbIVSUOHu4OwvmJu/m2FQ+m3PeeUx7AYYzweXjwPT4UNtOPrdCbh7iJvQATwfW
	 LwxcEd1hc2oFYwiQrho3deefoER33z9B8ASFRClih9l7yvSdcMoLnDuWFm9hFye0m/MCq
	 bNSGPvijpBZXAWmvZTea8+FlU590sdbdLYBe/lH1oiSBkfqbWHHNLdlAgIQXonecizBZc
	 Q3ry6FofU73UPVBJTsiha9q9E0FhQkFdEGpsYWfaKVEoiUUFBXpLE9jJKoxDlx0G/pLFG
	 BVDpXTrtdChZk1Z6k70A6PYJN21+IbFGVzBoZrpmRwS8JdpXN88u4rObASZ4e4SkxOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155640;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7f5TK1JGwEEbphlqVECbDXQ2TlLJMQVMNuNXf7kYdLs=;
	b=RP2FLAt3B9HWJoqaq6B1ImbkQqv+rrcAyN6UrnAfJZmwvHRGPWvMgxYLCEJ2OvnRy925
	 p62OnQsKcnYcUXvkX118tU8mtEpQKcvy59A1w9N+HBJPnlYRTRIQJFKj0KMiA4zMWoUU3
	 57tKvNjUOXhcNPtKgfMWJN/ryyoaw6D+CTy4qGNJybTODzZEi7NkOWuarerB5z8LEP1FL
	 P/5R+DSkJv4+7wuVQpjx+tOY4GyHKehGkjWioZh2QYyQZQcqLEruIVTQfELgXx1qJiTp0
	 x/MoAwDpAmBYpwxpgsz7C1s2EsXSs1f9xOOXknIU3rUt/BodS6h2RQ1ecSmIIGF5l1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d1pJLudY;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC166606A31F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 02:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC166606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d1pJLudY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793155639; x=1824691639;
  h=date:from:to:cc:subject:message-id;
  bh=Bw9F3kUAuBTQpzEcO5h00viyqxmF8oJKMyRIghsPNSI=;
  b=d1pJLudYwQ4yAOqTU684+pwicB7FT0Z5prXakqRX9/bctDYYSjEGX2gy
   YjIPnR1OyfcbrGPMMnMwRn+EyinQW23Sf2isev2WB5lt1dQ8Ki0d83Tns
   9HWMmuHfsr39tp0hUVrVCXWfhdMM32PPKEyvfdvKGjrn0OJhZ/5FDXtLf
   ttVmeIYKOwITMBKm5O1DRkB7Q3l8ZrymS30x5ZPJw/3P/QeDCucekedqM
   UpkIDlZ6FaSxM9zXSFTOMnuYZA/K2RWCC6yU2cqqOqdfR/GlVpI73IDUA
   sYIC60vTdFsRRH6xRfWea1d4RVOU28jbFmU0BWYzuUmVYp8kIpSwtZJIy
   Q==;
X-CSE-ConnectionGUID: feCUWTbRTtGSlDz0tOPQuA==
X-CSE-MsgGUID: 46/HxScgRASf7IXc7XB3vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1879675"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1879675"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 19:47:15 -0700
X-CSE-ConnectionGUID: 7KwhVTuyRDWxFouHohTGGA==
X-CSE-MsgGUID: I+xnpP0URCGlU1LRE5Apqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4662726"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 27 Oct 2026 19:47:14 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLth1-000000004jh-1thF;
	Wed, 28 Oct 2026 02:47:11 +0000
Date: Wed, 28 Oct 2026 03:46:49 +0100
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/ffa_ns_sgi_gicv3 5/6] ERROR: modpost:
 drivers/firmware/arm_ffa/ffa-module.ko: symbol 'of_irq_get_affinity'
 undefined!
Message-ID: <202610280344.CYmLBp7N-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/ffa_ns_sgi_gicv3
head:   eb0acbc83e30f735f7316e884334e50e5f4aec83
commit: 358f0733191a70917dd0964a9633ffd295e5637a [5/6] firmware: arm_ffa: Use device node interrupts property for IRQ lookup
config: arm64-randconfig-r2309-20261027 (https://download.01.org/0day-ci/archive/20261028/202610280344.CYmLBp7N-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610280344.CYmLBp7N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610280344.CYmLBp7N-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/firmware/arm_ffa/ffa-module.ko: symbol 'of_irq_get_affinity' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
