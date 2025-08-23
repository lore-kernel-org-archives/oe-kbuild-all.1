Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BEC1DF97F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 11:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755948883; cv=none; b=emRRs66nHgbMdUYZzBwmlJNeQHrNefoVn2wizH0p/soFTShp+d2ho+vI+hCdu9pKSUa9nROeVjE+I0CpdFoFEmbDVS71pZVAvyn3jLXD1MSDjDh33oMxUQeW3k4xCzzTc/Hmz+8rvQFF/xLpu7w3ffF10QKZSAS12IiufP+wd7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755948883; c=relaxed/simple;
	bh=HKA2dfQ7wolb5ONj4+w5fu/0uCaCA91pXOwf0LJtcvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d7y94rj7ZhTDP0puoEgVY96etoUjNPmtIbp7Eh3uVTT54bpxc3U74KMk2OMkuNqSCQaFKJt6RR7v5UZR5MTegG9CKAMaLWyBrw2w7OehAXAiMzaVNkPnj2crlkmNaFTyz3D4sR35aH9Ymuqh9i3bXUB8VXs2a2YFo6YaWAMzVKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2YGG+lz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2YGG+lz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755948882; x=1787484882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HKA2dfQ7wolb5ONj4+w5fu/0uCaCA91pXOwf0LJtcvM=;
  b=L2YGG+lzzF5LNCS52lOogUwi51i4XBhHl+zzHbf+q/2N4Ig1FxFAv461
   Xuba1vZU2LwkLz2fwdHZobGPUSF1/Yz8z8EfE4vtvJP924DDA0bP1XSgI
   c6X406h/X3lhD/p4K8Xzu+AppogqDIqAssSlBf/guZE6GQQvYqIMf6n8V
   TF9bVxkhAcWWt3eQ+POKDNxc81Ag9gmSDtxJYVihOgZZiaSmbZd0iKvV1
   dD0HrRjYMstMTljKa0k7WSUvhmj5H23CgnfCc/lHoc+ehAEQT8GAPlVEr
   2NuHdnUO2IKFiDjY5tHIiyuIn3Us0F3kV2f8Um0dBhpqlUNA1z3N6d92v
   w==;
X-CSE-ConnectionGUID: 7HY5ZTjoRw2RdwC1rKlZ4g==
X-CSE-MsgGUID: Py4x+vbZTgK8C1ete5gx1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58300931"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58300931"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 04:34:42 -0700
X-CSE-ConnectionGUID: yp9kU+gBQGi+3AK9+YU+iA==
X-CSE-MsgGUID: +lz1kSQQRl2e7ztPvbYgqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169098577"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Aug 2025 04:34:40 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upmVs-000MHL-2e;
	Sat, 23 Aug 2025 11:34:29 +0000
Date: Sat, 23 Aug 2025 19:34:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 443/443]
 arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtsi:260.8-270.4: Warning
 (graph_child_address): /soc/dvo@14018000/ports: graph node has single child
 node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202508231918.H1uEsV00-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   12cacc6855c36b7b2ce4a8f020b4a40a6433357b
commit: a1d33501caca76b0650cb75eafcab35c80d479e5 [443/443] CHROMIUM: arm64: dts: mt8189-skywalker: Initial DTS for skywalker reference
config: arm64-randconfig-001-20250823 (https://download.01.org/0day-ci/archive/20250823/202508231918.H1uEsV00-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508231918.H1uEsV00-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231918.H1uEsV00-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1368.27-1388.5: Warning (simple_bus_reg): /soc/xs-phy@11e80000: simple-bus unit address format error, expected "11e83000"
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1390.27-1402.5: Warning (simple_bus_reg): /soc/xs-phy@11e90000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1404.27-1416.5: Warning (simple_bus_reg): /soc/xs-phy@11ef0000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1524.32-1622.5: Warning (simple_bus_reg): /soc/opp-table-gpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:2548.32-2856.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:2858.10-2861.5: Warning (simple_bus_reg): /soc/emiisu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:439.37-459.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c000000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:461.29-465.5: Warning (unique_unit_address_if_enabled): /soc/syscon@d01a000: duplicate unit-address (also used in node /soc/soc-dbg-error-flag@d01a000)
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:629.32-683.5: Warning (unique_unit_address_if_enabled): /soc/mt8189-afe-pcm@11050000: duplicate unit-address (also used in node /soc/syscon@11050000)
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtsi:260.8-270.4: Warning (graph_child_address): /soc/dvo@14018000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +260 arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtsi

   256	
   257	&disp_dvo1{
   258		status = "okay";
   259	
 > 260		ports {
   261			#address-cells = <1>;
   262			#size-cells = <0>;
   263	
   264			port@0 {
   265				reg = <0>;
   266				disp1_dp_intf0_out: endpoint {
   267					remote-endpoint = <&dptx_in0>;
   268				};
   269			};
   270		};
   271	};
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
