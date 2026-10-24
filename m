Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792811448;
	b=bIg5kfKE7QtbjShCNetVmw86/AqNZyHIKi4QNEb0IhSwx4+n6Grj/XFlyd5u1oy/0U6I
	 R1vAutOaFUbmeRjbR+6Ue6ughhiJGRukRogjK4lck4sBGZl5rCLBsjiW9ooQfZnj/XzR0
	 xnKCF/DQZOEs3R/VrlhHy0R7EQFQ5FyvhM6VMZjnS2Dac0y3SFRkSxk7Va3OxnIhO+SKD
	 RdfwPuvd0n1zE225y5YAsE/DCNU4ALqT8yDVbHAC4k38/UsZP+9WRK93OsDM+3rgANA5M
	 SrRBlfIs26Ud7hgWWYzujgXzfP4xcPaxemTYHWEJtAAjUWefVztNs/TQrHdgj8h9rxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792811448;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=f+Cr+umVgXMe9KfNVEYCW5f8Y8xpCtRjeo6mvNHL0+s=;
	b=uCcpE3D5Z5LTK15qme+OIDOUGDjhh6OqTBPm5s0pk7SMGe9xOlFr/GijuhP7/l8n7eVI
	 9jS8JcfYBOgQ3S1qBBRPLl3//BCvfRR+2adBV+EVGXIrnXgvfFEQYz/Rh1dPhgQyaw6fH
	 6Nv2yO0atE8f7F5+wdyccwh+1Xl/oTAAqan6I1HPTwqfc8cdEjsf+zwZKb6Uw4+CmxjlP
	 O+1jyRZbv79+ZfYmOgvS2BsH8D8ANR093kK7C6N/+yVMe0BShlqfzrhkNXtfrmyfc0cbU
	 rgiuWRURaxbGHA7MLgX6FbbAw/guOdKbksTm0FwZKf2wPzFXMN3KDCg9Ss70JvQcIJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SsXtLAU9;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64301606A31B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 03:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64301606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SsXtLAU9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792811447; x=1824347447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7u6wnZrpkkGvC4DamhU9kPf1XMYQE+RGL1UjBwaHLXc=;
  b=SsXtLAU9bE25uy+XEyNKTERWgW6WClh0SEY8v0sHqI7/Ayr09uFDMuaC
   dRNW1vNhcIGTGwHBKObwtKz1+V6Mw2OR+aoKoZa1zgNM/TJLwMhgEKvt+
   6pTsMrbK7n/JCRj5p1zcEYfvuFM+gP2xqUlpQJdDlGMJfRR43ps8VRxpD
   UFzsNwExpSgZYjtDRUjl/4J2loKfLsVieVhx59VajkecK+kxkqOVtb6tU
   IX3s+GGGlBpRwG4kQ+PJ1dQceBHcDZg6GSrDQhYbUVs7+mQDbmfnhsNn+
   SZYG7OU7lbC2Rkxv95BL85sI3QFNxnwF/p0RC6LzuIFBrSTN/lvRgf5Ze
   g==;
X-CSE-ConnectionGUID: GvViIswbQvCPaqcTDF0f5g==
X-CSE-MsgGUID: qRh4B+7MR4CnYJ2xH+Xyfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1588000"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1588000"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 20:10:47 -0700
X-CSE-ConnectionGUID: 02VhpRjvRHO33Kkbg4td7A==
X-CSE-MsgGUID: gQPdsqyqSu28NWQXUmJs0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5641586"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 23 Oct 2026 20:10:45 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKS9b-00000000TWy-2gMd;
	Sat, 24 Oct 2026 03:10:43 +0000
Date: Sat, 24 Oct 2026 11:10:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 18/41]
 aux_clock_test.c:undefined reference to `__aeabi_ldivmod'
Message-ID: <202610241125.3T5wIcJl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   a40991dd87115c3f70bf87884b803ed7e09dc387
commit: 503828dc4bd6f98d85d169659fdfc68f30032df4 [18/41] timekeeping: Add a test for auxiliary to monotonic clock conversions
config: arm-randconfig-1002-20261024 (https://download.01.org/0day-ci/archive/20261024/202610241125.3T5wIcJl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610241125.3T5wIcJl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610241125.3T5wIcJl-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/time/aux_clock_test.o: in function `mono_conv':
>> aux_clock_test.c:(.text+0x288): undefined reference to `__aeabi_ldivmod'
>> arm-linux-gnueabi-ld: aux_clock_test.c:(.text+0x37c): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: aux_clock_test.c:(.text+0x4a8): undefined reference to `__aeabi_ldivmod'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
