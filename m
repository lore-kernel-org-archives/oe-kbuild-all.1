Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61182EDD66
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 12:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755867207; cv=none; b=MHMfoHVfTMB/mRqR5ZFFkOWJLlewjBSDZ4ciPRDd2iiZPrR5IqKXFRD2z3dhpF1OOpGh2LaYQTTshwIuFdB3SYqVIY0lJMw1Wkai9AnqY8kEidhge2dqav7BEOcR5sNBCi9kGZYihbR+267SLJXqBVizQOXNtGcfJirkjNzqJKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755867207; c=relaxed/simple;
	bh=SnK3IFVbrpyQAFIKKQNghWbpDc5pGlXUWiV8Wi6p/kU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GUJIGXXMBxIQr7VGVADZfFfwGUF5FemS/eZ2eOCtPCcNeGzUPJOYEPVR3OPubF4GNDbwgPm50PVjII+aFmWezvfmYNcVFEKNNGaGgRi8WIQuHMjwia70icaC9MNtE0fXAq3/k7o/zYdSFGkDujkt2/qxBzdL3/YBZfWJ7FwdnB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hv5DNRaq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hv5DNRaq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755867206; x=1787403206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SnK3IFVbrpyQAFIKKQNghWbpDc5pGlXUWiV8Wi6p/kU=;
  b=hv5DNRaqdO6Y0vNkBoqco6+W8xVS49Vd198pApDifrmL9p0d3XJ3JGEM
   2/oolXKcrbkqR7brAlM7/7yT79Rdls5F5I/wIbI8tyzFYqfMEYcpCmQiT
   GX+TXjlzs9X57vVM1hr8f5Xh5DDLoi7vaA6+fVBzf2gKgVBelWmPlo24u
   VVEYo11YZXmOpc/b1rWCgBbaGdyyhWrC0/gDgyYM+8xR6HEsslfb6/tMZ
   jNqL0r+jvgrtlEIIjHppl/jaUPhO2YvocCK047aGnQ9CP1zpQlGPffYu3
   yEvzkxw+dCTpFmjUa43CETrBFwBq0gNHcEqKsmfqd+4189zR7pukjYi4Q
   Q==;
X-CSE-ConnectionGUID: UqVzZaw6RGW92Sy3iXlUww==
X-CSE-MsgGUID: 0gdyZwBNQoe2+qF/Wp2SSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="45744416"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="45744416"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 05:53:25 -0700
X-CSE-ConnectionGUID: 0JImXEo0SDui6/2qdgvp/A==
X-CSE-MsgGUID: uCv6wsB3QJC9FnyTCJ8UpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168603086"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Aug 2025 05:53:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upRG2-000LHt-0Q;
	Fri, 22 Aug 2025 12:52:57 +0000
Date: Fri, 22 Aug 2025 20:50:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 414/414]
 Documentation/devicetree/bindings/mailbox/mediatek,tinysys-mbox.yaml:
 properties:compatible: [{'const': 'mediatek,tinysys_mbox'}] is not of type
 'object', 'boolean'
Message-ID: <202508222014.dSscXQ0l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   0c256f0b39db534a79b343d6e3498b23bd18be7e
commit: 283b38fe8b57768c2dccc7b4e6dab4674a0627c2 [414/414] CHROMIUM: dt-bindings: mt8189: Add dt-bindings files for tinysys-mbox
config: arm-randconfig-052-20250822 (https://download.01.org/0day-ci/archive/20250822/202508222014.dSscXQ0l-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508222014.dSscXQ0l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508222014.dSscXQ0l-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml: title: 'Mediatek SoC LVTS thermal controller (DTS) binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/mailbox/mediatek,tinysys-mbox.yaml: properties:compatible: [{'const': 'mediatek,tinysys_mbox'}] is not of type 'object', 'boolean'
   	from schema $id: http://json-schema.org/draft-07/schema#
>> Documentation/devicetree/bindings/mailbox/mediatek,tinysys-mbox.yaml: properties:compatible: [{'const': 'mediatek,tinysys_mbox'}] is not of type 'object', 'boolean'
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/mailbox/mediatek,tinysys-mbox.yaml: properties: 'mboxes' is a dependency of 'shmem'
   	from schema $id: http://devicetree.org/meta-schemas/mailbox.yaml#
>> Documentation/devicetree/bindings/mailbox/mediatek,tinysys-mbox.yaml: properties: 'mboxes' is a dependency of 'shmem'
   	from schema $id: http://devicetree.org/meta-schemas/mailbox.yaml#
   Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml: properties:audio-gain-db: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmin-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmax-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
--
>> Documentation/devicetree/bindings/mailbox/mediatek,tinysys-mbox.yaml: ignoring, error in schema: properties: compatible
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml: i2c-alias: missing type definition
   Documentation/devicetree/bindings/sound/audio-graph.yaml: convert-sample-format: missing type definition
   Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml: ti,x-plate-ohms: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-odd-pixels: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-even-pixels: missing type definition
   Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml: voltage-ranges: multiple incompatible types: uint32-array

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
