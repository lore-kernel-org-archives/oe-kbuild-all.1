Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1277193
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 12:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725107110; cv=none; b=tQGkASYRJWXiK+fTTbYLMJLiPyU3LshRJolQ2DUmZTcdReQtsXGhIiZwU2ZjoxuleVuqJSWe9RYlZkz5uCmmzmSRVCuK+TfsZnnnaPaGUQ5Ow/f4eJZ/1RUwt3Hr+FqhU9puaiK52Vb1oPqWBm822GD+w5HRlFMQzUOyZ9EFiEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725107110; c=relaxed/simple;
	bh=q6oBjL9qXjOZSMfe8GXtA3r40H6DZ8Vomjc66YvguEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qeDR7s07tF8/J1HDueDAH8ApQbSCx/xYG05y6xIL8xPR/1nLldtpU/lIRi3Bc0hOZUMQZKIL80C4GgpXjXSGsETGAH2pxblRAmtgvtToFyrzKAM6MstNtXTrHJfWWbcU+laTqeJRTwP65GHxk8vOn8mZWCh1uimOgnXpf6f6ay8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwFFRCDb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwFFRCDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725107107; x=1756643107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q6oBjL9qXjOZSMfe8GXtA3r40H6DZ8Vomjc66YvguEc=;
  b=kwFFRCDbehy75Y6FJWdOlQzM844ooIxLy5P8zwiEr59lQBhfmxaEyR7A
   6fhtYaOAD9baaBvGvYh1D9creQkqMbFJ7LFnG0+ZTCFfVQKsWDRFhtD7i
   eQXQ8zn+PaxUqOaf9PJSChy4cqDyiAusnCxFiP7kKhvs8Kv5b5HP214MY
   AT8HolhHWD+VII+NbVQJxG+jblp9E/QTwuBogwCobzHKL4zC69HmM+VgB
   GDs6sVHfUV19s7fYqkR/CYNipEu8+fN1bzfGlMzGSh9ImE8iHhHN/bBLG
   4CR49WNt+0oYlFnLyPBYmi3z/AY+QhfAYIiAOWjlR79uWnmXAqSfwC2jv
   Q==;
X-CSE-ConnectionGUID: wvrsy0vUSQaQl9inILOuFw==
X-CSE-MsgGUID: J4NNXotxSBSp6Uar5Zs8NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23257937"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="23257937"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 05:25:06 -0700
X-CSE-ConnectionGUID: jpAWTE6cTgOtz9IziOCjKQ==
X-CSE-MsgGUID: 4CiML+r0QqqaaLJ6CcR9Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="68950928"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Aug 2024 05:25:04 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skNA5-0002kO-20;
	Sat, 31 Aug 2024 12:25:01 +0000
Date: Sat, 31 Aug 2024 20:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [linux-next:master 6741/8126]
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: video-codec@fdb50000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202408312010.igYOIOSx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
commit: 6166b1c0084e059af539c93a9d48afe44220dbef [6741/8126] arm64: dts: rockchip: Add VPU121 support for RK3588
config: arm64-randconfig-052-20240829 (https://download.01.org/0day-ci/archive/20240831/202408312010.igYOIOSx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408312010.igYOIOSx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408312010.igYOIOSx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts:1244.7-1252.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: regulator@42: Unevaluated properties are not allowed ('rockchip,suspend-voltage-selector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: pmic@0: regulators:dcdc-reg4: Unevaluated properties are not allowed ('regulator-init-microvolt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: pmic@0: Unevaluated properties are not allowed ('regulators' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: audio-codec@11: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: audio-codec@11: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts:1115.7-1123.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /extcon-usb3: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: pmic@0: regulators:dcdc-reg4: Unevaluated properties are not allowed ('regulator-init-microvolt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: pmic@0: Unevaluated properties are not allowed ('regulators' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: audio-codec@11: 'clock-names', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: gpio-func: leds-gpio: {'rockchip,pins': [[0, 2, 0, 246]], 'phandle': 254} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: vcc-3v3-sd-s0-regulator: Unevaluated properties are not allowed ('enable-active-low' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
