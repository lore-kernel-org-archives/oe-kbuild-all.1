Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694315;
	b=1fU82p+KC5TWEpe0Jog3XkUW90/p0yXCPOWNchTnqrlXDNUWhcgdl4rNbYy9Qv3q7TUw
	 GNToJ1t1pn6ev2MOQtAovPUuY0AqwDDDVjprzL4R9n5ZFxMd8D/cywa0njUUudfdaLEtB
	 cLObJaPvVMmLC4Opq+ZqL9Xw3vjkLir46xhFAWxGEvNl1KcTVsv9O/W4Jwc++kz8A5wt7
	 OVQ9et3IbMXKhtU7FJV+iBASbsk9LmG5ZdAjVysJ6sUeddBIZbXZtAWfWHhKfQL5YvNjv
	 sSLU+YXKuLIB0VoHq3nqwoT2Aw64C8+hnSWx8wcrCR4Gbg5uoWUHTE3ZzO6XdbDxu3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694315;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=m/sqeQE+rS2t7YAOE+RMYMNRQkKi3JMaqA7b4GX7ezE=;
	b=o3674SeUDgdzzIpVOOOQrix4VBdX78eV3bNzvlRJP69ai2dqXvGToj+HE8lPv4cWmiBc
	 v6U7okjztbEETBu8l4SkT+kDM1I5yJb5MbjjuFFZrAhc+Ub/DEnGo47OuMfmqnelDyMap
	 AZxvl454nl6XHT+voOreOyxyAmNyc/phL6SIJ3hBxSWeot/88AzR0Uo2bjXn+sHie7G1t
	 6+ocYPQvTMO7ihyBRZqDeN+leuaHZgCToByJRx1K2vohsOOYqUEO3+hjJL5SusYYZs1Gz
	 ioMvVXjCBmvbjqSyH0D9JKp29Pw6CuTbBR6WxWC8tlfKJQzZi3bKSx05MoR4MxvTZuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dPDjggro;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBF3606A335
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Nov 2026 08:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FBF3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dPDjggro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793694313; x=1825230313;
  h=date:from:to:cc:subject:message-id;
  bh=Qji4qh29Uagv1nX384m9HUhZ9TIG+bmCpZmN+DpbPiQ=;
  b=dPDjggroMYqIwyLIhmABfIBeLWAT1jzZGQWlKtkmIl7+59bDJwHiAUqV
   6PcepAfSg8UPtZD2v4uz0BR4jinHtRvhHbuoVP+b1Heo2MkyXjeV4z9/p
   xHdA5wuKm38SRzmTJQXFBMOMeNnSb4wU1ytMOoiVXPC9nvVtqQbmwMEIs
   HuUrho6Nvis+z3P0ych3w7fKcJtZPjJUhQ/PScxsnGAt34HesH9hgVxkG
   755bnx62ojblhEAu5mbQP3pH43ueUoaWQeMx9vybViYMqX5IjCCsxQ1oJ
   hXFgPnCBEKZStW4HEzHb+V7ep/JF1RIr4jsatj2BEN/J2Xu2Tvblg9d7C
   Q==;
X-CSE-ConnectionGUID: 5kXIzc/LRJWjZAGpBNmSpw==
X-CSE-MsgGUID: XBeisDy+SH2u4Mju2bka7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2287611"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2287611"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 00:25:13 -0800
X-CSE-ConnectionGUID: Tz7DNksWQEirtI+UP6s6OQ==
X-CSE-MsgGUID: t5lP8mf6T6agsN5spLV3Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6740309"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Nov 2026 00:25:12 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xO9pN-00000000iUQ-1TBZ;
	Tue, 03 Nov 2026 08:25:09 +0000
Date: Tue, 03 Nov 2026 16:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/genexis-xg6846b-ethernet 22/29]
 drivers/net/ethernet/broadcom/bcm6846_runner.S:8: Error: junk at end of line,
 first unrecognized character is `,'
Message-ID: <202611031620.n4ptlpo7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-ethernet
head:   9efd82bc75823208a3e1c475db053417d3036bdc
commit: 8418a425aefab5763e03d2956cf7e3c892d63253 [22/29] net: broadcom: Assemble the BCM6846 Runner program at build time
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20261103/202611031620.n4ptlpo7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611031620.n4ptlpo7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611031620.n4ptlpo7-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/cciDuWfL.s: Assembler messages:
   drivers/net/ethernet/broadcom/bcm6846_runner.S:8: Warning: Tried to .set unrecognized mode `.L__sym_size_bcm6846_runner_start'
>> drivers/net/ethernet/broadcom/bcm6846_runner.S:8: Error: junk at end of line, first unrecognized character is `,'
>> /tmp/cciDuWfL.s: Error: .size expression for bcm6846_runner_start does not evaluate to a constant


vim +8 drivers/net/ethernet/broadcom/bcm6846_runner.S

     3	
     4		.section .rodata.bcm6846_runner, "a"
     5		.balign 4
     6	SYM_DATA_START(bcm6846_runner_start)
     7		.incbin "bcm6846_runner.bin"
   > 8	SYM_DATA_END_LABEL(bcm6846_runner_start, SYM_L_GLOBAL, bcm6846_runner_end)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
