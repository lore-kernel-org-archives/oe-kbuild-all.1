Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793204767;
	b=miu8X6rqsyEpX+5SieAgW+gmklAi10MdytA4l53+FX4NCsjOnAnEPlFIQRVcM4fL9zLM
	 Fpywo2H7kioq39ObEGHZ/EQvYqXNDSI9kMcvQ3rfJinkzSjq+/yucmdBaMZ65PiWTwYSW
	 XIKFyUuzsYY2rf76Fg1wyykAEhib8TBOxjVLYh51AP5t52F18v1Dd453v08p7SCVqfXUN
	 4FDDmZxdgaa1K7w9Go7S4GuG4Kp/DFhRD7C6mJuqm5z1ASvxhvEG+H/ErVr7y9NkGR6HW
	 M6PtmvBIg+th/OjQhQzgdyblITYLBl9KDmS3AyyE9fBjK8BiQm2myGdfpinOW44Kf5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793204767;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=hVHPqKC2r1ZDzEY0UdYaEBjAuJ6Ld4qz8io5ESnQAj4=;
	b=maSx4qJggCNbZoDLn4BvcDconk7sBttXWNpTo3+FlDlxjmtFRP9B+rMWKRBw+/pEtzyE
	 yRAZfCVYfGnsu4Rq44QDSKHkYxpsjIbKK3eQknNjUSHfBwucpB8AsqnjO2axwJkXLJ12H
	 XIE96L0wv5Ga4gb1g0P8uKK20zooecOPxf7YfP3FruQYQfTGm1e6zbY6OGEkgnE+o08By
	 pvXYWavIr85fHrmxyufTJp7rlmL/HHuAHU1AgoRRvKrsT8kvy1jIS9V7CyBRJ2scPvRDL
	 znVTI3Cwaz9LwTnW3Ect7xgx5r52S8tP3+DPEIAhbaHXndsTm46gxjSUBWK+Pv8utsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=elIdi354;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDE2606A322
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 16:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFDE2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=elIdi354
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793204766; x=1824740766;
  h=date:from:to:cc:subject:message-id;
  bh=m9NaZuKDaKblwa/gTK4jR8PBTiZWyrMWTlWZNRVqaUc=;
  b=elIdi354geNmKNSTc+ZM/wqFkRjEX2o4jtGJC5ekQ4QkJO5nf87ZECn5
   nre/h+euP9RSZP5Lt75AK1oOq/XgHmYPT100KtO7iFuPhVSICCRwiVayO
   dvnt0+yvqa3w5pXv/oUaTla2a7G/23rp+JR9w/4uoib1j3yiXfdCCfeCZ
   X+Ivo3Mqa4u6TONgDhuVUkrhKKzObHHxvGJU1ZNsQpyNNFmAemqZyFLRl
   otjeD+yqWxDduCKSnxC4776Zkc1Dqjsu7DZCB9yQbDhj/7/CIdmIcY/pz
   xZZVuLOWyEqFdsnzTPjFGWVC1QSRQRENIEnJvqX241crVsHy6YFC6m4Lb
   Q==;
X-CSE-ConnectionGUID: bu2R534HQZOTW76xpgilDQ==
X-CSE-MsgGUID: LlZhfp9OQAqe5IimmrZ20Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1961672"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1961672"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 09:26:03 -0700
X-CSE-ConnectionGUID: 2N8R/HhLRGqQRzWfbXjojw==
X-CSE-MsgGUID: g9HKQ5MDRu2+Cd7gOGe2sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="6698298"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 28 Oct 2026 09:26:02 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM6TP-000000004vF-3RmU;
	Wed, 28 Oct 2026 16:25:59 +0000
Date: Wed, 28 Oct 2026 17:25:41 +0100
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-10-28-2 225/344]
 sound/soc/fsl/fsl_qmc_audio.c:354:12: error: incomplete definition of type
 'struct snd_soc_dai'
Message-ID: <202610281732.cCXgGcwI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/morimoto/linux sound-cleanup-2026-10-28-2
head:   3274ffa4355111331c471a7987c5f2af43fac128
commit: 5d9d0b31011555e38f1112404dc23a8064a45a71 [225/344] ASoC: soc-dai: move struct snd_soc_dai to soc-dai.c
config: powerpc-randconfig-r2310-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281732.cCXgGcwI-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281732.cCXgGcwI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281732.cCXgGcwI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/fsl/fsl_qmc_audio.c:354:12: error: incomplete definition of type 'struct snd_soc_dai'
     354 |         return dai->driver - qmc_audio->dai_drivers;
         |                ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:560:14: error: incomplete definition of type 'struct snd_soc_dai'
     560 |                 dev_err(dai->dev, "Invalid dai\n");
         |                         ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:583:14: error: incomplete definition of type 'struct snd_soc_dai'
     583 |                 dev_err(dai->dev, "Invalid dai\n");
         |                         ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:596:14: error: incomplete definition of type 'struct snd_soc_dai'
     596 |                 dev_err(dai->dev, "Not enough qmc_chans. Need %u, avail %u\n",
         |                         ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:607:16: error: incomplete definition of type 'struct snd_soc_dai'
     607 |                                 dev_err(dai->dev, "qmc_chans[%u], set param failed %d\n",
         |                                         ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:632:14: error: incomplete definition of type 'struct snd_soc_dai'
     632 |                 dev_err(dai->dev, "Invalid dai\n");
         |                         ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:949:8: error: call to undeclared function 'devm_snd_soc_component_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     949 |         ret = devm_snd_soc_component_register(qmc_audio->dev,
         |               ^
   sound/soc/fsl/fsl_qmc_audio.c:949:8: note: did you mean 'snd_soc_component_register'?
   include/sound/soc-component.h:281:5: note: 'snd_soc_component_register' declared here
     281 | int snd_soc_component_register(struct snd_soc_component *component,
         |     ^
   7 errors generated.


vim +354 sound/soc/fsl/fsl_qmc_audio.c

075c7125b11c72 Herve Codina      2023-02-17  347  
075c7125b11c72 Herve Codina      2023-02-17  348  static unsigned int qmc_dai_get_index(struct snd_soc_dai *dai)
075c7125b11c72 Herve Codina      2023-02-17  349  {
59235453667271 Kuninori Morimoto 2026-10-27  350  	struct snd_soc_component *component = snd_soc_dai_to_component(dai);
59235453667271 Kuninori Morimoto 2026-10-27  351  	struct device *dev = snd_soc_component_to_dev(component);
59235453667271 Kuninori Morimoto 2026-10-27  352  	struct qmc_audio *qmc_audio = dev_get_drvdata(dev);
075c7125b11c72 Herve Codina      2023-02-17  353  
075c7125b11c72 Herve Codina      2023-02-17 @354  	return dai->driver - qmc_audio->dai_drivers;
075c7125b11c72 Herve Codina      2023-02-17  355  }
075c7125b11c72 Herve Codina      2023-02-17  356  

:::::: The code at line 354 was first introduced by commit
:::::: 075c7125b11c72e7933401d73000d6d151196072 ASoC: fsl: Add support for QMC audio

:::::: TO: Herve Codina <herve.codina@bootlin.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
