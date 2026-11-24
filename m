Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506644;
	b=OCpWCe3eB0NCVzEAOxozraHEUJX6CKVwOn3aFKKzhEZTaLhN2XUZHCkEf7BsQesVP5C8
	 9q9D4DbK3L3UkjvtTWpvPt3Xe4sEArCHnSI0w56Z1xez5K6hdfsbEBtLTeLvhbxoOfG0c
	 2kiAIeWGts7zL/4VZjFXwycd5xfgdmaHef/WERLug59gnG1GnUR/BrMBmZeo+7yQzjxsh
	 0aqDzRWr1OsZj8coTMuqDExqhAR8mr2EHo1jSwg31fU/Iw1BnoJ4PIseiZ960Ut6N1PKT
	 qpqxawrXlyuRbEeaV+YwEs3NkQX90JWzWlm/Gw3BZ9vpUEotu1Alr+/hBsaiTmL0oWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506644;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8hJbvQodi1y2J/rpsbmuApwZ7AhBXU5z5CQvzoVM7Pg=;
	b=oWcNdJDnhkr5+2Xe/J7SoKP20xMbpThR3DAaV4xGfn0NXV+4KmzS9IaCPSku6vphWDQp
	 URI92YeDJX6az5yGhcZpSe8up8Mv9Y5sx1/IMiDtWAuh7auFeX1J9XPiLj8+iFnRE9qaS
	 HcC5mEc+ivzGdC0jUgmOZD2Z5MrCx83gSbYye00X/ZwB5eNTrQqTd0lPCb5fSEB0zguYZ
	 Mn/e8y4xz870yA/icvOW8H1anfWu6/5I1AZVEalYLvXQ3NprV074ZMbHZg9xm3wpXUtSx
	 QzSgwezvvxFaaYO1StyKswhcHmY6stykrpEj17lQ2D8O7U0YwQ63O7uojO0N69ji4tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VLjWU3jP;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67387606A321
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Nov 2026 07:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67387606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VLjWU3jP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795506643; x=1827042643;
  h=date:from:to:cc:subject:message-id;
  bh=Yqt2cK+u6yk7kY7I3nxIM2rlPWksUNt4JBIHAElzKF4=;
  b=VLjWU3jPmIcU59W/k+hMe3oN93BgOCKaVY/10yXRDsFPe/YS5VUmeyTM
   zLGWMl1pnjCW72R3gnI7F6SKFJSB4ewmb3wjszPjko7Bov3wmFILHLx1X
   7cFjoij+jgrttNjyqknl1K7EZYtLsF2fBClRGfI3cEaXHmFfFkjbKIfsc
   VFSOJwsJ0VBtM8c8gwbcoQ8YtDBjx4p75Vuy5kMDB2xrfkXR5hM3dJsV6
   IcV0a2vUeZq9u5JvXC4AMM9Fh2QPebVV/G3OerJe1vcWAyyEUTm3JyNA4
   7HpV2mEfpSJ/HDsN+6qzZfwnOK52sRgZHwbbDhPYiaumYFuhJ0mPk8Mwg
   g==;
X-CSE-ConnectionGUID: zXQnXaHyTWi41V46MsOVPA==
X-CSE-MsgGUID: 8pw0rBnjTVCSDccYuv/DkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4177534"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4177534"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 23:27:07 -0800
X-CSE-ConnectionGUID: o4twOIuER1GHioQxVtk53w==
X-CSE-MsgGUID: vfYGzhyGRx+oTo0j6Eurrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="13285794"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 23 Nov 2026 23:25:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVku2-0000000059X-34Q7;
	Tue, 24 Nov 2026 07:25:22 +0000
Date: Tue, 24 Nov 2026 08:24:41 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 152/152]
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: video-codec@aa00000
 (qcom,sm8250-venus): power-domain-names: ['venus', 'vcodec0', 'mx', 'mmcx']
 is too long
Message-ID: <20261124081654.MSrl9HWf-lkp@intel.com>
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
head:   c55001a4a6a693873506dad52483486c04bf2c1e
commit: 152a20d3b2f1bb5aadaf4eb9e2b26a51743324a2 [152/152] arm64: dts: qcom: sm8250: sort out Iris power domains
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261124/20261124081654.MSrl9HWf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124081654.MSrl9HWf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261124081654.MSrl9HWf-lkp@intel.com/

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
