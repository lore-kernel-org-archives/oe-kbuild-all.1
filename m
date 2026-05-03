Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7333A875A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 14:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777817604; cv=none; b=th3e1R7IrUlVdqsid4XGDNJe+WF2V1AzetsL0DoaA44hgSh1ERtwwKlR7ybgiPqtHrdVcI7kO5BQVHQG9gVUXqsmo9AvZFvhiuNtsXZ4pwlFAE6b6RYIeoKZ+hnTEI4MjkXz/Ne8Pp9GzW/ic0pn1nRoL1hj9bvt2jHgHd1giWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777817604; c=relaxed/simple;
	bh=I+TnmmgQMLF7tGA3fQ26QDotL0CYtDgmS3V5UDzET/Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UgioaCS7UwG1Nbf+ZKhYHXtry6MzZPM7BWtaPXsE6GGMK3cZZhVY5vHXPNFH1WTGUPUaF5fkHj38StnFvNe7MrTn9Y5ZmV0ooiG6sUJZF7CTgi2h/oXeSe1TMz8fgLg9E+9yTEpB0l8DAmVbYT7GtU52sJMDhjLnQWJO730b4Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXZCg5AJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXZCg5AJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777817601; x=1809353601;
  h=date:from:to:cc:subject:message-id;
  bh=I+TnmmgQMLF7tGA3fQ26QDotL0CYtDgmS3V5UDzET/Q=;
  b=ZXZCg5AJiQrAOFssTUlnTp6hWdJ+g47Q+7DHzg+uFaGQdFbDRm4lDGel
   be6rgULds6JfaO/Pw1Oqq0sCcnCehnrrdfcKQaPnXcS//1WP+S9a3aWjT
   9ZS3QunyNhGenpYcIvdm9mzehNbjfy/J0s1SZDgGwECFu43wt6ZcIThWL
   t0bSWz1HAjxHvP+IhwtcrsRhd75e3SReo5hQIrFf3h/7eBfxWEMrTSDkT
   xTRYBebo+OCyUxxFPKJ6bFwWvoy3aqMJP6A7kGAxf/FCKKPqr4OzvXCsp
   eg7VGZdp4WP8Ur4FR2nwqcIh17cMG4f/sEr5zHajB5bgAAg+W403hHyxB
   Q==;
X-CSE-ConnectionGUID: maR2iSpMRoGnSj7YMYkYog==
X-CSE-MsgGUID: oub3l/QRQ5+ZOaJhJczDIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="89802805"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="89802805"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 07:13:20 -0700
X-CSE-ConnectionGUID: RIgfCzdUTvq4CDmBtyRSng==
X-CSE-MsgGUID: yIgt0VTmR26AKBlpvtapaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="258924506"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 03 May 2026 07:13:19 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJXZN-000000005Yz-2J51;
	Sun, 03 May 2026 14:13:17 +0000
Date: Sun, 03 May 2026 16:12:56 +0200
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/cgroup/cgroup.c:3391:33: error: implicit declaration
 of function 'kill_css_sync'; did you mean 'kill_fasync'?
Message-ID: <202605031646.29RPrwRy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tejun-Heo/cgroup-Defer-css-percpu_ref-kill-on-rmdir-until-cgroup-is-depopulated/20260503-165802
head:   f18fcea709e431e32f29d553290a21173d8530f6
commit: f18fcea709e431e32f29d553290a21173d8530f6 cgroup: Defer css percpu_ref kill on rmdir until cgroup is depopulated
date:   5 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260503/202605031646.29RPrwRy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031646.29RPrwRy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031646.29RPrwRy-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/cgroup/cgroup.c: In function 'cgroup_apply_control_disable':
>> kernel/cgroup/cgroup.c:3391:33: error: implicit declaration of function 'kill_css_sync'; did you mean 'kill_fasync'? [-Wimplicit-function-declaration]
    3391 |                                 kill_css_sync(css);
         |                                 ^~~~~~~~~~~~~
         |                                 kill_fasync
>> kernel/cgroup/cgroup.c:3392:33: error: implicit declaration of function 'kill_css_finish' [-Wimplicit-function-declaration]
    3392 |                                 kill_css_finish(css);
         |                                 ^~~~~~~~~~~~~~~
   kernel/cgroup/cgroup.c: At top level:
>> kernel/cgroup/cgroup.c:6047:13: warning: conflicting types for 'kill_css_sync'; have 'void(struct cgroup_subsys_state *)'
    6047 | static void kill_css_sync(struct cgroup_subsys_state *css)
         |             ^~~~~~~~~~~~~
>> kernel/cgroup/cgroup.c:6047:13: error: static declaration of 'kill_css_sync' follows non-static declaration
   kernel/cgroup/cgroup.c:3391:33: note: previous implicit declaration of 'kill_css_sync' with type 'void(struct cgroup_subsys_state *)'
    3391 |                                 kill_css_sync(css);
         |                                 ^~~~~~~~~~~~~
>> kernel/cgroup/cgroup.c:6087:13: warning: conflicting types for 'kill_css_finish'; have 'void(struct cgroup_subsys_state *)'
    6087 | static void kill_css_finish(struct cgroup_subsys_state *css)
         |             ^~~~~~~~~~~~~~~
>> kernel/cgroup/cgroup.c:6087:13: error: static declaration of 'kill_css_finish' follows non-static declaration
   kernel/cgroup/cgroup.c:3392:33: note: previous implicit declaration of 'kill_css_finish' with type 'void(struct cgroup_subsys_state *)'
    3392 |                                 kill_css_finish(css);
         |                                 ^~~~~~~~~~~~~~~


vim +3391 kernel/cgroup/cgroup.c

  3359	
  3360	/**
  3361	 * cgroup_apply_control_disable - kill or hide csses according to control
  3362	 * @cgrp: root of the target subtree
  3363	 *
  3364	 * Walk @cgrp's subtree and kill and hide csses so that they match
  3365	 * cgroup_ss_mask() and cgroup_visible_mask().
  3366	 *
  3367	 * A css is hidden when the userland requests it to be disabled while other
  3368	 * subsystems are still depending on it.  The css must not actively control
  3369	 * resources and be in the vanilla state if it's made visible again later.
  3370	 * Controllers which may be depended upon should provide ->css_reset() for
  3371	 * this purpose.
  3372	 */
  3373	static void cgroup_apply_control_disable(struct cgroup *cgrp)
  3374	{
  3375		struct cgroup *dsct;
  3376		struct cgroup_subsys_state *d_css;
  3377		struct cgroup_subsys *ss;
  3378		int ssid;
  3379	
  3380		cgroup_for_each_live_descendant_post(dsct, d_css, cgrp) {
  3381			for_each_subsys(ss, ssid) {
  3382				struct cgroup_subsys_state *css = cgroup_css(dsct, ss);
  3383	
  3384				if (!css)
  3385					continue;
  3386	
  3387				WARN_ON_ONCE(percpu_ref_is_dying(&css->refcnt));
  3388	
  3389				if (css->parent &&
  3390				    !(cgroup_ss_mask(dsct) & (1 << ss->id))) {
> 3391					kill_css_sync(css);
> 3392					kill_css_finish(css);
  3393				} else if (!css_visible(css)) {
  3394					css_clear_dir(css);
  3395					if (ss->css_reset)
  3396						ss->css_reset(css);
  3397				}
  3398			}
  3399		}
  3400	}
  3401	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
