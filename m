Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F601C8FB5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 10:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675479; cv=none; b=rJi17LcpTpMRZMMa7nhaKoYaZqs6f+Ai7FepG/dogUND8V2xqjIkRIGD4gMZlkckKBFP1olKQiE0Qe/MqJBcKGdVrg8sNZENVEv2L8p2XAmfi/hZMwdwKlW3xE+SUUm2xM+atbbbUMV5ka/PAsSFMy+Y1eELaE1ngyiJKw4FThk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675479; c=relaxed/simple;
	bh=mJzDCX2fVoTniYCSlmaLwWg3xwUzvKuWVxi61OOLkGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AFcqD2n5A11fc4Xtlp/vjLJFd8qxQMo+TQpM9anLUt1a57zw8yuQPs0XTfbb3THsd4IcKl83dvaRHqu9vrkUPSI/cjB3ZOZsVK77iivLe50Qg19UPKNnP1Tb60XXW+0eQnGgl61tL/Jirb8DoiJg4aT4JT7f/o1xxBldm02gdo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X1SqdpOa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1SqdpOa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750675478; x=1782211478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mJzDCX2fVoTniYCSlmaLwWg3xwUzvKuWVxi61OOLkGg=;
  b=X1SqdpOawkmHBZ4ApzjgIBW/PVciRlYIENO5dTU4eK+9LEgd19d1lw6h
   w6UXj8aNnbhgYZZcAMoXZVSujV4Cg1Q+3mIGr2iZ9En5djkSfZbUQmlFW
   VxZwmcLm2hRnUQUZCnYdKVSPCSnZE2cgGXzExEkQUnWh7GMRKcNBsjvxc
   mUNyYd/oHJzeb09pumGjHGXe+QadFVbnXpoNrd3cFuEW5LO7D6EFdsuH4
   jyPc/uvO9naR1GeGRhch7yU+6NaoGYzJJmdlUJQ1WXbnhl151znVHFBFV
   IafBb/V4tcrXNEmmVz2ZeXZjO4i8rSF+nz6MyGg4vWApKT0n2/7R9y9nY
   g==;
X-CSE-ConnectionGUID: mQqJGOXET+muBM5FOCgz3A==
X-CSE-MsgGUID: RwrlcCZEQcqffLkAefw0uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="70301635"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="70301635"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 03:44:37 -0700
X-CSE-ConnectionGUID: OiY31wQ1RHaJGg+/6mMemA==
X-CSE-MsgGUID: pU3nvKofTxaVfddvCzZJ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151035445"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jun 2025 03:44:36 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTefB-000NxS-2M;
	Mon, 23 Jun 2025 10:44:33 +0000
Date: Mon, 23 Jun 2025 18:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-QAT-Fix-V6.16-ANBZ21972 44/44]
 drivers/crypto/caam/caamalg_qi2.c:5148:39: error: implicit declaration of
 function 'str_false_true'
Message-ID: <202506231845.SQ5zyutw-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250623/202506231845.SQ5zyutw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506231845.SQ5zyutw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231845.SQ5zyutw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:30,
                    from drivers/crypto/caam/compat.h:9,
                    from drivers/crypto/caam/caamalg_qi2.c:7:
   drivers/crypto/caam/caamalg_qi2.c: In function 'dpaa2_dpseci_disable':
>> drivers/crypto/caam/caamalg_qi2.c:5148:39: error: implicit declaration of function 'str_false_true' [-Werror=implicit-function-declaration]
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
   drivers/crypto/caam/caamalg_qi2.c:5148:22: warning: format '%s' expects argument of type 'char *', but argument 4 has type 'int' [-Wformat=]
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


vim +/str_false_true +5148 drivers/crypto/caam/caamalg_qi2.c

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
