Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B3E38B12C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 23:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780441711; cv=none; b=m0CjcjwBepAyBlbZ5Jq6/KKYVHEqldZP0A7w2sAnBLO0OmHkJYcckEKSytwigfx46yW4+6yTnamYbOxSft4Mso+JtxrhCFspnllglls8UPaVvi3FUhbyRWucikEiuwJP/Z2UpIUXGfLaLBGYy82jS9FfKCb6Dky+jrvhYfcXz1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780441711; c=relaxed/simple;
	bh=LJseWyOU9wtDMRh+kJj+LshMCZ2WIwGtERFoptiXT8o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mJSKRSYBT7n6PFJQOEjDb3wyAqOjKnklCHkea9Z7ghsjdp8mmsS+Vyj1No8tL3ent9rS7XS6XR5KbU4FpCCMLaNUniAq+eNmKJi08M1523+gSoq80ReMKqzo00eFPsvJKeil2Bavme8Muc4ATQ3jIufdLF96DTnAhBBrTjKskYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3t6t0vf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3t6t0vf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780441711; x=1811977711;
  h=date:from:to:cc:subject:message-id;
  bh=LJseWyOU9wtDMRh+kJj+LshMCZ2WIwGtERFoptiXT8o=;
  b=j3t6t0vfBtoMcXMT92FD2DnQjnuZFTfkeuQOJHq2DiTEhxeoP7DDPoxK
   nH+vvlICtJ/1mJdXmUdzciYb1md9nhMxjaFvR3YDfNuMnuuqrWIPxNPzC
   Q5eZM4t13dwlYddEbfi2pzPTEGU/bzHSmLng67CM2MUtw5YtfWWeSe5ui
   pAWw/niYMGIh8713SAPm4j+uY9Fg3c9NDYzTAZCl80rnbl53+rajVg4n6
   FVPZB6mBNbCpgG2G62lbDd+Z+AIa+2ZmKdWKyVAdal1rYbEjmSApxyu0K
   n7uIKObPKesJ8gK5hzo5qHYBf8L3peagnLQhkoaHH4jd65fNzxw9Zf1Jb
   Q==;
X-CSE-ConnectionGUID: /xEUGKmDRL63eSPTOhYiBA==
X-CSE-MsgGUID: cPZk+V7uTIiJ4VkoxRevEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="103899135"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="103899135"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 16:08:30 -0700
X-CSE-ConnectionGUID: RF1mLOJ9RU2HCYyOngUGow==
X-CSE-MsgGUID: KjyHq4EEQNGMmShrOkB9IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="237686610"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jun 2026 16:08:28 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUYDi-00000000Ceo-06sC;
	Tue, 02 Jun 2026 23:08:26 +0000
Date: Wed, 03 Jun 2026 07:07:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/codecs/cx20442.c:355:30: warning: unused variable 'card'
Message-ID: <202606030627.Avj4MjqQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: f66a1b718fbcb7553fef8ad2e807c9e84ca546e5 [290/290] dai
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260603/202606030627.Avj4MjqQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030627.Avj4MjqQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030627.Avj4MjqQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/cx20442.c: In function 'cx20442_component_probe':
>> sound/soc/codecs/cx20442.c:355:30: warning: unused variable 'card' [-Wunused-variable]
     355 |         struct snd_soc_card *card = snd_soc_component_to_card(component);
         |                              ^~~~


vim +/card +355 sound/soc/codecs/cx20442.c

   351	
   352	static int cx20442_component_probe(struct snd_soc_component *component)
   353	{
   354		struct cx20442_priv *cx20442;
 > 355		struct snd_soc_card *card = snd_soc_component_to_card(component);
   356		struct device *dev = snd_soc_component_to_dev(component);
   357	
   358		cx20442 = kzalloc_obj(struct cx20442_priv);
   359		if (cx20442 == NULL)
   360			return -ENOMEM;
   361	
   362		cx20442->por = regulator_get(dev, "POR");
   363		if (IS_ERR(cx20442->por)) {
   364			int err = PTR_ERR(cx20442->por);
   365	
   366			dev_warn(dev, "failed to get POR supply (%d)", err);
   367			/*
   368			 * When running on a non-dt platform and requested regulator
   369			 * is not available, regulator_get() never returns
   370			 * -EPROBE_DEFER as it is not able to justify if the regulator
   371			 * may still appear later.  On the other hand, the board can
   372			 * still set full constraints flag at late_initcall in order
   373			 * to instruct regulator_get() to return a dummy one if
   374			 * sufficient.  Hence, if we get -ENODEV here, let's convert
   375			 * it to -EPROBE_DEFER and wait for the board to decide or
   376			 * let Deferred Probe infrastructure handle this error.
   377			 */
   378			if (err == -ENODEV)
   379				err = -EPROBE_DEFER;
   380			kfree(cx20442);
   381			return err;
   382		}
   383	
   384		cx20442->tty = NULL;
   385	
   386		dev_set_drvdata(dev, cx20442);
   387	
   388		return 0;
   389	}
   390	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
