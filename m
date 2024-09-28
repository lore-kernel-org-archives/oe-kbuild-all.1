Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05914125B9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 02:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727488865; cv=none; b=sB1gK6iIttaVJu8txSqv3dlRAu9SD+dcOsYD1D2OQ9IxGAZPQN7WiZ3a/MFGMAkPP0B36oV4qajYEn36tdTqTobJORrHYBIjkUCd1vv+FI/OfNlAe1OsHaLBxwfeSFOundSl3vm2WM6HWq0tfhaPvkbWbTRz8KyJ4LC5VWmBnAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727488865; c=relaxed/simple;
	bh=B0hDTo+aoXxw0AAPicUpctplhokJ78Jz3FNO3oGMdjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7/jr4rjd4aevR1bpwOyu+YRA4uISctJmcfSqHE9X9uIpBclusrjMHnG4l0W26gxlS87qxEHd/idg4zzV/fAkUVdXJNUQEMbq7oiYpqUfzvT0IJYi2pSGFkuTHrSdEbaCm5lMOGdB8HT1LzS8VmpkwmIBmIGBvWTRo6yqEK6758=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HvgeXoDB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HvgeXoDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727488862; x=1759024862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B0hDTo+aoXxw0AAPicUpctplhokJ78Jz3FNO3oGMdjs=;
  b=HvgeXoDBlacuRMNp3azo9QHcWJR4MFj1NCBqukPiBV0IGq9rXNQzN16Y
   wZNq2PU5Gur4BkNayNYQabKMMLiFCmNx9FtPqBTOX7LPE4B6BPlpByUrd
   R2a2EVzRIB6wNzzkyzZSubjCg1OBW2sn9+S5thBaE7fq5cPWJE2errBTO
   YfpsZNJDizwppxx5O2XIj4RbA0+kGcnOLjVxMM/JpedlU0nfTBH/sadoP
   xeKpv4hIPZwzawdd9chBGd84fVmbcEnB3NsOTE1brm55Rz9H+hzb0TewN
   7j4NZjuwWBMbjfJytCRqp2hNFfMVeyhql6XobJPVgibxQSsDUQTUKmYIt
   w==;
X-CSE-ConnectionGUID: itNtX4xHS7yOf/d05IMYtQ==
X-CSE-MsgGUID: zHQgTHPdRSWP1VS5B39o0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30535221"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30535221"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 19:01:00 -0700
X-CSE-ConnectionGUID: uAa4TFtBTmKYWHLL4w/w+g==
X-CSE-MsgGUID: kLnfXukeRt+crR+PvgSM3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73025912"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Sep 2024 19:00:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suMlQ-000Mpw-2G;
	Sat, 28 Sep 2024 02:00:52 +0000
Date: Sat, 28 Sep 2024 10:00:51 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: Re: [PATCH v4 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
Message-ID: <202409280936.0GoVcXMc-lkp@intel.com>
References: <20240926143122.1385658-4-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926143122.1385658-4-andrei.stefanescu@oss.nxp.com>

Hi Andrei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus robh/for-next linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Stefanescu/drivers-provide-devm_platform_get_and_ioremap_resource_byname/20240926-223448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240926143122.1385658-4-andrei.stefanescu%40oss.nxp.com
patch subject: [PATCH v4 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs support
config: mips-randconfig-r123-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280936.0GoVcXMc-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240928/202409280936.0GoVcXMc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280936.0GoVcXMc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-siul2-s32g2.c:296:46: sparse: sparse: incompatible types in comparison expression (different type sizes):
   drivers/gpio/gpio-siul2-s32g2.c:296:46: sparse:    unsigned int *
   drivers/gpio/gpio-siul2-s32g2.c:296:46: sparse:    unsigned long long [usertype] *
   drivers/gpio/gpio-siul2-s32g2.c:143:9: sparse: sparse: context imbalance in 'siul2_gpio_set_direction' - wrong count at exit
   drivers/gpio/gpio-siul2-s32g2.c:296:46: sparse: sparse: shift too big (32) for type unsigned int

vim +296 drivers/gpio/gpio-siul2-s32g2.c

   273	
   274	static struct regmap *common_regmap_init(struct platform_device *pdev,
   275						 struct regmap_config *conf,
   276						 const char *name)
   277	{
   278		struct device *dev = &pdev->dev;
   279		struct resource *res;
   280		resource_size_t size;
   281		void __iomem *base;
   282	
   283		base = devm_platform_get_and_ioremap_resource_byname(pdev, name, &res);
   284		if (IS_ERR(base)) {
   285			dev_err(&pdev->dev, "Failed to get MEM resource: %s\n", name);
   286			return ERR_PTR(-EINVAL);
   287		}
   288	
   289		size = resource_size(res);
   290		conf->val_bits = conf->reg_stride * 8;
   291		conf->max_register = size - conf->reg_stride;
   292		conf->name = name;
   293		conf->use_raw_spinlock = true;
   294	
   295		if (conf->cache_type != REGCACHE_NONE)
 > 296			conf->num_reg_defaults_raw = do_div(size, conf->reg_stride);
   297	
   298		return devm_regmap_init_mmio(dev, base, conf);
   299	}
   300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
