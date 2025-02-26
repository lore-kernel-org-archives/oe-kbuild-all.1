Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898CF2620DB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 23:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740613311; cv=none; b=o4D8DkbxyN/7fNw1ZucxTKEDwIIwDwif4kJNXMqPBAKb0F+sio2phIIYhJPTddMedICrqlHl+TctXiRcYaQOy6oDHPtBmlbo+jsKZOeHX6NFmzW1583Wa/bSl1iyVg735P6SjuFo5Igi76FQNsGY+dGasdpfMgVgVnoJHusVY0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740613311; c=relaxed/simple;
	bh=8Bwz6Uwyna28A9u7qfhyqwnfqrwLq4MaRl2ezjSy15Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fV5itNiVdcdbjSB5dZPPhBGhutcw7AHTo3XVdYtAK2CaEBHzytWzUH8IdstDwa/EbbTDC8IgcdTUBeL+tVaOgMUkYMwzEd+pFfBgNWLOMeeCV5+OMh7Bior1Uj5mTJ7+A9cxu86ktrOsJQl45qe70xR2wijVSf0Mpl5a25cAh2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WITW8INR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WITW8INR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740613309; x=1772149309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Bwz6Uwyna28A9u7qfhyqwnfqrwLq4MaRl2ezjSy15Y=;
  b=WITW8INRYUvERuwbPknKT/kGbZwsBjJOJxVcjslfmhhJ+uwToUr+ayPU
   PGf97NESvJyb5c2oSjPv7iF0Wu2abarkdEqIo6FQ4DXtdpN92CnLuYQ7D
   70iYAlHnEqc5DfkNDNrTr7YY/BezxfpvCt3xP4k0NiTKOqDOgIes1Id5Z
   t7eav1VWtZecjOjq3ImBJMowBDbD207PHcf9PdIF5TWDrGvYn73E3pXID
   333LjNJHINZBlNCGU0dZxm+8g3d3sROC1mZ+NtSkzanCqkS/ZMiSW3pTT
   xpiXFAs+Dak0akw7MGsXV0jThLMAFPeb3OIVybwYygkH3wt4c5exJgVdo
   g==;
X-CSE-ConnectionGUID: NI+KOQnFT8aSvDGBNgae6w==
X-CSE-MsgGUID: KuKAaKViQT6clDA/xu65/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="29088400"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="29088400"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 15:41:47 -0800
X-CSE-ConnectionGUID: RiJsh+UlQeywQDYkgACb6g==
X-CSE-MsgGUID: ie/z0suQRXuj9EEPHnB5cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="121446392"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 26 Feb 2025 15:41:45 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnR27-000CbY-2T;
	Wed, 26 Feb 2025 23:41:43 +0000
Date: Thu, 27 Feb 2025 07:41:38 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: sound/soc/renesas/sh7760-ac97.c:43:17: sparse: sparse: incorrect
 type in argument 1 (different base types)
Message-ID: <202502270743.XHyhWKWp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lad,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f4ce1f3318ad4bc12463698696ebc36b145a6aa3
commit: c087a94bea49acf34d651f7308506fe462a937b3 ASoC: Rename "sh" to "renesas"
date:   4 months ago
config: sh-randconfig-r132-20250226 (https://download.01.org/0day-ci/archive/20250227/202502270743.XHyhWKWp-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250227/202502270743.XHyhWKWp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270743.XHyhWKWp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/renesas/sh7760-ac97.c:43:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   sound/soc/renesas/sh7760-ac97.c:43:17: sparse:     expected void const volatile [noderef] __iomem *ptr
   sound/soc/renesas/sh7760-ac97.c:43:17: sparse:     got unsigned int
   sound/soc/renesas/sh7760-ac97.c:44:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   sound/soc/renesas/sh7760-ac97.c:44:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   sound/soc/renesas/sh7760-ac97.c:44:9: sparse:     got unsigned int
--
>> sound/soc/renesas/hac.c:77:3: sparse: sparse: symbol 'hac_cpu_data' was not declared. Should it be static?

vim +43 sound/soc/renesas/sh7760-ac97.c

aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  36  
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  37  static int __init sh7760_ac97_init(void)
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  38  {
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  39  	int ret;
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  40  	unsigned short ipsel;
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  41  
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  42  	/* enable both AC97 controllers in pinmux reg */
48ccb2ceec6fb1d sound/soc/sh/sh7760-ac97.c Paul Mundt    2010-10-27 @43  	ipsel = __raw_readw(IPSEL);
48ccb2ceec6fb1d sound/soc/sh/sh7760-ac97.c Paul Mundt    2010-10-27  44  	__raw_writew(ipsel | (3 << 10), IPSEL);
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  45  
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  46  	ret = -ENOMEM;
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  47  	sh7760_ac97_snd_device = platform_device_alloc("soc-audio", -1);
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  48  	if (!sh7760_ac97_snd_device)
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  49  		goto out;
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  50  
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  51  	platform_set_drvdata(sh7760_ac97_snd_device,
f0fba2ad1b6b53d sound/soc/sh/sh7760-ac97.c Liam Girdwood 2010-03-17  52  			     &sh7760_ac97_soc_machine);
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  53  	ret = platform_device_add(sh7760_ac97_snd_device);
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  54  
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  55  	if (ret)
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  56  		platform_device_put(sh7760_ac97_snd_device);
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  57  
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  58  out:
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  59  	return ret;
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  60  }
aef3b06ac69783d sound/soc/sh/sh7760-ac97.c Manuel Lauss  2007-05-14  61  

:::::: The code at line 43 was first introduced by commit
:::::: 48ccb2ceec6fb1d46d1bc92dadc602d4341a0149 sound: sh: ctrl_in/outX to __raw_read/writeX conversion.

:::::: TO: Paul Mundt <lethal@linux-sh.org>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
