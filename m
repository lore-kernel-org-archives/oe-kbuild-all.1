Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7423039A7FA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 13:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772803604; cv=none; b=rEmX4+CS62KzHiwmX8KUUO1sodFYSCY4pq6ih6Lxqa/8LkkEL79PYkFqRuYXjdl/DfAf16eCBJiBf8dKf3DkZjSquVglnPg1lJGWG6oYFmMNjziK+RKNHIrc9mHTDykbBYgtQAb5Bja+6TCXCDvsk0CAmp4hsZOaX8ZFGfD53XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772803604; c=relaxed/simple;
	bh=3/RnNG/J/nv3Z+sb4k8XKDYyIxZ2SHM6e36ZmdCdLiA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AvTohNJi1/BpnoBmtHIFjMyJq1kj4uiuw6huGBsWm/1TEhvE23Um36OZ8DiE8iXq3KXQEb08hqyrN7MtmzU8ycSOLRtIKhM4+bVInj8nxajGVotEP0kFHXBedwgOMWb95m7ydA6J1GeDQcDurcMiaA70VNj8YtwJxYuW9GZhyuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GEVlx3E2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEVlx3E2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772803603; x=1804339603;
  h=date:from:to:cc:subject:message-id;
  bh=3/RnNG/J/nv3Z+sb4k8XKDYyIxZ2SHM6e36ZmdCdLiA=;
  b=GEVlx3E2WHLjIRYvQzkS9kJzr3sYKlVDIxupf+zztiDZK/yc86ZXesD0
   90aoK/SiVjP+pkPKp8aJ8JWmcAf+JHuUXepyf7IzM7zHtwYSGmtCmxWNH
   +HnkngVFpZgiRObv3crFlteFmboFrE5d4X85E5HUnqVn4BbX/H5/uEadw
   Qm20lr71R4cQdaKt3tydy9TMbkVx9jIrxx6yT7LO8UlEHsbL3S2BBYvae
   eHOav011oKcZ6LA8qgZ7d5293ixXFy/XrqvY11KBrm9Lz+jcDExsZinvx
   DE0kJ7r01GI2XBF7uOa8RycKkX+RXUbJhbBepxxynBu2A6F2sEg2MI5r+
   g==;
X-CSE-ConnectionGUID: tg2Ho3ajQ/uCiR93XtAjvg==
X-CSE-MsgGUID: tN38zwkvTI6X8zHauf5c+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84236450"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="84236450"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 05:26:42 -0800
X-CSE-ConnectionGUID: dkyhMZcBSbOwfSkIeDd9Ig==
X-CSE-MsgGUID: XON8pMSMQqK+y+Ny1sS/Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="242022105"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Mar 2026 05:26:40 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyVCP-000000000sV-4BeS;
	Fri, 06 Mar 2026 13:26:37 +0000
Date: Fri, 06 Mar 2026 21:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>
Subject: [deller-fbdev:for-next 17/22] ERROR: modpost: "__end_rodata"
 [lib/fonts/font.ko] undefined!
Message-ID: <202603062147.JJ2KsE4c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git for-next
head:   26484b2fa418a002d099608e681aef86fc90990c
commit: a76e4bfc4b3586b47ede8e83bdb6050cd6b16025 [17/22] lib/fonts: Compare font data for equality with font_data_is_equal()
config: x86_64-randconfig-123-20260306 (https://download.01.org/0day-ci/archive/20260306/202603062147.JJ2KsE4c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603062147.JJ2KsE4c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603062147.JJ2KsE4c-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__end_rodata" [lib/fonts/font.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
