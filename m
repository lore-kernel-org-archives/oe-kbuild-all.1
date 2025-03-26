Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585414642D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 22:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743029168; cv=none; b=jUt5/8YkRulhGCbJMKmUQYtmKcnvdB6gbbBKZbYy9SzVVsieyDP/8h1dJKZwemT6LWumupVKFfHtSeKiD/XVW8Dr9gCDmsy+tycAMCOPP2QFXvbqSUVxF9Go6Xq8LA7a8Pzq/nWbnIh7pPLzABH4dc8Hk1livrqMjQzS8wZydeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743029168; c=relaxed/simple;
	bh=p6HmI2ory+r3NGU01o+vXcb03YTwWFe5MQReVUF4bUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ens2pKqQGM/NNrYAEGI1HeNIITg1T12oRiT7YgG22TTa9NO+iJHm8bZOAKbo+hsDxvcN6ODuYLz7WYUw3czwFm0arlX23zX6K44JfxMRhzsHwqnBIcP8UChAmEesZa3hnBKKh/SXLEMyDeFpC7imrS9DvJWFIJdG3KXOhXxgPpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKjjCHwQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKjjCHwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743029166; x=1774565166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p6HmI2ory+r3NGU01o+vXcb03YTwWFe5MQReVUF4bUc=;
  b=SKjjCHwQ13uUaXuTEFWcWby65+mIe+0buifHsOLVM4WLpdJ001s87XDW
   RdbPEFgwHS4eLM/wXqt300UcfsX0VTtPwiXPYZlrsorU61ta62fIkcUhI
   YwZa+kE6QLufE1eQxq+saF9cafmTyTmWvjpN9Iw0yFZm4STuq3TQA9DU1
   2OA6tkpLlcJB0ZpQbXmTT9W3KKBGZq8aJT1WRtCXXxE4m2m5+EKOOqFKz
   7qs+WNyBBy9QMovkd8VtY9PGufzgNLIyuDQrhbhrbGqcmhDnddyoRVUX0
   ziKh3+Ffsas4Suze3w4236+bzghEtsbrtRans50k7g1ZNzLtxuxMJXamD
   Q==;
X-CSE-ConnectionGUID: /CFRD01pSI2IZ7QkFyI6yQ==
X-CSE-MsgGUID: FAuUyHVlQ1+bsCRVy8eQnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="69705024"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="69705024"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 15:46:05 -0700
X-CSE-ConnectionGUID: 1P3+3OoAQtaURYemqVmSpA==
X-CSE-MsgGUID: jl5Jr7WqRBSt+ngHzaU69A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="129981129"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Mar 2025 15:46:04 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txZVT-00068h-02;
	Wed, 26 Mar 2025 22:45:57 +0000
Date: Thu, 27 Mar 2025 06:45:09 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.14/zen-sauce 7/31] drivers/gpu/drm/drm_debugfs_crc.c:335:33:
 warning: ' 0x' directive writing 3 bytes into a region of size 2
Message-ID: <202503270607.FeYwBsVX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.14/zen-sauce
head:   cb33a6dc022faa07ac1e1cd544567b28a7e9afeb
commit: f4f448a305e9d705b9a0da102ddfd58bfaac5cc0 [7/31] ZEN: Restore CONFIG_OPTIMIZE_FOR_PERFORMANCE_O3
config: csky-randconfig-r052-20250327 (https://download.01.org/0day-ci/archive/20250327/202503270607.FeYwBsVX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503270607.FeYwBsVX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503270607.FeYwBsVX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_debugfs_crc.c: In function 'crtc_crc_read':
>> drivers/gpu/drm/drm_debugfs_crc.c:335:33: warning: ' 0x' directive writing 3 bytes into a region of size 2 [-Wformat-overflow=]
     335 |   sprintf(buf + 10 + i * 11, " 0x%08x", entry->crcs[i]);
         |                               ~~^
   drivers/gpu/drm/drm_debugfs_crc.c:335:3: note: 'sprintf' output 12 bytes into a destination of size 2
     335 |   sprintf(buf + 10 + i * 11, " 0x%08x", entry->crcs[i]);
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +335 drivers/gpu/drm/drm_debugfs_crc.c

9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  283  
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  284  static ssize_t crtc_crc_read(struct file *filep, char __user *user_buf,
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  285  			     size_t count, loff_t *pos)
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  286  {
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  287  	struct drm_crtc *crtc = filep->f_inode->i_private;
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  288  	struct drm_crtc_crc *crc = &crtc->crc;
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  289  	struct drm_crtc_crc_entry *entry;
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  290  	char buf[MAX_LINE_LEN];
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  291  	int ret, i;
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  292  
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  293  	spin_lock_irq(&crc->lock);
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  294  
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  295  	if (!crc->source) {
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  296  		spin_unlock_irq(&crc->lock);
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  297  		return 0;
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  298  	}
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  299  
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  300  	/* Nothing to read? */
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  301  	while (crtc_crc_data_count(crc) == 0) {
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  302  		if (filep->f_flags & O_NONBLOCK) {
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  303  			spin_unlock_irq(&crc->lock);
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  304  			return -EAGAIN;
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  305  		}
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  306  
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  307  		ret = wait_event_interruptible_lock_irq(crc->wq,
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  308  							crtc_crc_data_count(crc),
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  309  							crc->lock);
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  310  		if (ret) {
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  311  			spin_unlock_irq(&crc->lock);
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  312  			return ret;
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  313  		}
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  314  	}
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  315  
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  316  	/* We know we have an entry to be read */
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  317  	entry = &crc->entries[crc->tail];
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  318  
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  319  	if (count < LINE_LEN(crc->values_cnt)) {
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  320  		spin_unlock_irq(&crc->lock);
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  321  		return -EINVAL;
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  322  	}
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  323  
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  324  	BUILD_BUG_ON_NOT_POWER_OF_2(DRM_CRC_ENTRIES_NR);
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  325  	crc->tail = (crc->tail + 1) & (DRM_CRC_ENTRIES_NR - 1);
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  326  
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  327  	spin_unlock_irq(&crc->lock);
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  328  
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  329  	if (entry->has_frame_counter)
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  330  		sprintf(buf, "0x%08x", entry->frame);
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  331  	else
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  332  		sprintf(buf, "XXXXXXXXXX");
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  333  
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  334  	for (i = 0; i < crc->values_cnt; i++)
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06 @335  		sprintf(buf + 10 + i * 11, " 0x%08x", entry->crcs[i]);
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  336  	sprintf(buf + 10 + crc->values_cnt * 11, "\n");
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  337  
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  338  	if (copy_to_user(user_buf, buf, LINE_LEN(crc->values_cnt)))
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  339  		return -EFAULT;
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  340  
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  341  	return LINE_LEN(crc->values_cnt);
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  342  }
9edbf1fa600a2ef Tomeu Vizoso 2016-10-06  343  

:::::: The code at line 335 was first introduced by commit
:::::: 9edbf1fa600a2ef17c7553c2103d0055d0320d15 drm: Add API for capturing frame CRCs

:::::: TO: Tomeu Vizoso <tomeu.vizoso@collabora.com>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
