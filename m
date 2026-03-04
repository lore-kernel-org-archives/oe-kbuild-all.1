Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5A52ECEB9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 00:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772583928; cv=none; b=g9t0N5uHigngURHxBTQe4vWdctJw2AA9qxraESlagxRbu977eY/4uUUY4ZQWhNQw20RpUSm7DcPoHztFpffiEDivQWDqeCy5NKdzzS8ZCDTbz7CQpN8bS0Y6pI+ZtWzsD7EAALVwq2rMn2K2HgnwcHA5sJOfa5qsd9TFevFAwD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772583928; c=relaxed/simple;
	bh=WtQvDC42Z647oSgh1Ri8POQuAGoEca3b8QC/5CKHh0E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QD4EcvVcAkVq7INb7qHWa58LNyQb0Mgh/JdrS230SwKIhSzsAcLCtOmFL/m10gkqEoVs+CyCCfZrdPe1TXdwZQP48XThCuH9tlK4DdbOcIbY0552j8pP4Ij7c+7kD5D41vD8H7Q4IAB1a1DyIaDVttm3MdXlEA+wkSrhMzj5NWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I986weou; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I986weou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772583926; x=1804119926;
  h=date:from:to:cc:subject:message-id;
  bh=WtQvDC42Z647oSgh1Ri8POQuAGoEca3b8QC/5CKHh0E=;
  b=I986weouCgzIRKca3zCrE+5qt+sedCUFVr/ykafjU86Tx5PC9u+eZs93
   3Nlq7sBLYPRd8Ltqo6lWKsGhJdunS+gURmVIi1p7LVaM6Cyqa8yYQMGqr
   yqRJq2NwT4cvQcyq/iNi29uGZYt96C0lFoqFizgjUbKaZaoKaR0oLTIZi
   HDFG8JmChMB293YpCOaMwgqXXHtJKSwPRY9U/Bzd9YJfGJclu6Af6OS9D
   T2Kjg9vOOowikAyn+hQ8UyJw7e7oparKc1C+l9Rt5PF9CxB0YQm8/jcXc
   0mFSQ8fe2yFEYiRUXe7k1Ol4eN3YGuAl/ia4L0amIY6FmS4GLDCDDuYM+
   Q==;
X-CSE-ConnectionGUID: w9ILBVFlRyyn7AQY6hmUAg==
X-CSE-MsgGUID: XmjyEa/qRrGCi9z6COCKxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73545316"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="73545316"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 16:25:26 -0800
X-CSE-ConnectionGUID: 5bw+3qxGSmCkC9g8+u0eOA==
X-CSE-MsgGUID: RqCICMjdRp6hlQ3vSOtnpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="248650360"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 03 Mar 2026 16:25:24 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxa3F-000000001aT-1geJ;
	Wed, 04 Mar 2026 00:25:21 +0000
Date: Wed, 04 Mar 2026 01:24:42 +0100
From: kernel test robot <lkp@intel.com>
To: Michael Walle <mwalle@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 2535/3431]
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dtb: system-controller@4a
 (kontron,sa67mcu): hwmon@8:compatible:0: 'kontron,sa67mcu-hwmon' is not one
 of ['kontron,sl28cpld-fan']
Message-ID: <202603040123.VMjAcolH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
commit: e176ad7b57a1a15ece213251b7f3103bd929e26c [2535/3431] dt-bindings: hwmon: sl28cpld: Drop sa67mcu compatible
config: arm64-randconfig-2051-20260303 (https://download.01.org/0day-ci/archive/20260304/202603040123.VMjAcolH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603040123.VMjAcolH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603040123.VMjAcolH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dtb: system-controller@4a (kontron,sa67mcu): hwmon@8:compatible:0: 'kontron,sa67mcu-hwmon' is not one of ['kontron,sl28cpld-fan']
   	from schema $id: http://devicetree.org/schemas/embedded-controller/kontron,sl28cpld.yaml
>> arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dtb: /bus@f0000/i2c@20000000/system-controller@4a/hwmon@8: failed to match any schema with compatible: ['kontron,sa67mcu-hwmon']
--
>> arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base-gpios.dtb: system-controller@4a (kontron,sa67mcu): hwmon@8:compatible:0: 'kontron,sa67mcu-hwmon' is not one of ['kontron,sl28cpld-fan']
   	from schema $id: http://devicetree.org/schemas/embedded-controller/kontron,sl28cpld.yaml
>> arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base-gpios.dtb: /bus@f0000/i2c@20000000/system-controller@4a/hwmon@8: failed to match any schema with compatible: ['kontron,sa67mcu-hwmon']
--
>> arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67.dtb: system-controller@4a (kontron,sa67mcu): hwmon@8:compatible:0: 'kontron,sa67mcu-hwmon' is not one of ['kontron,sl28cpld-fan']
   	from schema $id: http://devicetree.org/schemas/embedded-controller/kontron,sl28cpld.yaml
>> arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67.dtb: /bus@f0000/i2c@20000000/system-controller@4a/hwmon@8: failed to match any schema with compatible: ['kontron,sa67mcu-hwmon']
--
>> arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtb: system-controller@4a (kontron,sa67mcu): hwmon@8:compatible:0: 'kontron,sa67mcu-hwmon' is not one of ['kontron,sl28cpld-fan']
   	from schema $id: http://devicetree.org/schemas/embedded-controller/kontron,sl28cpld.yaml
>> arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtb: /bus@f0000/i2c@20000000/system-controller@4a/hwmon@8: failed to match any schema with compatible: ['kontron,sa67mcu-hwmon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
