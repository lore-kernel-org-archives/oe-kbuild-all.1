Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBA41A6807
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 02:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477659; cv=none; b=Qj7A9xTnOYMcnQ7RRJal1MR1Q6Af2JfIrfKUfRtgNmWPluZCBy5vPGPidCstyZNP8TDEoiJ9dsI3xtOyJtfc98ew9oRezc8RqFd35ul3BnOLHhkka4cmE/gwWltNi0jAQjtkQ7Qk/g53OambDuKwqGQznHc+av2bTxvCqjGNthg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477659; c=relaxed/simple;
	bh=Wm1E2aLbN2iqXlo5OTB4brw1lMtseREKk4DcvCT9xnA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lkbBZoIseVkWI1cXcr8syERfwJnMs1yLBKBYUc7BD+O10UTIoecnMuP31D2w6Ss1GCJrHokiPkqL9VvVhmL+QMYFeX9/8XiQfGdh/8pvvXOY1Fsp5rnGu8g3XdW9QGBcSvDv7oq7TypxNgam4+78QcRIv16dPLYAWbnX24g57EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktjXB9dF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktjXB9dF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790477657; x=1822013657;
  h=date:from:to:cc:subject:message-id;
  bh=Wm1E2aLbN2iqXlo5OTB4brw1lMtseREKk4DcvCT9xnA=;
  b=ktjXB9dFc2OnasD198iP3BR7+2ZABTqU7xCQFxeSlH7pKUDPNoeOmzRD
   lMTEJwj+l1KdOIJMJLZRbB4nBOvt72UwKA8oLzowmHdVGUE1XOf1bYQ++
   hKonD3T7TBiNmFVi9EoTnVfMMBX5YHIvwflVX/5yj/nsFMa7D9rm5u+tX
   3t3J7kb2cPmH7vQezBciYygcWRJYMhytf4vpXeUSctAfFqkkppw6g17ky
   g8H+o3mkxVSqImZBCPULSXrWqkM2DMnAVo/f+IeBN+Bh2JOpxeoUcT7aZ
   9gbyH7azw10tk4C87h/CBSjUVG3OyBxFLnHOzcP4E2/hylPa3rk0tYRpx
   Q==;
X-CSE-ConnectionGUID: ObdC8/G5SkiYeARx7fK8IA==
X-CSE-MsgGUID: ibrXhz4hReqh6bZA/BhtMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="93706824"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="93706824"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 19:54:16 -0700
X-CSE-ConnectionGUID: urmOI1ZNTE+jKpsAJFAz2g==
X-CSE-MsgGUID: TWk5VvX1RaSNmcuHiDR4xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="271184065"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Sep 2026 19:54:15 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAf1o-00000000MMj-3S9v;
	Sun, 27 Sep 2026 02:54:12 +0000
Date: Sun, 27 Sep 2026 10:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 9580/10910]
 /usr/bin/ld:./arch/um/kernel/vmlinux.lds:161: syntax error
Message-ID: <202609271037.xasAFkVC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 779c65ede6800595ec620b0b10aae7d5a5469cbd [9580/10910] um: link .lbss/.ldata/.lrodata correctly
config: um-randconfig-1000-20260926 (https://download.01.org/0day-ci/archive/20260927/202609271037.xasAFkVC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271037.xasAFkVC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271037.xasAFkVC-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld:./arch/um/kernel/vmlinux.lds:161: ignoring invalid character `*' in script
>> /usr/bin/ld:./arch/um/kernel/vmlinux.lds:161: syntax error
   collect2: error: ld returned 1 exit status

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
