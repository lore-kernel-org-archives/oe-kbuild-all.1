Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776550;
	b=qRcYgJYKO2dyk6Us7xOvO2uiLxIErwTwyFSmcGidFBEY8D6+7NMGCqCaAQdtbxl4kFbg
	 jlyCQ+ziMpxMahCLKxkTh/yHHvi9fEsqZxmO9vLuWFJzBn4B9fl6+TQEtKZQI+QKa5Ih6
	 GYAsTTcE3ALh9ozJOJeFeiE9JsVpTvXwnyDNjTuHCQvbgTYQDkg/vOg4V/MHiZWb8lADy
	 1LiD4apIBVPfco6brK003YLN+uJiLMbwofg1oDIqOQ3ZqLIaTSdEL4XM+QkmX/mzHHInt
	 1/EOsNRzQKOX0uAP1H7TrcHBldpBApGA7LlyMZZHwTrdu/SCiooqtZ+urMoT2PlI6xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776550;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=xayDVCMkjZYRJgYXFSdiPBnL1jOnfewHznh2f1HvKu0=;
	b=LyveRk+oAg8k64kMwARDheo8wb3GGJg7nu7VE52/IiUzXqRJ71giP+Rpm5sgUS2EeYv2
	 DwCT+MEDG0dHCvUkwioCI2g/4MgpJaSrr/DmxFNvMeml/RPXS4eRQ67QGvE1089Tfe/aU
	 qUmarna2DzZHt6vzwlo5+ADFNDtJVwF/uKQhGlFeKY/3Ok4USHrEDmq3QIUzRhbnY6VZp
	 KvUkCzeaDxPUPCu66aOd5xEw135uIpba4SJR9TLvjC5+UUo1QvJjIg6CfCyJp238J/cwM
	 nm/eB2id5PHR7c62r4ew5m4LqaQkRbmJhOuYzhqGGUVu8j9ATIuL4rZWVwWu4wCR2nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U9GwuVIx;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEB2606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 17:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEEB2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U9GwuVIx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792776550; x=1824312550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5K4PvaJrt5AfdEkN8s1gCukkdHFNhr0suq4gMljfFIA=;
  b=U9GwuVIxmUokF0i7XHqWDVL3vIHnxKUCNW6jmJIsAMg+s5BJVywzQ7ye
   Tww8s/E7IM2u5NhyIJ5w9+Ho1W8jQHOuTFj8mm7mqL7nC8nK96jW+hBEz
   QUAl61a8NZ88QJfyaA3cTsoqkz2Psz7jXqbpMvL+rKpq/L3t9a2p1HDdC
   dFdSOb1/5EdRx5jXuim//+BZSrdeG++bUCmw5cCbC1R3k9MrQv8VPJKx3
   XxnX8j4u/W7PZb1EjBqKUrclwL1WwYhQlWW88ZaygZoAG6rRP/GkxA4R8
   A42cMdursam+Vqgr/w4gMyFIy7v/P67HL10WDPwv/GTX+Cl891iwINziC
   w==;
X-CSE-ConnectionGUID: oGvXmYRSTHCr8sJynNW+LQ==
X-CSE-MsgGUID: VgzwFdINQI6RItMNtufbYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1543914"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1543914"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 10:29:10 -0700
X-CSE-ConnectionGUID: qSlULhScSWad9HFlFcQkPA==
X-CSE-MsgGUID: PUyTooWSSG6F9XL+iJpCww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3690149"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Oct 2026 10:29:08 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKJ4k-00000000T3K-1b77;
	Fri, 23 Oct 2026 17:29:06 +0000
Date: Sat, 24 Oct 2026 01:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 17/41] Warning:
 kernel/time/timekeeping.c:241 expecting prototype for ktime_mono_to_aux().
 Prototype was for ktime_aux_to_mono() instead
Message-ID: <202610240145.XHPPRoyD-lkp@intel.com>
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
commit: 43397fe79e1c3dcc1334df0cd2c26459efad86ba [17/41] timekeeping: Add facilities to convert between monotonic and auxiliary clock timestamps
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20261024/202610240145.XHPPRoyD-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610240145.XHPPRoyD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610240145.XHPPRoyD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/time/timekeeping.c:241 expecting prototype for ktime_mono_to_aux(). Prototype was for ktime_aux_to_mono() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
