Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24493334730
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Aug 2025 17:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756487240; cv=none; b=u+8q+24xe+ImwbMIwH3OI2vh05cJ4Osk4BmJN4o3XSFHa079T4Yae3dPmKYO8cRgpDrYIXKedtgtNk1wwh6EfNsLBJHwWKYPjhWThFBABkV5JL4DoPEH7PQ4Fyn80f/NwsomAuB6bxUigR8xwzatJoXpYdbuY5rWpz+HNNEOrBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756487240; c=relaxed/simple;
	bh=h+P/iLo/ncgptMqc6/rLJSBJlM+bh5orioiVqsZxgps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RnK4Fd1qjo8MRQgrm9fCaq7rWYPD1Iyi2NO65YQEIBTFNsHtpY9qKpaMtiZSMkk0riyuO7UVQInTif1svS8VM3nb/PVLpbil0/464FBrjh8EHyujNLn0m9Td6Z8H4rMSeZXDML/i4inKsgrpC7wU2RNOOfFJ1BWUNLX8p1VSOdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXszzlZw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXszzlZw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756487239; x=1788023239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h+P/iLo/ncgptMqc6/rLJSBJlM+bh5orioiVqsZxgps=;
  b=HXszzlZw6G/9C/hVJwFjONMjWHa6o1SDhF5DeqvFP2Ipsn2TLDmw39Sk
   chebI3GvZ1nEE/zmLWhdWSSmxk9I15W/++MiX7OA+jI3JVCiDraDFZ7mp
   oSy51MwyX/TPInaJp2LMEHF60j4TgnXuDqduyjjVCj6XusTQSsSU7T0B3
   PxODTljZf3byYp5tY3+BKt+Y7pSGsvJllLGU6uBi+RFGWKXD2iPaMDHwD
   osETmv9XNu7pnF4ENu2EBEg2KBLu5hz9oQCdF1pNO5CS0W/NPH2wmYcyb
   WBFU67nj4PAeeAfTBIolvVLV3E/LW+5RFl9k/RGw3luaTx/S48YsnAcy3
   g==;
X-CSE-ConnectionGUID: X6itUQMDReWwNXrxXDPFvQ==
X-CSE-MsgGUID: SOoIzwIxRASPhajn/V8OXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="57802783"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="57802783"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 10:07:13 -0700
X-CSE-ConnectionGUID: sffGUIYWSf+cGp3m+jvwng==
X-CSE-MsgGUID: xYCfjnURSdKQCrP45kAQXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="174794057"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 29 Aug 2025 10:07:11 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us2ZB-000UnR-1f;
	Fri, 29 Aug 2025 17:07:09 +0000
Date: Sat, 30 Aug 2025 01:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-08-27 160/163]
 sound/soc/atmel/tse850-pcm5142.c:62:34: error: invalid use of undefined type
 'struct snd_soc_dapm_context'
Message-ID: <202508300129.OwENl8ss-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-08-27
head:   c9adab745b2e28ef66808e807be5290d9c0922f6
commit: ad9fefcdf30eb38213d608e6825b466b51dda0d6 [160/163] ASoC: soc-dapm: move struct snd_soc_dapm_context
config: arm-randconfig-001-20250829 (https://download.01.org/0day-ci/archive/20250830/202508300129.OwENl8ss-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508300129.OwENl8ss-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508300129.OwENl8ss-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/atmel/tse850-pcm5142.c: In function 'tse850_get_mux1':
>> sound/soc/atmel/tse850-pcm5142.c:62:34: error: invalid use of undefined type 'struct snd_soc_dapm_context'
      62 |  struct snd_soc_card *card = dapm->card;
         |                                  ^~
   sound/soc/atmel/tse850-pcm5142.c: In function 'tse850_put_mux1':
   sound/soc/atmel/tse850-pcm5142.c:74:34: error: invalid use of undefined type 'struct snd_soc_dapm_context'
      74 |  struct snd_soc_card *card = dapm->card;
         |                                  ^~
   sound/soc/atmel/tse850-pcm5142.c: In function 'tse850_get_mux2':
   sound/soc/atmel/tse850-pcm5142.c:92:34: error: invalid use of undefined type 'struct snd_soc_dapm_context'
      92 |  struct snd_soc_card *card = dapm->card;
         |                                  ^~
   sound/soc/atmel/tse850-pcm5142.c: In function 'tse850_put_mux2':
   sound/soc/atmel/tse850-pcm5142.c:104:34: error: invalid use of undefined type 'struct snd_soc_dapm_context'
     104 |  struct snd_soc_card *card = dapm->card;
         |                                  ^~
   sound/soc/atmel/tse850-pcm5142.c: In function 'tse850_get_mix':
   sound/soc/atmel/tse850-pcm5142.c:122:34: error: invalid use of undefined type 'struct snd_soc_dapm_context'
     122 |  struct snd_soc_card *card = dapm->card;
         |                                  ^~
   sound/soc/atmel/tse850-pcm5142.c: In function 'tse850_put_mix':
   sound/soc/atmel/tse850-pcm5142.c:134:34: error: invalid use of undefined type 'struct snd_soc_dapm_context'
     134 |  struct snd_soc_card *card = dapm->card;
         |                                  ^~
   sound/soc/atmel/tse850-pcm5142.c: In function 'tse850_get_ana':
   sound/soc/atmel/tse850-pcm5142.c:156:34: error: invalid use of undefined type 'struct snd_soc_dapm_context'
     156 |  struct snd_soc_card *card = dapm->card;
         |                                  ^~
   sound/soc/atmel/tse850-pcm5142.c: In function 'tse850_put_ana':
   sound/soc/atmel/tse850-pcm5142.c:189:34: error: invalid use of undefined type 'struct snd_soc_dapm_context'
     189 |  struct snd_soc_card *card = dapm->card;
         |                                  ^~


vim +62 sound/soc/atmel/tse850-pcm5142.c

aa43112445f0f3 Peter Rosin       2016-11-15  57  
aa43112445f0f3 Peter Rosin       2016-11-15  58  static int tse850_get_mux1(struct snd_kcontrol *kctrl,
aa43112445f0f3 Peter Rosin       2016-11-15  59  			   struct snd_ctl_elem_value *ucontrol)
aa43112445f0f3 Peter Rosin       2016-11-15  60  {
d9a7adc36870a4 Kuninori Morimoto 2025-06-26  61  	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctrl);
aa43112445f0f3 Peter Rosin       2016-11-15 @62  	struct snd_soc_card *card = dapm->card;
aa43112445f0f3 Peter Rosin       2016-11-15  63  	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
aa43112445f0f3 Peter Rosin       2016-11-15  64  
aa43112445f0f3 Peter Rosin       2016-11-15  65  	ucontrol->value.enumerated.item[0] = tse850->loop1_cache;
aa43112445f0f3 Peter Rosin       2016-11-15  66  
aa43112445f0f3 Peter Rosin       2016-11-15  67  	return 0;
aa43112445f0f3 Peter Rosin       2016-11-15  68  }
aa43112445f0f3 Peter Rosin       2016-11-15  69  

:::::: The code at line 62 was first introduced by commit
:::::: aa43112445f0f3b7b30ea2189218fcbd437c28ec ASoC: atmel: tse850: add ASoC driver for the Axentia TSE-850

:::::: TO: Peter Rosin <peda@axentia.se>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
