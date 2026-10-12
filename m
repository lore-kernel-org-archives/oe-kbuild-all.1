Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9790F38DC4A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 05:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791784279; cv=none; b=V2m7XbYO2Ak/VKWRVDZjm8JeoMfyDRfzwK6qO480SDicjkpRq1xpUKsbfRI8cfJqGcQy1tcOo52O8PUgBDUPHkP3bN6rII1myO48bbz9G/Umno53PmehqqGYcx6XUi3Ig1fecsmmRlauIQMZSzcRpMkG4/o0wrk6Kr79fe+HYwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791784279; c=relaxed/simple;
	bh=E0GlakyuS+ddZc3eYlQZEqO0nAPxEUW4GZ40op2rv1I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KAfoudNaErjc2VO8LBvMay27A5j48F9Cg8o4Fqwc7LTU5HyE95qEyt6tjD8kyavmBNolq9fynicRnqtpX+4TgXJyfUPxp5jH6N3rc44WfpUImKgoQac7wjl87QlvTWzJt1zDHdrbc+3dWXejo1OwTDD1Qt71sm1FTgRwxyOpwWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWF78Qy9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWF78Qy9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791784278; x=1823320278;
  h=date:from:to:cc:subject:message-id;
  bh=E0GlakyuS+ddZc3eYlQZEqO0nAPxEUW4GZ40op2rv1I=;
  b=JWF78Qy9eNvYLsmNXn9UskG300XwoOQ8b0sCZWozD+gsQVAvcaH0PBtN
   Fh78+bYqCQLs67hBIEZzS9cIo7I3fZPlRCGrs4VarY2HOXsJj2EHzA/j2
   iM+/hkA3RJZOREErVnUo0pRxQGUXBaTMrhws9xKxD+SrpKwUlH7/j1NP6
   Bh/vaKxxHylMbprUqCTdngjTYvxFZbeOUFA7NtPh9cwV+L2rzC9XcShAj
   L9enr6WqZSiwy63oMElWroKXXVlZMrWIFr73M9NCPcPtwK2NC8OcSOR4a
   VcD5wEMXUm3n8TrURxkBDeEwv5WSAcUvvc41cFsTKW4uidA8ieNuU5Ffe
   Q==;
X-CSE-ConnectionGUID: z9TviAoWS8m2QWwCiiAjsQ==
X-CSE-MsgGUID: T8mVwnzKSw2xuou1c6gHww==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="489840"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="489840"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 22:51:17 -0700
X-CSE-ConnectionGUID: 1qqn9FdzRzuJDZX+yRBcGg==
X-CSE-MsgGUID: u6atzhYbQR+yu64hvpjiBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1139318"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 11 Oct 2026 22:51:16 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xG8wL-000000009wn-3H81;
	Mon, 12 Oct 2026 05:51:13 +0000
Date: Mon, 12 Oct 2026 07:50:44 +0200
From: kernel test robot <lkp@intel.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: oe-kbuild-all@lists.linux.dev,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [linux-next:master 12812/16158] Warning:
 drivers/power/supply/bq257xx_charger.c:90 struct member 'dev' not described
 in 'bq257xx_chg'
Message-ID: <202610120726.XkN50Smh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   becb95e45ef0dda9ffb35156d909d3da7a2789c3
commit: 455e49c6700c8111d492923952a1fe3b98da0195 [12812/16158] power: supply: bq257xx: Convert parameters setup to the new .init callback
config: sparc64-randconfig-2001-20261012 (https://download.01.org/0day-ci/archive/20261012/202610120726.XkN50Smh-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610120726.XkN50Smh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610120726.XkN50Smh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/power/supply/bq257xx_charger.c:90 struct member 'dev' not described in 'bq257xx_chg'
>> Warning: drivers/power/supply/bq257xx_charger.c:90 struct member 'dev' not described in 'bq257xx_chg'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
