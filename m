Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E252EDD45
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769203737; cv=none; b=nWG3j+PsGL4GekW8w83IMqKf3906Sn+JfAsbtXGPRpFKy3Mw9arMsy4M8cWJ6MJOqv/sEGJisJihh8623Uw6xqtknF+A6QmLJE5HxY0PXaNM9wEjnONVvhwcxeYeFpz6IxYbSCfeho/y5MHndaNPW9e2bG0zLircLjPAMvriCjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769203737; c=relaxed/simple;
	bh=F+3lxxdOCzI1G+P2RWvjJqV8G0EnM8ESruTvIjlp03Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBNYPahUcZESBQvUM5XycANdtFjtymy5iY40sMGyoC+jbYTItw2gx9iXu/tIlao7docWFNB6NWgQkp0cE1XZDRPlnaTAsaMAVET2q1ufAFBRQi+I6Wtqu3KykIBJrZgYq4V9JwWMs4zb+9Y6b13fv0Z9yS0CgSFFBFdN7GF1PR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pv+aTx8B; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pv+aTx8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769203735; x=1800739735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F+3lxxdOCzI1G+P2RWvjJqV8G0EnM8ESruTvIjlp03Y=;
  b=Pv+aTx8BBXE9LKZno3xWtDKIggAdkRk8qDl4allgxYx0uuO0hM3zEA7T
   UF9/PFf+5DMR16VoqYz4G+IeUlD2o4cmoUFOSj6q3vJqXqNQRvuPq3hG7
   2fUD6c1Ze1uCvlMgv0YoeSzGykOl0XNyPrv2XbuNRXLHL4qTZikvPveuB
   LJe/HZKnEK2Zh9hnJ5njIsjTyLuNn3GPX6w2m174a9B65G6eE8zsg2m89
   WqRfG6IwfRE9VKviAJC1wMVQDfNQ0cnqk9OuPK63nxvxuyU+0hqvPB92A
   jEr5WTEaLP4xfYn8zy6jwW2aihqCf+vrl5p6fmjg/Zp3AKj5BltBkSnji
   g==;
X-CSE-ConnectionGUID: gyKxMxhaTgq+pcSF7lz7jQ==
X-CSE-MsgGUID: BWD2TEnKT36I97S+AsFA9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="88037071"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="88037071"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:28:54 -0800
X-CSE-ConnectionGUID: ZNRfMAYGQeCGb28jB3gqig==
X-CSE-MsgGUID: 5pu4H/wGTbGQHbaRND9vtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="211581938"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2026 13:28:49 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjOhy-000000000p7-2cGG;
	Fri, 23 Jan 2026 21:28:46 +0000
Date: Fri, 23 Jan 2026 22:28:19 +0100
From: kernel test robot <lkp@intel.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v6 3/9] drm: verisilicon: add a driver for Verisilicon
 display controllers
Message-ID: <202601232234.kb8a1hFz-lkp@intel.com>
References: <20260123092830.4046009-4-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123092830.4046009-4-zhengxingda@iscas.ac.cn>

Hi Icenowy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on next-20260122]
[cannot apply to drm-misc/drm-misc-next drm/drm-next linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Icenowy-Zheng/dt-bindings-vendor-prefixes-add-verisilicon/20260123-173225
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260123092830.4046009-4-zhengxingda%40iscas.ac.cn
patch subject: [PATCH v6 3/9] drm: verisilicon: add a driver for Verisilicon display controllers
config: riscv-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_VERISILICON_DC-0-0 (https://download.01.org/0day-ci/archive/20260123/202601232234.kb8a1hFz-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260123/202601232234.kb8a1hFz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601232234.kb8a1hFz-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_VERISILICON_DC
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_VERISILICON_DC [=y] && HAS_IOMEM [=y] && DRM [=y] && COMMON_CLK [=y] && (RISCV [=y] || COMPILER_TEST)
   
   WARNING: unmet direct dependencies detected for SIFIVE_CCACHE
     Depends on [n]: CACHEMAINT_FOR_DMA [=n] && (ARCH_SIFIVE [=y] || ARCH_STARFIVE [=y])
     Selected by [y]:
     - ERRATA_STARFIVE_JH7100 [=y] && ARCH_STARFIVE [=y] && !DMA_DIRECT_REMAP [=n] && NONPORTABLE [=y]
   
   WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
     Depends on [n]: CACHEMAINT_FOR_DMA [=n]
     Selected by [y]:
     - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y] && !DMA_DIRECT_REMAP [=n] && RISCV_ALTERNATIVE [=y] && !RISCV_ISA_ZICBOM [=n] && RISCV_SBI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
