Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589FA292B2E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 22:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767909977; cv=none; b=GRO5f2bgNIz9hv7XeqXdPYIrNDBMiaJc7q9sdCmQ6ImbYWz2R5Q++qilHrw3fH9BMta0rJ3zpam6HCY6QYe+aLpHSMSCrIdZhEo4kJ9QhbkpItUjh2KJZckzzsXS6JsRWWkFImWBk9P/myAGEb1xN9nYxuZ6QT5Q4SsNLzGa2eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767909977; c=relaxed/simple;
	bh=pZVPSGxLA99/aVM0Q0GW5uYoxwxc/XdXHvzdER4FzDI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FrYV1104HNKJzX26E94ukDybAuv75gYP7M0eF3xRu6bzU4RpwId5kciJP6vRwN8JOPh0OfNFerwrQ5OLz+T20ZOwv6Z4bvrewaU48hH+bTKGxwgb3XMFgvzbRoA9uYoC7ujmPw7vv8V4svcneFwxQgZ4Cn4FBD2v8ouH93lK5BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=inRY7Z6U; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="inRY7Z6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767909976; x=1799445976;
  h=date:from:to:cc:subject:message-id;
  bh=pZVPSGxLA99/aVM0Q0GW5uYoxwxc/XdXHvzdER4FzDI=;
  b=inRY7Z6UkUlH57EkdQUbQ+EJ79EoBWn30dBlgVP8dQwocAhGFIOscdxz
   dWrPuBmWQ6nlmcDagP4zNSjdUjWfqv+hyHfGzz5CeST/uFAKv6JWEd2qP
   vKbspvHF3DbR2fZ1fL5UlwStRL3sR7wiVUQfjWBVmUHRvC62JNimMYKuc
   yylN4J1obrZLe5TTIwOlWNwlNRT5tpfChRA3tt5KYTdkQj6M6OwPPIoXH
   IeGXNpAeVLo/m88ip2t2427ptSY047VtZVi9aMi9urGZmanf1TI2WB5Jh
   miortz5USJ89On5UrRvx45I1bqCNl2oqup4MPCv9hRZsIbQD0I42Uq4bS
   A==;
X-CSE-ConnectionGUID: Qs6v65CqT6C99P/rtaeZUg==
X-CSE-MsgGUID: QWMktjkAROGOCbyNnkwoNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69347547"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="69347547"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 14:06:15 -0800
X-CSE-ConnectionGUID: 60iky+V+Q5msokSDM7qxXQ==
X-CSE-MsgGUID: EKaxsKB8TF+oNdzm5hPLBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="208363398"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 08 Jan 2026 14:06:14 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdy8w-000000001rg-3v2O;
	Thu, 08 Jan 2026 22:06:10 +0000
Date: Thu, 08 Jan 2026 23:05:32 +0100
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-01-07 3/47]
 sound/soc/codecs/rt1320-sdw.c:1261:13: error: implicit declaration of
 function 'snd_soc_component_get_bias_level'; did you mean
 'snd_soc_component_set_bias_level'?
