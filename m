Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ADE2144CE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 17:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739987963; cv=none; b=a7hlS9plSilbqxgW+LYp4mMJl1EFuXpxQNf0BdKNHVyPmOS+MrHFtZVnxhKhnKfTwMgWm6Uphkm/IMMkakIl4nmALKJcuBsQhtUyOhflmGfxYJKGS28xywhVwgXBDVHOnzNftIUN9rBtcITIZ1x/7qMey6izogtywyIQ2gQZp80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739987963; c=relaxed/simple;
	bh=8E5M/gZvMK2QnqnA01Kg5t6JS+LTnhL0QuH2mkmeeJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k8VV2n3HZLCTknZ5GcE3kAhzbof/j5Zfk/mzCT/1t3kCUIuKjux4J9YeKK5pU2vvHZWxshauUPVrqwSi9oraAgAyYW1RL5CgC5EuxqUE/B9fSaf8p9ZQC6lBNV39izFkGmBqS7ii/aFIj60xhHPgRn3I8r8ZMu9w262Q5NTIdMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8BfbZzZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8BfbZzZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739987962; x=1771523962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8E5M/gZvMK2QnqnA01Kg5t6JS+LTnhL0QuH2mkmeeJs=;
  b=b8BfbZzZwghXBVSbhHirVb1rDcFaXWjJpKSPS58Z5YhSkMrrhH7pQF3L
   SlfadlMYydCm53x+Yzcjtw6YJHKq7x0IoJHW2djbV164ZXnwf2mlQGYzQ
   Jxa0nK8gsElWAdnGR63fMWzqleSKqsvVEoSt3MqjfiAelklLnnNJ5NeQW
   jfP+nRc+unWruHXikgOxr1njhyh1PKWt2++ZJrGOVQ4N1aMx2Evp92UyY
   P+hnopagH3mKAmr3n9AdEe67+gb1BRqkjdOI0wwtZxoX/jPw9NKYwXrbi
   dXtd8j2OJtsBivJez61FBs/MRFgXPVZk2RjqYCLjld530Kum428k2q+7m
   g==;
X-CSE-ConnectionGUID: q8nMIWY3Qem5c+URK+1tlA==
X-CSE-MsgGUID: 6zKBiL2RR6qscw2P8yPfZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44508047"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="44508047"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 09:59:21 -0800
X-CSE-ConnectionGUID: L2RN2Md3QH6gaILOplXMOg==
X-CSE-MsgGUID: UZwc8kEhSueuP8eH/OS1mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119992327"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 19 Feb 2025 09:37:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tko12-0003FX-0d;
	Wed, 19 Feb 2025 17:37:44 +0000
Date: Thu, 20 Feb 2025 01:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1] drivers/gpu/drm/drm_atomic_helper.c:1269:25:
 warning: variable 'unused' set but not used
Message-ID: <202502200149.qtxEonrL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: b20adb9188f10874af2890eebec8862b91c71c5c [1/1] drm/atomic: Use new iterator macros in drm_atomic_helper_wait_for_flip_done, again.
config: sparc64-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250220/202502200149.qtxEonrL-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200149.qtxEonrL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200149.qtxEonrL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_atomic_helper.c: In function 'drm_atomic_helper_wait_for_vblanks':
   drivers/gpu/drm/drm_atomic_helper.c:1211:25: warning: variable 'old_crtc_state' set but not used [-Wunused-but-set-variable]
     struct drm_crtc_state *old_crtc_state, *new_crtc_state;
                            ^~~~~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_helper.c: In function 'drm_atomic_helper_wait_for_flip_done':
>> drivers/gpu/drm/drm_atomic_helper.c:1269:25: warning: variable 'unused' set but not used [-Wunused-but-set-variable]
     struct drm_crtc_state *unused;
                            ^~~~~~
   drivers/gpu/drm/drm_atomic_helper.c: In function 'drm_atomic_helper_wait_for_dependencies':
   drivers/gpu/drm/drm_atomic_helper.c:1807:25: warning: variable 'new_crtc_state' set but not used [-Wunused-but-set-variable]
     struct drm_crtc_state *new_crtc_state;
                            ^~~~~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_helper.c: In function 'drm_atomic_helper_commit_cleanup_done':
   drivers/gpu/drm/drm_atomic_helper.c:1889:25: warning: variable 'new_crtc_state' set but not used [-Wunused-but-set-variable]
     struct drm_crtc_state *new_crtc_state;
                            ^~~~~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_helper.c: In function 'drm_atomic_helper_commit_duplicated_state':
   drivers/gpu/drm/drm_atomic_helper.c:2898:25: warning: variable 'new_crtc_state' set but not used [-Wunused-but-set-variable]
     struct drm_crtc_state *new_crtc_state;
                            ^~~~~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_helper.c:2896:30: warning: variable 'new_conn_state' set but not used [-Wunused-but-set-variable]
     struct drm_connector_state *new_conn_state;
                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_helper.c:2894:26: warning: variable 'new_plane_state' set but not used [-Wunused-but-set-variable]
     struct drm_plane_state *new_plane_state;
                             ^~~~~~~~~~~~~~~


