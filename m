Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BA82EDD7D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 17:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261762; cv=none; b=D7R4qnyj3zgohRYie15xDy3jHtmDQ4Fgyz+y06kKfnM8pqNtqoyMJxHyCG0n7+pzpl8TmLadHngsePvrxgJIcDJ+lGm3Es+7y0D20c6+7imrlt5+mRtVgjqLzC3Bb6Xb7enbeqn07Z6GWqTOs2IZzZF4OdSemlIbxJjW8fcydys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261762; c=relaxed/simple;
	bh=ijm/rsPlcX4PvWianLXOH2Az+wEueWyxinsO8xPNG08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SHaOju1m1la3b+NV9Q/RDLfytVuPz2DvQI7FuHy9JKvElcf0vqtCfuEenknUsDP2Mn35PmuEzgH7fCs+qUOKWOj4447xP248lLUf+fFx42CqDZ18lcnCVDnY5rO6Rl0J4rCCM+Ou89fMWrpSm1x0FlgTWVRDithLr7zkOsnlYFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QKly7gy5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QKly7gy5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778261761; x=1809797761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ijm/rsPlcX4PvWianLXOH2Az+wEueWyxinsO8xPNG08=;
  b=QKly7gy5/t9pd88eClinVGOhCkGjYCu3fEfhsCYy1jS6/Mq3kFZ7bygu
   calQ2DP6on2jueULYktUgJ4nVcUCFe5u2J+pKfsGzBGnyqo0vnzy4aVA+
   Fnfq8ITyenTSkKYdVHBbjU0XWssOJvT1HqQ6p23A2d2HTPN1cXKvS3/ok
   uqWGDLUOGrNP6DPq2C4QBkNif15P07hmFLU3xg6trTOW3WGtI90nuxrzE
   fNSGOL//ak4ZPMlfyG3ghmtZrci5iFRVGcON8z/Ve3FArHW+Bv6Ao69ta
   du7EcST3r6/3bX/otbRCSZhvZEqAdCKCBNqArAG8xxn8VWd/2bO8FanCp
   w==;
X-CSE-ConnectionGUID: Ce3Q5v6KQUGvT6GzrSAGFA==
X-CSE-MsgGUID: Zrf+5FECQvqx/E58V3UINA==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="104697005"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="104697005"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 10:36:01 -0700
X-CSE-ConnectionGUID: K+HMXVXfQW2auFtwdXH55w==
X-CSE-MsgGUID: XYrs2Qz+TEy1pPEhG4WQhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="236948617"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 08 May 2026 10:35:58 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLP7E-000000007EL-0RHm;
	Fri, 08 May 2026 17:35:56 +0000
Date: Fri, 08 May 2026 19:35:35 +0200
From: kernel test robot <lkp@intel.com>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 "Kamil =?utf-8?Q?Go=C5=82da"?= <kamil.golda@protonmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 1385/4394]
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb:
 /soc@0/display-subsystem@5e00000/dsi@5e94000/panel@0: failed to match any
 schema with compatible: ['samsung,s6e8fco-m1906f9']
Message-ID: <202605081900.JGie5d6r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: 493cb869874cd301c370adf9a3f9577942c4f0f1 [1385/4394] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel
config: arm64-randconfig-2055-20260508 (https://download.01.org/0day-ci/archive/20260508/202605081900.JGie5d6r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081900.JGie5d6r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081900.JGie5d6r-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: /soc@0/display-subsystem@5e00000/dsi@5e94000/panel@0: failed to match any schema with compatible: ['samsung,s6e8fco-m1906f9']
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: clock-controller@5f00000 (qcom,sm6125-dispcc): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm6125.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
