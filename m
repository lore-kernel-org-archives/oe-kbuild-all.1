Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C722823185C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 09:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669646; cv=none; b=cCdW+z1QZkCzY419JJxQ9xrSglWw81Gf/6W8prby2IkvRzIgzxYUegZ06b/qKa1fIHnowfTbvii/rd2saq1sNVUjZRwsp4R8/OQA2uSaTkYUYMMv1COBsjCLazs+N6nnBlJXqBXZSP/+1gp13s8h1tMynq3Cm2m1v+wBMFwt/Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669646; c=relaxed/simple;
	bh=IGPp2bKXRoaWnEPoUDG9KsWHF4GAv/c1NluHQj9Bg5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RYhL2HIx3uD0sR4VquPMLK7zyHhvf6mMC+uNA3dBBdV5IvtZ/BN4bWq10cOzyXEqbDqfHXgkStC0J0KNP3Ek6s036iTv44SwTvDG98QWcnt3QuJVP55OHRPvH1hNweE55JkeYdfaJmsZDY9k91kL6gcqttFNL+ADnyECoK8zhq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1MPPSmP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1MPPSmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750669645; x=1782205645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IGPp2bKXRoaWnEPoUDG9KsWHF4GAv/c1NluHQj9Bg5I=;
  b=R1MPPSmPgXEs9VYq2q7GTDTr64Pj+aqiKZSvciEYIH5SkFHmQEgBaTR5
   cFdZWAsn6F5WSXyx6DhN2f4uHXOUZi9up0JxLfl4QXnzlbtTQ7vFKFBYv
   8ko7Iqf3c7zfEcJUUI9jRzwDqO/rl+/FXNJyAZZ/YYCChzPVyR0t0tkDt
   JEiUQBr4SdYmmyrj5OCFBTieLFP0jJp7Zq8AJjvWRzZWKkdR5kFJFbLJ1
   /i/JarmBo3JHaa+JFQgsBvXshng8ElUKb3j9O8OFbkqGsVP6MesxRAwOc
   UWW2woHD5zKyD1MNWV65kDzX1SKFnymtwK43jJBV38MDfBx89925B0TMQ
   g==;
X-CSE-ConnectionGUID: GcOMRnprQh+/c4K80oa+MQ==
X-CSE-MsgGUID: NXg0xy4nRk6UHQl3r6vmEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52837333"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52837333"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:07:24 -0700
X-CSE-ConnectionGUID: nuhK4yn8QACD2CVPCcPB8A==
X-CSE-MsgGUID: mQQ8fiRyRi6XXM1yInn1Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152215265"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jun 2025 02:07:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTd97-000Nt6-0a;
	Mon, 23 Jun 2025 09:07:21 +0000
Date: Mon, 23 Jun 2025 17:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-QAT-Fix-V6.16-ANBZ21972 44/44]
 drivers/crypto/caam/caamalg_qi2.c:5148:22: warning: format '%s' expects
 argument of type 'char *', but argument 4 has type 'int'
Message-ID: <202506231713.UH1vabNI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-QAT-Fix-V6.16-ANBZ21972
head:   a055f3851351a131fa5739cb2bdb282c44191105
commit: fe75824cb8322bd2a9b3002ef184150caac30cc1 [44/44] crypto: drivers - Use str_enable_disable-like helpers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250623/202506231713.UH1vabNI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506231713.UH1vabNI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231713.UH1vabNI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:30,
                    from drivers/crypto/caam/compat.h:9,
                    from drivers/crypto/caam/caamalg_qi2.c:7:
   drivers/crypto/caam/caamalg_qi2.c: In function 'dpaa2_dpseci_disable':
   drivers/crypto/caam/caamalg_qi2.c:5148:39: error: implicit declaration of function 'str_false_true' [-Werror=implicit-function-declaration]
    5148 |         dev_dbg(dev, "disable: %s\n", str_false_true(enabled));
         |                                       ^~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/crypto/caam/caamalg_qi2.c:5148:9: note: in expansion of macro 'dev_dbg'
    5148 |         dev_dbg(dev, "disable: %s\n", str_false_true(enabled));
         |         ^~~~~~~
>> drivers/crypto/caam/caamalg_qi2.c:5148:22: warning: format '%s' expects argument of type 'char *', but argument 4 has type 'int' [-Wformat=]
    5148 |         dev_dbg(dev, "disable: %s\n", str_false_true(enabled));
         |                      ^~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/crypto/caam/caamalg_qi2.c:5148:9: note: in expansion of macro 'dev_dbg'
    5148 |         dev_dbg(dev, "disable: %s\n", str_false_true(enabled));
         |         ^~~~~~~
   drivers/crypto/caam/caamalg_qi2.c:5148:33: note: format string is defined here
    5148 |         dev_dbg(dev, "disable: %s\n", str_false_true(enabled));
         |                                ~^
         |                                 |
         |                                 char *
         |                                %d
   cc1: some warnings being treated as errors


vim +5148 drivers/crypto/caam/caamalg_qi2.c

  5128	
  5129	static int __cold dpaa2_dpseci_disable(struct dpaa2_caam_priv *priv)
  5130	{
  5131		struct device *dev = priv->dev;
  5132		struct dpaa2_caam_priv_per_cpu *ppriv;
  5133		struct fsl_mc_device *ls_dev = to_fsl_mc_device(dev);
  5134		int i, err = 0, enabled;
  5135	
  5136		err = dpseci_disable(priv->mc_io, 0, ls_dev->mc_handle);
  5137		if (err) {
  5138			dev_err(dev, "dpseci_disable() failed\n");
  5139			return err;
  5140		}
  5141	
  5142		err = dpseci_is_enabled(priv->mc_io, 0, ls_dev->mc_handle, &enabled);
  5143		if (err) {
  5144			dev_err(dev, "dpseci_is_enabled() failed\n");
  5145			return err;
  5146		}
  5147	
> 5148		dev_dbg(dev, "disable: %s\n", str_false_true(enabled));
  5149	
  5150		for (i = 0; i < priv->num_pairs; i++) {
  5151			ppriv = per_cpu_ptr(priv->ppriv, i);
  5152			napi_disable(&ppriv->napi);
  5153			netif_napi_del(&ppriv->napi);
  5154		}
  5155	
  5156		return 0;
  5157	}
  5158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
