Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439FE3C07A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 12:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774267335; cv=none; b=bpVnP9xA8O8HnYjLCIsYCGNVGqWvqu0tolBt9XIwp62X31n+txU5o+TIgDZykUOYVWpasGEL6VpHRrfp+9GayYTe47u/96w+13tjBbEcVAEluLFMQP09TwMvBgyQPTpl4esz243hcvXwCpS1mnGej4hatEdn/fJb1nDgXtfv+qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774267335; c=relaxed/simple;
	bh=Yb6Yo7v68q/dnreJSUrZBtLutQX8Sd0o5/yGGxMn/Qc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iU2x28LY+h0DMC4vCLSIEVM00pSHAqHG1fRT0h/0jFKmZLY6w7mf4w4+doZ59FV6WPctyX/pXhPes5mYtMqsCGVK0Tg8pvmh4mjxJwxVWfdQE1OI+zbpkJ7Va8mnwlhJAlHSh6ce1YhPH6EMZSGrsULgIyAdrH6CAYPFe2EJkc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNkj3Sc6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNkj3Sc6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774267333; x=1805803333;
  h=date:from:to:cc:subject:message-id;
  bh=Yb6Yo7v68q/dnreJSUrZBtLutQX8Sd0o5/yGGxMn/Qc=;
  b=GNkj3Sc6Xm1y5L/5HJ+SVW1wt6UjwSXzXcdWVJ/Bkqx9s3W1XpMVaUYz
   49YeqlG+/Y3QpgoQlmf3JW40jq+80y7Q7+vU4p/wylkMbiO7q426IOicf
   wMlm0+aUIilUf63ydYTslBCR9fGuVu8Rlky0APFP660Bs4tVqxPDc0nU7
   IENFTEERq4FqzWFhVgal2ntmaDLDhrxQ3S9ebuACWQtmyMTfVAmMXjXQ0
   HJyx5Jrrn04uwRjbc/7GlBX8ZVxeKlETsP0lz1FaHcm8xV7MQhWWzwlsx
   waI+fB5IubcEAw61JwN8gSsGUgvv6Jz2Vb1WEgbzOzxxmh0+FxV+qca9D
   Q==;
X-CSE-ConnectionGUID: WQ+sqlhHRFiH30goo9fVow==
X-CSE-MsgGUID: RpLsGXwESi6Y2Kuyzco/fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="77872168"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="77872168"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 05:02:12 -0700
X-CSE-ConnectionGUID: jADQdgamQlKEHBejni+gXw==
X-CSE-MsgGUID: /5U5EDSmS2Wx6lwVPm3vGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223197455"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Mar 2026 05:02:11 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4dyy-000000000TR-2sbr;
	Mon, 23 Mar 2026 12:02:08 +0000
Date: Mon, 23 Mar 2026 20:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-mxl 113/113] Warning:
 drivers/net/dsa/mxl862xx/mxl862xx.c:2716 function parameter 'ds' not
 described in 'mxl862xx_fdb_add_per_fid'
Message-ID: <202603232001.mGpnuCnd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-mxl
head:   033a14af21b86a958a82e31fe31bab10b2905445
commit: 033a14af21b86a958a82e31fe31bab10b2905445 [113/113] net: dsa: mxl862xx: add support for 802.1Q VLAN-based tagging
config: sparc-randconfig-r072-20260323 (https://download.01.org/0day-ci/archive/20260323/202603232001.mGpnuCnd-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603232001.mGpnuCnd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603232001.mGpnuCnd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2716 function parameter 'ds' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2716 function parameter 'addr' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2716 function parameter 'vid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2716 function parameter 'fid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2716 function parameter 'port_id' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2735 function parameter 'ds' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2735 function parameter 'addr' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2735 function parameter 'vid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2735 function parameter 'fid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2716 function parameter 'ds' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2716 function parameter 'addr' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2716 function parameter 'vid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2716 function parameter 'fid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2716 function parameter 'port_id' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2735 function parameter 'ds' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2735 function parameter 'addr' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2735 function parameter 'vid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2735 function parameter 'fid' not described in 'mxl862xx_fdb_del_per_fid'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
