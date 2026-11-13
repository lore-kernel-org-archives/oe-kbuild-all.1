Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794570082;
	b=C0RmsMk9dT//jVOsVADaOzZehoB1XtGYV9kYiIaT5B5CTJAVd/+pIcMazAYOhriUss4d
	 8EBWNrwOA/WdB29NCduC+0gQbX5nLGaQpM0F0yFVEp7Z3Rhl9xbpjwV9tDgTtZE8ioXKn
	 ab5YWe23nDp66+QU9FoIy8tK9ABHNecwaWL/sHXfVbjSsxv2UPF0gBfYdAqbb9XUXvNgy
	 zbCULiskYakyF3ydPIQ2rO/fE1j+U+DfmkByh3bGntAjkvcqC6rIM3lYG5IUx9oTMQezN
	 G9kOeY+B8hTnSkZ0WnT1g1Cm5n9QjODHWGC8C71TYVv9Jki7dz/ycZ2FhezRAFI4Rzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570082;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XfDD46rp2pHlKaSd/T3nFfKRO/7O1iDAnYjdPD/rTOM=;
	b=kj7K3kVdtC2SBopzHloOKQYdGZido1E+yTv9HxZF4Eub+oArHKm2/EuZK11uT56anw20
	 2p52ckDnG2kCyl8eR3PdPhoG++i4rXxJSVyCD4WeZviRUR1XILaRjoZkcMxyQyz2K3Wb9
	 xFWE2IXACNqP+A3bolLqCdxOWsjD9Hs3NJ/XPr6CfzvtUzlOVG+Sfrk56d08i6ARWctL7
	 KskUbVbPQMsQaM3IA7cNzzEz2vXEFlU3bSuo8sJa8yNfMVr1NHxh0K4v/toqq7R32Uuky
	 YVpJWHTWAR04y4kZluKO5YpzFALVpTgYw9PvBgzo+4hr5YpCYl+8jxD8XysHmLiXboQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FufMsoX5;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD9B606A323
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 11:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AD9B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FufMsoX5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794570083; x=1826106083;
  h=date:from:to:cc:subject:message-id;
  bh=+h90G2X5hsNvax9TeYWbZ3U53cYE8jDp9gRo/r368Kg=;
  b=FufMsoX5BHyuq4O3pAewjAV2ulAoJr7J4wjN3kJJLR9pwNj9Wz7hqyZJ
   bNtsWJ3iGX1ZPkyL8ImWsE/tghIIbrboHdIgxSWDwZSJ/Qs8iKU6nQikm
   bjIngq85DXtg+oKWLIwgSnZu7t7gUQLTEZvIy7Y/PSuoPPltkVJCWxcm6
   /iicHwC9XUrxjTMXCMQ0Mv1al+AaTZS1Eb/XveRpM5i0EpsDkmDybUwGf
   WW5oQ6UXlzLyqqU2By1hXOIkaWDJDUrIBTdp7RFk9PL10aP5+qscI0Nvw
   Jr56ECJLt3fHtJ/7Pdcxukwd+x+UsBWTFhmxp7MpjPQnEnB7JF/K59fAl
   A==;
X-CSE-ConnectionGUID: iNf8iiRwS5mjJ8Ok5JzJGg==
X-CSE-MsgGUID: EJEtWV+fRBCkeORbOzmlmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3271469"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3271469"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:41:22 -0800
X-CSE-ConnectionGUID: NYmmWYP/TEeHSP0ytTtmdw==
X-CSE-MsgGUID: bDHVbS9FS1++jPRsdaR78Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9064678"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2026 03:41:20 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRpef-000000012jf-3LxU;
	Fri, 13 Nov 2026 11:41:17 +0000
Date: Fri, 13 Nov 2026 19:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-mod-2026-11-06-2 348/348]
 sound/soc/soc-pcm-mod.c:89:35: error: 'soc_pcm_open' undeclared; did you mean
 'soc_pcm_ret'?
