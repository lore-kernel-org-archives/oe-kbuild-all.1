Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBB16FB1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 00:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718324303; cv=none; b=h6kmnCj5EAOMMcU7RQvwpC2+VQZK49EycTJs8g/0BLGZsYDXm/HLUnL3RGi36wp7YVkwSEp/g2T5v5KATEvG1O4NoMhK8H7yTgXsJnOKxUYHlm5QoShWrr6aDETIegOA0xTBkY5QWhcykX5Au5lBBJMJvygWfjfQoGVEDmkJIIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718324303; c=relaxed/simple;
	bh=fS4/HVtzsQoOfRrt7aRnqqd3eeUu0uvZhK5tSB+wnkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AVgmEWuJS28YumMAUYo6uC2wXJklTrUr3/ImzlO+tj1bGnfzCsdIWFt4rPrkMzg19X1jLO0yVlZOKwd3BhaHTHFJZoGA2f/ejVT9VPnV6r6AVTxpaM626WSddbO/8SRHeG78sWJUh5JYuTzeolDhQdGSiKYNhkwIx0WrPMQWVoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8vXqlQo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8vXqlQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718324302; x=1749860302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fS4/HVtzsQoOfRrt7aRnqqd3eeUu0uvZhK5tSB+wnkQ=;
  b=e8vXqlQoFrVaa/UTvFrd9KhWpcf4N2mggeME4InzZE1XiPxecFChy2/0
   5hxeHMZ252TI/yhIYPD2iNs3ab6yqnYk6wjgN3DIW4wpP7Z3Eu3IbE0Do
   du/8aAeH1Uxjpwir/pqvmI5qPJNyzzQe0tNpNHoizuAHT3t2fcs81/1Tq
   89JdRO4HM1+Y2cvLKz7RahpsbZO6OK6IyR1rmrB/BaAmE5g0YZcDBmr7S
   +qCvfXUeycC2398u0xpqEdNlnkBsNOYSSHSZcsMlajHxfU92RV86XSy0w
   tyMgiOx4NKwF9emEuUB7VJSI3s7L/EWhNYo2xWt7NxAI8E73mHSFzBVDX
   g==;
X-CSE-ConnectionGUID: KTIpO9XSQsOVy5SDamLsEQ==
X-CSE-MsgGUID: LgUBA5XKSzSo3i+OeI21EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26591898"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="26591898"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 17:18:21 -0700
X-CSE-ConnectionGUID: FQ4MhWwhSUqzOWqlN+fl0g==
X-CSE-MsgGUID: xXZoVk1iSQWthB+Jw3vlyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="40822788"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jun 2024 17:18:20 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHue1-0000Y1-2I;
	Fri, 14 Jun 2024 00:18:17 +0000
Date: Fri, 14 Jun 2024 08:18:02 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 32/52] arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dtb:
 clock-controller@1400000: Unevaluated properties are not allowed
 ('power-domains' was unexpected)
Message-ID: <202406140836.wdNHlIRX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   1c608efa13a09b28407cf405e922e4a80c778dd1
commit: 1cc9fb02b9a0f3b68ddb9bf8658ac9befa2671f3 [32/52] arm64: dts: qcom: sm6375: Add VDD_CX to GCC
config: arm64-randconfig-051-20240614 (https://download.01.org/0day-ci/archive/20240614/202406140836.wdNHlIRX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406140836.wdNHlIRX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406140836.wdNHlIRX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dtb: clock-controller@1400000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm6375-gcc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
