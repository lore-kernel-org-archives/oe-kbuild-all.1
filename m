Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795865906;
	b=48PZHxiykpUbusNPwf0Do5hWzZnZEVsf+tCNd2wJ5dwkJdV+w06kgz4VDwNlLhSetcsh
	 bUmfPd7XageEFwxXENJh2SBMpyPnFNpx0QFkIi0gSpz2H9r/kZmbIru8tf5RednbapMCe
	 uqpAwtp5bYZhrUuJfxOsdP5JOetOqwXv5nOQBK5OoYJvEnmUW0bHf9oqo5AzETnFrrWKD
	 MS8/ZGPg08Ez6f3Sbi9JGAEbmrkWuDMj9adq6boy1dAqN0q2/X862Mfn4abiTziCFz8cF
	 lgWlok4/skfuj4uNsHJIr+x5g+1V3XDAwIkmY/5pqyVVMfEZqC5DrlvwUsOU57H40iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795865906;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=CuDPKctfzxxu5Q416HBVsHkeyxjW+4aPvlBweZom/0Q=;
	b=xuV9TzgTUlREZpYmMvNCHuyY3cqfWUjjGQE1Go0us43HX2K0pfdXuyJ06cgVk3AsjmDp
	 ocb+h7w2JKHxkd6YOJxM+rvhbKrHfb1MzWe0wozHIqfhPGHb8RepciXvGLn+1ljMJCLIq
	 dnYLQ24Cztf98SJ0G2iaUpIBGciPEE2nciR2M1lr0e9HoBL53gs9trAZaloMTSy0Yv0+e
	 BkqHOb1pl0u3tllC5BnZXhkcvVSvCBA7ULKyHi2ji9NBT53zAen5Q1y+SEdOBFdGrULaU
	 REvUgemOm9oVa+w11EYefqK4DTY8ong24oNMO/1nGoea/WNvpmCZ3GTyNaLJPZGj+3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UJu9XXQ4;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD54606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Nov 2026 11:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD54606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UJu9XXQ4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795865904; x=1827401904;
  h=date:from:to:cc:subject:message-id;
  bh=lvFSYjwiO74eRDEqPZYVQPPFXQd6uywzsjCN+lfs6B4=;
  b=UJu9XXQ4bL6wZ3Lj5qbdD0NxBivJRwC4kMgsUcy/9AumbltL+KQBqB2Y
   WD3CZzjjb3wReNHRjEN6C9OrdF6aTruG1x/dRq2I/ndBTaMyT4KFHHv79
   XVl12XhkGVztHWXHh4NTj5aUdN5Rf9SriJO0xHtZnYwOIGuet3uF4l5Qi
   eBBGhmGCYHJBxWNIraYAd2D7XdwqPRat9vPbRFyUzlIULgx5TyYt0dMo5
   EEijRX1cncrFXaOXDJ5fHXZI4BJ9XNtSBhrmR23O8Gd0zU6i9UrMchpl9
   dru0G0gWxwHVgR8+OS1FdqJ+Qqq6mCWBKpEZZQi+VHpM0tRC7AezvheAD
   Q==;
X-CSE-ConnectionGUID: L3+As7oxRTqUdfEpEFgLLw==
X-CSE-MsgGUID: 6kzCjGkPRQ+n/jHhfagRtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11980"; a="4656592"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4656592"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2026 03:38:23 -0800
X-CSE-ConnectionGUID: pYg54gEkQhCxJlajiNZIHA==
X-CSE-MsgGUID: 88l8pq5HQwm/IggSTySFdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="14315522"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 28 Nov 2026 03:38:21 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xXGl1-000000000Zi-246b;
	Sat, 28 Nov 2026 11:38:19 +0000
Date: Sat, 28 Nov 2026 12:37:28 +0100
From: kernel test robot <lkp@intel.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 12487/13037]
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: crypto@1b3a000
 (qcom,shikra-qce): 'clocks' is a required property
