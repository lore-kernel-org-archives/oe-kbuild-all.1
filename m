Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019E926738D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 07:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771054463; cv=none; b=FrxMi0+eTiymKUTWiunNpZ+RrCTyzUhZAa6XqRM6OhLXgG2ulUfysHN4I9TX4gd3pFNae1I5VIdnC+e+RxLwYZqXvBfMj+/ZLKq/Vdfw6Q2FVAkJze6RxFEKmopaqVMuLgYWLFeMtQBvuSrExK26RkgEDLBVsGeeS2I/5UNWhn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771054463; c=relaxed/simple;
	bh=hsHtsV73GR4a1Qw9c1LIJHGS0TOvrJ+vAXEEBiPuhys=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d+mo62OLqaBTMfcsqYl50anj4Op6Y+AEPALBAjLo/sC7cA8UjXV6RAO5SJqdBXqP8i7bJR6NkXl7lfkflhxGXT6NKS9IxFkpNAuedguYkKpojaqQRtPEQZrgA4QW6pDRJ63aqFEJF4VwjcCFxmvdd0jA0+t9mWWffJ8+7CidwiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ay1Od+CP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ay1Od+CP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771054462; x=1802590462;
  h=date:from:to:cc:subject:message-id;
  bh=hsHtsV73GR4a1Qw9c1LIJHGS0TOvrJ+vAXEEBiPuhys=;
  b=Ay1Od+CPUkk9Gje8H4EBmyuLhaJeeJoXmV6Cetg5Gj0Uo+of/47Gly95
   Op1TOoiPBaZSkt9ibB1ZnpRwRqO/EM6I8/A7mr1azHK+If8Rjn0oDfPGR
   BgtBOgI9jS9MuzR6o48ubOle2uiO/IBwzvVtBH6ExaujG5k6GJHzZM41h
   TMM5yXRA3/xmKUBlqm6WhVMmdnYTs0esf/jl5We6/ItZ0lR7jtRxWVnE/
   3HNGLpPgaPuv/ZEOyZGmbjHG9x/GxWeJDxWp8Pr8mclpS8QbsOXNf+vCG
   1h6RP+uWluUC6JYnZC0YoT+iNVerDhpOoFeezqrXsV8Q+k1vQg+UAfuuU
   A==;
X-CSE-ConnectionGUID: qXqCokHrQG+fEq3w3gTaDA==
X-CSE-MsgGUID: qg0LNIEOQZ+MpCaWHrSEHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="71942316"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="71942316"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 23:34:19 -0800
X-CSE-ConnectionGUID: bbrZmjd+Twit09rTEAjmxw==
X-CSE-MsgGUID: cgCxfBWMRwCWcAtd0h5RtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="212383739"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Feb 2026 23:34:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrAAQ-00000000wLw-4Bsz;
	Sat, 14 Feb 2026 07:34:14 +0000
Date: Sat, 14 Feb 2026 15:33:33 +0800
From: kernel test robot <lkp@intel.com>
To: Rajesh Gugulothu <rajesh.gugulothu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:master 493/590] Warning:
 drivers/media/platform/xilinx/xilinx-hdmirxss.c:463 struct member
 'vid_interface' not described in 'xhdmirx_state'
Message-ID: <202602141544.4jvMRY8E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: 6c57d13474fc2753f43a037249457663f1c71a1d [493/590] v4l: xilinx: hdmirx: Add support for native interface mode
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260214/202602141544.4jvMRY8E-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141544.4jvMRY8E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141544.4jvMRY8E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/media/platform/xilinx/xilinx-hdmirxss.c:463 struct member 'vid_interface' not described in 'xhdmirx_state'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
