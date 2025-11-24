Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842DA325725
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 19:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764013241; cv=none; b=SPL2wQgWK/w12tWNsA6rUtBQjGErYqapEOJz7cCvI4D3MK3Y4h7nxi8vpC5HJKQ9snyhnTuf6UeBWGZC/w3sfSw4n3TnJJXv7pG5A7FW/kKQkZ2VqULZ+SkGDm8GtME2e2dsgS5RyGVPiyxY1CQvAHGBJDpz5WH0KaES950p+uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764013241; c=relaxed/simple;
	bh=jvRAosfN2v/+e4qqRWiJwChT5vobaF/3YYwZp5WoiYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kt0g4LtIuPtLUc01z8flvRoQ6RT/bJw7vC7eD+vHrHT6l29aL3IepABTzeIIQG0xu/AO8qxJZIoBtd2czBvpQgZDOi6UOaR+tp/MgrpbRnvRNCXk4kYqB6nfor9lKj7USEGUGOf/YwJ85mkyUIJI9Zab8lxVYPJeUHj7OLSZHjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nw6O+JRn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nw6O+JRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764013239; x=1795549239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jvRAosfN2v/+e4qqRWiJwChT5vobaF/3YYwZp5WoiYo=;
  b=nw6O+JRnkApb/7kn6FK+6tXON75m2RW+0Ey7uHOi6Tvgbo+i/rW+GlZg
   tQfd22+CkQgupMhKaf5ymXvbbVVZw3xCTEfSQQpuOOr+S4jcB2iqjJTKJ
   +urqIPnK1t8uQkB2QXzg2DHxXDIfYt7j+Tl35t8wIWNOlcL2MIApUJX6O
   U448B63jAbYidiQ6wZmB1Cq7bAfvLBZoCM229jyQgf9wDQd4btcOHGAfG
   rHPacFY1DppN53GhSzm3QeqqUMm9VA2LMOv5xpNhBUz9SVvpBdjjY/O7z
   HcodvwpU4Mlb/DgWm418krzViw858qqKahY0iYmcMATkLQoz5jmLN7MGB
   Q==;
X-CSE-ConnectionGUID: cpqZf21JSpWGhrWd00a/8A==
X-CSE-MsgGUID: rtJyxIXwTnm67dU7lC12rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66182945"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="66182945"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 11:40:34 -0800
X-CSE-ConnectionGUID: nPD0gW7lSE2qIXW5GyiqAA==
X-CSE-MsgGUID: j/vAFErxRy+SpIDID6q5+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="191689591"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 24 Nov 2025 11:40:32 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNcQI-000000000JB-0egs;
	Mon, 24 Nov 2025 19:40:30 +0000
Date: Mon, 24 Nov 2025 20:40:28 +0100
From: kernel test robot <lkp@intel.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: oe-kbuild-all@lists.linux.dev, Georgi Djakov <djakov@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 9985/11727]
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb:
 interconnect@16e0000 (qcom,sm6350-aggre1-noc): 'clocks' is a required
 property
Message-ID: <202511242058.YF30PyXj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   422f3140bbcb657e1b86c484296972ab76f6d1ff
commit: dfb1717308ff4940b5252857f76bccbfb25ae69c [9985/11727] dt-bindings: interconnect: qcom,sm6350-rpmh: Add clocks for QoS
config: arm64-randconfig-2053-20251124 (https://download.01.org/0day-ci/archive/20251124/202511242058.YF30PyXj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev20+g7033eb7ce
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511242058.YF30PyXj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511242058.YF30PyXj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6350.dtsi:2331.27-2406.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: interconnect@16e0000 (qcom,sm6350-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sm6350-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: interconnect@1700000 (qcom,sm6350-aggre2-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sm6350-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: interconnect@16e0000 (qcom,sm6350-aggre1-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sm6350-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: interconnect@1700000 (qcom,sm6350-aggre2-noc): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sm6350-rpmh.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
