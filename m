Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182113;
	b=0RWV2Df77AhYszcVvBdQRVMuv4xSbgPaEPJetSqbnlJErbVKrKOuliqyrPZfXJxYFP3G
	 DSIZnUzfhi40vxatgHLC225gAAJSe/UrPDeAhUJ4/DchweHU3t04oAzDt+Y/MBaIEerio
	 +yMnrDzn75QC5XpxUZyrsYxAKaiLeujneWJHlWu0Pi5Ea5zK9gnvH6Xo3+aAK8jAEL+O6
	 uj6jJZGw3J/DSmOohvqSXvGGjLtiB6KUy0+AP02B9wPuub5yoOz1gj0g6/NoDautWLW8X
	 OSqjamckTzPhrX19FxNzBTq+B1X+gW9FrC0Qbg6X1FpboWvvkxTOFhVEvFr/m7+nOsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182113;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AjgkjbzBrJXPnJfR9IA1QFPC0/yl7MV2Y5lKlmRI0gc=;
	b=YSaJ/WLQ5bbfR/h/BmWIMXappq6KQ/myMIirXhsSPhD+j6txNwDwo88EG5rHsWBya86N
	 vdtVS4iHNJWBbDzHy68X88RGG1xISm0/YEi3yvEmTutBEa9pw3brNKUCQ2aCW9/CxycWZ
	 RujeM5n56zAG3QpaeVZTt7lQ0G30WiiZhDBdEi3x0scNGnioHHxPpXjc0PDY3GdPMHbYl
	 OMtko0mwC2D+X0OwL02VtpaKM28gbHlshzr1p+osTZs7xujczYSmb67lobkX6wMKi/7md
	 lKh1uYRFcU8S+C1FAQFEKfbxXvl1RIlEhKv3K/D/HHrRc//2jyHRgQdc37/nqqz2hmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MGqMYN2G;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0767606A32A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 13:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0767606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MGqMYN2G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795182113; x=1826718113;
  h=date:from:to:cc:subject:message-id;
  bh=WP5yvALvoVbvaT4wNZMxOadpBOnuGGKsNe02w57iSMk=;
  b=MGqMYN2GcgShTJVSxZgfzxOCG27QT2czHa5BVOMPwxnujhE5S1dpoM2H
   UVmfj21Cch/jJl1tSUz/W05/HoR6n7ZlOIzfOi74A4UTg7AfPEN8qOb4Y
   gIw1ivEV5E8lgDF/jYFCFesxeKnuVwbVE4iIpNeIIjKkwgxVqIXusG3th
   TctGuIv1rZrhee9cVIR6wHwVM9DLcfCqP/ZQ6HQXuFMm3FT/L3CnOC2Zo
   3M2Jpj0KHZPSyVNMbzTkR8nPLAU6V8XKtOoQfkGqFnMqI1HrtXXdZeDlA
   wl9PQ5wofWeyrmtJzXPBW/ioflJRGyPwX6ir2lxPSaeBhv3tUA/cOem5o
   A==;
X-CSE-ConnectionGUID: e9en3hAbTlSWyLY0ZHgpMA==
X-CSE-MsgGUID: p+kTDghKTC2nIdOn955V7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3943827"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3943827"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 05:41:52 -0800
X-CSE-ConnectionGUID: P1FirXNMSZeJA/SO3sRQPg==
X-CSE-MsgGUID: QKOtdoIaSSGXURTq0aWCPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10992740"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 20 Nov 2026 05:41:51 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUOs8-0000000042b-2Sv7;
	Fri, 20 Nov 2026 13:41:48 +0000
Date: Fri, 20 Nov 2026 14:41:04 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 152/152]
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: video-codec@aa00000
 (qcom,sm8250-venus): power-domain-names: ['venus', 'vcodec0', 'mx', 'mmcx']
 is too long
Message-ID: <20261120143709.3JGP5zDs-lkp@intel.com>
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
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261120/20261120143709.3JGP5zDs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120143709.3JGP5zDs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120143709.3JGP5zDs-lkp@intel.com/

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
