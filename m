Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC39270579
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 08:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746779572; cv=none; b=qz5S/5FnXABvVIRoytse3L8pYT/Vq9svoQ4uJJC0/pjp5A6sbSLS5CVgsrXLQq58si26Jj0G2ANBd9wMaJg2r0bw1S9HJp3HZfRchaQNkFL1chM8tsqYfL/AjvYbvzyJtL5uavYwu7WsCGS75fKAeMHjeDyFeP07rCKkbbRSolg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746779572; c=relaxed/simple;
	bh=Bk5tEp2EPHAvSEF5oK2iM/fhaoysMtgi/Fp8ikJMYE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dNkuLl+kbW7Qk9P1u+Hw9wBh/elvDWVHAojeDWPDanDIvxDppK0kulhAdfW8H4IuvM8rnPv2Z0BlPTVacXawvOS+4Fc7l4zJBSb5LiAq7lBLTrE67cZqnVHSo6QdlrICRIw/jv7yt8MR9RuVi6zxUJYhW/1sWjj1YJ3Mfx0P5H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVKu7hy8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVKu7hy8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746779570; x=1778315570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bk5tEp2EPHAvSEF5oK2iM/fhaoysMtgi/Fp8ikJMYE0=;
  b=fVKu7hy8QmkJ/GHxRMCNJ/pSGh/uJNu3pOt/CMNXNuqj0jl40r39jLe1
   rUXWBUIJvDfnxr5iHzIb7j1V8LAkJ/Pc83fG63lx/cifJThKldvFPyTqc
   hVGCuz26p5EQCY/y46AtwSSiNlSOC6cW1tyw1L/h00mC1cIGbzLpkz8pD
   83oiSfUxjYGqYc6C4Rc7Tup/SDGd8IDVN6uZV8lobxrEAFQD/XoaCpA4G
   UP4L4RDO24woNFjZFl9M9SZDTnHwQLISO3BI9igmESPO2uGGQ4jty5g/s
   d3BHR6OGhdyIp7uUDCxoQ+6wedpEM0uNHFczQKJehVhq6UrHVZSET6uKV
   w==;
X-CSE-ConnectionGUID: q40l7l/CQCyZHsjVZ9elNw==
X-CSE-MsgGUID: 8AKThD/XSnK0Rn/hENH5wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58815568"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="58815568"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 01:32:47 -0700
X-CSE-ConnectionGUID: BOJHW30pQhK+/brGwj2urw==
X-CSE-MsgGUID: fcljRKX7QZummQXlPhAiiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="137076901"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 May 2025 01:32:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDJ9v-000BpP-1E;
	Fri, 09 May 2025 08:32:43 +0000
Date: Fri, 9 May 2025 16:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:sven/atcphy 30/31]
 core.c:(.text.cd321x_update_work+0x360): undefined reference to
 `drm_connector_oob_hotplug_event'
Message-ID: <202505091641.taK6Yzdp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sven/atcphy
head:   d3ec1652047f59386b30060560d34db957d2347f
commit: f766cba9997032329a0515e0bc4f89869753e4e9 [30/31] WIP: tipd work for atcphy
config: arm-randconfig-001-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091641.taK6Yzdp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091641.taK6Yzdp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091641.taK6Yzdp-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/usb/typec/tipd/core.o: in function `cd321x_update_work':
>> core.c:(.text.cd321x_update_work+0x360): undefined reference to `drm_connector_oob_hotplug_event'
>> arm-linux-gnueabi-ld: core.c:(.text.cd321x_update_work+0x428): undefined reference to `drm_connector_oob_hotplug_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
