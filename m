Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2837831C584
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 09:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928563; cv=none; b=iJf1m4HtZ52Ie9I6xzkApt9oDar0Ymzl1uffolF2j7zVUhzSGqNJz57KsUliJtQRO0KoztUrHXboskEKJE0vZY34CfOhhXA+zd9iUAnoccHiWyvxnCv6GZeYYsNGAJu1u15l6+t2L3263nN66AkuCPyH4bOwPpI3Ag0lDei+4/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928563; c=relaxed/simple;
	bh=eMQkRDda0CTJz9d4NU/3B++tHCVu2jPNHFAlBjFXVW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b3/h2HbcOShX0ZKwMUx0+Q++AmkX6guYyTduumyTGQMUFrFtLdNvy5OltDiruvpBA+arn8Sy/Ho2aqsQbwhefoTmwV+Pnlr77rrBgbSgczwoZ7IUT0LajZeCUZr7qdt9OLnJZQ06MLvXhQReXNh7PVhL7NozFycI3g/VpgyW6vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ajv46Pm7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ajv46Pm7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764928555; x=1796464555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eMQkRDda0CTJz9d4NU/3B++tHCVu2jPNHFAlBjFXVW4=;
  b=Ajv46Pm7B0odvZhV/+RecoOCwdi4NpE9bRnwRZuTPcD/P1huBTSZ5orL
   rc+gjLW3yocDR/Re3VC45SXsXPQS51ahWgeMbHFzONYAsmJQI3Ge9wdx9
   Eto+RukGzZZ6oVTLG4V7kSbC0DAzaMrvLcI4c0NZrJm823kqhWfA8jO05
   yw0UZpGnjaUbnId4Nk5/ct20TjBkDjQK4Ss/6rMwIP1HiNAFCPOZkrdhE
   OUI+fvO68UW1VgfwTbEemh7E9I++4y3imUY4m2cgV+4VvonuhcbzSJ4GS
   VL0U8FRGx909uxxN1Yc4edW2S8CTMXJy4VXrV/h1n1kPa8SG/NYlkXD2x
   A==;
X-CSE-ConnectionGUID: huw7fTmTSxqr03LAGgpfKg==
X-CSE-MsgGUID: z28qauzERX2wIst6QC43kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66998729"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="66998729"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 01:55:52 -0800
X-CSE-ConnectionGUID: +6KdWMbeSzyDiQKsF075og==
X-CSE-MsgGUID: dKXMO0MPS0ia7hxtFnuTew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="200382606"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Dec 2025 01:55:50 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRSXU-000000000sv-07Ck;
	Fri, 05 Dec 2025 09:55:48 +0000
Date: Fri, 5 Dec 2025 10:55:17 +0100
From: kernel test robot <lkp@intel.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 9345/13567]
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: panel@0
 (samsung,sofef00): compatible:0: 'samsung,sofef00' is not one of
 ['samsung,sofef00-ams601nt22', 'samsung,sofef00-ams628nw01']
Message-ID: <202512051050.IHaYWy0f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6987d58a9cbc5bd57c983baa514474a86c945d56
commit: 1388c08c84a2b1f37abae656c1f88d18ecb1364e [9345/13567] dt-bindings: panel: Convert Samsung SOFEF00 DDIC into standalone yaml
config: arm64-randconfig-2051-20251204 (https://download.01.org/0day-ci/archive/20251205/202512051050.IHaYWy0f-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051050.IHaYWy0f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051050.IHaYWy0f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: panel@0 (samsung,sofef00): compatible:0: 'samsung,sofef00' is not one of ['samsung,sofef00-ams601nt22', 'samsung,sofef00-ams628nw01']
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,sofef00.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: panel@0 (samsung,sofef00): compatible: ['samsung,sofef00'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,sofef00.yaml
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: panel@0 (samsung,sofef00): 'poc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,sofef00.yaml
   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: panel@0 (samsung,sofef00): 'vci-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,sofef00.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
