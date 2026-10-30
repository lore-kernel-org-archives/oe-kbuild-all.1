Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396620;
	b=rT1q/Hju4wNR0YWxOsyoZuGLKL5wCpmiWEmaysalZ3d/mogU4ui7FCfRHv8azfE2wDcp
	 29wBcGD+9qtFtcx//hZv1tZSYJhYLVOsvlV70QDqqMsiJT9kDNbMzPnw8G+M0tfWeoigt
	 oeplUij2TrG/38JT/9BYWwjn1trVgGljDrkQSqAEptN9MCCQQVql6hZ9Azk/o4+oIMEpC
	 Px6ETSCHUIdWjz/ySqp0bTSmnuvcaQxtxbmo6jfqkpVBxwiTqfH92v8SUfZwbLHk1A8Pl
	 pXMY8/3Yf4On2eYI2KlahKKRVu12VFEMvKx7242zPNoZuioqB4U8QpujmiCEtYOSeig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396620;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Co4Q9F6w3RzvxiuCZhuCBdwh2cpjPJuHxfTBSguqV+0=;
	b=TdnjQmxnB8Y23KIao4UlDeSNLYgtP/uXDkBMh5SqjZlMxmRxAwbTNXAKtcLXRClqMWjB
	 i6KNeQCJ5faJ8ABvk0CqUF8X8jn+L17bguMSHTFzLvgEjmEFy3sg/yoa/Moced5a7OotJ
	 ouCxxHRvW6i5Ap8peHvld3t2azmC8Ep18TVN9NmqgUJO5D2Z/IRT6K0g9v245abfF778n
	 V5OnbGi9GYTyAWJxsoa6NIHT7BXpu9DknBqMW5B/H3BYGdiKxsqpDVZ/mb4Zm75d9A50b
	 imi8WNQGtFBeQLJqKYDtTXdCuab/oeTgCK4ThJ5rmsP92jUdo2hHIiy2xYzevq/mKwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ePuOkLP3;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B96606A31D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 21:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B96606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ePuOkLP3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793396617; x=1824932617;
  h=date:from:to:cc:subject:message-id;
  bh=Turn9n+Bjfb6aGT2UJDdq2ZycXxL559UWpsBWmI3gR4=;
  b=ePuOkLP3A4Ro5EQjFYqM/U7YtsPdaQqsA3mvPrW35lj0ii1rpRfNM+1h
   evapUcQUYqLiAb9BhHl66lgqZcDe0LIwn2SYncrS0Yl0WNSHWQqJCbLus
   QeYrtpXn+k7Jkaybx5WCdZrCRHZBVqbh6NHh3hsalR51YTQ2m7MGlYpK4
   mkgt7ATRWAGhU+MsQJs8MURDUU7emtkfXdloheTmqJQhywsbcbEukw+Q+
   cLetLD6mus17JY/gxrGcjtxrjZjRC3ilRO9yb5+3V8MqTr3KvGXeD+yHV
   VNWDk6u1dS93nvp/XqR3OK4VA3JshCicoVtdkN0T7SERg50QUPRoSvCwO
   w==;
X-CSE-ConnectionGUID: SZ4LKm+RQh+iRvz9BmymVQ==
X-CSE-MsgGUID: 4zHK3nACSgOWLvXxl2vR/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2183336"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2183336"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 14:43:37 -0700
X-CSE-ConnectionGUID: 8QrRogYdT2mWYHvhsB1YQA==
X-CSE-MsgGUID: 6Uc95yBOSRO1E/uLX5iyxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5434471"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 30 Oct 2026 14:43:36 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMuNp-000000005iN-34Wx;
	Fri, 30 Oct 2026 21:43:33 +0000
Date: Fri, 30 Oct 2026 22:42:45 +0100
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wens@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wens:sunxi-wip 36/36]
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1930:1: warning: label 'pm_put' defined
 but not used
Message-ID: <202610302254.Ekd0JM5s-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   e8e10ee67982c55fd3900953641c680a2fbef1c6
commit: e8e10ee67982c55fd3900953641c680a2fbef1c6 [36/36] HACK: drm/etnaviv: check if GPU is actually there
config: x86_64-randconfig-r2304-20261030 (https://download.01.org/0day-ci/archive/20261030/202610302254.Ekd0JM5s-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610302254.Ekd0JM5s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610302254.Ekd0JM5s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/etnaviv/etnaviv_gpu.c: In function 'etnaviv_gpu_detect':
>> drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1930:1: warning: label 'pm_put' defined but not used [-Wunused-label]
    1930 | pm_put:
         | ^~~~~~


vim +/pm_put +1930 drivers/gpu/drm/etnaviv/etnaviv_gpu.c

  1904	
  1905	static int etnaviv_gpu_detect(struct etnaviv_gpu *gpu)
  1906	{
  1907		int ret;
  1908	
  1909		ret = pm_runtime_resume_and_get(gpu->dev);
  1910		if (ret < 0)
  1911			return dev_err_probe(gpu->dev, ret,
  1912					     "Failed to enable GPU power domain\n");
  1913	
  1914		ret = etnaviv_gpu_reset_deassert(gpu);
  1915		if (ret) {
  1916			dev_err_probe(gpu->dev, ret,
  1917				      "GPU reset deassert failed\n");
  1918			goto fail;
  1919		}
  1920	
  1921		etnaviv_hw_identify(gpu);
  1922	
  1923		if (gpu->identity.model == 0) {
  1924			ret = -ENODEV;
  1925			dev_err_probe(gpu->dev, ret, "Unknown GPU model\n");
  1926		}
  1927	
  1928	fail:
  1929		pm_runtime_mark_last_busy(gpu->dev);
> 1930	pm_put:
  1931		pm_runtime_put_autosuspend(gpu->dev);
  1932	
  1933		return ret;
  1934	}
  1935	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
