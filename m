Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03303570B2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 05:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769059542; cv=none; b=rGi5IYOz3hdRPQf3AoKLMLbHg62PDPN02f/QjMOsQKifmSo4VUOQF+rXuXVcWuII98lh/lsTDACWXYWZt/Wxbzld57BgDcxucVmpV0zN4Sj3xYQXQ2gBP0GH2NWBJP2Luw/fKjc9XXhtEL7XTzkRZQnVb1HwIaVJ5cuCchL0U+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769059542; c=relaxed/simple;
	bh=CdH9hN2qD8W9guQRn3LE4Ei9k1Lrm65gQWJoZIRo/nw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lYtb9fht6WI6qa/ByRfkzW1Wu2jhyABz+80RyFD1CAXuIBab4Y5futDyjOrhGtv1vBy7VWSwcsZvyIbDjx5R+PHET8fK1oQbM7MppnPExkiEAttU53EsqkF/NnRY9a7sCdbGiHkFJaE4i7QneJWZb/6WDR0A7nsx/STbeeGsZUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KovNs0CL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KovNs0CL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769059540; x=1800595540;
  h=date:from:to:cc:subject:message-id;
  bh=CdH9hN2qD8W9guQRn3LE4Ei9k1Lrm65gQWJoZIRo/nw=;
  b=KovNs0CLCm1ZBrTEUfQommetunjRSItU3vhXXDfoo4jL019EFwcvMAZE
   cj+E5EoJd1xBjei1iohKBbTTZIA7m+lHPlZ/wY+tkzW/VN3rQQ5VzdHAQ
   orgHBxXBDoWh521mkDhyDFVf+fbEbKqnsZvS7gbpIMCP+lWRzHRFY14aG
   vcCWMvQQEQgajrmhJ9scgD2DFve4EfgA8B+d2ktMvU/IF+gNdESTlbWee
   pI9DUZkPevym0kvrDsm4kYeVYNXA9MpLEW6GjkB7V0C9onj00gdvJm003
   1CbKx/Ogrbt95hsIWtQtmqZaRCgwB727oMZFdSDbVWG8JZvT9qP5kxATm
   A==;
X-CSE-ConnectionGUID: AuRGBZ+2QMaauyyDu6GteA==
X-CSE-MsgGUID: Zpr9rKW/RaenrpfSSClwCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="95769438"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="95769438"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 21:25:39 -0800
X-CSE-ConnectionGUID: VWyeyos7QrCLOpVbwHx1Kw==
X-CSE-MsgGUID: AWZa2L5cT3il9ndHM66kkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="211162391"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jan 2026 21:25:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vinCJ-00000000STd-0s0b;
	Thu, 22 Jan 2026 05:25:35 +0000
Date: Thu, 22 Jan 2026 13:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-arch-pebs-ANBZ29483 24/24]
 setup.c:undefined reference to `topology_apply_cmdline_limits_early'
Message-ID: <202601221315.Bhjntypo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-arch-pebs-ANBZ29483
head:   55fc1bcbb65fd1eace1f13433232761fe54fa60e
commit: 958a42aeddf62f2857c597e278636e6b389927c9 [24/24] x86/cpu/topology: Rework possible CPU management
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260122/202601221315.Bhjntypo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221315.Bhjntypo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221315.Bhjntypo-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/setup.o: in function `setup_arch':
>> setup.c:(.init.text+0x7dc): undefined reference to `topology_apply_cmdline_limits_early'
>> ld: setup.c:(.init.text+0x7ec): undefined reference to `topology_init_possible_cpus'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
