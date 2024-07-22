Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748A014A90
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 04:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721622492; cv=none; b=bFAeCH4gfccOIBw9znZf8beowmj4iYw5BDw5KLPEjtdR478JihO/u23edsxdnB4ZsMR/uf/eeY1rMMwCNP9rQj7MBZ/rP3UbUt/CIWHEIKiYp8pjyHcGC7gbiLYw0GGQTqwcsnMphfj+qHenrEu7Ri1rnToP3lib9oopz1eVMoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721622492; c=relaxed/simple;
	bh=El8z7dcqXKFMcGq7Hco85i0cAC03t7wsbT4F3QiNqTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pC4nmTwQ4XwPugRQiyErqv5xlqkuTRxBlBtqMWX1Tso6AtJ3dUfyAXoOOIUC3/HFJ1G1r6/WwCyZ6AhLKF/bKPNxPo1joYatDPtxr8hI/jHwu+CQPGS7e8j1ctjJLw3WkCKfNA6DpCWQpl5vtEwktqUzrnuO9uGAiC/E62CKV4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUje9d1L; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUje9d1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721622490; x=1753158490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=El8z7dcqXKFMcGq7Hco85i0cAC03t7wsbT4F3QiNqTM=;
  b=UUje9d1LP+B2ZHwoqKsHkNUKusdolI4iB1lBJXaEa3MIWAivPxgjQg3O
   VwqNsCQnN+ja3m89WRfesF00Bt5EO2ZtUNxTsu8Z1QahijFzavlPPbzim
   k/yuHQEWWUJQFwWX9GhrLmc4fhibuwTWvViGKuL5d8UnIX4rjV4GImt3o
   Cj/S4oC3kG+2SYIASyfVUnYSeLvb0AgqUuQuoZlJm1xnovz4/fp99Anz1
   2cLswVmyL/zlIoTdN7+/6jqeKCdh5p4HSmC7Mja5KC1Asnzf5VtkHIg3K
   FchJZ95I4FmK2LzTlpO4Pl2Xvn7f+Qe0AO3cqBJ/F2Tfhq2z+b0ZrtHmO
   w==;
X-CSE-ConnectionGUID: 6hFMZ6O2Tq2qiUSgpWXyrA==
X-CSE-MsgGUID: VSlB++TbSritGkXC2df2pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="23035604"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="23035604"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 21:28:09 -0700
X-CSE-ConnectionGUID: 1ZU3+EUrSdag4SwQJsArSQ==
X-CSE-MsgGUID: yy/cclWVSR6bVr3t1QajuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="51640295"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Jul 2024 21:28:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVkeb-000krk-2g;
	Mon, 22 Jul 2024 04:28:05 +0000
Date: Mon, 22 Jul 2024 12:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-msiof-2024-07-19 16/16] sound/soc/sh/msiof.c:470:17:
 error: 'stop' undeclared
Message-ID: <202407221259.msJUVJhx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-msiof-2024-07-19
head:   a12bc552b3fd774fec2214ece9ee022c4808d676
commit: a12bc552b3fd774fec2214ece9ee022c4808d676 [16/16] msiof
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240722/202407221259.msJUVJhx-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407221259.msJUVJhx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407221259.msJUVJhx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/sh/msiof.c: In function 'msiof_trigger':
>> sound/soc/sh/msiof.c:470:17: error: 'stop' undeclared (first use in this function)
     470 |                 stop = 1;
         |                 ^~~~
   sound/soc/sh/msiof.c:470:17: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/device.h:15,
                    from include/linux/dmaengine.h:8,
                    from include/linux/of_dma.h:14,
                    from sound/soc/sh/msiof.c:25:
>> sound/soc/sh/msiof.c:482:39: warning: format '%x' expects a matching 'unsigned int' argument [-Wformat=]
     482 |                         dev_warn(dev, "SISTR = %08x\n");
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   sound/soc/sh/msiof.c:482:25: note: in expansion of macro 'dev_warn'
     482 |                         dev_warn(dev, "SISTR = %08x\n");
         |                         ^~~~~~~~
   sound/soc/sh/msiof.c:482:51: note: format string is defined here
     482 |                         dev_warn(dev, "SISTR = %08x\n");
         |                                                ~~~^
         |                                                   |
         |                                                   unsigned int
>> sound/soc/sh/msiof.c:464:42: warning: this statement may fall through [-Wimplicit-fallthrough=]
     464 |                 priv->substream[is_play] = substream;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   sound/soc/sh/msiof.c:466:9: note: here
     466 |         case SNDRV_PCM_TRIGGER_RESUME:
         |         ^~~~
   sound/soc/sh/msiof.c: At top level:
>> sound/soc/sh/msiof.c:117:12: warning: 'msiof_read16' defined but not used [-Wunused-function]
     117 | static u32 msiof_read16(struct msiof_priv *priv, u32 reg)
         |            ^~~~~~~~~~~~


vim +/stop +470 sound/soc/sh/msiof.c

   450	
   451	static int msiof_trigger(struct snd_soc_component *component,
   452				 struct snd_pcm_substream *substream, int cmd)
   453	{
   454		struct device *dev = component->dev;
   455		struct msiof_priv *priv = dev_get_drvdata(dev);
   456		unsigned long flags;
   457		int is_play = msiof_is_play(substream);
   458		int ret = -EINVAL;
   459	
   460		spin_lock_irqsave(&priv->lock, flags);
   461	
   462		switch (cmd) {
   463		case SNDRV_PCM_TRIGGER_START:
 > 464			priv->substream[is_play] = substream;
   465			/* fallthrough */
   466		case SNDRV_PCM_TRIGGER_RESUME:
   467			ret = msiof_hw_start(component, substream, cmd);
   468			break;
   469		case SNDRV_PCM_TRIGGER_STOP:
 > 470			stop = 1;
   471			/* fallthrough */
   472		case SNDRV_PCM_TRIGGER_SUSPEND:
   473			ret = msiof_hw_stop(component, substream, cmd);
   474			break;
   475		}
   476	
   477		if (stop) {
   478			u32 sistr = msiof_read(priv, SISTR);
   479	
   480			/* indicate error status if exist */
   481			if (sistr)
 > 482				dev_warn(dev, "SISTR = %08x\n");
   483	
   484			priv->substream[is_play] = NULL;
   485		}
   486	
   487		spin_unlock_irqrestore(&priv->lock, flags);
   488	
   489		return ret;
   490	}
   491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
