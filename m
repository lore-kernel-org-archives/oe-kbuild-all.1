Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A70B281369
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 17:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757006161; cv=none; b=XOSRqrEVzdzkN1Qh2fjRbXomN8W8x5Mva6Dp8EwSBubIDAEL3axy8e3vF9SXkOMne4G5fJv7CAUeTEEW3RiUu9KTybd+MuwuyhjoqS8LlmoIfPelortocuTiHP+ZjvaAnfUN4FHIuYDSFK5Jpzt91LwJ2v5J7K6cjlXScu4UTqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757006161; c=relaxed/simple;
	bh=akmXV1AlrYFgEiBppywDs4bG8IKe2/O2QiT5VTJOB+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qX6+esuDa5a2uajZn+BSZWWy22zKM/IB9fTeaGc7G4Oh/a5TNVWi4O3C9uXzP2EaOdAz3Oz8587na1jA62bWc457genAi/R0l72u5HhMMk+SI3/jI6qj2Gsr2LoNLaK/gprmgGfiVvVsDzbKpJuM5zhmw31BP2O35bRyBhQvRqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQ3QUIYG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQ3QUIYG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757006159; x=1788542159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=akmXV1AlrYFgEiBppywDs4bG8IKe2/O2QiT5VTJOB+E=;
  b=NQ3QUIYG7mKy2gHKeL8PZCP032TaCFbTPXP41M8IiE1fkGv2+2K5tIhl
   ejFpH6IQjMDfBdrpZ2n/J7shpQ3hRb6OiZIYlKMY7ejlwLRWFzqH33KHl
   iPZgwth+CJM68j8lDRKCy8w94sFwN9BXAvMFTYuhYVKtBgvm3ZOF7j79w
   bVl2TOhSI4sWyRu7hAEcEhn0PAa3u3fn6C0KzIr1uUa8ALUKP36wlMPB/
   zVAKDe7dfdaq7a8iWgD1F/x9PWTxqFUi72/tVCyno4ap/w06vKnIFGVwp
   6qEtnDtDMzKIVaUKQvmg509XBEDOSccEwhXu+KoyK9YO46kg0rWqTotSL
   Q==;
X-CSE-ConnectionGUID: zdl2CtL3S8aFJya8GxSRwA==
X-CSE-MsgGUID: dwCwu9CZQK6MvmdcRHPyow==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="84785770"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="84785770"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 10:15:58 -0700
X-CSE-ConnectionGUID: UgyapYWhR3+cH/XrENP7nw==
X-CSE-MsgGUID: u0YMAYKkRJeEemq0hYBzvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="202790111"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 04 Sep 2025 10:15:58 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuDYx-0003nf-0X;
	Thu, 04 Sep 2025 17:15:55 +0000
Date: Thu, 4 Sep 2025 19:15:25 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 2/2]
 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml:
 sound-name-prefix: missing type definition
Message-ID: <202509041908.OEqLgtTU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   dd8b17eff1686a86f89b06958f1dd4488b1b7d85
commit: e3e561707c28c4d2c6da13a942ce7e1b07a59569 [2/2] dt-bindings: display: meson-dw-hdmi: add missing sound-name-prefix property
config: arm-randconfig-2052-20250827 (https://download.01.org/0day-ci/archive/20250904/202509041908.OEqLgtTU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509041908.OEqLgtTU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509041908.OEqLgtTU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml: sound-name-prefix: missing type definition
   Documentation/devicetree/bindings/i2c/i2c-gpio.yaml: i2c-gpio,sda-open-drain: missing type definition
   Documentation/devicetree/bindings/i2c/i2c-gpio.yaml: i2c-gpio,scl-open-drain: missing type definition
   Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml: diff-channels: missing type definition
   Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml: msi-controller: missing type definition
   Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml: led-sources: missing type definition
   Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml: default-brightness: missing type definition
   Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml: max-brightness: missing type definition
   Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml: data-active: missing type definition
   Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml: hsync-active: missing type definition
   Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml: pclk-sample: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
