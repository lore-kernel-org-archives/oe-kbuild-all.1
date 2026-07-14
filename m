Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B285494A09
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046144; cv=none; b=V8JDCvZCo/+wWMCx14CTYsoWNuJvQQesH/6b6vZSGmupvJgrFDaf3lBjhegnhFM/wIlTviyQPyYf/fWrf09nbv4gOh3wIsV1dYoZBsDCAcwlGTRaYEWNDM3+D3LF9+eD+2qpOw+N3BDISlM+p+c1/bDVWoqILaaRH+QZ8L6dTCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046144; c=relaxed/simple;
	bh=FayN6K4UOT1PqnHQ7epvKVXPXLldPxVZdnygUHdrp2I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RJYu2/ov8bKUFkCmU/+58W71/4q9+SO7h47vBUuGxnXxDwgQ1nHor8ySGJ34dxvTHjuw8CNN3bTmyTDwLZMsfqGgs4gJ/JT2/TWDrPhXZNz51VKEnSKib6YwqOuvbbzWhGTpNEfjHX1wEVk/oweQjWnZD8OIphUFW2a2ddqDCGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCzvWojf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCzvWojf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784046142; x=1815582142;
  h=date:from:to:cc:subject:message-id;
  bh=FayN6K4UOT1PqnHQ7epvKVXPXLldPxVZdnygUHdrp2I=;
  b=aCzvWojfTEUXHjQUik5dSPU3vIkiGK+ty8T2POtwOdj9FRIUfnXZbnJH
   YQQm7wzOeFuUrZn8a+Wsm4/8/9KRw4coFgPgdX1l/VAEw2f47BwoOG2Y+
   ib09RzbU2lwQq4rTxzV0ao7SJ1SmcdRPSTKZdgz5LpoAR8D7hglfXfzyY
   gpbl96Mcr8b2tsUjhgjK31rECJ9AJvLZbzMnZoksaQb8YPIyze53RVVVL
   Aw16Zuq160//rEQXcAiz8eFJveSa0IWirl1sqHtkP8hqqIoX6Mh4/Z5or
   uTkzSHnwtPbuCEkkdFSz15ni/SiP33Hr7zBjYH8DvbobVA2yICZ4jAgFZ
   Q==;
X-CSE-ConnectionGUID: hLQ7wTmwTMyKmzOnyRBMLw==
X-CSE-MsgGUID: +AujjDkyTmCsS4klBZD/LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88496533"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="88496533"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 09:22:21 -0700
X-CSE-ConnectionGUID: OWV9fgekQ3q576K1YPvrIw==
X-CSE-MsgGUID: 1Nvbdfb0QbucMaAnetzxOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="260804517"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jul 2026 09:22:20 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjfti-0000000042b-0s1R;
	Tue, 14 Jul 2026 16:22:18 +0000
Date: Tue, 14 Jul 2026 18:21:22 +0200
From: kernel test robot <lkp@intel.com>
To: "David 'equinox' Lamparter" <equinox@diac24.net>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/networking/ipv6-addrsel.rst:
 WARNING: document isn't included in any toctree [toc.not_included]
Message-ID: <202607141831.ujAOXbq1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/David-equinox-Lamparter/net-ipv6-fix-lookup-for-0-non-subtree-route/20260714-174919
head:   745e2c3a79e2e0369ee5dbd1e650b1fddbed477f
commit: 745e2c3a79e2e0369ee5dbd1e650b1fddbed477f net: document RFC6724 rule 5.5 implementation
date:   6 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260714/202607141831.ujAOXbq1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607141831.ujAOXbq1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:58: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:228: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:251: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/networking/ipv6-addrsel.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/checksum-offloads:157: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
