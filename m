Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E33121C9F4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 03:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758685383; cv=none; b=WBeBBebPzkw63RJM5F2wYq9NwtS8dPgHQEqV3vWT4Mq3n/lpwdqEjEesxw6ioAFNdysJZb8El52Tb1DMksnE+zpjWR2M2DpzR289lbxlY5+qS4OPk3duPnzPAbmDq1G5ZK14K32tLLIqqUOSvOJuMN5xrVLLSsJdB4DnjdkTC38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758685383; c=relaxed/simple;
	bh=c+oDilAl9F1EsVqeumeUAbOYG5PRP97+BuILESbMUrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A9LoEgi14wt+by8kqTiEr3PwcJQKa+b664WvVRWlWf42jUiWw7w2Kwo1vn6x2v1OyGLjdCCmR+9dMFkYJH97oQfbs2ZbY/7yT7/VsBFTyfibo1kmV4xNs+E5IsciV5S8SbtFczoF5gm5/C2XV8IceRMWcCTWkFyrJ1Dbx7nnp2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMmoabAZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMmoabAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758685380; x=1790221380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c+oDilAl9F1EsVqeumeUAbOYG5PRP97+BuILESbMUrA=;
  b=JMmoabAZi3nqiAoDCguwSx0FHPWhrsbFJ9xrlFLdU3K6IMFHFkxJMVrY
   vvMoDUnCHCX8AI/2JP8Y49VrxmLIGvi4aGFBRg39TYjGdcPTBKql2c/2K
   fLAz0GRYHFn8Y4GJ/ecHHn4jkwFdPmeYwnOhKSLRUvwNQZaMh9b6kn64M
   5Ds6ylKyvFySAaJtSPMZCD8pEYU01ewOljVKD66FOjLsN4j3ZJtBMDGDb
   2H31lZwZkVM13xQc9vC2V26SRFmyMOZ6VYBD1IDS+snlheoTT+jWRxlLk
   1OlVO5yzef5C+Cm592989Z55uep+fNKMr+bKEpuMO4zOoZ4tih9ihxqwm
   Q==;
X-CSE-ConnectionGUID: SkID6o9iRCCzuQVh1+Louw==
X-CSE-MsgGUID: 88JcNbQdS7KNe6OgWI8cHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60899047"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="60899047"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:43:00 -0700
X-CSE-ConnectionGUID: X6krAWtSRMSn6XyUHnKT0Q==
X-CSE-MsgGUID: Tpr91gOLT5yp0r3hdYU9hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="207675890"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Sep 2025 20:42:58 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1GPA-0003lx-0h;
	Wed, 24 Sep 2025 03:42:56 +0000
Date: Wed, 24 Sep 2025 11:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:test 3/10] include/linux/ftrace.h:563: multiple
 definition of `unregister_ftrace_direct_hash';
 drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first
 defined here
Message-ID: <202509241143.1OG103Oz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git test
head:   1b7fc74c36a93e90816f58c37a84522f0949095a
commit: 96622eaa88e4d87dfdd8d16c2fbfc1cb55cdefe2 [3/10] ftrace: Add unregister_ftrace_direct_hash function
config: x86_64-buildonly-randconfig-004-20250924 (https://download.01.org/0day-ci/archive/20250924/202509241143.1OG103Oz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509241143.1OG103Oz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509241143.1OG103Oz-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/nouveau/nouveau_drm.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_drm.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_hwmon.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_hwmon.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_led.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_led.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_nvif.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_nvif.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_vga.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_vga.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo0039.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo0039.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo5039.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo5039.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_gem.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_gem.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_mem.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_mem.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_prime.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_prime.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_sgdma.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_sgdma.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_ttm.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_ttm.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_vmm.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_vmm.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_exec.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_exec.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_sched.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_sched.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_uvmm.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_uvmm.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_backlight.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_backlight.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bios.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bios.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_connector.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_connector.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_display.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_display.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_dp.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_dp.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/arb.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/arb.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/crtc.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/crtc.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/cursor.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/cursor.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/dac.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/dac.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/dfp.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/dfp.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/disp.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/disp.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/hw.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/hw.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/nouveau_i2c_encoder.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/nouveau_i2c_encoder.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/overlay.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/overlay.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvnv04.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvnv04.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvnv17.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvnv17.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/lut.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/lut.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/core.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/core.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/core507d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/core507d.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/core827d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/core827d.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/core907d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/core907d.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/core917d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/core917d.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/corec37d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/corec37d.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/corec57d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/corec57d.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/coreca7d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/coreca7d.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/crc.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/crc.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:563: first defined here


vim +563 include/linux/ftrace.h

   562	
 > 563	int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
   564	{
   565		return -ENODEV;
   566	}
   567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
