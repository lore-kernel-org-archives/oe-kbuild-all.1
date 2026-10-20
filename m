Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792474680;
	b=tpPCsDT8TEbPEvWUyZJey15RzkP+RCUzc47o1H1PkANB1ESCDZlXvapK9DcHPMRVhWAj
	 q9UJhTRsrCQAVek17yFJjJuz1KfwMlv1wN6dRfL4ICI9gwAbsD+GvcH1+gneWvNEx88tW
	 +cYp0bR5MpWCs1Np7qs7rVf9eJffDffPAoNYtIH3Q9yB3St4xUICUvT610dKNVz0VyvV5
	 j4wpxag7wZkWUBRtc8KeH/1AAqEM+xuVqcMF755a0Uy8w/QF9Owl8o8K2q6UEFTKU7U58
	 JdmXW9JoNuwNeupU9mFYKrVYzC2IQtaAMmmODuBxll/Oi3TXegTLpOWO0+w1s5HoCew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792474680;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=AbQx3F5DeqIg01v5J1HMAoVNtPC3XJeQSCQTqpj8efU=;
	b=Yl4n0LbMatgriPSgKbvJWAvZwkxR/5vfyBVHGnXwNRyUiKVnSWKKEI5yIRfxA6CFkecQ
	 s+3JyX5FQa/t04hpkz9UsXtSj7NjwnXBpX6E+y3GVGaasytqHFmho8FPG+ynsJdHsHKY6
	 l853klB8oNoO3eeppxnz0hhdHiGf1Wa2W2CvVUcuuSr4e8xe0ip6VFIesUotWbAyHldR2
	 xlHv1x4w194PVHO4jRakKLuR1gydmz36JiMUqmJNsYUb8H+bBZWEBayTnNFsrAbeMp9Kv
	 y9u9Ac5fIDP9Iwy+tFifKLILWnhZ+wOUh3wC7Qodo0e0x9jouxRzqvycN0OeizY3NJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RUgD4eHz;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94562606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 05:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94562606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RUgD4eHz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792474678; x=1824010678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CgbzEe28G1zTrLdrNfJYfgWctwC1jg4tju9+nzpN6Co=;
  b=RUgD4eHzpPUBnKZVvbHMKd1EjVoOsXRWo6EQDyyqUB0lu9O/9vJu4qCU
   mMteyl3wn7+JrFaj5kwOUJZ2mE1sR3dXQ56UubBuxDKTvZGd7Amn61jna
   6CY4EUNUBvZHMJK+itmyRzXLD8ElYjfS58eUa/UzcAYcxDUu48Chn35wZ
   vHppLPPXUG1U9YlokzMZlDofYpmzn66Ma+5B/2+1bTpTFfbJlilbQW6f0
   JwfZoBcnwM0GaGTVGZXvHjb+5m3hl6caf4Sw/9F/RwrwR8qHbh3fFAEdb
   szrftpmu8eOhW2J0bZtMpi0RtslsaOjgDX9KyZ7WDdq/raCxZr1dXehXI
   A==;
X-CSE-ConnectionGUID: /9oHbXgLSnOWKHRxzO8ykg==
X-CSE-MsgGUID: GwWHHaflQFiRZWnWdi4xWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1059038"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1059038"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 22:37:57 -0700
X-CSE-ConnectionGUID: LV6bCR60Sxa6Yc/YIXoDCg==
X-CSE-MsgGUID: WFK0iYt7RvyviF8oI28nAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2691338"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Oct 2026 22:37:50 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ2Xh-00000000Mxi-3lzb;
	Tue, 20 Oct 2026 05:37:45 +0000
Date: Tue, 20 Oct 2026 13:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: Damon Ding <damon.ding@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v4 11/14] drm/bridge: analogix_dp: Use
 bridge->next_bridge instead of plat_data field
Message-ID: <202610201323.RdqouIbq-lkp@intel.com>
References: <20261019085836.3065008-12-damon.ding@rock-chips.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019085836.3065008-12-damon.ding@rock-chips.com>

Hi Damon,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next]
[cannot apply to daeinki-drm-exynos/exynos-drm-next linus/master v7.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/drm-bridge-analogix_dp-Return-bitmask-from-analogix_dp_get_irq_type/20261019-165823
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261019085836.3065008-12-damon.ding%40rock-chips.com
patch subject: [PATCH v4 11/14] drm/bridge: analogix_dp: Use bridge->next_bridge instead of plat_data field
config: parisc-randconfig-1001-20261020 (https://download.01.org/0day-ci/archive/20261020/202610201323.RdqouIbq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610201323.RdqouIbq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610201323.RdqouIbq-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/gpu/drm/bridge/analogix/analogix_dp.ko: symbol 'devm_drm_of_display_mode_bridge' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
