Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5763BE49
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 02:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740452314; cv=none; b=qZ2w0s/JMAFgUp/dw1zdOnWN/olFyI5U3cODvWOQ787WhBgufoWe7EaBnikXvfda3vroFzGlxCEhz6ryDyufBz1dc3TxyWbPbTBifCDlJwUaxYzrZEq4RuCvrmitIBkkzpDJX04uDlplwUlEB9cOyKjBFHFpdI+frVwxMPBp0Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740452314; c=relaxed/simple;
	bh=kxKjwHCL2pWf5OC1/LimyCSG0RtuNXBaXTYrsRixrjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rQ1ZjEPOkLStT4Y7BT9CaeblR+pO4blxgaU/jjOU0Wx78/3THrnKlX0QHAiAHHiwWDkbWNQqQXv/iNXcpVzCtGPOJ0MalTl0xC5Z/BKMXklKY5rP+II4jayTwYPyF9z+QtuGqosYFl6mXlQCkn+yvxI98D1MaMcdXxyZHrAMghk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltnWhdP5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltnWhdP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740452312; x=1771988312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kxKjwHCL2pWf5OC1/LimyCSG0RtuNXBaXTYrsRixrjA=;
  b=ltnWhdP50TGVp5uBz5NmADeeYnBkoYXQ9PpqbyMQ45EvK0awSa10QGQr
   k/a65E1D+CodoUxES9z8YWY5b5skNGWnG6KGl9pj8djvFQEI8KSlsGD5H
   8jJAq6XIDoxUWdv057rKK3jn7nh7WvGGz51Ir13P0QFKK1D16KQkXt0dB
   eCkHECOR/d9OzjMXH7dAhefqXuorJF0T5swoOF0OJf/RmjDiE67EYmjQb
   bIUl4i8hjpBuAz+YjfC9H7LPGYCI5/zL43OEx9tgwmFEAxVPHMkLFjYLa
   j2tsOTKnpM/8WKisFurZkdzwoZA7+H5ScXZub6kT7AMct/43N6p+Ut22L
   A==;
X-CSE-ConnectionGUID: MDYM75RETXuFj4F+4I8tQg==
X-CSE-MsgGUID: zAATYpK0QAWBbQ5R8adeIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51878358"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="51878358"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 18:58:31 -0800
X-CSE-ConnectionGUID: THs3B3IGTTO1RbdbsvRWyA==
X-CSE-MsgGUID: H2uipHQOTJaTXBQwpo37aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116100079"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 24 Feb 2025 18:58:30 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tml9H-0009gX-2G;
	Tue, 25 Feb 2025 02:58:22 +0000
Date: Tue, 25 Feb 2025 10:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/69 1/1]
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c:112:25: warning: variable
 'crtc_state' set but not used
Message-ID: <202502251045.qYicZBsJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Maarten,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel/linux-intel-lts.git pr/69
head:   f36ea6678b4077d9bbb4644e73977fb91d187ab7
commit: d7429669c8f939cf4db4865c4e1106df0da76754 [1/1] drm/msm: Convert to use new iterator macros, v2.
config: arm-randconfig-003-20250224 (https://download.01.org/0day-ci/archive/20250225/202502251045.qYicZBsJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502251045.qYicZBsJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502251045.qYicZBsJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c: In function 'mdp4_prepare_commit':
>> drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c:112:25: warning: variable 'crtc_state' set but not used [-Wunused-but-set-variable]
     struct drm_crtc_state *crtc_state;
                            ^~~~~~~~~~
   drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c: In function 'mdp4_complete_commit':
   drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c:126:25: warning: variable 'crtc_state' set but not used [-Wunused-but-set-variable]
     struct drm_crtc_state *crtc_state;
                            ^~~~~~~~~~


vim +/crtc_state +112 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c

c8afe684c95cd1 drivers/gpu/drm/msm/mdp4/mdp4_kms.c     Rob Clark         2013-06-26  106  
0b776d457b9476 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c Rob Clark         2015-01-30  107  static void mdp4_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *state)
0b776d457b9476 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c Rob Clark         2015-01-30  108  {
0b776d457b9476 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c Rob Clark         2015-01-30  109  	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
8d76b79faaaefb drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c Daniel Vetter     2016-06-02  110  	int i;
8d76b79faaaefb drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c Daniel Vetter     2016-06-02  111  	struct drm_crtc *crtc;
8d76b79faaaefb drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c Daniel Vetter     2016-06-02 @112  	struct drm_crtc_state *crtc_state;
0b776d457b9476 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c Rob Clark         2015-01-30  113  
0b776d457b9476 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c Rob Clark         2015-01-30  114  	mdp4_enable(mdp4_kms);
0b776d457b9476 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c Rob Clark         2015-01-30  115  
0b776d457b9476 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c Rob Clark         2015-01-30  116  	/* see 119ecb7fd */
d7429669c8f939 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c Maarten Lankhorst 2017-07-19  117  	for_each_new_crtc_in_state(state, crtc, crtc_state, i)
0b776d457b9476 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c Rob Clark         2015-01-30  118  		drm_crtc_vblank_get(crtc);
0b776d457b9476 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c Rob Clark         2015-01-30  119  }
0b776d457b9476 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c Rob Clark         2015-01-30  120  

:::::: The code at line 112 was first introduced by commit
:::::: 8d76b79faaaefb1bd16a56dc66f799c9afd82c6f drm/msm: Use for_each_*_in_state

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
