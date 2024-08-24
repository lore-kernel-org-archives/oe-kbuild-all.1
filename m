Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66F72F2F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Aug 2024 05:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478118; cv=none; b=lTleNFC6J/GDj4Bf05gYqdzUjgTN56byrLdB57ObU5cxUaehTpDhrgeYdv8Av7kHbq7CqXC7Zz0HIfjsAaSDuRRvAJnsiKwSym/HrxfM5iEAiTr7z1IXAigFiJj1PdSGUc+T1h1uHHmYBTZpKT9U1HLhsmhh8S8Hs4F+KWEOGfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478118; c=relaxed/simple;
	bh=1bOqTKtzcDNDVR3x4xV1509ZWPfDF25zKRj9zA3IPTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i+CPyAZS0orCfarXFgFVst7+cyXEkDHgPlSLHnp0w4kzcsVoMweo5OgrSdVGhys+W/ICycn50X4CTreZ4gts8labDNoi6mccdwJ7jW8hUv3Wf0aXdwrEV7wbVemER4sgmvCNy8i3kvSMYMKK7EHgLAay2rmLIPFrG0rB0Kte61k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Du31vKZ0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Du31vKZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724478116; x=1756014116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1bOqTKtzcDNDVR3x4xV1509ZWPfDF25zKRj9zA3IPTA=;
  b=Du31vKZ0Azp/Ykn4EuRDK+meBVMloT7xkCFPDVIKOO/ZbF3n+tkQP1sp
   O2eEOAbXUBQ0IIAiZf2cN/wGJKmv8EqtWNpMoyhMcMu6MeTtaBxVvoFfx
   p/SbXCuoaLrhSbvJjmk63zOJaxWVb3eAvl1goai6yFQHQmSrb2Zh5yKwV
   HjR0/2XKMRvVm2JWFdn3trmpYQ5z7YjMvtrhFyGhMVxaw9QqwpESCzZwR
   T9RzpgDwSRDBsYViLhOP6Go13cDaZ8Op5D+XxglSVE2MqCAQDAAR9d8PI
   jqBpvex/9Q7XKY1qA+LMA58M1lhHEE9PCBXzdexhQnfk8JPvrfL7YiOWb
   g==;
X-CSE-ConnectionGUID: BO6RfiI+TRWvAfrg/MPGpQ==
X-CSE-MsgGUID: Qtv47IAVQXCrazehNhGlKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="33583625"
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="33583625"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 22:41:55 -0700
X-CSE-ConnectionGUID: JGTQc5GeTvWzdY390htkUw==
X-CSE-MsgGUID: RkpzipibQ2GNc7Ge3Batcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="62066374"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Aug 2024 22:41:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shjX6-000EHr-2n;
	Sat, 24 Aug 2024 05:41:52 +0000
Date: Sat, 24 Aug 2024 13:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: Khanh Le <khanh.le.xr@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>
Subject: [morimoto:renesas-bsp/v6.6.44-2024-08-06 170/263]
 sound/soc/codecs/ak4619.c:757:2-3: Unneeded semicolon
Message-ID: <202408241303.QoJ93eYi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.6.44-2024-08-06
head:   ff03ebca7beefc8674ba44334c73b5b593142204
commit: 664487bb901145b01de52c429edca1157cf8fca4 [170/263] ASoC: Add ak4619 codec support
config: arm-randconfig-r053-20240824 (https://download.01.org/0day-ci/archive/20240824/202408241303.QoJ93eYi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408241303.QoJ93eYi-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/codecs/ak4619.c:757:2-3: Unneeded semicolon

vim +757 sound/soc/codecs/ak4619.c

   704	
   705	static void ak4619_hw_constraints(struct ak4619_priv *ak4619,
   706					  struct snd_pcm_runtime *runtime)
   707	{
   708		struct snd_pcm_hw_constraint_list *constraint = &ak4619->constraint;
   709		int ak4619_rate_mask = 0;
   710		unsigned int fs;
   711		int i;
   712		static const unsigned int ak4619_sr[] = {
   713			  8000,
   714			 11025,
   715			 12000,
   716			 16000,
   717			 22050,
   718			 24000,
   719			 32000,
   720			 44100,
   721			 48000,
   722			 64000,
   723			 88200,
   724			 96000,
   725			176400,
   726			192000,
   727		};
   728	
   729		/*
   730		 *	[8kHz - 48kHz]		: 256fs, 384fs or 512fs
   731		 *	[64kHz - 96kHz]		: 256fs
   732		 *	[176.4kHz, 192kHz]	: 128fs
   733		 */
   734	
   735		for (i = 0; i < ARRAY_SIZE(ak4619_sr); i++) {
   736			fs = ak4619->sysclk / ak4619_sr[i];
   737	
   738			switch (fs) {
   739			case 512:
   740			case 384:
   741			case 256:
   742				ak4619_rate_mask |= (1 << i);
   743				break;
   744			case 128:
   745				switch (i) {
   746				case (ARRAY_SIZE(ak4619_sr) - 1):
   747				case (ARRAY_SIZE(ak4619_sr) - 2):
   748					ak4619_rate_mask |= (1 << i);
   749					break;
   750				default:
   751					break;
   752				}
   753				break;
   754			default:
   755				break;
   756			}
 > 757		};
   758	
   759		constraint->list	= ak4619_sr;
   760		constraint->mask	= ak4619_rate_mask;
   761		constraint->count	= ARRAY_SIZE(ak4619_sr);
   762	
   763		snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, constraint);
   764	};
   765	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
