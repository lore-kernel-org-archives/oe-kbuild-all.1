Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0134F19F40B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Apr 2026 12:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777206936; cv=none; b=DmuL1lE29wEI7aAsEKr68S1bSmqBF5YWnNlrLYk+QiJlLKxc6+bO3fL9zLmeInu+Rylrr0k7+sbw7GCei5DH4aAlOCmXtjxsn1PdoTadF1v4qO0jJlur3bChtAeYe5eQkJFQWCOrgcKWcLzn+j2+Pi3bW5bOQ4j5SZI2eXXY60I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777206936; c=relaxed/simple;
	bh=5TUwyi4PJXxmfyYVrF+MQiwv2+OqPxyTFi/+PCKaTTc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FHg/udGGIJ/dHPxX9PbZBF/ArmO6PipvOawOLxszvBf3M5w9Y2f9CjdZ/iMLbrPMXknnu13r0UcRQ95iP9r0pCzlLI+O9wflXGdCjgPPdZnsXa0uEVAadaLNpodB/UhA6lh6ja/iVJwQ0ZbFuIZW7SY6QQkakRYixZbKE2qVaCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Od0wK7yG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Od0wK7yG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777206934; x=1808742934;
  h=date:from:to:cc:subject:message-id;
  bh=5TUwyi4PJXxmfyYVrF+MQiwv2+OqPxyTFi/+PCKaTTc=;
  b=Od0wK7yGYTVVgRvyxczxC89a9lDTnt+fgNGc3MubiUCsDGV4E02FyGmv
   44FOKfCmS4wnr0/e4YdZ0t/KjDBsvCSkt8QsSeNNDJ0GOUDigbgYLd8ck
   AnDce7vZ1zyDwdJjsUb52/EiCHXxgfUmiju+P6FQ0qy936ebes3ssGmWy
   qCJX11OLDgfQpFbg3epqhMw2hH0/akoseTd2JmGVCvHIcmHR6mGnjOejx
   pC/cBo7aYjGgD/6gpLdpbRx+I8PTnPDFTqX8akC5TyTaS1r9Dr02yM5IY
   OkZbYKGpoviVoFAx/iQp3sfPQXxcPdO3/7dpxkDuM5UmZ94djGGMqf73Q
   A==;
X-CSE-ConnectionGUID: PrThIeSCRTuqhAwiryihmA==
X-CSE-MsgGUID: UeM0aSV2ToK33+L8Jzk59Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="103580216"
X-IronPort-AV: E=Sophos;i="6.23,200,1770624000"; 
   d="scan'208";a="103580216"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 05:35:34 -0700
X-CSE-ConnectionGUID: yynrzzv8SLmR/2rb4K2Nhw==
X-CSE-MsgGUID: V28ObpM4Q1+XzmNTFFXB/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,200,1770624000"; 
   d="scan'208";a="229071559"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2026 05:35:32 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGyht-000000007sN-3vBs;
	Sun, 26 Apr 2026 12:35:29 +0000
Date: Sun, 26 Apr 2026 20:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:config-gpio-legacy-7.1 22/22]
 sound/soc/pxa/pxa2xx-pcm.c:21:27: error: 'pxa2xx_soc_pcm_new' undeclared here
 (not in a function)
Message-ID: <202604262007.ONssWsxR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git config-gpio-legacy-7.1
head:   bbb302c86fdfa7705d8511a74c4b6db205cd2683
commit: bbb302c86fdfa7705d8511a74c4b6db205cd2683 [22/22] ASoC: pxa: integrate sound/arm/pxa2xx into sound/soc/pxa2xx
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260426/202604262007.ONssWsxR-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260426/202604262007.ONssWsxR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604262007.ONssWsxR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/pxa/pxa2xx-pcm.c:21:27: error: 'pxa2xx_soc_pcm_new' undeclared here (not in a function)
      21 |         .pcm_construct  = pxa2xx_soc_pcm_new,
         |                           ^~~~~~~~~~~~~~~~~~
>> sound/soc/pxa/pxa2xx-pcm.c:22:27: error: 'pxa2xx_soc_pcm_open' undeclared here (not in a function)
      22 |         .open           = pxa2xx_soc_pcm_open,
         |                           ^~~~~~~~~~~~~~~~~~~
>> sound/soc/pxa/pxa2xx-pcm.c:23:27: error: 'pxa2xx_soc_pcm_close' undeclared here (not in a function)
      23 |         .close          = pxa2xx_soc_pcm_close,
         |                           ^~~~~~~~~~~~~~~~~~~~
