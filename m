Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B68E3C5553
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 06:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778740069; cv=none; b=LHQME4O+ThOghT/J8C0H6FC2woRLThOYj4kUHR0BT7gYG1BzeCjoQXEyzmSF2AerHmqPruibwiLI9X5X3XDIeG9M3WwX/HWbEdtnDiN1l+EbYkgzKge5FIsGM4rb3YrGV03q6v2qyaAUJ0f7COL46F/Jtl0dq+37N0CqJR3LBA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778740069; c=relaxed/simple;
	bh=oqlyHTB6HlrOinriYYwoJGq0BqXGbkgg0rpHL45r3IU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7U0OTKGYWOBNHJqKO9iAYGMHyarta1AmiCiOIPS53iaFyKrsKgkvnOgSvNmYKl64ZoSNtevwGiiAvQR6REjqafyBUwnhqNEASdYp70NGXWMIC2gj87V1H7pZytyy3IsdSAVkPsgnX4d6p8rjvPohUiu7sQCE0YrS452nBzQ80M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/9c3vEH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/9c3vEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778740067; x=1810276067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oqlyHTB6HlrOinriYYwoJGq0BqXGbkgg0rpHL45r3IU=;
  b=I/9c3vEHdaEOAu9+1tYlCyK99XKutD32kSO89B18hOSGgrHzOIy8/7iT
   f4HNFs/8CdOaNM3mY1BZAwx1WUcQlyOPsyE6hfGE12hKCJJelufiy9vMA
   XwqPKVknTeE9VDM47NHLORW0Hgi0Jdb4jSFLi06CdeSGEZkM/UAbSbtfc
   NNlIDZGo2jWAp5y6cPJKGiX7KBSG0wyDIP62z9kJhbrQrQsGGxhhNb7Vb
   myha9jfyTXPsaRvPZ/RcK1xZfbzxzEEJDa1GG00b0ZlSMfb6rc7L+NkD6
   p80/88AU0SfwJqtsGObnnqZIe0P95Vm3HR6b5foVKati/juLSDirR2dRc
   w==;
X-CSE-ConnectionGUID: cY3j+3VASI+dgQNg1J9gpw==
X-CSE-MsgGUID: I/wbuQixSwmWxFbNLmiUig==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="90779084"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="90779084"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 23:27:47 -0700
X-CSE-ConnectionGUID: pCSDxIQOTKeiCrPYNobXEg==
X-CSE-MsgGUID: 3I10vI6fRjajBtdAQ6DtfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="238541423"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 May 2026 23:27:44 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNPXp-000000005xH-2glt;
	Thu, 14 May 2026 06:27:41 +0000
Date: Thu, 14 May 2026 14:27:29 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, linux@armlinux.org.uk,
	airlied@gmail.com, simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/armada: fix device_node reference leak in
 armada_lcd_bind()
Message-ID: <202605141402.WTQDmspg-lkp@intel.com>
References: <20260509091821.963513-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509091821.963513-1-vulab@iscas.ac.cn>

Hi Wentao,

kernel test robot noticed the following build errors:

[auto build test ERROR on daeinki-drm-exynos/exynos-drm-next]
[also build test ERROR on drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master rmk-arm/drm-armada-devel v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/drm-armada-fix-device_node-reference-leak-in-armada_lcd_bind/20260512-194755
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20260509091821.963513-1-vulab%40iscas.ac.cn
patch subject: [PATCH] drm/armada: fix device_node reference leak in armada_lcd_bind()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260514/202605141402.WTQDmspg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141402.WTQDmspg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141402.WTQDmspg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/armada/armada_crtc.c: In function 'armada_lcd_bind':
>> drivers/gpu/drm/armada/armada_crtc.c:1039:9: error: 'ret' undeclared (first use in this function); did you mean 'res'?
    1039 |         ret = armada_drm_crtc_create(drm, dev, res, irq, variant, port);
         |         ^~~
         |         res
   drivers/gpu/drm/armada/armada_crtc.c:1039:9: note: each undeclared identifier is reported only once for each function it appears in


vim +1039 drivers/gpu/drm/armada/armada_crtc.c

  1007	
  1008	static int
  1009	armada_lcd_bind(struct device *dev, struct device *master, void *data)
  1010	{
  1011		struct platform_device *pdev = to_platform_device(dev);
  1012		struct drm_device *drm = data;
  1013		struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  1014		int irq = platform_get_irq(pdev, 0);
  1015		const struct armada_variant *variant;
  1016		struct device_node *port = NULL;
  1017		struct device_node *np, *parent = dev->of_node;
  1018	
  1019		if (irq < 0)
  1020			return irq;
  1021	
  1022	
  1023		variant = device_get_match_data(dev);
  1024		if (!variant)
  1025			return -ENXIO;
  1026	
  1027		if (parent) {
  1028			np = of_get_child_by_name(parent, "ports");
  1029			if (np)
  1030				parent = np;
  1031			port = of_get_child_by_name(parent, "port");
  1032			of_node_put(np);
  1033			if (!port) {
  1034				dev_err(dev, "no port node found in %pOF\n", parent);
  1035				return -ENXIO;
  1036			}
  1037		}
  1038	
> 1039		ret = armada_drm_crtc_create(drm, dev, res, irq, variant, port);
  1040		if (ret)
  1041			of_node_put(port);
  1042		return ret;
  1043	}
  1044	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
