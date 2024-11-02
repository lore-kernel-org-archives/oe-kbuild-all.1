Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3000C12FF69
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730533824; cv=none; b=Dt2SqQzR2KIbvj79wMtbMJkDPNaD/Vg0om11PnbXRDwO0qQA3uT9ooJdlWuEqQQP2c2aY7BTqPhJaFCx04FsuLP+c84h7XkhaCltl/rEidf9XFxk4NYNp5/uh3Hm8TapAxqfFAFRZjEUshkB7Y+7hzeLPbFCj/bPkh1Ev6coxFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730533824; c=relaxed/simple;
	bh=xyj21Cadg2qWGouZ2QqbVMHmLQMIbSTPDWf88yLiIlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkN3KV0gBObta1w71dMZ4J6Bk8+w/C0LQi/DP8kcxdTtzgvFcjB5nLNm1n9mO9Uc+MuW4J46rALhWu0yOR0Q3MKQuMlPD00N8sg4ybXTAoAocKo/4QOtISjqz7oZ+wzs3HcKFly9g/qwtcIVqjCGDMjO029W4NbZhHvMuv6DWT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YvtQyTsS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YvtQyTsS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730533822; x=1762069822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xyj21Cadg2qWGouZ2QqbVMHmLQMIbSTPDWf88yLiIlI=;
  b=YvtQyTsS96hzxKyCQ+rZ1S9qZzjbitvyTMRz7UWJNruvEKfouTdTKdjW
   Fm8HWiUK+au9FFRn1txW1MbuXdDsBZrjUoe8Vi7UAsqIvCfXedrpaZ0eD
   A/0D/kRi4qStNeVrqT6vp2/8brbZazpCg28gHnnUbKrfrIOqLMsilDhdN
   mJHUEOFOgrOwofOkwNKkbDsVI43Elz7ME3VI7PT7oi20MtVwlGoG6M5Td
   kF0Lw8neytLs5fLqMI+Eq6cCkyfUTQWSTAZRl/kMiyDimoNaC1ZEHNrBe
   nBTwWW02TeWeZ0Fnxj+Wz3yDhUZLKIBerOhfiWYiefBtJJMmJl9k1eJte
   A==;
X-CSE-ConnectionGUID: ivFpeknIQtytOxiJVBZElQ==
X-CSE-MsgGUID: vNqPc+y1Qfucbo2Iki1LFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="41663350"
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="41663350"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 00:50:22 -0700
X-CSE-ConnectionGUID: mE0pGos6QrC4kpmiLs7q/A==
X-CSE-MsgGUID: rNQamn6vQkumReV4ILS5lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="87107093"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Nov 2024 00:50:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t78tm-000iZV-2R;
	Sat, 02 Nov 2024 07:50:18 +0000
Date: Sat, 2 Nov 2024 15:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 3/7] drm/connector: implement generic HDMI codec
 helpers
Message-ID: <202411021500.tp7G2CnS-lkp@intel.com>
References: <20241101-drm-bridge-hdmi-connector-v2-3-739ef9addf9e@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101-drm-bridge-hdmi-connector-v2-3-739ef9addf9e@linaro.org>

Hi Dmitry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on f9f24ca362a4d84dd8aeb4b8f3ec28cb6c43dd06]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/ASoC-hdmi-codec-pass-data-to-get_dai_id-too/20241101-182046
base:   f9f24ca362a4d84dd8aeb4b8f3ec28cb6c43dd06
patch link:    https://lore.kernel.org/r/20241101-drm-bridge-hdmi-connector-v2-3-739ef9addf9e%40linaro.org
patch subject: [PATCH RFC v2 3/7] drm/connector: implement generic HDMI codec helpers
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241102/202411021500.tp7G2CnS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021500.tp7G2CnS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021500.tp7G2CnS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_connector_hdmi_codec.c:161: warning: expecting prototype for drm_connector_hdmi_init(). Prototype was for drm_connector_hdmi_codec_init() instead


vim +161 drivers/gpu/drm/drm_connector_hdmi_codec.c

   150	
   151	/**
   152	 * drm_connector_hdmi_init - Initialize HDMI Codec device for the DRM connector
   153	 * @connector: A pointer to the connector to allocate codec for
   154	 *
   155	 * Create a HDMI codec device to be used with the specified connector.
   156	 *
   157	 * Returns:
   158	 * Zero on success, error code on failure.
   159	 */
   160	int drm_connector_hdmi_codec_init(struct drm_connector *connector)
 > 161	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
