Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866AB39B49E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 12:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772713195; cv=none; b=IdCKjPqQ0t1OXL7DijrGNfQrIcNMl1dCobhsIywGvNTg6N/+NoGkn/W3HnGwCa2MyCEk4VhrEreqq//8thNQBzPq/Tccoe89wjJz/N7FYA934lE0X/RCjqm2gLPCKuTPgFD8H/96tPircUx9HEWeF3E7wyMf2HbeHml6DdspGCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772713195; c=relaxed/simple;
	bh=JcVfoqvxLTN3oUPdUsi++vRZhGmqV5gIeRZTzEXeiK8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nIsj+8hAhFzcgmyOea4k3qP6VvMgqKeTr2xNqIlzv3eeXdxpaZpkkncqs+JTeQCHnk7p9qQDWy4LbR8tytAolqkaHxPhx1Dlk0N8eYFfJL49CaQfNm2t6Y5pYsV3o3NG93yP45PVr3dyKfMWka6Jj46BnuDxXjYNV+voKUgqpS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBrLiBS2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBrLiBS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772713195; x=1804249195;
  h=date:from:to:cc:subject:message-id;
  bh=JcVfoqvxLTN3oUPdUsi++vRZhGmqV5gIeRZTzEXeiK8=;
  b=DBrLiBS21BJVpHHZAviEHG4jxF6pcVwCXxHog4Gy+8MvMfYgFtV+Gqh6
   ZcOwDZLOKUxZI+fiH8oWIUVXVM1K6oO2cG1pAM9E5VeswZrZqimoWUBFW
   rqbzzESbTIrxMIsYB/B4wMhTgjttu2V5OJTSV546nJyYWTjk9P6qTLpoF
   H0mtNKIhMZgPS4J+m3bFvlino1EsJroi9jkB5QyXaJyo2Lfyn+CiJoM0j
   XuB/dRmW61P5IhM1CDD/A9m8h2IqM/KVoks8V1bxObzz1caize0ib0w1F
   0bk/FOf0kOp9enUYqVKDm9K4kLV8Gf5k/2QwXwL072g1r/C2Vgy+Zl2CM
   g==;
X-CSE-ConnectionGUID: 34IcZoB1SmCZxmCG1lI2Pw==
X-CSE-MsgGUID: ilJQLaxCQSiR0VyOjkxeJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73988100"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="73988100"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 04:19:55 -0800
X-CSE-ConnectionGUID: eD4zJU6vSJqSpFXA5SQpvA==
X-CSE-MsgGUID: MYVQb/PKQ7620YKlJPhEOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="249136337"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2026 04:19:53 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy7gE-000000000aI-2hlL;
	Thu, 05 Mar 2026 12:19:50 +0000
Date: Thu, 05 Mar 2026 20:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-6.18.y 757/757] Warning:
 drivers/gpu/drm/msm/dp/dp_drm.c:24 function parameter 'connector' not
 described in 'msm_dp_bridge_detect'
Message-ID: <202603052008.yyFc64Zg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Andy,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.18.y
head:   6258e292d7463f96d0f06dff2a39093a54c9d16f
commit: 5d156a9c3d5ea3dbec192121259dee2c2f938fa1 [757/757] drm/bridge: Pass down connector to drm bridge detect hook
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260305/202603052008.yyFc64Zg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603052008.yyFc64Zg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603052008.yyFc64Zg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/msm/dp/dp_drm.c:24 function parameter 'connector' not described in 'msm_dp_bridge_detect'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
