Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F54379CE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 14:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632917; cv=none; b=U34agfoAuWdgLZU9itNRrdz1aNlOY/cyOkZBs6EpQgUQm8rYVqlu0GjBZVGj84b5dANDnT9Wxn0CjziH4SSmJgvS1unxgHPB3zop6tWroa2F8aBMnMCO3XE/IkEexVljQifmEcylhD4DPQEKRh3PwSgAAserN4iqhAWJC5fy1zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632917; c=relaxed/simple;
	bh=PiiQTqYCm+BsI884E1XTBes/JM/gA5Y+/jguTN51xN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VOtihcn0u37tZf1+sVSWounjqSuJbTwpv6q8p2fxMlWCQG7QYzqSevy0+JK6khc9Sv4YF+AhaT9//ZOStk6eDZEJIWJ8YD2T91SPpzQh0xeKo6Ksr0SsF3bT8r25fm8tiWF2NYGWAImPBuckkpFRCuFc2nLTY12yjXT4DUv7QIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHXCJftO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHXCJftO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718632916; x=1750168916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PiiQTqYCm+BsI884E1XTBes/JM/gA5Y+/jguTN51xN0=;
  b=LHXCJftOWRkk8x2e85RdE25l8N27l9GDUF80QSjO+nCxXWQdptfEAHrB
   0nkmY7Z+AzyqhYzQih3szHoD2RO+zeZKyCZHVArVi9svSsgf4c+i6O1My
   ojUnyskggbSaxUsllpzzs1Tx1kVks/iPs3smBI6leXB1FmfNJ1kSdQOgg
   ikY34hABmZiL9LemAovsxRsED+XDX65iTNChNV+jHbRKEjZ4CHRCHIloh
   CNHiW8GOTCSErTFGJqG1Ub0wYC28DTUWeMwyrew0+xjiy2e9tv8tfA8g1
   /U+0UMGSMGyWNve7JpDv2txNz2SUbx8H55FyVpN3DUrT3PO9fBBA2eCNj
   A==;
X-CSE-ConnectionGUID: oE2FbkniQ0KlOmdapohIig==
X-CSE-MsgGUID: wavPnNs6SMO4OFlUlZqLZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="12109880"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="12109880"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 07:01:55 -0700
X-CSE-ConnectionGUID: YsLccodAQHG5AKv20DDjvQ==
X-CSE-MsgGUID: jOhT04epQBmUbwaiTRYOGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41142218"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jun 2024 07:01:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJCvf-0004MK-2v;
	Mon, 17 Jun 2024 14:01:51 +0000
Date: Mon, 17 Jun 2024 22:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:arm64-for-6.11 56/211]
 arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dtb: iommu@1c48000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202406172111.ksHbU0JR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   f55a758fd355c1b5ed7c73434a99ae07d5741226
commit: 7ddab80e115086c0f2f37fa5a95466d0885d66d2 [56/211] arm64: dts: qcom: sdm450: add Lenovo Smart Tab M10 DTS
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240617/202406172111.ksHbU0JR-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406172111.ksHbU0JR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406172111.ksHbU0JR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8953.dtsi:911.27-961.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8953.dtsi:1329.11-1339.7: Warning (graph_child_address): /soc@0/usb@70f8800/usb@7000000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dtb: /: failed to match any schema with compatible: ['lenovo,tbx605f', 'qcom,sdm450']
>> arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dtb: iommu@1c48000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,msm8953-iommu' is not one of ['qcom,msm8976-iommu']
   	'qcom,msm-iommu-v1' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
