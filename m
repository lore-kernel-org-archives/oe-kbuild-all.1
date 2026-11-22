Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795387349;
	b=PMHKb3EsJJYUOul6aeKKpKNB23g/pJIZ4JGEigybdK61Z/jogKZ4tCiJksg+VRSRI/NN
	 fCFpfF/Y11fTBUIXX4L7ukzoT07UJggO5eFXvhRuS9GjOL/X+Lch+Eblfcvn2+TlvPREZ
	 SjieDd0oCvmUwMi5cZhybAO7U9D/MZPhXyOFy6vTrDWXW9tZ7s6SaV2b9l56tWi6semsn
	 K/mZeSDwhc5bkUOPLhjccS9lAjPk4ZtvJLLOITxXedsH3CJXgKmmxL3/Vz5PMPfhdgNSD
	 RMPZBWf89L7+v+7KyxplTySX/3H94wLPHj0SPMOQCMClRxMF8q+KPTumdAh/EeQFwbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795387349;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mqnJPlU3KtxeK0Ta1jGakpkAMgtu3SASmNWG8m/+CzA=;
	b=p5LYR/zKFNN2pbWjqwVMvm1Em2OuBklsf87fe/uGSlUpt4Q7pNa+j1tdz9byisi1Hoit
	 sa8VxX+9Hxc+8xaGjywjKjiqtrlMXrWWWaJVA4pgPvrDujGrvzchNsbAIJmR41wEFTZOJ
	 mUtpJOro1w4f2QteG4peXEGCVMGED1PDT5CyDg2iGq0jzybv3RhdrRG5F+uluaY4c+5U1
	 mr7UQLhSrfN3WHvVnctireG3ppgVpcN4qU84BcxX0QxPowfFHFTPIvOOv1BEJQkGNhD9l
	 vtS5WKANzRVlnooIV3UPlp5a52FKBGi+d5nA3GOSV4OaUtd4yxBwCm5fn1ZP6YFMssw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nZNl2yR4;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7298B606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Nov 2026 22:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7298B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nZNl2yR4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795387349; x=1826923349;
  h=date:from:to:cc:subject:message-id;
  bh=ri3fCMZuw8/qUqsL58jgMnefLjc27C60jogFdYb+EeY=;
  b=nZNl2yR4ahPzI3q94kBfekQ8/gPSGk0uBMOkgj34KNpRT+pYYFS7L95w
   SLW6W+gSUVJrKE5PlkB3aeKFIOwHZb4JYCdI38qO72yVpeBORb3nt0Vs5
   NFPNCxAjYXE6AtifUDEdwMLLeUH2FfLRlKtYCzt3WgF11dIEm++B5VDuF
   NR82g8LYRv+yB8BxEE2+zglTfhmCHRl1XzLsTrJEL6PSrQjA68cKdojAS
   NYUZTcSt4wPbIlnu7Q1cqWHp87OVIh/Xsbuui6MkXs6QpDrBH3L4gfPV8
   L+y6wKXwSYJjU1o+fa4kjNGLkooATWJ8ip5X2ZZRbO1zmhZqevhmS+2cV
   A==;
X-CSE-ConnectionGUID: AI7Z7JN5RFCRgCN821hYFg==
X-CSE-MsgGUID: 1juVH2OiSRW8B87zBpZpbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4099810"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4099810"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 14:42:28 -0800
X-CSE-ConnectionGUID: rDrTx4stRzGFft04qyChIw==
X-CSE-MsgGUID: gfMZ9ql5TbSXbTaw/lUuBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11719434"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2026 14:42:26 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVGGO-000000004cY-0JN3;
	Sun, 22 Nov 2026 22:42:24 +0000
Date: Sun, 22 Nov 2026 23:41:26 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 152/152]
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: video-codec@aa00000
 (qcom,sm8250-venus): power-domain-names: ['venus', 'vcodec0', 'mx', 'mmcx']
 is too long
Message-ID: <20261122233933.y7XaucAb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: 152a20d3b2f1bb5aadaf4eb9e2b26a51743324a2 [152/152] arm64: dts: qcom: sm8250: sort out Iris power domains
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261122/20261122233933.y7XaucAb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122233933.y7XaucAb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261122233933.y7XaucAb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: cpu@300 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: cpu@400 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: cpu@500 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: cpu@600 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: cpu@700 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domain-names: ['venus', 'vcodec0', 'mx', 'mmcx'] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domains: [[218, 0], [218, 2], [52, 8], [52, 6]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml
--
   arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: cpu@300 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: cpu@400 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: cpu@500 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: cpu@600 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: cpu@700 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domain-names: ['venus', 'vcodec0', 'mx', 'mmcx'] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domains: [[218, 0], [218, 2], [52, 8], [52, 6]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml
--
   arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: cpu@300 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: cpu@400 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: cpu@500 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: cpu@600 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: cpu@700 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domain-names: ['venus', 'vcodec0', 'mx', 'mmcx'] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domains: [[186, 0], [186, 2], [52, 8], [52, 6]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml
--
   arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: cpu@300 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: cpu@400 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: cpu@500 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: cpu@600 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: cpu@700 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domain-names: ['venus', 'vcodec0', 'mx', 'mmcx'] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domains: [[186, 0], [186, 2], [52, 8], [52, 6]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml
--
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: cpu@300 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x04\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: cpu@400 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x04\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: cpu@500 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x04\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: cpu@600 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x04\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: cpu@700 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x04\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domain-names: ['venus', 'vcodec0', 'mx', 'mmcx'] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domains: [[198, 0], [198, 2], [53, 8], [53, 6]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml
--
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: cpu@300 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x04\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: cpu@400 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x04\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: cpu@500 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x04\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: cpu@600 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x04\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: cpu@700 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x04\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domain-names: ['venus', 'vcodec0', 'mx', 'mmcx'] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domains: [[194, 0], [194, 2], [53, 8], [53, 6]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml
--
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: cpu@300 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: cpu@400 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: cpu@500 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: cpu@600 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: cpu@700 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domain-names: ['venus', 'vcodec0', 'mx', 'mmcx'] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domains: [[189, 0], [189, 2], [52, 8], [52, 6]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml
--
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: cpu@300 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: cpu@400 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: cpu@500 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: cpu@600 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: cpu@700 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domain-names: ['venus', 'vcodec0', 'mx', 'mmcx'] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domains: [[189, 0], [189, 2], [52, 8], [52, 6]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml
--
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: cpu@300 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: cpu@400 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: cpu@500 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: cpu@600 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: cpu@700 (qcom,kryo485): qcom,freq-domain: b'\x00\x00\x00\x02\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domain-names: ['venus', 'vcodec0', 'mx', 'mmcx'] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: video-codec@aa00000 (qcom,sm8250-venus): power-domains: [[190, 0], [190, 2], [52, 8], [52, 6]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