Message-ID: <202601082304.f1vgMUcO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-01-07
head:   fe6b9a73807b5ac65643101c473a796bef5ac5ea
commit: f149b825f8b4b9f649b0dabe347f74fc53c1c7a0 [3/47] ASoC: soc-dapm: remove compatibility definition for dapm
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260108/202601082304.f1vgMUcO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601082304.f1vgMUcO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601082304.f1vgMUcO-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/rt1320-sdw.c: In function 'rt1320_r0_cali_put':
   sound/soc/codecs/rt1320-sdw.c:1249:45: error: implicit declaration of function 'snd_soc_component_get_dapm'; did you mean 'snd_soc_component_to_dapm'? [-Wimplicit-function-declaration]
    1249 |         struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(rt1320->component);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             snd_soc_component_to_dapm
   sound/soc/codecs/rt1320-sdw.c:1249:45: error: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> sound/soc/codecs/rt1320-sdw.c:1261:13: error: implicit declaration of function 'snd_soc_component_get_bias_level'; did you mean 'snd_soc_component_set_bias_level'? [-Wimplicit-function-declaration]
    1261 |         if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF &&
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |             snd_soc_component_set_bias_level
   sound/soc/codecs/rt1320-sdw.c: In function 'rt1320_dspfw_load_code':
   sound/soc/codecs/rt1320-sdw.c:1586:17: error: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1586 |                 snd_soc_component_get_dapm(rt1320->component);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/rt1320-sdw.c: In function 'rt1320_r0_load_mode_put':
   sound/soc/codecs/rt1320-sdw.c:2391:45: error: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2391 |         struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(rt1320->component);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/rt1320-sdw.c: In function 'rt1320_r0_temperature_put':
   sound/soc/codecs/rt1320-sdw.c:2519:45: error: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2519 |         struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(rt1320->component);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1261 sound/soc/codecs/rt1320-sdw.c

da1682d5e8b53a Shuming Fan 2025-12-16  1243  
da1682d5e8b53a Shuming Fan 2025-12-16  1244  static int rt1320_r0_cali_put(struct snd_kcontrol *kcontrol,
da1682d5e8b53a Shuming Fan 2025-12-16  1245  			      struct snd_ctl_elem_value *ucontrol)
da1682d5e8b53a Shuming Fan 2025-12-16  1246  {
da1682d5e8b53a Shuming Fan 2025-12-16  1247  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
da1682d5e8b53a Shuming Fan 2025-12-16  1248  	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
da1682d5e8b53a Shuming Fan 2025-12-16  1249  	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(rt1320->component);
da1682d5e8b53a Shuming Fan 2025-12-16  1250  	int ret;
da1682d5e8b53a Shuming Fan 2025-12-16  1251  
da1682d5e8b53a Shuming Fan 2025-12-16  1252  	if (!rt1320->hw_init)
da1682d5e8b53a Shuming Fan 2025-12-16  1253  		return 0;
da1682d5e8b53a Shuming Fan 2025-12-16  1254  
da1682d5e8b53a Shuming Fan 2025-12-16  1255  	ret = pm_runtime_resume(component->dev);
da1682d5e8b53a Shuming Fan 2025-12-16  1256  	if (ret < 0 && ret != -EACCES)
da1682d5e8b53a Shuming Fan 2025-12-16  1257  		return ret;
da1682d5e8b53a Shuming Fan 2025-12-16  1258  
da1682d5e8b53a Shuming Fan 2025-12-16  1259  	rt1320->cali_done = false;
da1682d5e8b53a Shuming Fan 2025-12-16  1260  	snd_soc_dapm_mutex_lock(dapm);
da1682d5e8b53a Shuming Fan 2025-12-16 @1261  	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF &&
da1682d5e8b53a Shuming Fan 2025-12-16  1262  		ucontrol->value.integer.value[0]) {
da1682d5e8b53a Shuming Fan 2025-12-16  1263  		rt1320_calibrate(rt1320);
da1682d5e8b53a Shuming Fan 2025-12-16  1264  	}
da1682d5e8b53a Shuming Fan 2025-12-16  1265  	snd_soc_dapm_mutex_unlock(dapm);
da1682d5e8b53a Shuming Fan 2025-12-16  1266  
da1682d5e8b53a Shuming Fan 2025-12-16  1267  	return 0;
da1682d5e8b53a Shuming Fan 2025-12-16  1268  }
da1682d5e8b53a Shuming Fan 2025-12-16  1269  

:::::: The code at line 1261 was first introduced by commit
:::::: da1682d5e8b53a51072552844c551b1b784e52c2 ASoC: rt1320: support calibration and temperature/r0 loading

:::::: TO: Shuming Fan <shumingf@realtek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
