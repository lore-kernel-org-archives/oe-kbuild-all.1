Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C843C23D7CD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 08:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761984876; cv=none; b=p4ZKNzUIqvqurrba8BWkJQA2BVWZ86FXkiJsBljGs9kBc6vJllFiaxkTFUc1Taoknb7bVoO0dEnLfYiiHywuKSobIq+MAsjnPbi7cc5EURsmtsu00uoDWexQXEqgC7uTaQ2A7kkL/K9FjwuZkKONWtryWjt0IGFIdZc5dtykg10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761984876; c=relaxed/simple;
	bh=jhOkPJ4K+CCuWCM2QO5E7K6TyB34uTCYttsn8gMIj5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WTYnjfULEK4/e7OVziwkVPhWhgKMS9BKjpjrNAqUu8WNmBEoehjUjM1/i/Kua8i4sLZ0xTeGKFXvjv9vHSrmfdcbEO4XaAzixB3HN3Amluv6hxGZh0Mo+UJmWjONdLfPpmSJOd5mEp08XpriCkz/j5C5hYR6TfJfud9A4ilB6lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBpATMwC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBpATMwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761984874; x=1793520874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jhOkPJ4K+CCuWCM2QO5E7K6TyB34uTCYttsn8gMIj5Q=;
  b=mBpATMwC2o4XaA82hCqR+eYAedD+ER5R1M5fbIjfjQ7P4iKYTNssfXWt
   CkYi08HRvoULIXKf5/gCInFHh34m5QSRavyCqfr2K5fEw9w6LahrPepnw
   Xn11YSyOnKlMj7oLajd7rOTOZMJaXuLWUZ4TVJaN/YtTwELSYOhZAphVp
   oAdZlCP0DIKdDjVt9Ay4APqtL7VFsZVSAgQD6dMrLMUkQuCobQ+ry9pEh
   8bWC12apZazRB/qGfaIdiIcmEzy0c5ves+ZQ5ebGKr70ZA+Bn5+VJEQWf
   zm2cKIfRNqVkw6BtQ2PMnS1cLBsMbVAK3w3QHp50HqGlFjJgOoepl1nlu
   Q==;
X-CSE-ConnectionGUID: +PzB8BeUTFWXvAqNIpadBQ==
X-CSE-MsgGUID: bfj0XLfXQv+/adKELQXeyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67974949"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67974949"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 01:14:34 -0700
X-CSE-ConnectionGUID: yoC/0XnaRTu/kv26tiiv9w==
X-CSE-MsgGUID: EiH6isXZSZSK8wCO1MEQvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="190507123"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 01 Nov 2025 01:14:33 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vF6kp-000000001H6-0Srp;
	Sat, 01 Nov 2025 08:14:31 +0000
Date: Sat, 1 Nov 2025 09:14:01 +0100
From: kernel test robot <lkp@intel.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 4624/5383]
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: panel@0
 (samsung,s6e3fc2x01): compatible:0: 'samsung,s6e3fc2x01' is not one of
 ['samsung,s6e3fc2x01-ams641rw']
Message-ID: <202511010934.GdtcAn9h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
commit: 986f28f3a71e44ebd984ee45c4f75c09109ae7ee [4624/5383] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with panel
config: arm64-randconfig-2052-20251031 (https://download.01.org/0day-ci/archive/20251101/202511010934.GdtcAn9h-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511010934.GdtcAn9h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010934.GdtcAn9h-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: panel@0 (samsung,s6e3fc2x01): compatible:0: 'samsung,s6e3fc2x01' is not one of ['samsung,s6e3fc2x01-ams641rw']
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6e3fc2x01.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: panel@0 (samsung,s6e3fc2x01): compatible: ['samsung,s6e3fc2x01'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6e3fc2x01.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: panel@0 (samsung,s6e3fc2x01): 'vci-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6e3fc2x01.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: panel@0 (samsung,s6e3fc2x01): 'poc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6e3fc2x01.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
