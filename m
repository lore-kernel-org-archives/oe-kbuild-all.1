Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADC2324B33
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 07:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780039914; cv=none; b=gpRNe1Rxd4wcvOOvOHMLPVpDruhRD578JD7FNcLtFiaX2VlMxC/Q0P1bL5yDxFfHtKiFkzCx5vtelm93nRBpIhUrqMqfKSrJvB268XaKjwLBp7XDXwXu91A7VdycH+xGYGtpvsPm0jWcnHA2iKGm1p9iivsomSQszEatCk9A48g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780039914; c=relaxed/simple;
	bh=vI/5B7EAfrh2K/RpnItI7BQL3Iw7kvv28C+tbRHhADY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W+6OE4jTueLzMx131xhgytzmPe+PyfewZjOq1E9mVOfZfsdUTExXTaH8tKeNpnXUViZVz8G8UmtjbaZrEzknaY2dg9xvNLt8d1EMEmNpUxc96oyfJaRCHoPVpO5xUHzwRP1Cku9lbt3Xw+8VNFnVVn14uLrH8+6Y7kqL4mYuFP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHIl8HuK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHIl8HuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780039913; x=1811575913;
  h=date:from:to:cc:subject:message-id;
  bh=vI/5B7EAfrh2K/RpnItI7BQL3Iw7kvv28C+tbRHhADY=;
  b=iHIl8HuKk/QoHbRb9sXYcO2BtwXkZVH1MTH8fOv/AMWTNgnHn38PNeL7
   yPS6ziXr1rgMOd0soVPMeqQDnks7Cs2ZVCDwRzwXPVyCd2oghx1nU0Gc3
   8844YYWzEos25BRipx7goiRObkhHS00cZ/fwim5kZk4IPxr4xb0cMtKe3
   MjrcV5OV4OR10JsI36UP3q02Z3RQkcpvkLLnQyMD+mgNWSSbfG4QJem32
   ab+4jjEj5hOqHrRlrW9nQiqIloY3DGfTYjh9P+X46kD7nhznR5eHDee74
   MZpO5fc0CWoMPjoLfVb1z5WpcfgDFbJVzZrHidyGYkKz0JiOa1vViKZzG
   w==;
X-CSE-ConnectionGUID: pjW07WtRSfO85PeHub6PbA==
X-CSE-MsgGUID: g8c2SFKCREu4qlmfdnquIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80883285"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="80883285"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 00:31:52 -0700
X-CSE-ConnectionGUID: FaYcFVu2RkeM5etuQRAfsQ==
X-CSE-MsgGUID: wAk1wpQ0RdWKsBLTfK9zJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="266651115"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 May 2026 00:31:50 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSrh6-000000006uk-172d;
	Fri, 29 May 2026 07:31:48 +0000
Date: Fri, 29 May 2026 15:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [thermal:thermal/linux-next 8/19] ERROR: modpost:
 "meson_sm_get" [drivers/thermal/amlogic_thermal.ko] undefined!
Message-ID: <202605291530.en7aGn7w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/linux-next
head:   3929405c64376a8a54c794e8a4485023b108a97e
commit: b21d88de69184c1dc82d85859aeb34a6418b96e4 [8/19] thermal/drivers/amlogic: Add support for secure monitor calibration readout
config: arm64-randconfig-003-20260528 (https://download.01.org/0day-ci/archive/20260529/202605291530.en7aGn7w-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291530.en7aGn7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291530.en7aGn7w-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "meson_sm_get" [drivers/thermal/amlogic_thermal.ko] undefined!
>> ERROR: modpost: "meson_sm_get_thermal_calib" [drivers/thermal/amlogic_thermal.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
