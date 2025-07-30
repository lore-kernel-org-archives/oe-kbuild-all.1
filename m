Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A73D290F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 00:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753836709; cv=none; b=FK7NPgxydOTUiaiM9k3A2Mr+f8U7meIjuxEZ3OYsmfEsipMeWyzMEj14Cd1yiX/yNm+JFHf/x/n+gvsnY3usy8ukJPDI+hcE2DFxKMavMI2QwSskcrKsJBlEgsp3TIO0MbN2rQ+GMnSnd3K61eaHOLoqhDexwIpeddv/dWfV1BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753836709; c=relaxed/simple;
	bh=PRvj7/tY0gbPjZ9nvQIa9jtFtzC+d4gO88MH1ziiZgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKo8qg0GFaRLCvzdeFpuCNqbPKKh4nKtJC5LCfwxI2IIH3BFwJ5N8FJL9BNeT4JtTCFKSNvh0jJDFuLA+XD74SH+YOrqoeb+Yps9k9J3tZpyG2uxj6C/KpGV3B4dwvGRxnqM1tCvxO+St+pQA/4tMme7fSA48u6Oi8fCTMbZpCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nuBf9OdN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nuBf9OdN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753836707; x=1785372707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PRvj7/tY0gbPjZ9nvQIa9jtFtzC+d4gO88MH1ziiZgY=;
  b=nuBf9OdNAL8ESYWtKyKgzV/DqPlshBrWa+fJY920B2J8fcNDIv4O5uZ+
   sPnKmlZQNy1F8oVeXc+oW3V8h5oAVCO5nCzXG2tKkyWvIbJsDtNUY0UW8
   yp7ULQl3fGl0OgroigyZQ3zWykwiTS2qArlHcyavC+KTcKFQatleQlYvP
   mUkhOgkPxDBW+Dd2qf/2IZ90JvpJOTMQPMDgCVggDwfTmZuQDSWQTBvnk
   g83jERrFUkK9324XaQldM1JkCrpfSbBBAsN8EiVIggwK02fcxjppwNVMw
   hhMcO9LxpNtai5lu3+9ZiXC4VRloCRpV3RMect9AVpV+7sNCrB/37SoHk
   g==;
X-CSE-ConnectionGUID: op6N3fOoQ4iT0JlS83sm7A==
X-CSE-MsgGUID: 6xbbH1X4TRSzpebNXfT/vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="67566242"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="67566242"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 17:51:47 -0700
X-CSE-ConnectionGUID: 1Std8N5pSHOU8Hrf9kRN4A==
X-CSE-MsgGUID: tRwCDmk9QRGDzKVmAmsItA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="193840524"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Jul 2025 17:51:40 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugv2f-0001oh-2w;
	Wed, 30 Jul 2025 00:51:37 +0000
Date: Wed, 30 Jul 2025 08:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/5] phy: rockchip: phy-rockchip-typec: Add
 typec_mux/typec_switch support
Message-ID: <202507300837.EQJOJgpi-lkp@intel.com>
References: <20250729090032.97-3-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729090032.97-3-kernel@airkyi.com>

Hi Chaoyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250729]
[also build test ERROR on linus/master v6.16]
[cannot apply to robh/for-next rockchip/for-next krzk/for-next krzk-dt/for-next v6.16 v6.16-rc7 v6.16-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/dt-bindings-phy-rockchip-rk3399-typec-phy-Support-mode-switch/20250729-170255
base:   next-20250729
patch link:    https://lore.kernel.org/r/20250729090032.97-3-kernel%40airkyi.com
patch subject: [PATCH v3 2/5] phy: rockchip: phy-rockchip-typec: Add typec_mux/typec_switch support
config: powerpc-randconfig-002-20250730 (https://download.01.org/0day-ci/archive/20250730/202507300837.EQJOJgpi-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300837.EQJOJgpi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300837.EQJOJgpi-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_connector_oob_hotplug_event" [drivers/phy/rockchip/phy-rockchip-typec.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
