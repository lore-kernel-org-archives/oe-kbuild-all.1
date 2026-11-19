Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087275;
	b=wWQZgCbYeGev3A4SOfBPLSV91q6082CjoNIX8jyIoEhX+lk7h8/eD/ZGzVQPG7dPRqIZ
	 f0ZXq4kj9lnAzpi4tbIudLm6FfJr+svgdVZxNPWa0mwnU45gNU/R9AqkusH84vNE5AKMT
	 ASznFtTS8Cr9JqLiqCMk9qnnPFAaht+0c86zSq8VHot03LP7kdbJs11Gq/WxVNCCgTmad
	 UcDd7TFP6dXjaUTlUVntDx5iQC1ZFtnhQibxibNB7j60MXqnVr+g5/ghD7yE2LbA80qgK
	 qALV6EqsmE5Yp5gn+zcquNMUw7D3yiWg+O+zZrBFr9KSt9sH+eF9QlQJ0CuLZSGTacA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087275;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rs/WCZDTzYteKnoXIrlLHLIS24y19yotFKn81Nik2RI=;
	b=LY1pIUMmR6SBiDpr7lnUYwa15aqwMtij5G3HXY3nAyZkTR7PjyhpQ4OeEzyzbV4D4mT5
	 WnwOyUOFKEgYgfK+nDlgGzXIOGyJuTHbTis4C34iF43JFFK5Ecp6K8dhLbNkrySIpNQ/C
	 DRdIv0o0KQssGk536jWeHdaIQnCY+cr184H+0BkA3zS6ZeE9qXfOoLjr6tM+m8L8TFe22
	 iKSs+Mv3QCR0/E11dTMaGOEu5d+b128yK+EgtfTCc8BDr6EkyEh/ZEoi87s/sY6ELWRBU
	 xG9QQNky8DO8ROWjPh9vN0ms38dotujrsv7JjRPSnlBhWa4AH1Vq6uOoFMa6pqMQOdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l3xz9P1F;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63425606A330
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 11:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63425606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l3xz9P1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795087275; x=1826623275;
  h=date:from:to:cc:subject:message-id;
  bh=fu9GyfTuxE+DS4g1it6wpmVlCQXAAk3SGbeWMw9ziXI=;
  b=l3xz9P1FBmop8B4ffSoqoZRZmO5yPOWyk3oRKjiqAt+uQKVXVnWuxZHR
   fgctSdIfpQTGl/w9jvPLQMC2NSoHAqd3pXLQLr8fULR1kakabnoIMi1FD
   ocCPTIHGfvTTidilkh0KHrOskLB6DyGptp6+KBqDQZ4yV3KYkt8QH7lf0
   wHa+FQcS0OBvg4BbF8Z7chP8uo4fX/RjSyaIHQ4AUOpnf6tyWIhcW/b96
   CzlgFd0UFdAlelOJAW22CeLfmzajZliXdvzuIZsFUCpTPeE6itz10QItJ
   M0Bqfhyi+auIzXY1BkYHNirP9tyVLxSWCcEOgdtou10CHsX6+RHcdnfX9
   A==;
X-CSE-ConnectionGUID: h6EhxuyYQXGaxnCR4iQhBA==
X-CSE-MsgGUID: NNMWzD1ZSCWg3Slx099ccQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3961893"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3961893"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 03:21:14 -0800
X-CSE-ConnectionGUID: kY3FVk9FT6yknB0P+tVpLw==
X-CSE-MsgGUID: iHPGeomnTqChuGlIg5Rmrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="12362412"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 19 Nov 2026 03:21:12 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU0CU-000000003lF-1BfN;
	Thu, 19 Nov 2026 11:21:10 +0000
Date: Thu, 19 Nov 2026 12:20:57 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 152/152]
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: video-codec@aa00000
 (qcom,sm8250-venus): power-domain-names: ['venus', 'vcodec0', 'mx', 'mmcx']
 is too long
Message-ID: <20261119121822.ucjpPic7-lkp@intel.com>
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
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261119/20261119121822.ucjpPic7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119121822.ucjpPic7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119121822.ucjpPic7-lkp@intel.com/

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
