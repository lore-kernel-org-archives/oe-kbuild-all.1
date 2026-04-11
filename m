Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BFF8C1F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 02:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775872975; cv=none; b=VkaDLnNj6R3PfSsN6DQaL0IqVbm25NTQx894oenmT3VRruvJrjivH1YyG0DEH7P0I249e7MEI7FvipAqrbl5CswiHGdn7D1w1B6yk2hdhEtdbBElLpshJ8O4gyZ+7PwVjcRkEB1bx8kn73iGVG0b+BgoUpVaXthwUStw2ZmkSX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775872975; c=relaxed/simple;
	bh=mOizB6PLuphTWS8hXNDsp58vrRphdLMuHDmgyGYyKhg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aD1/grG/NEYDRwlAyKzcupskum8UZhhp7AEjvKx8pfg0PEOjvUgRSChi/Qg+979I9Z8hkzeFsIo2xqgg6mKkIFQWh9OaahWLwmmcWqP2W3aSwSYDknJrjG6gOgz/UHbW0nSVOE3FaGW3gEk0A/lkX5yqTLSWaQqRkFyj00zOS3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBESg5DA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBESg5DA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775872974; x=1807408974;
  h=date:from:to:cc:subject:message-id;
  bh=mOizB6PLuphTWS8hXNDsp58vrRphdLMuHDmgyGYyKhg=;
  b=mBESg5DAzltuO2kpBIq9NqQx7fSLSs2wAEkPc4HRCX1M74unsxqyKot4
   CRLBs1UFnlvmQW+3PsNe6NpU0Gos9ozKcsVv3ZHZqCqbdPYSlARnSPwrC
   ZK+ry/h0m03mpmADSJEsqIPEUl87O+S++JBpg6kLqNCr9B/DD8+tAHH5B
   /GBov9NzNBp+mjpDFYNuL8PyvJUi3Y66LwfjOp7+cSEi4npmxUl4Dv/R0
   ndy+sc0ZQjLm4hXuBx1FZCbDxICTHsuWokqSL2g+s77E2bvfRQSEAhTxg
   3XmpVzW6Eug7bz7UqcxbQNLsalUoEyciObZcxmH8yC9ZwJ6KnD4pQJKOL
   Q==;
X-CSE-ConnectionGUID: ij57VbfaSX68dtGI1/C45A==
X-CSE-MsgGUID: hb+3+sDpRiOKQJUbH2SiZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76611764"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76611764"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 19:02:53 -0700
X-CSE-ConnectionGUID: K9oUB3geR9OuvJ9Z7+B8iA==
X-CSE-MsgGUID: qnRoQ/AVTGuy4TjUHcx96g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="228224718"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Apr 2026 19:02:53 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBNgQ-000000000bt-0nYs;
	Sat, 11 Apr 2026 02:02:50 +0000
Date: Sat, 11 Apr 2026 10:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 16/27] ERROR: modpost:
 "nfsd_handle_dir_event" [fs/nfsd/nfsd.ko] undefined!
Message-ID: <202604110917.cMuflyXS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   340042c418d5b1b9287c2cdd19cae0f1c012da40
commit: efb939289ee8d27fff2e5b1fd7ab3f94a94d5a02 [16/27] nfsd: add notification handlers for dir events
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260411/202604110917.cMuflyXS-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110917.cMuflyXS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110917.cMuflyXS-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "nfsd_handle_dir_event" [fs/nfsd/nfsd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
