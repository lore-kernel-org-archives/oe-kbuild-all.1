Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D43628CF69
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 18:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750357113; cv=none; b=U3m/W3LUkzwoRFVZGitn6DPX7p23kjQSFxQz89YDNX/5d+7TeAWKTB9UTM1lUfaMIlh/GGu53MxlvXdiuz/cx2p8g6s3RZVQnn3tHBZevyDPPh4OJiyL6U15MvILOWGyG35kkev+JykplKW7aDLvBM44SxmolQrn+6o1yYdCx9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750357113; c=relaxed/simple;
	bh=XPAqp1LT5+aQV7zNt05IQCAswsuTjMsSTg0UrPBs2vk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uD9g6EDC2ZZf7jloAZcOa40khcw693kqm7IKH90WBQZxJ4ul/a4UxRb4ht3UxRR2TWLtz+GgEQ6E5XU4YaR7iJddkgff1O66zTbQueqXivYbJJLfBdZdjnOX83x0Sm5/UGHZAsq5DGPdMkWYMYT5zeJHa+lmreOCpcqvx1f0jEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kK/ao4wY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kK/ao4wY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750357112; x=1781893112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XPAqp1LT5+aQV7zNt05IQCAswsuTjMsSTg0UrPBs2vk=;
  b=kK/ao4wYch2tRY3432Y8NiUWeCkOUUn9WAvGehFuEEhAF5gpHY8ewQeJ
   bdC1TFsoYROyw9laeF4yvu9A8PbkibpOJsaoby2bKIOp7IxW0ePjP2SSm
   UI//GbnY/W85m8rZsnRblxelUU7L4CSEqWNrjtQRvP8zk3zvvlQPoaAwm
   2tfosU/H4wBdegI8usFtJSkhxtpjlHFPa57vNyD3f8aVnUZGGUCMy+sGM
   DWgDYaDg/mTaHSnVKg6bsgp9/UCIxuEDmKiRNsV0OzDMbWvzR/ljzHRAX
   G3Pri0whnDdoBi/E0H2xlYHmnKSAkCLeesAocAfFH1jyFFfCT5r7ynReD
   Q==;
X-CSE-ConnectionGUID: posQv3JQQhaDOljCYnvlvQ==
X-CSE-MsgGUID: mkWKz0ibS3Wl3cW6S1OKgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64049541"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64049541"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:18:30 -0700
X-CSE-ConnectionGUID: 9MEh7n5sQNK80EFzYMv4nQ==
X-CSE-MsgGUID: RT/BWsjEQaWKpuh4K0CPBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150920774"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jun 2025 11:18:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSJqE-000L0I-2x;
	Thu, 19 Jun 2025 18:18:26 +0000
Date: Fri, 20 Jun 2025 02:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 3172/3877]
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/camss@5c6e000: failed to
 match any schema with compatible: ['qcom,qcm2290-camss']
Message-ID: <202506200228.RxTCwPJ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2c923c845768a0f0e34b8161d70bc96525385782
commit: 2b3aef30dd9dfd6cd2de3026126413a30028b850 [3172/3877] arm64: dts: qcom: qcm2290: Add CAMSS node
config: arm64-randconfig-051-20250619 (https://download.01.org/0day-ci/archive/20250620/202506200228.RxTCwPJ5-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200228.RxTCwPJ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200228.RxTCwPJ5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1834.27-1907.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1792.11-1802.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/camss@5c6e000: failed to match any schema with compatible: ['qcom,qcm2290-camss']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
