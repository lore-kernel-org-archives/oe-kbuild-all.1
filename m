Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB953A7842
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 14:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006992; cv=none; b=NVNdFpOIHugkmz1jhUqZvy6pODb8FSrq28KOUzyaIv06KwaYcyGpvVJJ4Gra3KYccUumXmCa1Vaa5M27mK3kDfnD+BG+RUugn96r3DxEzFYusTFjyjjSHdM7nJnMwkKnvij3ywPnC561poMOu7lNq5OCS4Q4ei3Kvi/5H7wvpHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006992; c=relaxed/simple;
	bh=6LTNJOg2E8MaKxl1xCHKvy5jwJaoAeaRCG+agnK2yY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cauelZZt9Vxe1N2S6Ngyk56pN9PUC6O0OCtowIEN6zgP/vOXI8oNZsxdZ/QzD6kNXzZ833v6wdV4kJw/KXwh0koG6fEuZiHefFTFyu/7KzILCAWI6+VsehDWB1hU+nN6mzoBf8GZ9xTVVl+64wdkseFVeS647XzAvsJOW59p6sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Suuiw+yB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Suuiw+yB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769006990; x=1800542990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6LTNJOg2E8MaKxl1xCHKvy5jwJaoAeaRCG+agnK2yY8=;
  b=Suuiw+yBHaRopvzEsI+a60EcxBuD4QgXR2wwwj612+SChP+XFoARH0I8
   5YzfkeN/4lXoQwZSEOQP9jrj0xSDBBu/lBpgl0qnArEuTjCtahpOVgo4L
   MA7YsbZxclVnUlaZL/0Rx5DtN3RW5XSe9pp/KRCNRh6Cnk508a9QDM+V3
   C7nNDYu6y76IRDaictQ3ad8iO5zX7MlUUWRuznfVmUCPxqYkEPNDlwbUR
   0UlmtGtPFnoiQw8TfsqSTG16OPZalR1BEStVyroE/xS28Z84kXPz+LM2p
   4iZJ1mMFnbbV5WLIG+bXpltFL3CuDJmrRIcN3i8068yE9zxkc8gXKOvJB
   A==;
X-CSE-ConnectionGUID: UiOwSshqQA2ZsNMDN8J6RQ==
X-CSE-MsgGUID: cSkjvKOvSeWRYygL92k+rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="74087014"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="74087014"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 06:49:48 -0800
X-CSE-ConnectionGUID: n3tKdQlJR0Kh2goUKtuKHg==
X-CSE-MsgGUID: FgiU5irsRD68qf9iNbOS1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="229432837"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jan 2026 06:49:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viZWc-00000000RJx-31ND;
	Wed, 21 Jan 2026 14:49:38 +0000
Date: Wed, 21 Jan 2026 22:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: Josua Mayer <josua@solid-run.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Vignesh R <vigneshr@ti.com>, Andi Shyti <andi.shyti@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/7] mux: Add helper functions for getting optional
 and selected mux-state
Message-ID: <202601212215.qNGA0wVh-lkp@intel.com>
References: <20260121-rz-sdio-mux-v6-2-38aa39527928@solid-run.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-rz-sdio-mux-v6-2-38aa39527928@solid-run.com>

Hi Josua,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Josua-Mayer/phy-can-transceiver-rename-temporary-helper-function-to-avoid-conflict/20260121-173607
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260121-rz-sdio-mux-v6-2-38aa39527928%40solid-run.com
patch subject: [PATCH v6 2/7] mux: Add helper functions for getting optional and selected mux-state
config: i386-randconfig-001-20260121 (https://download.01.org/0day-ci/archive/20260121/202601212215.qNGA0wVh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601212215.qNGA0wVh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601212215.qNGA0wVh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mux/core.c:56 struct member 'mstate' not described in 'devm_mux_state_state'
>> Warning: drivers/mux/core.c:56 struct member 'mstate' not described in 'devm_mux_state_state'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
