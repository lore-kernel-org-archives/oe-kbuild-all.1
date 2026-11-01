Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793501445;
	b=glvjvnsz1JrRuE/pHVDxtX++E77Hb7stV3rBvn/IHwAVcXux5mRdFKYmXyk36Krr9cRt
	 +Hncp5bpQ0pWK01kZ1+MDlbFBm9WIH0W7i10OG0Q0PYloogMCIrGjrkKH3Af/hC6YWcXr
	 zxDyqqhY2i86dq8FCu0lMPyapkzm3tcMfNoI0Q7nBSBpq31mI27/MvfyBvBy7ZWOwgbIe
	 ONar61IQ42z37uG0HGEys3hubNeqKt2NJJSyfLnDPdPn5XY5pg3zXq2bkCd6hDgQSvFi7
	 6cBzSSZ4cGirFkfbXnIJSC3VEKo/J6KN4IVWFIRgQWTWLjpPySCHzpANfeAv5D7Y5+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793501445;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=VxoqU5n3EQgH19uGlnKJn7PaUw0NoT6Vd1peODCR+Ss=;
	b=SwA9VEkwrF9EQltThopEnjZZhsP9WcrN5SY6kPbDOIh9TUHqxKkowJoNpskR87jag4B8
	 rYE9JiC4iCkWKiAoaa0kGOGcXPx6WweW8IDb64xdmZCjN1+iULLlPLVlsb8kNov07lz+3
	 Z8thtRGvPSj9PlXHFYdKsc/BdwP6y4nwLsl/1P3JSnOkPzqyM+Wv7SkD5vg9p79ZWyxhX
	 SBKzG5221wuMPgF4MrP/3f8mjPDUotZB1yQYT4WAFCwGBlVHYow9Hm8HlTOaLoCH36ui2
	 tIEo+RkwqUe2YdrSMx/oPek8PjFb99Voh+e1rb6hzCm4SCJv0RGO/40OfmZeAC3UpXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PkfQ3HlE;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7F4606A324
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 02:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C7F4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PkfQ3HlE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793501443; x=1825037443;
  h=date:from:to:cc:subject:message-id;
  bh=GY47p+7skq7P8WycVmuJLQMFuugMg/Hj2/701k2T5RI=;
  b=PkfQ3HlEPCaQtCJFrs2AlwgHc5PIEgH69JeQYKyvQgTUakuUxLQ9cgdk
   zAvzpxScyCWRocpUWpSER7MO8bHfPttefhWTKFGaMyZ6u3CllfDw70NNG
   RxJ1n0E73c6bk0Ve0sGNDpsvyjeICLyX+ABPZ9g8WfdeYkUxruwfWmFo3
   x5Xg21J7MZcwjWuQr4inuw5B4UtVU+x5OaIXHA/EFMMZb2XyPW3BAlAul
   zRoWmw19bItbe1cE5ZAcz3f9GkhxfXiHYKFHjIYIIavV/YzeUg1FGuEY5
   SlGGx6f/WA4Y9EJhgLWZpSv6yjUyrUwuPKD7osTTES22exKTshD23gntS
   g==;
X-CSE-ConnectionGUID: 6xgq8Qk6QkaPji+s/jyywg==
X-CSE-MsgGUID: 5jAbdHZtTK+lAt179HAq/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2104146"
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="2104146"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 19:50:42 -0700
X-CSE-ConnectionGUID: w20I1pH5SXa9Aqfknjnvyw==
X-CSE-MsgGUID: iiio5ptJQoiq/OOl1Dr53A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="5881328"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 31 Oct 2026 19:50:42 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNLeZ-000000006JH-1KV0;
	Sun, 01 Nov 2026 02:50:39 +0000
Date: Sun, 01 Nov 2026 03:49:52 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 842/842] kismet: WARNING:
 unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE
Message-ID: <202611010337.llgrMpPd-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_PTP_1588_CLOCK-CONFIG_SXE-0-0 (https://download.01.org/0day-ci/archive/20261101/202611010337.llgrMpPd-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261101/202611010337.llgrMpPd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611010337.llgrMpPd-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
     Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
     Selected by [y]:
     - SXE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
     - SXE_VF [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
