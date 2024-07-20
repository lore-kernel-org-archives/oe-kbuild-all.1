Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCFD12FF70
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 17:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721496880; cv=none; b=YIm+YKYoP+GSpwo+Nz6oYFlb9+RTygulsgX5QJsUFT9QRJxrlKfecw53ARzftLyUYrFQCvyjly1vG1MM98iwieRi3NSPwfUWte4p4nAMZQQLVC+iHH6q+vDOF0+PTky/QlsEwYOhq5akn2fHbFqPg4cCzzjik4WXBiiCnCtbcQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721496880; c=relaxed/simple;
	bh=2My1ShpR7Fxg9+mW5hwUe82exYOiyJJeydNoa8xE/xk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WAxQr02DuNE0aCxqLKvTS8hpx23enZlRrv2+jS5FFXlj1qK7SExbAIf7Xmm9XPsBs9LiTz/I6Xm512FU2dbhGLR0mUN0cgRABP06BqRB71PediC9Lk5vePRw2xBcfP8aEo27VYZkZOWgTXxtILg99AUHbdJ1Oger8TWwEQfvN08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iq6nTDCE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iq6nTDCE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721496878; x=1753032878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2My1ShpR7Fxg9+mW5hwUe82exYOiyJJeydNoa8xE/xk=;
  b=Iq6nTDCE+F3wdS871tTKAtd0wDGsCF+M1oQaxBfu3sC2ZregcHCeovAf
   tsSuwKNbELyy72XueYNoCka01K/Qp3Aq2H+Tqjwip7lAa6FObXm51AEna
   DwxfxXTD5E1zh8ZKy7d03wtc1isO5whkZ/TBmXp6v8z6PR9V3Qc8A7R2v
   LwUWM8SiOsRkxc4RJfXuf1nDrmqgi0PSN3rNy7bbzzF4bjApoCZRIngPC
   zSHAXW/nktnwCDE77O10MXk0kyGvSRwGwTXF25Q6qiHWPDh6AcPMpDL34
   g4pija1p7e9V435PSglpfaq5sw/XZb71xY0RmjxzLf4iNwahwm6cwzW/y
   Q==;
X-CSE-ConnectionGUID: ibPYcZDWThGFTRXZb4UZFg==
X-CSE-MsgGUID: B3cWH9NESSiqUtlMOlLQrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="22972447"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="22972447"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 10:34:37 -0700
X-CSE-ConnectionGUID: W/VYu7fESJmsG79h2+Uv4Q==
X-CSE-MsgGUID: 9gKtAEV9RPefS9dqp49wdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="51491561"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Jul 2024 10:34:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVDyb-000jTU-1u;
	Sat, 20 Jul 2024 17:34:33 +0000
Date: Sun, 21 Jul 2024 01:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Javier Martinez Canillas <javierm@redhat.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [drm-misc:drm-misc-next 4/4] drivers/gpu/drm/drm_panic.c:712:6:
 error: no previous prototype for 'drm_panic_is_enabled'
Message-ID: <202407210102.CVF3SR4I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jocelyn,

First bad commit (maybe != root cause):

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   7e33fc2ff6754b5ff39b11297f713cd0841d9962
commit: 3a9b77cee7502f7450c725d4ead2c4a44924d158 [4/4] drm/panic: Remove build time dependency with FRAMEBUFFER_CONSOLE
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240721/202407210102.CVF3SR4I-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407210102.CVF3SR4I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407210102.CVF3SR4I-lkp@intel.com/

Note: the drm-misc/drm-misc-next HEAD 7e33fc2ff6754b5ff39b11297f713cd0841d9962 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_panic.c:712:6: error: no previous prototype for 'drm_panic_is_enabled' [-Werror=missing-prototypes]
     712 | bool drm_panic_is_enabled(struct drm_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/drm_panic_is_enabled +712 drivers/gpu/drm/drm_panic.c

813ca3aa8fecac Jocelyn Falempe 2024-04-09  705  
9f774c42a908af Jocelyn Falempe 2024-07-17  706  /**
9f774c42a908af Jocelyn Falempe 2024-07-17  707   * drm_panic_is_enabled
9f774c42a908af Jocelyn Falempe 2024-07-17  708   * @dev: the drm device that may supports drm_panic
9f774c42a908af Jocelyn Falempe 2024-07-17  709   *
9f774c42a908af Jocelyn Falempe 2024-07-17  710   * returns true if the drm device supports drm_panic
9f774c42a908af Jocelyn Falempe 2024-07-17  711   */
9f774c42a908af Jocelyn Falempe 2024-07-17 @712  bool drm_panic_is_enabled(struct drm_device *dev)
9f774c42a908af Jocelyn Falempe 2024-07-17  713  {
9f774c42a908af Jocelyn Falempe 2024-07-17  714  	struct drm_plane *plane;
9f774c42a908af Jocelyn Falempe 2024-07-17  715  
9f774c42a908af Jocelyn Falempe 2024-07-17  716  	if (!dev->mode_config.num_total_plane)
9f774c42a908af Jocelyn Falempe 2024-07-17  717  		return false;
9f774c42a908af Jocelyn Falempe 2024-07-17  718  
9f774c42a908af Jocelyn Falempe 2024-07-17  719  	drm_for_each_plane(plane, dev)
9f774c42a908af Jocelyn Falempe 2024-07-17  720  		if (plane->helper_private && plane->helper_private->get_scanout_buffer)
9f774c42a908af Jocelyn Falempe 2024-07-17  721  			return true;
9f774c42a908af Jocelyn Falempe 2024-07-17  722  	return false;
9f774c42a908af Jocelyn Falempe 2024-07-17  723  }
9f774c42a908af Jocelyn Falempe 2024-07-17  724  EXPORT_SYMBOL(drm_panic_is_enabled);
9f774c42a908af Jocelyn Falempe 2024-07-17  725  

:::::: The code at line 712 was first introduced by commit
:::::: 9f774c42a908affba615bbed7463dd4f904dd5f1 drm/panic: Add drm_panic_is_enabled()

:::::: TO: Jocelyn Falempe <jfalempe@redhat.com>
:::::: CC: Jocelyn Falempe <jfalempe@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
