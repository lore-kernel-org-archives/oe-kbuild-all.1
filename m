Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462711D130E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 01:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769219021; cv=none; b=bpUwhQlvc15HQU3CtjRIDEhFLe2m54kspH1NqhFj0KC0gjoDBY2d45qa4mb9D653HggNPw428eohyuW9WE/Hc+NRf7+74wYNG6P18fh2Gx3BVVRGIfZF3iQw/OEKmvv0Hr5FC2JBs/lZ+SfVOD8hW35C2QJbF/wPAqYBDOaXU2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769219021; c=relaxed/simple;
	bh=LE6g77oRUZ9oVJnkVP8SkICAETx2jr/NrSUc0D0yVfY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GHSyeyvzz/fr7zEqqbBcD9q7nMilut+ZgF/noWJpYmd0OHTuyHDzo7Ye/ozWNDzgqnMYxnd8lWTj4XkhyI3eo1E8FWmu2wE8jPb09jS9JmMdMw1r8z2qVcG52H3F9q11aXCaDxaVZYrm0HeeFiehJGKN+/ZlmkNfcBqnASPOYWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fq9rpgKt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fq9rpgKt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769219020; x=1800755020;
  h=date:from:to:cc:subject:message-id;
  bh=LE6g77oRUZ9oVJnkVP8SkICAETx2jr/NrSUc0D0yVfY=;
  b=fq9rpgKtx6ODTY4YayvvF5GZ6sMsV6KiviwyWr5YHCJfhjC7sNPw1pep
   +wvHnuhXXbUDB+/sk8LQRE4Tg+f5xIL2tHgVzmWN/MN4Ma2kFfA3r8IfT
   gcX4h4+Q6dyu95znDV1OUrmDddb9v1OQABwdR83tEVHyRpwQ5ipJ97dfg
   4gRgmv3EzUwQbLlZGi/cL4v5OnL6Xp4KhQm170Lo4ICFhfliiBBi/6FN8
   5ew/7O7N8kcQpyR5OG/G3A/eDNxYg+HjZyjgSnX1hCpqXYULJ6qGwzrcT
   wJ2ob6U0P+u8JuZNfvf8ASzL5hpNFuaa0phsWguyVKkh4O/emFyJaNUNq
   Q==;
X-CSE-ConnectionGUID: 9wT0DGJwQoOxOdBudJvbjQ==
X-CSE-MsgGUID: Ha1RW0IZRie2ZYsiQ5KkWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="88049322"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="88049322"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 17:43:37 -0800
X-CSE-ConnectionGUID: hyXoKFZ8Qgq+lCzUqNcLKw==
X-CSE-MsgGUID: AFgH0Xo0Tv2adIjik0bI6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="237822581"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2026 17:43:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjSgX-00000000Ufi-27eK;
	Sat, 24 Jan 2026 01:43:33 +0000
Date: Sat, 24 Jan 2026 09:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 5078/9539] ERROR: modpost:
 "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-ilitek-ili9882t.ko]
 undefined!
Message-ID: <202601240937.0L01qHxn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
commit: 65ce1f5834e9598e5120048010b4fe220e70473c [5078/9539] drm/panel: ilitek-ili9882t: Switch Tianma TL121BVMS07 to DSC 120Hz mode
config: x86_64-randconfig-r072-20260124 (https://download.01.org/0day-ci/archive/20260124/202601240937.0L01qHxn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240937.0L01qHxn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601240937.0L01qHxn-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-ilitek-ili9882t.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
