Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6291E4AF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 03:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769831236; cv=none; b=VNlfYaRmrc4Ep+GyUjXXzncIhTUPW+u29EgONkunbw41qnq3fG1Ze14BAVdDgU7PBiEpW/i3yWhHNHiL/R9BlSsNpNsP9w2akMcaNXKVRGpq2vzVr0/kkS5gRvAQgSq4+4/LBUJYRqX1xvkEukCkoSK/mF7Doz6fOavwWs3nDm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769831236; c=relaxed/simple;
	bh=1Ef7KVQJS1jISsacsNjEn0nQgGVrKZVKF2ewInWDLmQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FWR2jBBREmMjNCw+8Vdm9+dyZeYBos/CHeOAW5j3k0Xz/S6WHrVtU4PzEIsNnm36M0OcB8Nq38je84mBlCRJJy0YLXjZnV3/SpRYL0ojVPrxzl+C9Z5T1f1VNN5mYU5NEydm0TdWCWtFdgQI6182wbw+w3aTR8UCaXUjt5Hdv5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAyyh1fD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAyyh1fD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769831234; x=1801367234;
  h=date:from:to:cc:subject:message-id;
  bh=1Ef7KVQJS1jISsacsNjEn0nQgGVrKZVKF2ewInWDLmQ=;
  b=KAyyh1fDDwoE8F+Z9Ah5MFRPlBuv8LGC+RbkjVS/P4Bya0i3szz38iyk
   O8aEJbXDGXIx+C8LcNww3GKIgmb8OSwo+D0eedmI0hUx5S6Ej6WeM9mwd
   fmD9JuI/6XES0Swbvog6xSr0wz6oOU7l9FNatpm7pUwo8oB1tpC8HPM5J
   2zcG8OZhlhAXhIOibW0ahMiK4WFqYIg1MMLvzHJUEqF/MFGgqxG87/EMY
   RGQYQ26rWIhlMRTfIA4EIpGZgW2L2hGcKXIjylrlGLkZ6T4M+2bbBrMqQ
   2eQmuCvosgrhN16lUUMvBjyAsxALty4asAPZ+QxTNvxGFwMqisUBuwWCc
   Q==;
X-CSE-ConnectionGUID: KRDNpDyJSOarvABbBI9iZg==
X-CSE-MsgGUID: zF/naWioQ/KrWRTFhK/oKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="82505237"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="82505237"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 19:47:14 -0800
X-CSE-ConnectionGUID: Mwcl0N5ARM+dGjKCl2dsyg==
X-CSE-MsgGUID: BqVmF2CcQ1eACHjZc9xpTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="208591082"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jan 2026 19:47:13 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm1x0-000000002e3-3AoT;
	Sat, 31 Jan 2026 03:47:10 +0000
Date: Sat, 31 Jan 2026 04:46:13 +0100
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 1/1]
 ./usr/include/linux/exportd_netlink.h:1:1: error: C++ style comments are not
 allowed in ISO C90
Message-ID: <202601310445.F9T5sNil-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   077e7343a43c486345b6ed3fcee3b2ef296ec201
commit: 077e7343a43c486345b6ed3fcee3b2ef296ec201 [1/1] nfsd: add new netlink spec for svc_export upcall
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260131/202601310445.F9T5sNil-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310445.F9T5sNil-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310445.F9T5sNil-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/exportd_netlink.h:1:1: error: C++ style comments are not allowed in ISO C90
       1 | // SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
         | ^
   ./usr/include/linux/exportd_netlink.h:1:1: note: (this will be reported only once per input file)
>> ./usr/include/linux/exportd_netlink.h:7:10: fatal error: net/netlink.h: No such file or directory
       7 | #include <net/netlink.h>
         |          ^~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
