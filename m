Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362263C5855
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 08:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683334; cv=none; b=VE9XXcKZmW2/3gw4a+/S8u7JOypqrt51NK+6XGDHsPykV/J0wcHrAg0pGJ/Pwlh8KARiOPNqCwuDzaYAotKoG8O3dzRkgbvqqvWVbUoAnsCZBDc8Rv9PNAXv+mNpk9n/ZuRkJzA+y9EZW1o/UgVzYSBH/ilOjhUePpi8yBE4PYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683334; c=relaxed/simple;
	bh=WjY1MjybHh+hFTl+TH5FrRJ/gD9qhMM4cp7p6Zsz2FE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=heBxvr46Mztx+pJnFxxyjCfsLFnMktUfti3ehiZLQZnqKSOAInFrgIWn4K+8L21AshE2qO/8GR4g0yMiqY+OBFAl5nX5O1ED2KTCJVMQDQPmGWN7QUICmft9XDLivmcbodAMPrNWTEy0kgOwwgeI9eAjKqlvQAcoajOvVOb4Cso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5VGFzBq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5VGFzBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781683330; x=1813219330;
  h=date:from:to:cc:subject:message-id;
  bh=WjY1MjybHh+hFTl+TH5FrRJ/gD9qhMM4cp7p6Zsz2FE=;
  b=N5VGFzBqkM8GD0aMUS+LWDx1266UOxuG7B/rTZyqtxqDZU67hA8swVEq
   /DGaXh4TPgaA1eVGzzVSeUIf27Qvt5PtOGo/A1iuEcZ8KHtmSh+qIJxGY
   BpaFHvVK2Q/929ta3SsrsJ8lh9331i/Tfiq8rm1G52OE11nn59X3pszyG
   BI1K7THzTeOjR3jcL6RL88q4e0Y+f7ughLsQf485R54sxH2b7jfJVs06Y
   N+sV9xyqqAH4zVvhNveQdD39Z/6h5JDMO0RywJpGJwLsKocxYh+9zYxVD
   3nJDHbe7ZXi2acOQyTGiuAf6olnQXOtUegFQemcUQlECTcLwQbJd7eS3r
   A==;
X-CSE-ConnectionGUID: TNpwyQWrSqKFCdNWBgFuAQ==
X-CSE-MsgGUID: gmgol/8aSrqJ00XbGfRnUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82577425"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="82577425"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 01:02:08 -0700
X-CSE-ConnectionGUID: nnsSv1uqTuaWn1bTqzUZtg==
X-CSE-MsgGUID: 1SWcyd7QT/u0tF1gBRUc1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="243846517"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jun 2026 01:02:06 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZlDo-00000000UGA-0vhu;
	Wed, 17 Jun 2026 08:02:04 +0000
Date: Wed, 17 Jun 2026 16:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 326/326]
 sound/soc/soc-card.c:42:6: warning: no previous prototype for
 'snd_soc_card_attach_priv'
Message-ID: <202606171526.khZduE6t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: bcca3afbe4030eb595d239674303afc5fd051920 [326/326] ASoC: soc-card.h: remove compatible definition
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260617/202606171526.khZduE6t-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606171526.khZduE6t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606171526.khZduE6t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-card.c:42:6: warning: no previous prototype for 'snd_soc_card_attach_priv' [-Wmissing-prototypes]
      42 | void snd_soc_card_attach_priv(struct snd_soc_card *card, void *data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c: In function 'snd_soc_card_remove':
   sound/soc/soc-card.c:886:27: error: 'struct snd_soc_card_driver' has no member named 'probed'; did you mean 'probe'?
     886 |         if (card->driver->probed &&
         |                           ^~~~~~
         |                           probe
   sound/soc/soc-card.c: In function 'snd_soc_card_register3':
   sound/soc/soc-card.c:1337:14: error: 'card_driver' undeclared (first use in this function)
    1337 |         if (!card_driver->name)
         |              ^~~~~~~~~~~
   sound/soc/soc-card.c:1337:14: note: each undeclared identifier is reported only once for each function it appears in
   sound/soc/soc-card.c:1351:24: error: returning 'int' from a function with return type 'struct snd_soc_card *' makes pointer from integer without a cast [-Wint-conversion]
    1351 |                 return -ENOMEM;
         |                        ^


vim +/snd_soc_card_attach_priv +42 sound/soc/soc-card.c

a17b7ac8c2f6e3 Kuninori Morimoto 2026-05-25  41  
37fbbbd202b3c6 Kuninori Morimoto 2026-03-30 @42  void snd_soc_card_attach_priv(struct snd_soc_card *card, void *data)
37fbbbd202b3c6 Kuninori Morimoto 2026-03-30  43  {
37fbbbd202b3c6 Kuninori Morimoto 2026-03-30  44  	card->priv = data;
37fbbbd202b3c6 Kuninori Morimoto 2026-03-30  45  }
37fbbbd202b3c6 Kuninori Morimoto 2026-03-30  46  EXPORT_SYMBOL_GPL(snd_soc_card_attach_priv);
37fbbbd202b3c6 Kuninori Morimoto 2026-03-30  47  

:::::: The code at line 42 was first introduced by commit
:::::: 37fbbbd202b3c6492f62f43397daad7b7a4f35b2 ASoC: soc-card: move snd_soc_card_{set/get}_drvdata() to soc-card.c

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
