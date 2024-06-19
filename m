Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3E213C676
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 17:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718816613; cv=none; b=U6HANFRj5dazyL6kJpniWC1c67e6tzWZgC/h2TG9NBwjqy+qPqh3vqIosKcELlQhxQHy+IvtXcz9dwRk47/Yu0pIxs9Fln3mfIUzWtS0RQfRjQ9KXCrEEpnCseKsD13yJoGoC0OzWRK4fGmO8EVcX7AlWX2dqtMAUJfT3Owpff4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718816613; c=relaxed/simple;
	bh=T8cEQhVAkelKC0yOt9zzTymo5YfnHpbwuk+BevgCSWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YcehDEbakY5rxlm3C8GemEQATV0Gw3Bi+wltxJeyQ86olt21wErER2OVob98dQTLZwGfnpVYF9p3fReF9n3vOTkljGCNLUHt01eMgo9Pz8ffdkAkLxnpjkRaX/bwD16e2NQpdWwjnu4sTHgasKytW9A4c9IWZy2g2CgHvN7MMtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjgLjexk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjgLjexk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718816612; x=1750352612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T8cEQhVAkelKC0yOt9zzTymo5YfnHpbwuk+BevgCSWU=;
  b=NjgLjexkGdBuV66NanybC7Vx8eITF7NSW1/LOn+TgVQFQir9T5fy8Cw7
   mMJ1iX1QoV3cvzJfm0pgK4Z+CKM77Zj7wBWu6E2y/G0PQsXeToRYhr1h/
   0WYArLGlAmfUKkN7/TGEQuQUPTMyIziOsS3gRWdvJB309CSGXXgQ943bQ
   iQ+cO5Jz6tcZfP2FdNmGaFe+JE6yiuesi7HrHfStpPXO/jC7JbBO6VOeh
   uZhPDMmVpMYF//d6EBbVwWc7o1p7Af5hlv/gaO/cD9n+PGZNDSV5sJpKW
   WxjT5zMvWT/zYNFstz9gb3jwyLXwu2GB2UDMRfOn5ZXbKWNsLYK20e6Cz
   g==;
X-CSE-ConnectionGUID: GHH2Dl8MRQy0nki47RDFcg==
X-CSE-MsgGUID: ARYlyR3bQmG/Bp9Hb3b/vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15907573"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15907573"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 10:03:32 -0700
X-CSE-ConnectionGUID: 9cPlstNuQ8uLOQFZCLe2bQ==
X-CSE-MsgGUID: m3CDYq2yQWqiV86gvHopqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="79456465"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jun 2024 10:03:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJyiW-0006n2-06;
	Wed, 19 Jun 2024 17:03:28 +0000
Date: Thu, 20 Jun 2024 01:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Yu <jack.yu@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:file0IqEIN 13/14] sound/soc/codecs/rt1318.c:1340:10:
 error: 'struct i2c_driver' has no member named 'probe_new'
Message-ID: <202406200049.Zh0T2R9y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git file0IqEIN
head:   04c200922d911f7a33febc0e7991f3a2efd856ad
commit: 48ed4d2435aa749a8d59fd7543313d51d0800175 [13/14] ASoC: rt1318: Add RT1318 audio amplifier driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240620/202406200049.Zh0T2R9y-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200049.Zh0T2R9y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200049.Zh0T2R9y-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/codecs/rt1318.c:785:5: warning: no previous prototype for 'rt1318_pll_calc' [-Wmissing-prototypes]
     785 | int rt1318_pll_calc(const unsigned int freq_in,
         |     ^~~~~~~~~~~~~~~
>> sound/soc/codecs/rt1318.c:1340:10: error: 'struct i2c_driver' has no member named 'probe_new'
    1340 |         .probe_new = rt1318_i2c_probe,
         |          ^~~~~~~~~
>> sound/soc/codecs/rt1318.c:1340:22: error: initialization of 'const struct i2c_device_id *' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Werror=incompatible-pointer-types]
    1340 |         .probe_new = rt1318_i2c_probe,
         |                      ^~~~~~~~~~~~~~~~
   sound/soc/codecs/rt1318.c:1340:22: note: (near initialization for 'rt1318_i2c_driver.id_table')
   sound/soc/codecs/rt1318.c:1341:21: warning: initialized field overwritten [-Woverride-init]
    1341 |         .id_table = rt1318_i2c_id,
         |                     ^~~~~~~~~~~~~
   sound/soc/codecs/rt1318.c:1341:21: note: (near initialization for 'rt1318_i2c_driver.id_table')
   cc1: some warnings being treated as errors


vim +1340 sound/soc/codecs/rt1318.c

  1333	
  1334	struct i2c_driver rt1318_i2c_driver = {
  1335		.driver = {
  1336			.name = "rt1318",
  1337			.of_match_table = of_match_ptr(rt1318_of_match),
  1338			.acpi_match_table = ACPI_PTR(rt1318_acpi_match),
  1339		},
> 1340		.probe_new = rt1318_i2c_probe,
  1341		.id_table = rt1318_i2c_id,
  1342	};
  1343	module_i2c_driver(rt1318_i2c_driver);
  1344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
