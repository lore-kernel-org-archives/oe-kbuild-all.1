Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD2A481B1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jun 2026 05:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781500938; cv=none; b=eD2PP1VRDCWsXKDzbMFkzFyRScPMM55Ga8B/JsXlEdWdu5URPl28Hb7Folg1Ay0AOYT/TWu5wOfjur4+UAm8P8gi2sPOsB/cKyk/h/hlrqSv7GroQ63e11VqQaFbarYCaQ5j7AO7he60d5Q+cbp6FnKE89dW+ekhD792nnu1puw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781500938; c=relaxed/simple;
	bh=vu8jlzv8B3es25am7Zg7yJjswMtt8A6vLOig5qvdSYs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hto3zyC9zv6xLuSRgfOLFwmvCYbThQh6XV3OHSBGf4JMWuxv6MvfFF6AaMSb90fsucTboN94WBU3pMXUVO8ohDFu8Eks+8aHj4Tqyg7xix3b/0RszDcADpdxzf5MD8JkV+GoAJXxttd09kLioAdRSb+qZqpWQPQw7xyoSG3Ihgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZ9o7AAY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZ9o7AAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781500937; x=1813036937;
  h=date:from:to:cc:subject:message-id;
  bh=vu8jlzv8B3es25am7Zg7yJjswMtt8A6vLOig5qvdSYs=;
  b=bZ9o7AAYvL6iK4LPFB8jL0SyZQU/oMInx6IsXdrBvGg/y5wEB5zBBAM9
   31hNYK6N5iVM4j2i6ld9BTgg9eHDZ7jb5YbluWWvOjDLFTQGQcgFICJLn
   Q8FNUg9hcd2vHArRX/2fO4al55LE6DcWxnnVn3r2rBrfunJkuELZXIXDO
   nf9Y2SsLazuUBzLQ39JTQJvSAYMTZDJNIbW6JzADjggfEHNhFDuoilj0V
   6OLqFpPGN7OHg8ZjJipmaXd5t0Blzu41baMpPlgddmt7j/PaW7apPWVkw
   7yIwcWp7/8xhQgBO1Pavma6vigxLRWErVcx3xDrgMCUYI7cWaorhXVV41
   Q==;
X-CSE-ConnectionGUID: uTe2ggZAS9y/cJdXTWu0TA==
X-CSE-MsgGUID: PXGwWpfKRaSeMafRNmFQvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="99654181"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="99654181"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 22:22:16 -0700
X-CSE-ConnectionGUID: 9B4/3wbhRbWpYbFuzG85Cw==
X-CSE-MsgGUID: TEoLKtzJTiuQv4SI7O0MeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="247403415"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2026 22:22:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYzm0-00000000RVa-22DB;
	Mon, 15 Jun 2026 05:22:12 +0000
Date: Mon, 15 Jun 2026 13:21:30 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [linux-next:master 13064/13763]
 sound/soc/codecs/rt5682.c:2937:undefined reference to
 `sdw_slave_wait_for_init'
Message-ID: <202606151303.Erj5lfRD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: 933feddee4d739748fe7d183432d10e589adfe97 [13064/13763] ASoC: rt5682: Use new SoundWire enumeration helper
config: i386-randconfig-007-20260615 (https://download.01.org/0day-ci/archive/20260615/202606151303.Erj5lfRD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606151303.Erj5lfRD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606151303.Erj5lfRD-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pci/controller/cadence/pcie-cadence-plat.o: in function `cdns_plat_pcie_probe':
   drivers/pci/controller/cadence/pcie-cadence-plat.c:113:(.text+0x161): undefined reference to `cdns_pcie_ep_setup'
   ld: sound/soc/codecs/rt5682.o: in function `rt5682_probe':
>> sound/soc/codecs/rt5682.c:2937:(.text+0x1a4a): undefined reference to `sdw_slave_wait_for_init'


vim +2937 sound/soc/codecs/rt5682.c

  2927	
  2928	static int rt5682_probe(struct snd_soc_component *component)
  2929	{
  2930		struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
  2931		struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
  2932		int ret;
  2933	
  2934		rt5682->component = component;
  2935	
  2936		if (rt5682->is_sdw) {
> 2937			ret = sdw_slave_wait_for_init(rt5682->slave, RT5682_PROBE_TIMEOUT);
  2938			if (ret)
  2939				return ret;
  2940		}
  2941	
  2942		snd_soc_dapm_disable_pin(dapm, "MICBIAS");
  2943		snd_soc_dapm_disable_pin(dapm, "Vref2");
  2944		snd_soc_dapm_sync(dapm);
  2945		return 0;
  2946	}
  2947	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