Message-ID: <202611131950.yGyXUHKw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/morimoto/linux sound-mod-2026-11-06-2
head:   9667cbd3f622480983c9c69e0525b2ca47c07f74
commit: 7454144fb3be295810104db73497ffa2d04a6254 [348/348] hoge
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261113/202611131950.yGyXUHKw-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611131950.yGyXUHKw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611131950.yGyXUHKw-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-pcm-mod.c: In function 'soc_new_pcm_mod':
>> sound/soc/soc-pcm-mod.c:89:35: error: 'soc_pcm_open' undeclared (first use in this function); did you mean 'soc_pcm_ret'?
      89 |         rtd->ops.open           = soc_pcm_open;
         |                                   ^~~~~~~~~~~~
         |                                   soc_pcm_ret
   sound/soc/soc-pcm-mod.c:89:35: note: each undeclared identifier is reported only once for each function it appears in
>> sound/soc/soc-pcm-mod.c:90:35: error: 'soc_pcm_hw_params' undeclared (first use in this function); did you mean 'snd_pcm_hw_params'?
      90 |         rtd->ops.hw_params      = soc_pcm_hw_params;
         |                                   ^~~~~~~~~~~~~~~~~
         |                                   snd_pcm_hw_params
>> sound/soc/soc-pcm-mod.c:91:35: error: 'soc_pcm_prepare' undeclared (first use in this function); did you mean 'soc_pcm_ret'?
      91 |         rtd->ops.prepare        = soc_pcm_prepare;
         |                                   ^~~~~~~~~~~~~~~
         |                                   soc_pcm_ret
>> sound/soc/soc-pcm-mod.c:92:35: error: 'soc_pcm_trigger' undeclared (first use in this function); did you mean 'snd_soc_dpcm_trigger'?
      92 |         rtd->ops.trigger        = soc_pcm_trigger;
         |                                   ^~~~~~~~~~~~~~~
         |                                   snd_soc_dpcm_trigger
>> sound/soc/soc-pcm-mod.c:93:35: error: 'soc_pcm_hw_free' undeclared (first use in this function); did you mean 'snd_pcm_hw_rule'?
      93 |         rtd->ops.hw_free        = soc_pcm_hw_free;
         |                                   ^~~~~~~~~~~~~~~
         |                                   snd_pcm_hw_rule
>> sound/soc/soc-pcm-mod.c:94:35: error: 'soc_pcm_close' undeclared (first use in this function); did you mean 'snd_pcm_oss'?
      94 |         rtd->ops.close          = soc_pcm_close;
         |                                   ^~~~~~~~~~~~~
         |                                   snd_pcm_oss
>> sound/soc/soc-pcm-mod.c:95:35: error: 'soc_pcm_pointer' undeclared (first use in this function)
      95 |         rtd->ops.pointer        = soc_pcm_pointer;
         |                                   ^~~~~~~~~~~~~~~


vim +89 sound/soc/soc-pcm-mod.c

    68	
    69	/* create a new pcm */
    70	int soc_new_pcm_mod(struct snd_soc_pcm_runtime *rtd)
    71	{
    72	//	struct snd_soc_component *component;
    73		struct snd_pcm *pcm;
    74		int ret = 0, playback = 0, capture = 0;
    75	
    76		ret = soc_get_playback_capture(rtd, &playback, &capture);
    77		if (ret < 0)
    78			goto err;
    79	
    80		ret = soc_create_pcm(&pcm, rtd, playback, capture);
    81		if (ret < 0)
    82			goto err;
    83	
    84		rtd->pcm		= pcm;
    85		pcm->nonatomic		= rtd->dai_link->nonatomic;
    86		pcm->private_data	= rtd;
    87		pcm->no_device_suspend	= true;
    88	
  > 89		rtd->ops.open		= soc_pcm_open;
  > 90		rtd->ops.hw_params	= soc_pcm_hw_params;
  > 91		rtd->ops.prepare	= soc_pcm_prepare;
  > 92		rtd->ops.trigger	= soc_pcm_trigger;
  > 93		rtd->ops.hw_free	= soc_pcm_hw_free;
  > 94		rtd->ops.close		= soc_pcm_close;
  > 95		rtd->ops.pointer	= soc_pcm_pointer;
    96	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
