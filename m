Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7E96BB5C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 11:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706699415; cv=none; b=UXB1LKAeacrQf7TsZmMdlGYMRUqD+yN+1w82Fb+R0uzGW03PkRMeGEYab8q+yDdqwwnG7jHAy+WPaco9JNXpRfhtAQWNAt/JpTEmS2GImosG8Ch2PWi2L3sKygc0W2n+gMPZT6tcJm+YJd38mc4vAxWBvkKo84U9E0PU+N6Fco8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706699415; c=relaxed/simple;
	bh=pNV7Fp3pIVGNE8ZCf7QhHI4yrM6P2wp+90NMgGKvxdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAv/zrcZ3cn1WVa0/rLfACvO1grjjhru+ecbsw5f6hV+7FdYGE5R4nFf6YuqpacsmELPGonMtdSRChvyn/l/IXYhtQt8lJRpf16PwvNEgd6CimAMKd3fqhSamfvrMbrr7RKXBKoHNNAOwNRXOlsEvAQOlXy/AlbNF392DYg49cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fei5vohp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fei5vohp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706699413; x=1738235413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pNV7Fp3pIVGNE8ZCf7QhHI4yrM6P2wp+90NMgGKvxdI=;
  b=Fei5vohpDRbBTTyHkaFcxz4G4dqPocQLXR+oTmims2Q7yd+ii7sd4SgH
   QHrkCmvB3ZYgujMIxcTDwyJ6bDvcSeMJ08xlIIRtNrp+AYftK7cKVUzDO
   /K/YRdxvmF3gZ/4EQb+0gR7ahl5R/346eYnZMr9j/889mSTwY0FzntEGb
   XyWGhucJcWlq7VsGYLcNvSHeRZcrFRkUAR5/18G/ujxS/gNuLeQqPgsYH
   DiewXbSaJrv2VX0kXBmB3qK0bHQo12RvxqPXSCNFfZf0PibNaMAu4ispq
   11MBe0VMKWV8p8hAJIO4lOIrYspyZh5aeaBUe9kYA9xlPAE7OQt9Mhyme
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10205214"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10205214"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 03:10:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="4034515"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 31 Jan 2024 03:10:05 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV8Ti-0001Ua-09;
	Wed, 31 Jan 2024 11:10:02 +0000
Date: Wed, 31 Jan 2024 19:09:15 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	daniel.lezcano@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, miquel.raynal@bootlin.com,
	rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
	support.opensource@diasemi.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, andersson@kernel.org, konrad.dybcio@linaro.org,
	amitk@kernel.org, thara.gopinath@gmail.com,
	niklas.soderlund@ragnatech.se, srinivas.pandruvada@linux.intel.com,
	angelogioacchino.delregno@collabora.com,
	baolin.wang@linux.alibaba.com, u.kleine-koenig@pengutronix.de,
	hayashi.kunihiko@socionext.com, d-gole@ti.com,
	linus.walleij@linaro.org, DLG-Adam.Ward.opensource@dm.renesas.com,
	error27@gmail.com, heiko@sntech.de, hdegoede@redhat.com,
	jernej.skrabec@gmail.com, f.fainelli@gmail.com, bchihi@baylibre.com
Subject: Re: [PATCH v1 03/18] thermal: Directly use
 thermal_zone_platform_params for thermal_zone_device
Message-ID: <202401311855.eNllZc44-lkp@intel.com>
References: <20240130111250.185718-4-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130111250.185718-4-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on linus/master v6.8-rc2 next-20240131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/thermal-core-Change-governor-name-to-const-char-pointer/20240130-192357
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20240130111250.185718-4-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v1 03/18] thermal: Directly use thermal_zone_platform_params for thermal_zone_device
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20240131/202401311855.eNllZc44-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311855.eNllZc44-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311855.eNllZc44-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/gov_fair_share.c: In function 'get_target_state':
   drivers/thermal/gov_fair_share.c:44:72: error: 'struct thermal_zone_device' has no member named 'num_trips'
      44 |         return (long)(percentage * level * cdev->max_state) / (100 * tz->num_trips);
         |                                                                        ^~
>> drivers/thermal/gov_fair_share.c:45:1: warning: control reaches end of non-void function [-Wreturn-type]
      45 | }
         | ^


vim +45 drivers/thermal/gov_fair_share.c

4ccc5743ae7053 drivers/thermal/fair_share.c     Durgadoss R  2012-09-18  40  
4ccc5743ae7053 drivers/thermal/fair_share.c     Durgadoss R  2012-09-18  41  static long get_target_state(struct thermal_zone_device *tz,
bcdcbbc71125c3 drivers/thermal/fair_share.c     Javi Merino  2015-02-18  42  		struct thermal_cooling_device *cdev, int percentage, int level)
4ccc5743ae7053 drivers/thermal/fair_share.c     Durgadoss R  2012-09-18  43  {
c408b3d1d9bbc7 drivers/thermal/gov_fair_share.c Viresh Kumar 2022-10-17  44  	return (long)(percentage * level * cdev->max_state) / (100 * tz->num_trips);
4ccc5743ae7053 drivers/thermal/fair_share.c     Durgadoss R  2012-09-18 @45  }
4ccc5743ae7053 drivers/thermal/fair_share.c     Durgadoss R  2012-09-18  46  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
