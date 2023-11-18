Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BEE1CF93
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 21:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hc9Db6Pn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700343346; x=1731879346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LJXjOb+KewYsrTEUlJCa92ls1KMHSAnBn81gLT7ZRXk=;
  b=Hc9Db6PnNOoSxkAjIv7CoJRCAr4mVHmM9TuM7I8It0D0gMHwCXbFaGz7
   +y6sv/wpNoeQMx1g06EkvzEENjXv6C0TwcRyRrwQq0lz66PEPDNpgLXpR
   gaYI5Gb/eL3+PnjVaOii1t1oKBu/gO/P67JkqrtmsjQ1FKpDIjU542aZ1
   QhiBtzNS/qJwfax6cvINeTJ0IWKVogh/aSqdcnNJtS8TAmxQ6fMLpy9OI
   qTemPbiMLZm4kXgc16qEg+HNZCi9wWtTQdRfdSQsDdmU7RdFXECl/yptY
   zArbZ4x/in0whdfyMRDpmYHsfMFhdLsNmFJWgq8tSVCR2Hszir83TdXBu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="388604869"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="388604869"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 13:35:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="14219335"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2023 13:35:42 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4SyZ-0004Jj-1Q;
	Sat, 18 Nov 2023 21:35:39 +0000
Date: Sun, 19 Nov 2023 05:35:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mehdi Djait <mehdi.djait@bootlin.com>, mchehab@kernel.org,
	heiko@sntech.de, hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, alexandre.belloni@bootlin.com,
	maxime.chevallier@bootlin.com, paul.kocialkowski@bootlin.com,
	michael.riesch@wolfvision.net,
	Mehdi Djait <mehdi.djait@bootlin.com>
Subject: Re: [PATCH v11 2/3] media: rockchip: Add a driver for Rockchip's
 camera interface
Message-ID: <202311190502.W5r6jlfH-lkp@intel.com>
References: <db605935ad21c4780b73db87605b52d30bc936a4.1700132457.git.mehdi.djait@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db605935ad21c4780b73db87605b52d30bc936a4.1700132457.git.mehdi.djait@bootlin.com>

Hi Mehdi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linuxtv-media-stage/master robh/for-next linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mehdi-Djait/media-dt-bindings-media-add-bindings-for-Rockchip-CIF/20231116-190910
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/db605935ad21c4780b73db87605b52d30bc936a4.1700132457.git.mehdi.djait%40bootlin.com
patch subject: [PATCH v11 2/3] media: rockchip: Add a driver for Rockchip's camera interface
config: x86_64-kismet-CONFIG_VIDEO_V4L2_SUBDEV_API-CONFIG_VIDEO_ROCKCHIP_CIF-0-0 (https://download.01.org/0day-ci/archive/20231119/202311190502.W5r6jlfH-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311190502.W5r6jlfH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311190502.W5r6jlfH-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API when selected by VIDEO_ROCKCHIP_CIF
   
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
     Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && MEDIA_CONTROLLER [=n]
     Selected by [y]:
     - VIDEO_ROCKCHIP_CIF [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_DEV [=y] && (ARCH_ROCKCHIP || COMPILE_TEST [=y]) && V4L_PLATFORM_DRIVERS [=y] && PM [=y] && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
