Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C561945FFA0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 22:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388579; cv=none; b=mVQ429Ht8HIG0UzgxmzwU8/DyXbk0rSO2NTyU48gwYl97/CxxN/T9olfkc4F/0dvE79aDNrWAvGNmn7TDXJo210Ia9XLdMB2ON+ozmiqDN1xGDk2E/CLVtr57tElUa68Fg2grDpl70YZznwLWEZBJ84ldsCuq40HBBjnXt+dJX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388579; c=relaxed/simple;
	bh=0d0h+yE1LtsNcYMIajiLG4/S0USio8ZW0JMert7f4mE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pb1G6gdrpxj6EG8H/TDTMShrn4WXZpXoFuf77lVdO5YuQLm48LlIfOXlnRcGRV3O14xtyud644XWz35QeQvv81bP9o12w4lJSoq3ZWV3tGG5JZX3XCOtggfwZjthcVY/xsPDHlv0OfFCcF5EV9tlU+93+MnQpqKSYuJAtwxwKdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFId9Dqq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFId9Dqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788388572; x=1819924572;
  h=date:from:to:cc:subject:message-id;
  bh=0d0h+yE1LtsNcYMIajiLG4/S0USio8ZW0JMert7f4mE=;
  b=LFId9DqqJxQ2I6ziSA3U4ViQLzYzd2bfWcW9/6ZrtmjIRa7/ASBSwjei
   FkeqRMrAGGN2dO93p6pTJWLeazc4PiWjORCPylQrrDawiird8amQiTzMF
   l6+8zj9PH0IbjHbeuA08v3gXYXT5YFu+BgN7bVKB9qpzx5pOj5t6sDHUp
   Lbju7Hdkms+iw0Jsc4kWYChNy5rZvzt+K/76xJZxlJRTVuVwnucP4Px82
   oeB74sPQIA/YR+SPUSk1FW113/wrzSlF4OGYUeCWvcN1TS0Q/mg5cweSo
   MjVgw4lHx5ARSTiIISpwJ0yd+uN3H/Eg3FimnWC4WUvw+8sFzbp844ILF
   g==;
X-CSE-ConnectionGUID: AQqH3Fo3Q3eEIHJl6be7aA==
X-CSE-MsgGUID: ZmceTN8AT6Gb12Pwi5OzRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="111634356"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="111634356"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 15:36:08 -0700
X-CSE-ConnectionGUID: akmqHB7hQ8OyYTxJVbJkyA==
X-CSE-MsgGUID: IAT1Md2NQs+zks+hUt4ZfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="266298345"
Received: from igk-lkp-server01.igk.intel.com (HELO 05545efcfdd3) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 02 Sep 2026 15:36:06 -0700
Received: from kbuild by 05545efcfdd3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1tYq-000000000Xf-1nqK;
	Wed, 02 Sep 2026 22:36:04 +0000
Date: Thu, 03 Sep 2026 00:35:51 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 278/278]
 Documentation/devicetree/bindings/arm/ete.yaml:44:60: mapping values are not
 allowed here
Message-ID: <202609030035.f5qwAf0c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qais,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   ae917b3c7332e08006443a49c261aa97ce703103
commit: 4198bdb2cff86af72de536067e11d8783928c881 [278/278] ANDROID: coresight: Update ETE DT yaml file
config: arm-randconfig-2051-20260902 (https://download.01.org/0day-ci/archive/20260903/202609030035.f5qwAf0c-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 88e822a5253bec54a95687e59540a2d48cbaf4ca)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609030035.f5qwAf0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609030035.f5qwAf0c-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[2]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/arm/ete.example.dts] Error 1
   make[2]: *** Deleting file 'Documentation/devicetree/bindings/arm/ete.example.dts'
   make[2]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
   make[2]: Target '__build' not remade because of errors.

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/arm/ete.yaml:44:60: mapping values are not allowed here

vim +44 Documentation/devicetree/bindings/arm/ete.yaml

     9	
    10	maintainers:
    11	  - Suzuki K Poulose <suzuki.poulose@arm.com>
    12	  - Mathieu Poirier <mathieu.poirier@linaro.org>
    13	
    14	description: |
    15	  Arm Embedded Trace Extension(ETE) is a per CPU trace component that
    16	  allows tracing the CPU execution. It overlaps with the CoreSight ETMv4
    17	  architecture and has extended support for future architecture changes.
    18	  The trace generated by the ETE could be stored via legacy CoreSight
    19	  components (e.g, TMC-ETR) or other means (e.g, using a per CPU buffer
    20	  Arm Trace Buffer Extension (TRBE)). Since the ETE can be connected to
    21	  legacy CoreSight components, a node must be listed per instance, along
    22	  with any optional connection graph as per the coresight bindings.
    23	  See bindings/arm/coresight.txt.
    24	
    25	properties:
    26	  $nodename:
    27	    pattern: "^ete([0-9a-f]+)$"
    28	  compatible:
    29	    items:
    30	      - const: arm,embedded-trace-extension
    31	
    32	  cpu:
    33	    description: |
    34	      Handle to the cpu this ETE is bound to.
    35	    $ref: /schemas/types.yaml#/definitions/phandle
    36	
    37	  out-ports:
    38	    description: |
    39	      Output connections from the ETE to legacy CoreSight trace bus.
    40	    $ref: /schemas/graph.yaml#/properties/ports
    41	    properties:
    42	      port:
    43	        description: Output connection from the ETE to legacy CoreSight Trace bus.
  > 44	        $ref: /schemas/graph.yaml#/properties/port required:
    45	
    46	required:
    47	  - compatible
    48	  - cpu
    49	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
