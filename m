Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B93948FF6F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 07:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396117; cv=none; b=EjlirSGTjZxvVKdnIBMBtAgnCXlyc+XtBeVlR4twKSsY+fArsWxo1UjZgN8wxgqARKbXjps18ADPLgJx3l60zEb1BiB/ys1MUgg0udZSI8cY9Zvw9wIz1eshZ1Bdm0I8kksN+LCDd6ns2t5EHNVhKXtgld4AIPr+o/aA123Rnrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396117; c=relaxed/simple;
	bh=vG70IKrQP02cssZsWg67Waa9N7X8qn2JJz1UJtwAYEs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B7/taNanqNg3Sww6teTqnZmEX28SrM+0GQzQsvTj0r/lUFYf13VcBDkKwWZPo+Xp/lLTebk1OW07am34wPXQwC2U0U8ZnDcsdOHwWcRyWmL1aUnl1hT9nwBgKFKj4ABUmgbMSa+lr5y1sZZyVf1xN8pLTKW2TUjfc14kT+G5MoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBLy8cGW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBLy8cGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792396116; x=1823932116;
  h=date:from:to:cc:subject:message-id;
  bh=vG70IKrQP02cssZsWg67Waa9N7X8qn2JJz1UJtwAYEs=;
  b=KBLy8cGWLC0kClXUL0z/W4xWlLSiJzv6bCB1hM99SEfvoUbymju0V9dt
   QymLV4KkO2ictf1jnRQ4FhiXNLJYPeLRgPsbwr+LAtCPnVDoCRncuOuN4
   Qu8RcjQftM4cN6dw9gwKQXtQHp354nyR41+VKS00u4MIKw4/GACDE9NHR
   KQNumeQ7DwwKXJIy4o2mulOr+3vxmJSiY4dyRC/DKV5Jfgurb2JJly0ba
   2A15G8/hHoKOePtGiEIY2IhxB8tYWHMjoztQ3jfIpmbqiqd0idgXukIps
   G2+6wkZDXfzZoKIf5jS+B/jQXISTYRps6OxH6Erj1FtSlmG3ZqkMCis6V
   w==;
X-CSE-ConnectionGUID: BjbN/1B7QZavF5JwXGTA8w==
X-CSE-MsgGUID: 31KiQLzTT+2NUUA5juxe/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1087130"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1087130"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 00:48:36 -0700
X-CSE-ConnectionGUID: H/wnMllVRf2vhQMwFxC9kg==
X-CSE-MsgGUID: ipXyDrtoSkGmUOPKGGmVUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4227846"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 19 Oct 2026 00:48:35 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIi6i-000000005Xb-2Y79;
	Mon, 19 Oct 2026 07:48:32 +0000
Date: Mon, 19 Oct 2026 09:48:09 +0200
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:hexagon 31/82] Warning:
 drivers/rpmsg/qcom_glink_native.c:130 struct member 'open_work' not described
 in 'qcom_glink'
Message-ID: <202610190925.OlRd36tj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git hexagon
head:   35ab1dadb94646b74469738c1741f68e8c6aac3d
commit: a4310ab4ef4371948e163b1696ae14880866aef1 [31/82] rpmsg: glink: auto-open channels listed in device tree
config: openrisc-randconfig-r2106-20261019 (https://download.01.org/0day-ci/archive/20261019/202610190925.OlRd36tj-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190925.OlRd36tj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190925.OlRd36tj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/rpmsg/qcom_glink_native.c:130 struct member 'open_work' not described in 'qcom_glink'
>> Warning: drivers/rpmsg/qcom_glink_native.c:130 struct member 'open_work' not described in 'qcom_glink'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