Message-ID: <20261128123056.jdS3jO2X-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e5aad2bdbbee783611d32599f89cea3f12f9593d
commit: 7957c2884f761ad0503dba6b2517535b1b06a2b2 [12487/13037] dt-bindings: crypto: Correct Shikra QCE compatible hierarchy
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261128/20261128123056.jdS3jO2X-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev9+g7453fd0b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261128/20261128123056.jdS3jO2X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261128123056.jdS3jO2X-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/pm8005.dtsi:61.23-70.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@1c40000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: crypto@1b3a000 (qcom,shikra-qce): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: crypto@1b3a000 (qcom,shikra-qce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: crypto@1b3a000 (qcom,shikra-qce): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,shikra-qce', 'qcom,sm8150-qce', 'qcom,qce'] is too long
   	'qcom,crypto-v5.1' was expected
   	'qcom,crypto-v5.4' was expected
   	'qcom,shikra-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
   	'qcom,shikra-qce' is not one of ['qcom,eliza-qce', 'qcom,glymur-qce', 'qcom,kaanapali-qce', 'qcom,milos-qce', 'qcom,nord-qce', 'qcom,qcs615-qce', 'qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce', 'qcom,x1e80100-qce']
   	'qcom,qce' was expected
   	'qcom,ipq4019-qce' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:61.23-70.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@1c40000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: crypto@1b3a000 (qcom,shikra-qce): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: crypto@1b3a000 (qcom,shikra-qce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: crypto@1b3a000 (qcom,shikra-qce): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,shikra-qce', 'qcom,sm8150-qce', 'qcom,qce'] is too long
   	'qcom,crypto-v5.1' was expected
   	'qcom,crypto-v5.4' was expected
   	'qcom,shikra-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
   	'qcom,shikra-qce' is not one of ['qcom,eliza-qce', 'qcom,glymur-qce', 'qcom,kaanapali-qce', 'qcom,milos-qce', 'qcom,nord-qce', 'qcom,qcs615-qce', 'qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce', 'qcom,x1e80100-qce']
   	'qcom,qce' was expected
   	'qcom,ipq4019-qce' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
--
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk.dtb: crypto@1b3a000 (qcom,shikra-qce): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk.dtb: crypto@1b3a000 (qcom,shikra-qce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk.dtb: crypto@1b3a000 (qcom,shikra-qce): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,shikra-qce', 'qcom,sm8150-qce', 'qcom,qce'] is too long
   	'qcom,crypto-v5.1' was expected
   	'qcom,crypto-v5.4' was expected
   	'qcom,shikra-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
   	'qcom,shikra-qce' is not one of ['qcom,eliza-qce', 'qcom,glymur-qce', 'qcom,kaanapali-qce', 'qcom,milos-qce', 'qcom,nord-qce', 'qcom,qcs615-qce', 'qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce', 'qcom,x1e80100-qce']
   	'qcom,qce' was expected
   	'qcom,ipq4019-qce' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
--
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk-imx577-camera.dtb: crypto@1b3a000 (qcom,shikra-qce): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk-imx577-camera.dtb: crypto@1b3a000 (qcom,shikra-qce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk-imx577-camera.dtb: crypto@1b3a000 (qcom,shikra-qce): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,shikra-qce', 'qcom,sm8150-qce', 'qcom,qce'] is too long
   	'qcom,crypto-v5.1' was expected
   	'qcom,crypto-v5.4' was expected
   	'qcom,shikra-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
   	'qcom,shikra-qce' is not one of ['qcom,eliza-qce', 'qcom,glymur-qce', 'qcom,kaanapali-qce', 'qcom,milos-qce', 'qcom,nord-qce', 'qcom,qcs615-qce', 'qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce', 'qcom,x1e80100-qce']
   	'qcom,qce' was expected
   	'qcom,ipq4019-qce' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
--
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk-imx577-camera.dtb: crypto@1b3a000 (qcom,shikra-qce): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk-imx577-camera.dtb: crypto@1b3a000 (qcom,shikra-qce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk-imx577-camera.dtb: crypto@1b3a000 (qcom,shikra-qce): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,shikra-qce', 'qcom,sm8150-qce', 'qcom,qce'] is too long
   	'qcom,crypto-v5.1' was expected
   	'qcom,crypto-v5.4' was expected
   	'qcom,shikra-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
   	'qcom,shikra-qce' is not one of ['qcom,eliza-qce', 'qcom,glymur-qce', 'qcom,kaanapali-qce', 'qcom,milos-qce', 'qcom,nord-qce', 'qcom,qcs615-qce', 'qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce', 'qcom,x1e80100-qce']
   	'qcom,qce' was expected
   	'qcom,ipq4019-qce' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
--
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtb: crypto@1b3a000 (qcom,shikra-qce): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtb: crypto@1b3a000 (qcom,shikra-qce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtb: crypto@1b3a000 (qcom,shikra-qce): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,shikra-qce', 'qcom,sm8150-qce', 'qcom,qce'] is too long
   	'qcom,crypto-v5.1' was expected
   	'qcom,crypto-v5.4' was expected
   	'qcom,shikra-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
   	'qcom,shikra-qce' is not one of ['qcom,eliza-qce', 'qcom,glymur-qce', 'qcom,kaanapali-qce', 'qcom,milos-qce', 'qcom,nord-qce', 'qcom,qcs615-qce', 'qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce', 'qcom,x1e80100-qce']
   	'qcom,qce' was expected
   	'qcom,ipq4019-qce' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