>> sound/soc/pxa/pxa2xx-pcm.c:24:27: error: 'pxa2xx_soc_pcm_hw_params' undeclared here (not in a function)
      24 |         .hw_params      = pxa2xx_soc_pcm_hw_params,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/pxa/pxa2xx-pcm.c:25:27: error: 'pxa2xx_soc_pcm_prepare' undeclared here (not in a function)
      25 |         .prepare        = pxa2xx_soc_pcm_prepare,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/pxa/pxa2xx-pcm.c:26:27: error: 'pxa2xx_soc_pcm_trigger' undeclared here (not in a function); did you mean 'snd_soc_dpcm_trigger'?
      26 |         .trigger        = pxa2xx_soc_pcm_trigger,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
         |                           snd_soc_dpcm_trigger
>> sound/soc/pxa/pxa2xx-pcm.c:27:27: error: 'pxa2xx_soc_pcm_pointer' undeclared here (not in a function)
      27 |         .pointer        = pxa2xx_soc_pcm_pointer,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
--
>> sound/soc/pxa/pxa2xx-pcm-lib.c:60:8: error: return type defaults to 'int' [-Wimplicit-int]
      60 | static pxa2xx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
         |        ^~~~~~~~~~~~~~~~~~
>> sound/soc/pxa/pxa2xx-pcm-lib.c:127:5: warning: no previous prototype for 'pxa2xx_soc_pcm_new' [-Wmissing-prototypes]
     127 | int pxa2xx_soc_pcm_new(struct snd_soc_component *component,
         |     ^~~~~~~~~~~~~~~~~~
>> sound/soc/pxa/pxa2xx-pcm-lib.c:142:5: warning: no previous prototype for 'pxa2xx_soc_pcm_open' [-Wmissing-prototypes]
     142 | int pxa2xx_soc_pcm_open(struct snd_soc_component *component,
         |     ^~~~~~~~~~~~~~~~~~~
>> sound/soc/pxa/pxa2xx-pcm-lib.c:149:5: warning: no previous prototype for 'pxa2xx_soc_pcm_close' [-Wmissing-prototypes]
     149 | int pxa2xx_soc_pcm_close(struct snd_soc_component *component,
         |     ^~~~~~~~~~~~~~~~~~~~
>> sound/soc/pxa/pxa2xx-pcm-lib.c:156:5: warning: no previous prototype for 'pxa2xx_soc_pcm_hw_params' [-Wmissing-prototypes]
     156 | int pxa2xx_soc_pcm_hw_params(struct snd_soc_component *component,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/pxa/pxa2xx-pcm-lib.c:164:5: warning: no previous prototype for 'pxa2xx_soc_pcm_prepare' [-Wmissing-prototypes]
     164 | int pxa2xx_soc_pcm_prepare(struct snd_soc_component *component,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/pxa/pxa2xx-pcm-lib.c:171:5: warning: no previous prototype for 'pxa2xx_soc_pcm_trigger' [-Wmissing-prototypes]
     171 | int pxa2xx_soc_pcm_trigger(struct snd_soc_component *component,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/pxa/pxa2xx-pcm-lib.c:179:1: warning: no previous prototype for 'pxa2xx_soc_pcm_pointer' [-Wmissing-prototypes]
     179 | pxa2xx_soc_pcm_pointer(struct snd_soc_component *component,
         | ^~~~~~~~~~~~~~~~~~~~~~


vim +/pxa2xx_soc_pcm_new +21 sound/soc/pxa/pxa2xx-pcm.c

f11a96d5cd9420 Liam Girdwood     2006-10-12  19  
0717e66f404123 Kuninori Morimoto 2018-01-29  20  static const struct snd_soc_component_driver pxa2xx_soc_platform = {
f8772e17def204 Kuninori Morimoto 2019-10-02 @21  	.pcm_construct	= pxa2xx_soc_pcm_new,
f8772e17def204 Kuninori Morimoto 2019-10-02 @22  	.open		= pxa2xx_soc_pcm_open,
f8772e17def204 Kuninori Morimoto 2019-10-02 @23  	.close		= pxa2xx_soc_pcm_close,
f8772e17def204 Kuninori Morimoto 2019-10-02 @24  	.hw_params	= pxa2xx_soc_pcm_hw_params,
f8772e17def204 Kuninori Morimoto 2019-10-02 @25  	.prepare	= pxa2xx_soc_pcm_prepare,
f8772e17def204 Kuninori Morimoto 2019-10-02 @26  	.trigger	= pxa2xx_soc_pcm_trigger,
f8772e17def204 Kuninori Morimoto 2019-10-02 @27  	.pointer	= pxa2xx_soc_pcm_pointer,
f11a96d5cd9420 Liam Girdwood     2006-10-12  28  };
f11a96d5cd9420 Liam Girdwood     2006-10-12  29  

:::::: The code at line 21 was first introduced by commit
:::::: f8772e17def20470f94bd1d6e1cf24badb2611de ASoC: pxa: remove snd_pcm_ops

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
