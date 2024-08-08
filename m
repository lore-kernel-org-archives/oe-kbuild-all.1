Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7182144316
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 17:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723139565; cv=none; b=mBUDeAbtKce/LGnQmULQDoQ/Toe/cIfspyhiMdAWfvkJcvZzdzbSl83jZcTcVSOGqYwEkkJCcODyG5PNUW4nV0eFDaQ8GWlwjfTv2oOWcEhBXzZbS7k7eSS6bVpf5QlbyitPn/qNl5d1kA5fdXoLiilmctwnql78n1jswIANo1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723139565; c=relaxed/simple;
	bh=fBYzb9q58GUyO+F6s8oW2cvMI2xtXQ/irUMXIi6iaFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pi/aG7wYLF6/zhfqjkBN4Q9DjQJatUEsUomsLGv0WuBug3azAA39GBnr44Ep1H5ZpU7Qfo5DcpylgRqQG8B+/4p9dW8k6K0RF+CXUQ56OyxK5jXIrgUKuHbrJegDlbVqi1TqEAhJq52dsIfrlwADqcfXD3Qr0AlvT7BzgqpPty0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEBvlSQx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEBvlSQx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723139563; x=1754675563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fBYzb9q58GUyO+F6s8oW2cvMI2xtXQ/irUMXIi6iaFE=;
  b=JEBvlSQxyOKtNDXRiCSg5NvJijmIbLL36RgA4pdc/lPwjLYRp4l636/S
   UNEwi3/Gm2D8WF5FdW1EOg9yCUumL4t157NQwol6Z9oAaPPpSi81V8aZv
   ivYLO7jfPiDbHVTbm96pQaYqDrNag+0yXufTkH86wKrl6OV75ybAgCGE8
   joPDeh2QVDVgGi2uXhfnfEEtb+ItufiIAGmV0JWvRhCdOFVZFBi3Etwcf
   nxdNXaY/J1hfEb1gtt7L14sl0hfvcJBUTAA+uN6AKnpBrp6yngfuF6rG4
   34m2VgOSsKd446PfEC20AKZjxml02EpRL5574Xm5C95DuglrnFwFT8Jq2
   g==;
X-CSE-ConnectionGUID: raTAcv8oRdGFtVzA9cJ8wg==
X-CSE-MsgGUID: GBiK6x/ZSy22uaXOm3ualA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32433598"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="32433598"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 10:52:43 -0700
X-CSE-ConnectionGUID: ISTeMbyLSyuhUOk3z5pfCQ==
X-CSE-MsgGUID: Cwk/nXO2RYaAN3s29GK5gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="57537432"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 08 Aug 2024 10:52:41 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc7JW-0006OJ-1p;
	Thu, 08 Aug 2024 17:52:38 +0000
Date: Fri, 9 Aug 2024 01:52:34 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: [tiwai-sound:for-next 69/82] sound/pcmcia/vx/vxpocket.c:273:26:
 error: 'pdev' undeclared; did you mean 'p_dev'?
Message-ID: <202408090110.t0mWbTyh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   e95b9f7f2ee05bbef3bf6a4cd7da6e887f17f652
commit: 2acbb5e57230830016e0fb2d61886e7a8c7f59ce [69/82] ALSA: vxpocket: Use standard print API
config: i386-randconfig-141-20240808 (https://download.01.org/0day-ci/archive/20240809/202408090110.t0mWbTyh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090110.t0mWbTyh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090110.t0mWbTyh-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/pcmcia/vx/vxpocket.c: In function 'vxpocket_config':
   sound/pcmcia/vx/vxpocket.c:207:13: error: 'struct vx_core' has no member named 'dev'
     207 |         chip->dev = &link->dev;
         |             ^~
   In file included from include/linux/device.h:15,
                    from include/sound/core.h:10,
                    from sound/pcmcia/vx/vxpocket.c:13:
   sound/pcmcia/vx/vxpocket.c: In function 'vxpocket_probe':
>> sound/pcmcia/vx/vxpocket.c:273:26: error: 'pdev' undeclared (first use in this function); did you mean 'p_dev'?
     273 |                 dev_err(&pdev->dev, "vxpocket: cannot create a card instance\n");
         |                          ^~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/pcmcia/vx/vxpocket.c:273:17: note: in expansion of macro 'dev_err'
     273 |                 dev_err(&pdev->dev, "vxpocket: cannot create a card instance\n");
         |                 ^~~~~~~
   sound/pcmcia/vx/vxpocket.c:273:26: note: each undeclared identifier is reported only once for each function it appears in
     273 |                 dev_err(&pdev->dev, "vxpocket: cannot create a card instance\n");
         |                          ^~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/pcmcia/vx/vxpocket.c:273:17: note: in expansion of macro 'dev_err'
     273 |                 dev_err(&pdev->dev, "vxpocket: cannot create a card instance\n");
         |                 ^~~~~~~


vim +273 sound/pcmcia/vx/vxpocket.c

   247	
   248	
   249	/*
   250	 */
   251	static int vxpocket_probe(struct pcmcia_device *p_dev)
   252	{
   253		struct snd_card *card;
   254		struct snd_vxpocket *vxp;
   255		int i, err;
   256	
   257		/* find an empty slot from the card list */
   258		for (i = 0; i < SNDRV_CARDS; i++) {
   259			if (!(card_alloc & (1 << i)))
   260				break;
   261		}
   262		if (i >= SNDRV_CARDS) {
   263			dev_err(&p_dev->dev, "vxpocket: too many cards found\n");
   264			return -EINVAL;
   265		}
   266		if (! enable[i])
   267			return -ENODEV; /* disabled explicitly */
   268	
   269		/* ok, create a card instance */
   270		err = snd_card_new(&p_dev->dev, index[i], id[i], THIS_MODULE,
   271				   0, &card);
   272		if (err < 0) {
 > 273			dev_err(&pdev->dev, "vxpocket: cannot create a card instance\n");
   274			return err;
   275		}
   276	
   277		err = snd_vxpocket_new(card, ibl[i], p_dev, &vxp);
   278		if (err < 0) {
   279			snd_card_free(card);
   280			return err;
   281		}
   282		card->private_data = vxp;
   283	
   284		vxp->index = i;
   285		card_alloc |= 1 << i;
   286	
   287		vxp->p_dev = p_dev;
   288	
   289		return vxpocket_config(p_dev);
   290	}
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
