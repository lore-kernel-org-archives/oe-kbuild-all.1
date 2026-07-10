Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57181FD4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 23:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783727283; cv=none; b=Y8bwrIFMJGDOv7btw7qxLIXblfjFQQD0FiUNYva+X7MGsOWqvO/jKjEp//6u9mrJOUJIPa45tCjP89sHZs79660mhR8UuiSAgWsb2XNolecGG7lvHq1MQmwUBNBU9Hs8VCsqj+Z6+7bbHJd9mPhm6mozCshO1iOwFlEXcN7ruPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783727283; c=relaxed/simple;
	bh=MiGYfpQZtx+lEikYieC7NWHiD9AXWhaBe09HWkoMY9Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tyKmn1j1Hvd0bF1aRxXx26PHRZRMSx1TNzfFBK2w4DxttWniUVbewqtSv6tnPOiXBiBqMJFlYoUZBgxu/obASveadS4M8KPHeIeOuJLc6ViHgy3RShvY552Iani2DhnTcC/Y/idb76kumgP2a+RLBo1UD1xixR/Qop0Oxlyek5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMBKA3Ua; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMBKA3Ua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783727282; x=1815263282;
  h=date:from:to:cc:subject:message-id;
  bh=MiGYfpQZtx+lEikYieC7NWHiD9AXWhaBe09HWkoMY9Q=;
  b=iMBKA3Ua+pdaywSqfUczmZX73IAlLSARdz3/aFTaNPzdhi3YByg14jk/
   mI8QWxmkQEEnScfz5a6hC8iVb77QOqta9/NZXST+gBmtiEOugtzfKDKS+
   lrGBslr4bOguTW0VguJ1nXN54Dg3UvBMNwoZ0ZkftGNo/1HlGG/h1f9kl
   NMA1hWGOyLaegmENG3LB31lb+ctSOSnqwgPlW1y9uFVNpmRTm26ntXSY3
   53WbCwT7c8fb8pV+ME+Mn8u5+w5AwmprRsG6jTGIw9noYd4Rx0TBhm6e/
   U+cnedLwqUggbhBC+BPuA8V40T3Y5/g3IeSYPFJ3FWBQXfKc9NPkNPZ/C
   Q==;
X-CSE-ConnectionGUID: NHap/d35SiiqvTMpNxdfmw==
X-CSE-MsgGUID: eF4bwKtZR7KNN0R7sCx1QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71950627"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="71950627"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 16:48:01 -0700
X-CSE-ConnectionGUID: 0DRMWe2dTLmYwPFxzYGL4A==
X-CSE-MsgGUID: ChfiTixKSOakG9PJoW0NFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="278260949"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jul 2026 16:47:59 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiKwn-000000003FN-115H;
	Fri, 10 Jul 2026 23:47:57 +0000
Date: Sat, 11 Jul 2026 01:47:34 +0200
From: kernel test robot <lkp@intel.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [linux-next:master 4353/5655]
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: /soc@0/isp@9253000: failed to
 match any schema with compatible: ['qcom,kaanapali-camss']
Message-ID: <202607110146.DaYETVnz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bee763d5f341b99cf472afeb508d4988f62a6ca1
commit: 7cc8ca0387f572a4d69941fe380e7a262342491d [4353/5655] arm64: dts: qcom: kaanapali: Add camss node
config: arm64-randconfig-2055-20260710 (https://download.01.org/0day-ci/archive/20260711/202607110146.DaYETVnz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110146.DaYETVnz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110146.DaYETVnz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: /soc@0/isp@9253000: failed to match any schema with compatible: ['qcom,kaanapali-camss']
--
   arch/arm64/boot/dts/qcom/kaanapali.dtsi:3601.27-3688.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@9800000/dsi@9ac0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/kaanapali-qrd.dtb: /soc@0/isp@9253000: failed to match any schema with compatible: ['qcom,kaanapali-camss']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
