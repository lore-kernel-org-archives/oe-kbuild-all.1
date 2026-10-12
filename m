Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF923B4E98
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 10:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800076; cv=none; b=AkoNIRzDxKdWNOMrhIZTUUZkhmb4XEWCceAbkqBtgyUlnkM1sygW7Bngxc9YRQV5GeuswrdAfMi1ZKcgHos8JQVzOJ1wi//9muMTwQgPfOQFl14q7WgtLRiaJ9avLHJhq250I62ABKrnkn8rDaDjA+E4QFn+ITAayn+j9+Ywh48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800076; c=relaxed/simple;
	bh=bYCtVIOTdwMVf+zZzYI4OM2rq01ERw4O17ZN0Gu2Ewk=;
	h=Date:From:Cc:Subject:Message-ID; b=cbjTHeg0jJcBwjVDZR3vn1X5OImEs2iOKUD8hdYHwu0v1FdfMcbFKM5Si2gUi3EA6Ylkcrz9K/raICYllyw+Uo1mxlKqeLb4or82vv4o6esiOFSkz2ny13FREc8cPfP1jFl1SUYqY9enILEwx4yFKUwNPm88RDSB/Mvt4UODQ+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z45mqE4A; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z45mqE4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791800069; x=1823336069;
  h=date:from:cc:subject:message-id;
  bh=bYCtVIOTdwMVf+zZzYI4OM2rq01ERw4O17ZN0Gu2Ewk=;
  b=Z45mqE4AyZQrPwbDvYcgKElxOq2teXy0NV1czQj4bfQzmu9kk/YOD4VS
   rprU8Hyv/+A/ok8bnvud3iSuQR99e3Ldu9/IpurhZ9dJhA2CQSjj4Ol9R
   OBSG3eN6CVCYEMs3HasgfDPFt/Wu2s4OhVvoulVGdi/18egdE7rq4HsxV
   p2/3f5Eqjpoj/0i/3VV8vdYsvKoWOVzAJpYz/pqjGtoUPp7QrgpPKZYV7
   Fy3dUV5KemPZYLTpCCSslt6cCeyRJjz/0NHiOub7yn0TqyG6Z5hAoYUag
   9BiMCKM0pmHKq05tzH8mIaGh7JHevAFAv+oZKnrLj3dk6lGOGfaJzARQy
   Q==;
X-CSE-ConnectionGUID: b/g4pI8pT5+uabgCdMryKw==
X-CSE-MsgGUID: rssDtunkRYGaC3lw29ORVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="512461"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="512461"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 03:14:29 -0700
X-CSE-ConnectionGUID: lrr3lzo+QX2lsvuXMqYN1g==
X-CSE-MsgGUID: codjHsGiSN2vebvONIHAhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="962602"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 12 Oct 2026 03:14:27 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGD32-000000009zH-2dli;
	Mon, 12 Oct 2026 10:14:24 +0000
Date: Mon, 12 Oct 2026 12:13:55 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Fedora Kernel Team <kernel-team@fedoraproject.org>
Subject: 
 [snitzer:kernel-7.3/nfs-testing-canary-reduce-ff-layout-contention 6979/7391]
 Warning: kernel/rh_messages.c:218 Excess function parameter 'driver_name'
 description in 'driver_deprecated' (did you mean one of: 'module_name')
Message-ID: <202610121224.5wO5ETR6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Fedora,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/nfs-testing-canary-reduce-ff-layout-contention
head:   e8175b5511f04799e2f9dfdf79d8d68f5d8c7e5d
commit: 20f0b99715da065080579841e131a5527c206453 [6979/7391] Merge 'master' into 'os-build'
config: arc-randconfig-r2200-20261012 (https://download.01.org/0day-ci/archive/20261012/202610121224.5wO5ETR6-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610121224.5wO5ETR6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610121224.5wO5ETR6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/rh_messages.c:218 function parameter 'module_name' not described in 'driver_deprecated'
>> Warning: kernel/rh_messages.c:218 Excess function parameter 'driver_name' description in 'driver_deprecated' (did you mean one of: 'module_name')
   Warning: kernel/rh_messages.c:305 function parameter 'mod' not described in 'mark_tech_preview'
   Warning: kernel/rh_messages.c:335 function parameter 'mod' not described in 'mark_partner_supported'
   Warning: kernel/rh_messages.c:218 function parameter 'module_name' not described in 'driver_deprecated'
>> Warning: kernel/rh_messages.c:218 Excess function parameter 'driver_name' description in 'driver_deprecated' (did you mean one of: 'module_name')
   Warning: kernel/rh_messages.c:305 function parameter 'mod' not described in 'mark_tech_preview'
   Warning: kernel/rh_messages.c:335 function parameter 'mod' not described in 'mark_partner_supported'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
