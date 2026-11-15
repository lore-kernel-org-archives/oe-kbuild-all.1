Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760827;
	b=pNNP2tHKrGfsdFVF8wlH+s/2G+WYYNLtjINxd5lWKL1+7SC8B5MFQAlbXLtB71JC+tGm
	 Ef7x3ukfWAt1sTrxDREwgRZMJQMqcrCgL2fLXHiU34frr+K1qh5p2e+WEzlckYUOwgO+e
	 bjfQF7D0JLQ6x8hEWcp+YL6jO8jpUd6AZeKSBx81DgJgJWhCdcSPtXKqXVZdtK3/+hK6M
	 ncPtuc2+irT3u9CwORaxcawsqvW/s2T7ilpkXTgKBh+gVobcyG3F3lw2tZFGWiWZ5Ub5b
	 YBji5KWg6xje7ucTbIXmGCFgAtgUgByJLo2OGEamgESuwZD8CYvw7ko4HZ1uHgF2DNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760827;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=0d4XqzNLLUUIQ084977tKLwF0WmR1GX60WGzKIrcLY8=;
	b=IUt0MkKhdiidi2PAYaDJAyddyd7jsf0rs605wMsjZZnvQTb06//KmPmLZ4rQ30/Ib1nH
	 3jhEU4DZtbbwM/aqZGPlWL8bLRq/A3ZQBPJaGQ2DjesUhMzj3JLYsmigwedUYKKqjKPZA
	 GV1vnJfGvDOUCT3pfVWmgIU8u/ozgzrh2WvIB/vl7mRr4WJeDRowrbzmeDIwTQnEJREsa
	 OE5ndoUQBWRfmpxZvkPLeGbUCWAjUvxBXTtL/jXdaHnFp+sFPFcJXd/02LASWy5u7QE8E
	 WclcCeVrvCPvuroeF/XlBHHWFCxdV2RGUc+aQ3JxpKRAVgKT7bFJlKHaQpUO35X7xGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ep9KJOiw;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF1E606A31E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 16:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBF1E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ep9KJOiw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794760825; x=1826296825;
  h=date:from:to:cc:subject:message-id;
  bh=S7ElG9RSD1Cx59gpBo4rjwN7idGSf+xT5xf7LwDbMjU=;
  b=Ep9KJOiwmGX0cSJmmIBaf/j7enibbupS8N94gTrudXhfsdOOKkUj56+g
   jMqT83M5QtT4/lPjGACLTbCJMxEgDp7k6OcJPoeO1MPVVFNRTAApgiB/A
   ZiYgAyiiCDadndA6ju7PO9+W4r9NjdnXBbzKss3SkCSLj4d9HGWzsokNJ
   kcrtE2NpHukJ85hO29wF6/z3J3fgFxXSSlfwDbcjmV+6wsjrvlvo0NkbW
   uHwQ3lLblOBnwxRGC1WoGTf7SrtTtU2vJ2BMPiICdcfRCdtOcez63S6Xm
   BwxSQFxKebhLFfRECp7RXHI1qXiSl33LyQhbS/xJOwqshjfcPMyq4hmRH
   w==;
X-CSE-ConnectionGUID: 3rglYJfNQ2WqT54gNr5GIw==
X-CSE-MsgGUID: ptUy8TANSn+dufa378tbUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3359141"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3359141"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 08:40:25 -0800
X-CSE-ConnectionGUID: wvkH1dnhS1iY9HE0WBnREA==
X-CSE-MsgGUID: ipVvug9SQTSyBuCeQnh89Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9196001"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 15 Nov 2026 08:40:14 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSdH0-000000002K0-1UeO;
	Sun, 15 Nov 2026 16:40:10 +0000
Date: Sun, 15 Nov 2026 17:39:27 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 3/3] kismet: WARNING: unmet
 direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PCI
Message-ID: <202611151759.kkKylTwp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   dc68b182b9f87e42548fb6ce886be612535b2116
commit: 3aecfb5d583a915dc68f9fb5b5bc7dd643d5016d [3/3] anolis: spi: add support for Phytium SPI
config: x86_64-kismet-CONFIG_SPI_PHYTIUM-CONFIG_SPI_PHYTIUM_PCI-0-0 (https://download.01.org/0day-ci/archive/20261115/202611151759.kkKylTwp-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261115/202611151759.kkKylTwp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151759.kkKylTwp-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PCI
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PCI [=y] && SPI [=y] && SPI_MASTER [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
