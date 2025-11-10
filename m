Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6613E47B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 01:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762739942; cv=none; b=h46sroz2F7eVaYdZ3Ot/Igo2Se7t+J4zX2RCGrfIrV9EtSx9CcGUSz3+HfymQvhhWp++U1X+akY7AJTheEQjxhmudFlbNpZht5s5j1KRlG0s6ybi/pjIedfSy0JeeaDo0OX+eChDaJZ/d6cfiYZn/c19+gq0hEA0BdmP9jYBsZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762739942; c=relaxed/simple;
	bh=OV1r25tG6TVmH2w6Dlbl2gYefTwmiZqVyIhtq7eg0UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1O4jTb2nirjE+xYki6XsXh0dv505/SyiWfcW8Bv97IdTUhYfuMHtahEnHZSZqWxoMAtm+jD8AYi3zXphTgZc7hpmoxfrw0mYtkt6/jXWiIhdBt8lHWPL0spxzwUyKs7C0ZX9fwktzjvFQgyMSeJCCiHQHlO0IBPc3Zi76/7Rdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UdCZzBjh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UdCZzBjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762739940; x=1794275940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OV1r25tG6TVmH2w6Dlbl2gYefTwmiZqVyIhtq7eg0UU=;
  b=UdCZzBjhHUtx4i9TY3+G2qL9x5Ykj2gzNsDOFXZgcvSlcyuwUV3/1czP
   /gvpQZ/PGUC9nnzS1pADJ2LViVKvc18dHOcFnzkl4Z4V5NNMLbCZU91Td
   lyMTgoMBuU2uyyzA8Hm7aBzUJZ4UfMIc4b+K7iRIVx4VNgO6Mo/3gf/yj
   xSXTX5XAbDTx8k1VRT764L1iPcHGvL6S2Df5882wVLHcGkPD7AjfCWorS
   5OlxiUwfyYa+E8Ij8qmVpC2XGPZj+c8EjY140uTiN7lxgmn7c8ock0L8u
   6smps5p0q0mIWcD4OeCvNi7kLNZZShFQRUpaggVYZkhR/FBXyV6lE2wa4
   A==;
X-CSE-ConnectionGUID: PGbCODbTTnuLV2yCF/F5Ng==
X-CSE-MsgGUID: qizf+TCjSS2OtgBrHKWVDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="75084120"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="75084120"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 17:59:00 -0800
X-CSE-ConnectionGUID: wY9RxmsfTQC0AzkIKps53Q==
X-CSE-MsgGUID: zHS4clUZQE6hczki2nXVwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="188294623"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Nov 2025 17:58:59 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIHBI-0002Zj-2J;
	Mon, 10 Nov 2025 01:58:56 +0000
Date: Mon, 10 Nov 2025 09:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/4] dmaengine: Use dma_request_channel() instead of
 __dma_request_channel()
Message-ID: <202511100917.IbXHDyqF-lkp@intel.com>
References: <20251109222944.3222436-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109222944.3222436-2-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on vkoul-dmaengine/next]
[also build test ERROR on linus/master v6.18-rc5 next-20251107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/dmaengine-Use-dma_request_channel-instead-of-__dma_request_channel/20251110-063117
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20251109222944.3222436-2-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/4] dmaengine: Use dma_request_channel() instead of __dma_request_channel()
config: s390-randconfig-001-20251110 (https://download.01.org/0day-ci/archive/20251110/202511100917.IbXHDyqF-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511100917.IbXHDyqF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511100917.IbXHDyqF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/dma/dmaengine.c:40:
   drivers/dma/dmaengine.c: In function 'dma_request_chan_by_mask':
>> include/linux/dmaengine.h:1627:24: error: passing argument 1 of '__dma_request_channel' from incompatible pointer type [-Werror=incompatible-pointer-types]
     __dma_request_channel(&(mask), x, y, NULL)
                           ^~~~~~~
   drivers/dma/dmaengine.c:889:9: note: in expansion of macro 'dma_request_channel'
     chan = dma_request_channel(mask, NULL, NULL);
            ^~~~~~~~~~~~~~~~~~~
   drivers/dma/dmaengine.c:757:62: note: expected 'const dma_cap_mask_t *' {aka 'const struct <anonymous> *'} but argument is of type 'const dma_cap_mask_t **' {aka 'const struct <anonymous> **'}
    struct dma_chan *__dma_request_channel(const dma_cap_mask_t *mask,
                                           ~~~~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
   Selected by [y]:
   - REGULATOR_RT5133 [=y] && REGULATOR [=y] && I2C [=y] && GPIOLIB [=y] && OF [=y]


vim +/__dma_request_channel +1627 include/linux/dmaengine.h

c13c8260da3155 Chris Leech     2006-05-23  1616  
c13c8260da3155 Chris Leech     2006-05-23  1617  int dma_async_device_register(struct dma_device *device);
f39b948dbeaf9d Huang Shijie    2018-07-26  1618  int dmaenginem_async_device_register(struct dma_device *device);
c13c8260da3155 Chris Leech     2006-05-23  1619  void dma_async_device_unregister(struct dma_device *device);
e81274cd6b5264 Dave Jiang      2020-01-21  1620  int dma_async_device_channel_register(struct dma_device *device,
10b8e0fd3f7234 Amelie Delaunay 2024-05-31  1621  				      struct dma_chan *chan,
10b8e0fd3f7234 Amelie Delaunay 2024-05-31  1622  				      const char *name);
e81274cd6b5264 Dave Jiang      2020-01-21  1623  void dma_async_device_channel_unregister(struct dma_device *device,
e81274cd6b5264 Dave Jiang      2020-01-21  1624  					 struct dma_chan *chan);
07f2211e4fbce6 Dan Williams    2009-01-05  1625  void dma_run_dependencies(struct dma_async_tx_descriptor *tx);
f5151311c3f37f Baolin Wang     2019-05-20  1626  #define dma_request_channel(mask, x, y) \
f5151311c3f37f Baolin Wang     2019-05-20 @1627  	__dma_request_channel(&(mask), x, y, NULL)
864ef69b2d9b34 Matt Porter     2013-02-01  1628  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
