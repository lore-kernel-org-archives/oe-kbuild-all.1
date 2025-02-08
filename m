Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB2224817F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 15:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739026876; cv=none; b=dkoLssF2zl8rPPYPaQzWkxFJGwjeLEWVWZ1WnFkvAfCLI223sH+LM0xfKB3j1mWMfxCvSfqsJkNJeeMLlSCuQ/hxtf2zvHzBk59VKUyJJ/bMNNXCcmXC+IQsindrg4CfH08OCPB+9XnqvY20tVgQLtbibQzrnKU/w62MtObe4sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739026876; c=relaxed/simple;
	bh=oUdNE/knSRZTMNI0GM2ibbe2wOyiIi4OxLXFL6CD6aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmE7Xrao/TinLuop6Q8VWyM3vxm/Xze9wEQlvANS3qTcTaLHJCYtfo6cT1NO+h1VbE6HpzJEGbbD+s943JYfnEzSpLzl4il3Ml04eOHS906Oz5UwZD46BDC40gUgBZOBEwXcce3/gnNQgzqGRhfGYMbfkqfe5gbdZNto+YOxyBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdLlATEG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdLlATEG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739026875; x=1770562875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oUdNE/knSRZTMNI0GM2ibbe2wOyiIi4OxLXFL6CD6aw=;
  b=CdLlATEGtkBvAXTcXdwZhwougW8N9RyU0f2wTf+BvUJCbXXdqkBrGsFK
   OsEquS1T2ldAoDZug3F0FTXHnRkesIy5znMZhUpcIgve6ZkrJU/xBrYcT
   gdzP6+52ulc6l/bFUutSDL5dqKrys+h1CAnFkkAGfd7HEkx1FPETDU2jt
   +EtH24lXqjbDQEOu4VuhaROkTg87bzYzllZKYIBWFOODZP5oGNa6IR5DR
   2MmVKntj65ON62F5DEIH61pmOr6VHgKiDr1mA6rKqvRSIvlnL7YynS47I
   cy66Ca3BjmbUz4ce0Ux8rBSzSh2HAj3OKOzFJB5c50VGZ3qARe1rl5/J/
   A==;
X-CSE-ConnectionGUID: d9Z6SE9AQFOuDjvLjnWf5Q==
X-CSE-MsgGUID: /dcCs9NFQiiKOFITPTipZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39783858"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39783858"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:01:15 -0800
X-CSE-ConnectionGUID: cFMuT3VZQoi7gUylQgT/aA==
X-CSE-MsgGUID: 6RgaP+1PQOuJ1OaQbZZftg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="111613881"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2025 07:01:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgmKQ-00109B-1f;
	Sat, 08 Feb 2025 15:01:06 +0000
Date: Sat, 8 Feb 2025 23:00:57 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
	kernel-team@android.com, willmcvicker@google.com,
	peter.griffin@linaro.org, daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v7 2/3] firmware: add Exynos ACPM protocol driver
Message-ID: <202502082233.qjIDyD3Z-lkp@intel.com>
References: <20250207-gs101-acpm-v7-2-ffd7b2fb15ae@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-gs101-acpm-v7-2-ffd7b2fb15ae@linaro.org>

Hi Tudor,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/Tudor-Ambarus/dt-bindings-firmware-add-google-gs101-acpm-ipc/20250207-233333
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250207-gs101-acpm-v7-2-ffd7b2fb15ae%40linaro.org
patch subject: [PATCH v7 2/3] firmware: add Exynos ACPM protocol driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250208/202502082233.qjIDyD3Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082233.qjIDyD3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082233.qjIDyD3Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/samsung/exynos-acpm.c:646: warning: expecting prototype for acpm_put_handle(). Prototype was for acpm_handle_put() instead


vim +646 drivers/firmware/samsung/exynos-acpm.c

   640	
   641	/**
   642	 * acpm_put_handle() - release the handle acquired by acpm_get_by_phandle.
   643	 * @handle:	Handle acquired by acpm_get_by_phandle.
   644	 */
   645	static void acpm_handle_put(const struct acpm_handle *handle)
 > 646	{
   647		struct acpm_info *acpm = handle_to_acpm_info(handle);
   648		struct device *dev = acpm->dev;
   649	
   650		module_put(dev->driver->owner);
   651		/* Drop reference taken with of_find_device_by_node(). */
   652		put_device(dev);
   653	}
   654	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
