Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E1919D8A2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718455759; cv=none; b=caJN3RtLqTDSibW75MVTXtozaqtA5W7piQrMhrgYHa8XfYEjkM3owPpHPf3cMgkmM5K+5Av3YK3ma43bOwlWxZuWNxhLd30rzy2oA/8xNSg3q4Q3Ld7rIZWZ/kSEtTZRRqpLcmI8wosNujD3jFM0oe+xHtVApN0q7YkWPWbcRAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718455759; c=relaxed/simple;
	bh=qzvZnjce1Z3lI3MkCTKs/CcqA8dqHFymQX0j3AYxg2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GaeSmR4eh2KV8XwJRnUAzM9c+qWekAX7WfvjrQ78YlcKoXysEkAmMcviYxuFIA4gMZXUggBBQ6qbi8f9CCuo1TuXAtADmcj8fKeimcihmR8OnXOYg1dDjc8z8iSpuTPbi3XSwJ3DDPhttDGpRxhUmuBPEjblp6qicOIrNOFI7QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEtUl0H1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEtUl0H1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718455758; x=1749991758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qzvZnjce1Z3lI3MkCTKs/CcqA8dqHFymQX0j3AYxg2g=;
  b=JEtUl0H1p1CSSu1Fl3jHSTQ9O4xq+MqNhpEp908lPNZ2Fefnml0AszDz
   WvgFUT/Gfj//l4AQjPgM4ezJXfBqYF8gnm130MZchbm0GYW4MR+/iG7UP
   1vxNX2GL79RoDd1co3ssBbE+tEm1Vgntcvg8di4aem4X2YvBYPfSU/SNv
   iLU6l3eyg1eGXdgNyapRDwe+tn9QlV04BAdHz8P24cx33tn/6EyYr6lbJ
   xaCNdk157YkgRd121U7236fJ38CG9fw7d6nAnpb8cW4bHCn+Pp6L1HAzS
   vcdfLTbImDo2jcg7hwkbvNDTeUqZdeBmUAvSzMyuUxjoYUJ7+42vPFHFB
   Q==;
X-CSE-ConnectionGUID: +BEOQZgeRgqG6G3MpZWs1w==
X-CSE-MsgGUID: R0rz5eOxQCWJeOytBoDrRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15569950"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="15569950"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 05:49:18 -0700
X-CSE-ConnectionGUID: arUf5O83QnOo3CBVGUEsTA==
X-CSE-MsgGUID: Y3bJtf4VRF67PAR4FPpIEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="45153431"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jun 2024 05:49:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sISqI-00001O-07;
	Sat, 15 Jun 2024 12:49:14 +0000
Date: Sat, 15 Jun 2024 20:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 22/52] arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: extcon_usb1:
 'ti,enable-id-detection' does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202406152004.F2fNnorG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   019f915e51b7d4f3095d95d93b1c0f4f63db02cc
commit: aa46a7d78e21c04677db8a286cd07db4d7588068 [22/52] dt-bindings: extcon-usb-gpio: convert to DT schema format
config: arm-randconfig-051-20240614 (https://download.01.org/0day-ci/archive/20240615/202406152004.F2fNnorG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406152004.F2fNnorG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406152004.F2fNnorG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: leds: led4:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'netdev' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'none', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'netdev' does not match '^cpu[0-9]*$'
   	'netdev' does not match '^hci[0-9]+-power$'
   	'netdev' does not match '^mmc[0-9]+$'
   	'netdev' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: leds: led4: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /encoder@0: failed to match any schema with compatible: ['ti,tpd12s015']
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: extcon_usb1: 'ti,enable-id-detection' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/extcon/extcon-usb-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
