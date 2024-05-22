Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487305223
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 May 2024 01:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716341746; cv=none; b=MdK4RC9xZr/o+HSYw1WGuLqI9QJJzpcjycw84Y9jpVlUH9fI2tHvEvYaupWDMLWYoKMrde9nMq96tCZTEqsYVAbdWyX1k8ZdxrlEU4JbhjeX/8kieVjELyn/tAD7wJ/n79qNJssxuEy3AhAUOmoZHlz8z7kLpHh+aj78AhkqZPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716341746; c=relaxed/simple;
	bh=GIPJYWiTtT2xt1SFvKMcln2TnmGAvpunmuMXQDvV9Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOEygUwk2lXJN2OXosbd8H2mfzM+o1cD9YPur7shYA+UiGbqkQl63wNFglhEtxQVCUZovti4A1c/UM/+uQTQ/3zA08dhJiGhapSbNcsVu7yPWdUc32tGh23pH2maM3VQu9/mOnhFGnEPrMB8ogenVLyvs1C//87ZtFUUdc2NOcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3e5gXkC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3e5gXkC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716341745; x=1747877745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GIPJYWiTtT2xt1SFvKMcln2TnmGAvpunmuMXQDvV9Mk=;
  b=L3e5gXkCc34fUd4uVg2cdolINr0XLKDdsqVQMrgHL3tZw7x/utNuJfS+
   L3E5mCE2RTyVW7GfecteXEs1QM3V8/Q+R9bkRrN9R1Tk8OaGf6JkvGTC8
   uRxaBVbScY3M91F9NdGduWxBw7EmmOHmY0IrsJm5uE9pgkWUziL//Z/IL
   bnJMA98Ip3XKXKIMveEe+2aKcZJ62FvrBZjP0mYAuzPQINEMOrbhiteZR
   IfqeN+lWz8Abx+wKG1KK3PQQboXUBEXMJSKfOJdLDZaQyjQ6cVgVVgnbL
   b2YTJJtDOj7FV1FCT3nwvU2o99X1cpwNOBoAisbsZfSsZaeQwvEU5wkRb
   Q==;
X-CSE-ConnectionGUID: RfSbHAQMT/et3yNKTP6HDw==
X-CSE-MsgGUID: h1D2pbboTFGR6WveQkvOeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="11640627"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="11640627"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 18:35:45 -0700
X-CSE-ConnectionGUID: +huA8liXQ5mIGcIz2tpcjQ==
X-CSE-MsgGUID: hPMjsnW+TUeH4Mg8YuObmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="63945781"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 May 2024 18:35:38 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9atD-0000uj-2A;
	Wed, 22 May 2024 01:35:35 +0000
Date: Wed, 22 May 2024 09:34:37 +0800
From: kernel test robot <lkp@intel.com>
To: keith <keith.zhao@starfivetech.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
	andy.yan@rock-chips.com, xingyu.wu@starfivetech.com,
	p.zabel@pengutronix.de, jack.zhu@starfivetech.com,
	shengyang.chen@starfivetech.com
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, keith.zhao@starfivetech.com
Subject: Re: [PATCH v4 04/10] drm/vs: Add hardware funcs for vs.
Message-ID: <202405220946.U4oQ9BG2-lkp@intel.com>
References: <20240521105817.3301-5-keith.zhao@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521105817.3301-5-keith.zhao@starfivetech.com>

Hi keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master next-20240521]
[cannot apply to robh/for-next rockchip/for-next v6.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/keith/dt-bindings-display-Add-YAML-schema-for-JH7110-display-pipeline/20240521-110316
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240521105817.3301-5-keith.zhao%40starfivetech.com
patch subject: [PATCH v4 04/10] drm/vs: Add hardware funcs for vs.
config: arm-kismet-CONFIG_CMA-CONFIG_DRM_VERISILICON_DC8200-0-0 (https://download.01.org/0day-ci/archive/20240522/202405220946.U4oQ9BG2-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240522/202405220946.U4oQ9BG2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405220946.U4oQ9BG2-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CMA when selected by DRM_VERISILICON_DC8200
   WARNING: unmet direct dependencies detected for CMA
     Depends on [n]: MMU [=n]
     Selected by [y]:
     - DRM_VERISILICON_DC8200 [=y] && HAS_IOMEM [=y] && DRM [=y]
   
   WARNING: unmet direct dependencies detected for DMA_CMA
     Depends on [n]: HAVE_DMA_CONTIGUOUS [=n] && CMA [=y]
     Selected by [y]:
     - DRM_VERISILICON_DC8200 [=y] && HAS_IOMEM [=y] && DRM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