vim +/unused +1269 drivers/gpu/drm/drm_atomic_helper.c

623369e533e8a5 Daniel Vetter     2014-09-16  1250  
0108648749bfa5 Boris Brezillon   2017-06-02  1251  /**
0108648749bfa5 Boris Brezillon   2017-06-02  1252   * drm_atomic_helper_wait_for_flip_done - wait for all page flips to be done
0108648749bfa5 Boris Brezillon   2017-06-02  1253   * @dev: DRM device
0108648749bfa5 Boris Brezillon   2017-06-02  1254   * @old_state: atomic state object with old state structures
0108648749bfa5 Boris Brezillon   2017-06-02  1255   *
0108648749bfa5 Boris Brezillon   2017-06-02  1256   * Helper to, after atomic commit, wait for page flips on all effected
0108648749bfa5 Boris Brezillon   2017-06-02  1257   * crtcs (ie. before cleaning up old framebuffers using
0108648749bfa5 Boris Brezillon   2017-06-02  1258   * drm_atomic_helper_cleanup_planes()). Compared to
0108648749bfa5 Boris Brezillon   2017-06-02  1259   * drm_atomic_helper_wait_for_vblanks() this waits for the completion of on all
0108648749bfa5 Boris Brezillon   2017-06-02  1260   * CRTCs, assuming that cursors-only updates are signalling their completion
0108648749bfa5 Boris Brezillon   2017-06-02  1261   * immediately (or using a different path).
0108648749bfa5 Boris Brezillon   2017-06-02  1262   *
0108648749bfa5 Boris Brezillon   2017-06-02  1263   * This requires that drivers use the nonblocking commit tracking support
0108648749bfa5 Boris Brezillon   2017-06-02  1264   * initialized using drm_atomic_helper_setup_commit().
0108648749bfa5 Boris Brezillon   2017-06-02  1265   */
0108648749bfa5 Boris Brezillon   2017-06-02  1266  void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
0108648749bfa5 Boris Brezillon   2017-06-02  1267  					  struct drm_atomic_state *old_state)
0108648749bfa5 Boris Brezillon   2017-06-02  1268  {
2d705c0b367622 Maarten Lankhorst 2017-07-12 @1269  	struct drm_crtc_state *unused;
0108648749bfa5 Boris Brezillon   2017-06-02  1270  	struct drm_crtc *crtc;
0108648749bfa5 Boris Brezillon   2017-06-02  1271  	int i;
0108648749bfa5 Boris Brezillon   2017-06-02  1272  
b20adb9188f108 Maarten Lankhorst 2017-07-19  1273  	for_each_new_crtc_in_state(old_state, crtc, unused, i) {
0108648749bfa5 Boris Brezillon   2017-06-02  1274  		struct drm_crtc_commit *commit = old_state->crtcs[i].commit;
0108648749bfa5 Boris Brezillon   2017-06-02  1275  		int ret;
0108648749bfa5 Boris Brezillon   2017-06-02  1276  
0108648749bfa5 Boris Brezillon   2017-06-02  1277  		if (!commit)
0108648749bfa5 Boris Brezillon   2017-06-02  1278  			continue;
0108648749bfa5 Boris Brezillon   2017-06-02  1279  
0108648749bfa5 Boris Brezillon   2017-06-02  1280  		ret = wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
0108648749bfa5 Boris Brezillon   2017-06-02  1281  		if (ret == 0)
0108648749bfa5 Boris Brezillon   2017-06-02  1282  			DRM_ERROR("[CRTC:%d:%s] flip_done timed out\n",
0108648749bfa5 Boris Brezillon   2017-06-02  1283  				  crtc->base.id, crtc->name);
0108648749bfa5 Boris Brezillon   2017-06-02  1284  	}
0108648749bfa5 Boris Brezillon   2017-06-02  1285  }
0108648749bfa5 Boris Brezillon   2017-06-02  1286  EXPORT_SYMBOL(drm_atomic_helper_wait_for_flip_done);
0108648749bfa5 Boris Brezillon   2017-06-02  1287  

:::::: The code at line 1269 was first introduced by commit
:::::: 2d705c0b367622d382d80c38240b3069c19f4eeb drm/atomic: Use new iterator macros in drm_atomic_helper_wait_for_flip_done

:::::: TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
:::::: CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
