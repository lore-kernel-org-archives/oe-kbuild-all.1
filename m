Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF077125B9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 18:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720894184; cv=none; b=Jqpex2n/92CJmZ98jJtBpOOYf6pVA/ynkfbHPKi3bAuZGxNJ+bfLdQrG5cTjolimfqxFSpHjUW0jKJig0vYfneei/tot5lHR8XEG/xljMJCfp8D38w+Qx0T6ldQmfxv8bGmktZ23yM5d6n/PlAdvaWRc4LdtRpM64K2wcAREBV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720894184; c=relaxed/simple;
	bh=2mESLXUe78nX+khI/8xRDq9tEkbwYSAKjZeFGlVsGAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bSrfpWlYTJoJubW33cy9MgW2xTsSV9TtHc9Kk4Sxys/gtKANqpTDobThb5og9IywjmgjDCDy0IFZIhZweK65IenEbUmuMfsa2URk71CqQc1L1Hd0xvEqTcHNo4UUYXDPlHsGthmOded0QP/FycNVIUjA4x/skyV4OYgWK2DeLtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bdndYkLv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bdndYkLv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720894182; x=1752430182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2mESLXUe78nX+khI/8xRDq9tEkbwYSAKjZeFGlVsGAY=;
  b=bdndYkLvkpc3+B25wz9c1b/aZQ4q5hgKmfXOl9tazRoKMY2QVC0Xc8Hb
   2w3wFPWVoL+sW1P5X4zbaQ084MLFOSZVJqRzQhP03ajlKeiW+RAaY39C5
   QVFMEnu7rKh/0FyXj0KKzPfoPn+h3Nu22GortuleMueJhpInxuYcd099g
   7piaMoJ5IMRVolOpn6UtXZ9wFM9KYGOPrcKtNk4Xab5G7bzV55kauZlx5
   41CmhWc9XpJxZkUv276uHasqbjgA6T4YwA95JxIhmaI1WtlMohuWB0NiS
   0H6sub6sYZK2Sv+GwkCO9rxJAhxZDsdD8hekP6BTadTbwbSydGayhm+7p
   A==;
X-CSE-ConnectionGUID: ZEd5ByXMTbGYJxBm0n15UQ==
X-CSE-MsgGUID: Ms2hzKlpSBSNSFwJk+QfEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="29714391"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="29714391"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 11:09:41 -0700
X-CSE-ConnectionGUID: j0OPtYGcStKYj7+zbBSgMA==
X-CSE-MsgGUID: fKMTDkWvQLeNzzERKlRuYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="79901342"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Jul 2024 11:09:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sShBh-000cbW-0o;
	Sat, 13 Jul 2024 18:09:37 +0000
Date: Sun, 14 Jul 2024 02:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [linux-next:master 11608/12880]
 arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: watchdog@2100:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202407140220.61jYKFFf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fe121b622825ff8cc995a1e6b026181c48188db
commit: 34b60b78550eedbb596274f0336d1f86a80fcd19 [11608/12880] arm64: dts: amlogic: add watchdog node for A4 SoCs
config: arm64-randconfig-051-20240713 (https://download.01.org/0day-ci/archive/20240714/202407140220.61jYKFFf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407140220.61jYKFFf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407140220.61jYKFFf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: watchdog@2100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['amlogic,a4-wdt', 'amlogic,t7-wdt'] is too long
   	'amlogic,a4-wdt' is not one of ['amlogic,meson-gxbb-wdt', 'amlogic,t7-wdt']
   	'amlogic,a4-wdt' is not one of ['amlogic,c3-wdt', 'amlogic,s4-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/amlogic,meson-gxbb-wdt.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: watchdog@2100: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/amlogic,meson-gxbb-wdt.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: /soc/bus@fe000000/watchdog@2100: failed to match any schema with compatible: ['amlogic,a4-wdt', 'amlogic,t7-wdt']
--
>> arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dtb: watchdog@2100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['amlogic,a4-wdt', 'amlogic,t7-wdt'] is too long
   	'amlogic,a4-wdt' is not one of ['amlogic,meson-gxbb-wdt', 'amlogic,t7-wdt']
   	'amlogic,a4-wdt' is not one of ['amlogic,c3-wdt', 'amlogic,s4-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/amlogic,meson-gxbb-wdt.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dtb: watchdog@2100: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/amlogic,meson-gxbb-wdt.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dtb: /soc/bus@fe000000/watchdog@2100: failed to match any schema with compatible: ['amlogic,a4-wdt', 'amlogic,t7-wdt']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
