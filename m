Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560726;
	b=BBFbAhGygyFNdgBcQZ/XCnvNI2zqbWiRFoBwuV6OzXt0p6T6tvoDH4AYp4xricG7cxr8
	 l/9A+UBaF6dAVfc5XGOyPTnu9pHjwLC4jfmLcC/XibkHi6Od7nHF74uRoCQzDKgtNgnXH
	 GOJ/5o/qGUJplM3PxNeJJUNBtAKPW2lBJNZ4JEzX/Vra661AqjERTVFZuZF/ZJQ8OXBxB
	 exMMNHaF5UFlxEayc8WokIQce6gGtXK9K9D3j7cUvdOl+BeFksp348sY6kuAAzi/W4xMD
	 ZONk9ectlsGMbrKIMVcBXmTrn1g5WVYscDSTo6NyGyVvjKk5r8vzjMKD7CFHWyYwX4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560726;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Hg+YnZMgNkkMxql5AMytox/TcrFvLQ1USzg+SVbRJDo=;
	b=s28bo3JDV5Hqq8BNLlhpZo07/3QC0DjLQ29iyws5vGhtku9AgIyXQy83RMuWB3manMS5
	 xja5HKRLmoFcu+LGyaT89Zg4UUeJq6jH1sF1SWRYIeBJGIJuUQBNd9KnWBVOYM8QuEbEP
	 BegwArF87SqH26vkiMdF3EhFwyGL11/SxFHXOFAakDgCRz9DJpS2P9AZ1GHfIxoDUhK97
	 Qh/T4V5+lPlyOl0uZ5WfEAPnVYkrmDO1iyOEuj7SJFNLlTwF6siMXJMhr8zAcvMmsUrdD
	 1GnFAoq8tiYHbC3UIu9xkLu5aDDVLi5nU+1lLkf5yMvCH1HCY1K0S8oqHbDgbSk655A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QO1mou8G;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9A1606A321
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Nov 2026 22:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A9A1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QO1mou8G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795560726; x=1827096726;
  h=date:from:to:cc:subject:message-id;
  bh=zFl+zK8nekjgE0Vws5YG30WXIdcEQ2BjWWitnTR0vvk=;
  b=QO1mou8Gqy84aa0zV7Db0IyWgyEXargIo2giQnUAoXhDksQOA2EekvN4
   /AnM+ZXlT/bsNQCyKWjwAEDih3vEAyhl7NBRj+KRjuR+rOU2MKmxe+Uzw
   cBOHlq2TEZr9qzSTyHof9aY7NBX3mbQZjQmj/6a0dtpAphJw+/sZaMvFN
   eDsGwtazk3fPEitAzUx0DLnDL7Iwv2dBSQF/i7dtECEVZ9kSwpsl1AvuZ
   3kmkQG3Jz4dvgM+U1iODJ5CCxNQU5yn5CripDLlLO6fgPoINmfoqVek6P
   9/C3MARLSPp43qkE964l5Rw1fhh7FLTCMyJaeMltDzQqNyJenN7j07Wwm
   w==;
X-CSE-ConnectionGUID: HfWwpDvBTwaEIIcneEfiLA==
X-CSE-MsgGUID: 5eNTJV/9T5WId6ZN7uggHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4308401"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4308401"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 14:52:04 -0800
X-CSE-ConnectionGUID: t4zj6FAsTxawHo8AcZwTWA==
X-CSE-MsgGUID: PQHa4ZdWQJG5jrctRrHrQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="12152061"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 24 Nov 2026 14:52:02 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVzMl-000000005Jh-1Oda;
	Tue, 24 Nov 2026 22:51:59 +0000
Date: Tue, 24 Nov 2026 23:51:58 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 152/152]
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: video-codec@aa00000
 (qcom,sm8250-venus): power-domain-names: ['venus', 'vcodec0', 'mx', 'mmcx']
 is too long
Message-ID: <20261124234854.7NlkVqz9-lkp@intel.com>
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
head:   58f2449a557a99270b15eb9841152be2ead76472
commit: 152a20d3b2f1bb5aadaf4eb9e2b26a51743324a2 [152/152] arm64: dts: qcom: sm8250: sort out Iris power domains
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261124/20261124234854.7NlkVqz9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124234854.7NlkVqz9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261124234854.7NlkVqz9-lkp@intel.com/

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
