Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1017399031
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 21:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779139807; cv=none; b=V4RAxIJ8tkJuq8L7f2HEVFmLNBbAleNxnsKWWDeEjxdHNekyja7VEObx7zkFdV55LCMFOB3sv7KmWKwMcWM2x2qxF5cxIScREkmyOn7gjR9e51hkN9ICGDssm3YWG7UTkmtRR6zngaMDNStjtAt/wgLFIIqN2XMbEPLSSqZbFJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779139807; c=relaxed/simple;
	bh=C7IjxmNiYnyo1F+cGYH2YnOPIJmq4po2q/PpH2crlzY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kg/960muuvYVhQU7BWCgrjI+J6RWML5nQlMUkjsecKb41/Lo2Lxp9eCDbayDZ9h7vIUtvz5HbmsR9eBhScY4D0hWGJERuUPrdJbrFKEI/PwBh7ifQoTZ2yfuwDi4yUvcCRNuKhdGZe2+LcvzHI6qRJMheBZSFqu1ez+I5oPqXCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OihY3jd7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OihY3jd7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779139806; x=1810675806;
  h=date:from:to:cc:subject:message-id;
  bh=C7IjxmNiYnyo1F+cGYH2YnOPIJmq4po2q/PpH2crlzY=;
  b=OihY3jd7/MjTmCDOULz760VQd0SeP6SoU//qjZUlp0OrWScHpQrBQpLd
   L0GK8J6lJ/08ckL4tNDJ7O5c795owpWF05tzxCg8oA/6t7Kx8MwlQAIlC
   boMV8O4uEaJOM6i1WsIGlAWqWjlrqXX2LgkZtpfAHN18lTNXx9o1EHP2w
   97ZO2REe6dFiKagkEunzWFkwdjrdwIO2581TI6mM2R4EEGpVnPuOibBv0
   JDrRPZjjLXgLVf/t3ok8dmIAHnOglU7+1641ecb8vpiTSD/dX45QNScQr
   F9osWm6HZAgf2efnn9eLAW0HPHyQddn3CNt5aszVZWJbLZtRhbotY+a0D
   g==;
X-CSE-ConnectionGUID: yJ2CmEtMQgmcWyt3XsYd3Q==
X-CSE-MsgGUID: cC5D7mTyQRWhmDHXRYZdRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97439988"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97439988"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 14:30:05 -0700
X-CSE-ConnectionGUID: 7IAO4TobSNeE4oWSQIR60Q==
X-CSE-MsgGUID: fmAonD+4SMynkKsxXXiYlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="241393808"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 18 May 2026 14:30:04 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP5XF-000000009wH-27nK;
	Mon, 18 May 2026 21:30:01 +0000
Date: Mon, 18 May 2026 23:29:46 +0200
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 132/238]
 drivers/s390/cio/cmf.c:550:25: warning: variable 'size' set but not used
Message-ID: <202605182340.isVRQEhf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: c2abb22c9f24b8570ba3fe1c115908b142514b99 [132/238] s390/cio: replace __get_free_pages() with kmalloc()
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260518/202605182340.isVRQEhf-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605182340.isVRQEhf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605182340.isVRQEhf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/s390/cio/cmf.c: In function 'free_cmb':
>> drivers/s390/cio/cmf.c:550:25: warning: variable 'size' set but not used [-Wunused-but-set-variable]
     550 |                 ssize_t size;
         |                         ^~~~


vim +/size +550 drivers/s390/cio/cmf.c

^1da177e4c3f41 Linus Torvalds            2005-04-16  532  
94bb063312d872 Cornelia Huck             2006-06-29  533  static void free_cmb(struct ccw_device *cdev)
^1da177e4c3f41 Linus Torvalds            2005-04-16  534  {
^1da177e4c3f41 Linus Torvalds            2005-04-16  535  	struct ccw_device_private *priv;
94bb063312d872 Cornelia Huck             2006-06-29  536  	struct cmb_data *cmb_data;
^1da177e4c3f41 Linus Torvalds            2005-04-16  537  
^1da177e4c3f41 Linus Torvalds            2005-04-16  538  	spin_lock(&cmb_area.lock);
^1da177e4c3f41 Linus Torvalds            2005-04-16  539  	spin_lock_irq(cdev->ccwlock);
^1da177e4c3f41 Linus Torvalds            2005-04-16  540  
94bb063312d872 Cornelia Huck             2006-06-29  541  	priv = cdev->private;
94bb063312d872 Cornelia Huck             2006-06-29  542  	cmb_data = priv->cmb;
^1da177e4c3f41 Linus Torvalds            2005-04-16  543  	priv->cmb = NULL;
94bb063312d872 Cornelia Huck             2006-06-29  544  	if (cmb_data)
94bb063312d872 Cornelia Huck             2006-06-29  545  		kfree(cmb_data->last_block);
94bb063312d872 Cornelia Huck             2006-06-29  546  	kfree(cmb_data);
^1da177e4c3f41 Linus Torvalds            2005-04-16  547  	list_del_init(&priv->cmb_list);
^1da177e4c3f41 Linus Torvalds            2005-04-16  548  
^1da177e4c3f41 Linus Torvalds            2005-04-16  549  	if (list_empty(&cmb_area.list)) {
^1da177e4c3f41 Linus Torvalds            2005-04-16 @550  		ssize_t size;
^1da177e4c3f41 Linus Torvalds            2005-04-16  551  		size = sizeof(struct cmb) * cmb_area.num_channels;
7b4ff87cbf3d25 Heiko Carstens            2016-06-20  552  		cmf_activate(NULL, CMF_OFF);
c2abb22c9f24b8 Mike Rapoport (Microsoft  2026-02-10  553) 		kfree((void *)(unsigned long)cmb_area.mem);
^1da177e4c3f41 Linus Torvalds            2005-04-16  554  		cmb_area.mem = NULL;
^1da177e4c3f41 Linus Torvalds            2005-04-16  555  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  556  	spin_unlock_irq(cdev->ccwlock);
^1da177e4c3f41 Linus Torvalds            2005-04-16  557  	spin_unlock(&cmb_area.lock);
^1da177e4c3f41 Linus Torvalds            2005-04-16  558  }
^1da177e4c3f41 Linus Torvalds            2005-04-16  559  

:::::: The code at line 550 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
