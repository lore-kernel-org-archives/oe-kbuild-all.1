Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF153107A0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 22:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726697037; cv=none; b=YF9XnyzE1nevzSmQhIAyP5GjLRQcdfng++q0dC/7+hcE/GvwvXqIYt2NB6PJ8MjbmlbjjTJzkoV3MumcWCxGI1XVNNSVbyOKG1ARAPXQ2wo6uJ34o9qKVt7MT1CusQtBQmnjlj+pJcC0BcoyBoUZ0iA5GtzTfx02ywTuY4swkv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726697037; c=relaxed/simple;
	bh=Sw2zQLUIX3vBGkY+LpF8aqfNZtbYV3WnCSM0JcfoRIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gDfKg5+J11MGEAIcOFug2gXgO+BJpGDiCCft8r8SpNIF7zPxdTdmHLjjlogpjJTHgeHdTExwh9OHoKrC8z0gMDtSKVrZ7w0F9imUVDbndSj9FXt47w5cfsuTcwyzCuzWAHmBIi/w68D+af+YMWCpppAZ+/PbXNdLv4iSpoFUnMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4KX6BfT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4KX6BfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726697035; x=1758233035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sw2zQLUIX3vBGkY+LpF8aqfNZtbYV3WnCSM0JcfoRIE=;
  b=g4KX6BfTtWyaN1lt4zk3KIlfUkiamjLHmQmfGIy42KgkaVF5WhB8afMS
   dIv1yd0DOByTmUWJ//gkoOiw+e6joLQ+rQdbnZVVY+UhAw5QDKjFVn0Ke
   FCMwrdy7A3VZbyyi3JBUltqW+AsN7ja0Wc7LT624FFaf1L1LuXOTwM855
   XS8j+EGvRWinx8RJ5dVOAwozCa2uU2imSFtqcao3dTcG2EzOL8OqAlCsv
   X/0LhP1TK+S4kgY84RnMlEeUaHDDZ2E7bxPPdxN/dkRMT9NIRMFugUbmJ
   RlbhqR800vaA3Ni4SF7zRKWM9oraDmPkvOp8d8rU/9bkSalvPXhELMs2n
   w==;
X-CSE-ConnectionGUID: +QBpxMgGT8Wikv/G5IeNDg==
X-CSE-MsgGUID: 7S/OQXJpRgGMLSfYIHsvKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29375892"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="29375892"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 15:03:54 -0700
X-CSE-ConnectionGUID: lDUcPo4wQGCD7L5Rlh//Hg==
X-CSE-MsgGUID: WRssu+HwRRKJCVESyDacZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="70551194"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Sep 2024 15:03:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sr2m6-000Cfo-0n;
	Wed, 18 Sep 2024 22:03:50 +0000
Date: Thu, 19 Sep 2024 06:03:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-error-cleanup-2024-09-17 53/53]
 sound/core/init.c:189:17: error: 'ret' undeclared; did you mean 'net'?
Message-ID: <202409190651.rwt9ZgB1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-error-cleanup-2024-09-17
head:   6e744db4fc836ed345a41eec70b1318a5658e4d4
commit: 6e744db4fc836ed345a41eec70b1318a5658e4d4 [53/53] ALSA: indicate error message on function, not caller (snd_card_new())
config: x86_64-rhel-8.3-kunit (https://download.01.org/0day-ci/archive/20240919/202409190651.rwt9ZgB1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409190651.rwt9ZgB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409190651.rwt9ZgB1-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/core/init.c: In function 'snd_card_new':
>> sound/core/init.c:189:17: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     189 |                 ret = -ENOMEM;
         |                 ^~~
         |                 net
   sound/core/init.c:189:17: note: each undeclared identifier is reported only once for each function it appears in


vim +189 sound/core/init.c

   155	
   156	/**
   157	 *  snd_card_new - create and initialize a soundcard structure
   158	 *  @parent: the parent device object
   159	 *  @idx: card index (address) [0 ... (SNDRV_CARDS-1)]
   160	 *  @xid: card identification (ASCII string)
   161	 *  @module: top level module for locking
   162	 *  @extra_size: allocate this extra size after the main soundcard structure
   163	 *  @card_ret: the pointer to store the created card instance
   164	 *
   165	 *  The function allocates snd_card instance via kzalloc with the given
   166	 *  space for the driver to use freely.  The allocated struct is stored
   167	 *  in the given card_ret pointer.
   168	 *
   169	 *  Return: Zero if successful or a negative error code.
   170	 */
   171	int snd_card_new(struct device *parent, int idx, const char *xid,
   172			    struct module *module, int extra_size,
   173			    struct snd_card **card_ret)
   174	{
   175		struct snd_card *card;
   176		int err;
   177	
   178		if (snd_BUG_ON(!card_ret)) {
   179			err = -EINVAL;
   180			goto err;
   181		}
   182	
   183		*card_ret = NULL;
   184	
   185		if (extra_size < 0)
   186			extra_size = 0;
   187		card = kzalloc(sizeof(*card) + extra_size, GFP_KERNEL);
   188		if (!card) {
 > 189			ret = -ENOMEM;
   190			goto err;
   191		}
   192	
   193		err = snd_card_init(card, parent, idx, xid, module, extra_size);
   194		if (err < 0)
   195			goto err; /* card is freed by error handler */
   196	
   197		*card_ret = card;
   198	err:
   199		if (ret < 0)
   200			dev_err(parent, "%s_new() failed with err %d\n", __func__, err);
   201	
   202		return err;
   203	}
   204	EXPORT_SYMBOL(snd_card_new);
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
