Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD075C89
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 20:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719605871; cv=none; b=sZLemakCVVv0mIInjFGR28zNpPRQlzM5BNDSazVlre2W7yqlqG89LYYtSeVDlGlbMmOr7yQ/zeyT5Qnkz2fRtM3XlhE7ZoqREmoyCd/xpoybICbUr3jbGt1o7vQJYJg55PmUiBt5nFFo3c7/DhIBBxpUyHUKP6nvPGLER3s0Aw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719605871; c=relaxed/simple;
	bh=EuI7EWRro8ZvmjR0wCN7ln6d/7hJo7+Nn+N0F1RRWeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ST33aQx7W5wESCUF5sG3dkpwe7TAqSaH/+J1R6YMrRxhfVxB/9EHKzQgVBneI6VrPHrpfjf4G2UjQQ+GF7BhByNwatpF6bljuveTIZLGeeOErxECknA9fRQWHS88z6pHqVwxQ7f8yki70PI/UAfwVJ36Ie9LBAHzZzOVP6WHo8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JW0xqIkz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JW0xqIkz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719605870; x=1751141870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EuI7EWRro8ZvmjR0wCN7ln6d/7hJo7+Nn+N0F1RRWeI=;
  b=JW0xqIkzdYbTdZlZfqzhhKrjd73MrfrlhKEil6GRtAlwqa7RY66war9X
   ZVQhBIqdPULixstxWVYwjmvy42W2p0fZfEmhb6gG219bEAXX/erxCAGVE
   cjYKgKaHiWDkcTgrTUBW9os4dZa0Gum8nogtRibMbpLV3zSIIZs3u3wtE
   dSSWMTyBxVk0TMXLpB9fyRGPTZvou+zISA5+MotYINj4uzd/sktW+3S9q
   MkNapTVWlbj0BnFkdxkWYwpmOyCoXUMo0TXxR9A9CFUw0apQwtuPOac1s
   TyeQHbXoUHIajzAU3lsOgyieqQZwqLXNh5couOnlcReCOBfEqr0wGGtm2
   w==;
X-CSE-ConnectionGUID: yRWFT9HfTFOa0IMzhUn/2Q==
X-CSE-MsgGUID: oy9Maj+aQneFCIsPlE47Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="34341262"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="34341262"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 13:17:49 -0700
X-CSE-ConnectionGUID: ql0yL/eLQ7aE90xs7/ZbHw==
X-CSE-MsgGUID: zOGC6nbvTKueMGpG5nZT1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="49194391"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Jun 2024 13:17:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNI2T-000ILe-2Q;
	Fri, 28 Jun 2024 20:17:45 +0000
Date: Sat, 29 Jun 2024 04:17:31 +0800
From: kernel test robot <lkp@intel.com>
To: Naina Mehta <quic_nainmeht@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:arm64-for-6.11 54/251] arch/arm64/boot/dts/qcom/sdx75-idp.dtb:
 mmc@8804000: compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202406290402.kTqkE3Ra-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   fd513b922e34edb0db1284a4abee7f6c10ffd9a7
commit: 37f5169f5c83c5de469d666aea7b9eca4c30e6b9 [54/251] arm64: dts: qcom: sdx75: Add SDHCI node
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240629/202406290402.kTqkE3Ra-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240629/202406290402.kTqkE3Ra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406290402.kTqkE3Ra-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sdx75-idp.dtb: mmc@8804000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sdx75-sdhci', 'qcom,sdhci-msm-v5'] is too long
   	'qcom,sdx75-sdhci' is not one of ['qcom,sdhci-msm-v4']
   	'qcom,sdx75-sdhci' is not one of ['qcom,apq8084-sdhci', 'qcom,ipq4019-sdhci', 'qcom,ipq8074-sdhci', 'qcom,msm8226-sdhci', 'qcom,msm8953-sdhci', 'qcom,msm8974-sdhci', 'qcom,msm8976-sdhci', 'qcom,msm8916-sdhci', 'qcom,msm8992-sdhci', 'qcom,msm8994-sdhci', 'qcom,msm8996-sdhci', 'qcom,msm8998-sdhci']
   	'qcom,sdx75-sdhci' is not one of ['qcom,ipq5018-sdhci', 'qcom,ipq5332-sdhci', 'qcom,ipq6018-sdhci', 'qcom,ipq9574-sdhci', 'qcom,qcm2290-sdhci', 'qcom,qcs404-sdhci', 'qcom,qdu1000-sdhci', 'qcom,sc7180-sdhci', 'qcom,sc7280-sdhci', 'qcom,sc8280xp-sdhci', 'qcom,sdm630-sdhci', 'qcom,sdm670-sdhci', 'qcom,sdm845-sdhci', 'qcom,sdx55-sdhci', 'qcom,sdx65-sdhci', 'qcom,sm6115-sdhci', 'qcom,sm6125-sdhci', 'qcom,sm6350-sdhci', 'qcom,sm6375-sdhci', 'qcom,sm8150-sdhci', 'qcom,sm8250-sdhci', 'qcom,sm8350-sdhci', 'qcom,sm8450-sdhci', 'qcom,sm8550-sdhci', 'qcom,sm8650-sdhci']
   	'qcom,sdhci-msm-v4' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: /soc@0/mmc@8804000: failed to match any schema with compatible: ['qcom,sdx75-sdhci', 'qcom,sdhci-msm-v5']
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names:1: 'hs_phy_irq' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
