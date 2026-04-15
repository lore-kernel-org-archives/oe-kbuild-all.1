Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF9A2BEC2E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 05:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776232061; cv=none; b=JAU/iO9slLzc0vJptrU6aa5B37KYglah3gNdt4S1o8C06GrbtDExkFD81KQjMupDKG7GHA7LQoZGwwvT+yPJQueP23RBYcUIm3n5oyi1dGBbGky0a64U6c2wEskFY7rdeiFhXtKz8H3F8kazUyNIug4sNeu5dMRMGgXL6IZFJdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776232061; c=relaxed/simple;
	bh=gdm/J3nOv46IuC7VHeTuiZjyv9F2RwjqAiSk8roMPeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dvaKcPEZYEl/ddEytFOYjKsFYCMAiFPsCCP/uJ6z2GRFMshSdFtUXVKXzUlYIS951QPc+IWP4dRrAQkw6pRi131bS8Z5uAXcYupnNGfcf0cWhjdPVv4OXOm3Z2OC77pdZgeaAz0Sp3y6wd3hH5Xs5CiFMNf7Q+lhRZATMLsRbIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRtA2JxS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRtA2JxS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776232060; x=1807768060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gdm/J3nOv46IuC7VHeTuiZjyv9F2RwjqAiSk8roMPeE=;
  b=FRtA2JxSD3L/xaQ319KOkqO5AWM8UM5SShr0cxNFzyFdpAUepLGfYNEb
   C8FiHLeIc9yFXEM8Lq7BF95EpGEoTbkfdxfAL/AJvuErYQ/+VPG+3R91G
   g80HyALOCgr8FTxwr02ERDFofruXbjhm5I1C4ipCU+boAglIh/tURZfoS
   gA3Qwq8ZZE7fuPyF24mwqnItEoZGjreDty3BAEZ6lgRT6rsjl4uJ/E6kt
   7lsf0bRMj58O36CrsvRaIirjacPNwpGP1lU5X0d1314yjMZ4RqOpe5jcv
   NeVfOPw6RmkNQk4+jpsbj6QHsku2PHGpSDFYUiI+anif4cUJhR+GtBCjO
   g==;
X-CSE-ConnectionGUID: 0C0SIVxpTT2MIi8Hf5bAPA==
X-CSE-MsgGUID: f3PKWocYTlutdj6QmsGqhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88648815"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88648815"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 22:47:39 -0700
X-CSE-ConnectionGUID: f8IUpd5fTiq7Qxebbz3vzg==
X-CSE-MsgGUID: FBCKi8pSQge4dJUmxKOlSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234707547"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Apr 2026 22:47:39 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCt67-000000000BJ-2Ipg;
	Wed, 15 Apr 2026 05:47:35 +0000
Date: Wed, 15 Apr 2026 13:47:03 +0800
From: kernel test robot <lkp@intel.com>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: 
 =?us-ascii?Q?[broonie-ci:v11=5F20251231=5Foder=5Fchiou=5Fasoc=5Frt5575=5F?=
 =?us-ascii?Q?add=5Fthe=5Fcodec=5Fdriver=5Ffor=5Fthe=5Falc5575?= 4/4]
 sound/soc/codecs/rt5575.c:342:3-8: No need to set .owner here. The core
 will do it.
Message-ID: <202604151350.sFMk2viV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v11_20251231_oder_chiou_asoc_rt5575_add_the_codec_driver_for_the_alc5575
head:   420739112e95c9bb286b4e87875706925970abd3
commit: 420739112e95c9bb286b4e87875706925970abd3 [4/4] ASoC: rt5575: Add the codec driver for the ALC5575
config: hexagon-randconfig-r064-20260413 (https://download.01.org/0day-ci/archive/20260415/202604151350.sFMk2viV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604151350.sFMk2viV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/codecs/rt5575.c:342:3-8: No need to set .owner here. The core will do it.

vim +342 sound/soc/codecs/rt5575.c

   338	
   339	static struct i2c_driver rt5575_i2c_driver = {
   340		.driver = {
   341			.name = "rt5575",
 > 342			.owner = THIS_MODULE,
   343			.of_match_table = rt5575_of_match,
   344		},
   345		.probe = rt5575_i2c_probe,
   346		.id_table = rt5575_i2c_id,
   347	};
   348	module_i2c_driver(rt5575_i2c_driver);
   349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
