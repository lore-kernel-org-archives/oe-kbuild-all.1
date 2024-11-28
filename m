Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1D2197556
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 09:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732787153; cv=none; b=nRpZ+g8k+qPdiVkGL14LdbL4DbQMQ+Hv+k4aD9lsbkJTE4xPcRpuA3sGxJIP645yIdctJroCU5krT1dxRGNNNK6hYg1ibD3l/KNgPr6zbJJ5UBEz9OIZx4iTgqEY2d5zuT5Mt7jhHEBxUr4LhsOytXnCvfXVbVIicLQGCB2AlkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732787153; c=relaxed/simple;
	bh=ElKAIf7wizv8tySByFr9uH0wtDLkJuM2U3uj8KUY5/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jYU5whOvxfTm03NRD6p4+H/1dWV9obt5shdhJcyLQuhTDJBULhx0dTl24vzfkkBM0BAxpI+e4B4yN1CYaERv1QBUioGUpVEYx73fSu2mQV7n1c6NZQxenXKSXob1cUMGCiJ+WlXkR8+rXM3ePrNl8QjtjLYMVgFn8BLxHJ6SSgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AjMccI51; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjMccI51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732787151; x=1764323151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ElKAIf7wizv8tySByFr9uH0wtDLkJuM2U3uj8KUY5/U=;
  b=AjMccI51GuscyfSP+GI4LTaZ2vRwTEBVj0tuyzDEtsyE/pRlTicxRc73
   HBI8jr7dRsL403w1l3nGZyVguEYPzSk6rm93CWU1eFtj+P4WTwQtlxylF
   pCmOy9gyriD4/rY1ir8fvP2aTKGUG/OiU/xcJ6Q+JJ/UQ1843heZPbCnb
   9rdYR5M/pKI8OHGaiVjjIshsBXWw4who16e0c5XTNC8B6G1ZLPN7oKMbG
   sOUZIiEAkLobnk6dZ+zj+/R1QPfq8sI+xFUtN57/1iwO7WGlqopfAXvY3
   1WjRt28RBC1bZI+66qH11+RdzOVCpaPreq45AWnirt030x/fE1yCRBnvG
   A==;
X-CSE-ConnectionGUID: 6PnK3/u2Ttq0DjtFAlYpZg==
X-CSE-MsgGUID: Roe5gYvRSuiiNzPh4CMhcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32380345"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="32380345"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 01:45:48 -0800
X-CSE-ConnectionGUID: Nl0qXlUCRnWTxg903O1FXA==
X-CSE-MsgGUID: 75uwHZRVRhCQtDvHxW8BAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="123160390"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Nov 2024 01:45:48 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGb5l-0009Pd-0b;
	Thu, 28 Nov 2024 09:45:45 +0000
Date: Thu, 28 Nov 2024 17:45:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2415/2415]
 Documentation/devicetree/bindings/arm/cpus.yaml: examples: '-| /{ cpus {
 arm,pbha-performance-only = /bits/ 8 <0x01 0x05 0x09>; arm,pbha-no-aliases =
 /bits/ 8 <0x02 0x04 0x06 0x08>;ncpu@0 { device_type = "cpu"; compatible =
 "arm,cortex-a57"; ... };n}; };'...
Message-ID: <202411281745.DnH89ucd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   48ec47c01c3800fd4419afd91af83e95ba9584d5
commit: 41987e135ceca78d4999eded438024857c9eb9a2 [2415/2415] dt-bindings: arm: Add binding for Page Based Hardware Attributes
config: arm64-randconfig-051-20241111 (https://download.01.org/0day-ci/archive/20241128/202411281745.DnH89ucd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281745.DnH89ucd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281745.DnH89ucd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/rtc/rtc.yaml: title: 'RTC Generic Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/rtc/rtc.yaml: properties:quartz-load-femtofarads: '$ref' should not be valid under {'const': '$ref'}
   hint: Standard unit suffix properties don't need a type $ref
   from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/rtc/rtc.yaml: properties:trickle-resistor-ohms: '$ref' should not be valid under {'const': '$ref'}
   hint: Standard unit suffix properties don't need a type $ref
   from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>> Documentation/devicetree/bindings/arm/cpus.yaml: examples: '-| /{ cpus { arm,pbha-performance-only = /bits/ 8 <0x01 0x05 0x09>; arm,pbha-no-aliases = /bits/ 8 <0x02 0x04 0x06 0x08>;ncpu@0 { device_type = "cpu"; compatible = "arm,cortex-a57"; ... };n}; };' is not of type 'array'
   from schema $id: http://json-schema.org/draft-07/schema#
>> Documentation/devicetree/bindings/arm/cpus.yaml: examples: '-| /{ cpus { arm,pbha-performance-only = /bits/ 8 <0x01 0x05 0x09>; arm,pbha-no-aliases = /bits/ 8 <0x02 0x04 0x06 0x08>;ncpu@0 { device_type = "cpu"; compatible = "arm,cortex-a57"; ... };n}; };' is not of type 'array'
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/arm/cpus.yaml: 'maintainers' is a required property
   hint: Metaschema for devicetree binding documentation
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml: title: 'Allwinner A83t Display Engine 2/3 Clock Controller Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml: title: 'Marvell Real Time Clock controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml: allOf:0: 'then' is a dependency of 'if'
   hint: Keywords must be a subset of known json-schema keywords

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
