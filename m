Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881011AF6BE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 16:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718900957; cv=none; b=OZLKUNAw17PyPCW9gmoTa/70NVdfAdq4ooKcoPfdtvzyANt/MOiMZDjE1eefKd6yejKZRHkwvzlGA6O2JHisTdk8oliob0Tks3i3IIJqZB+5BkcARzL9Qz7fDtuls92YAM3rw68XFgerKEoYmrvxwvYX/AQIy/1+umHgUmgQxoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718900957; c=relaxed/simple;
	bh=ORMUU3U2mo5R6IWa5RO01868M8k1Zlq1n5ypSyQhzKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DigSrxWuW369e/4roUn1DS6H7i+9i5fq5BeqhzPwoSg8NudJxnCPERBoeOeh0gtkhffWMDYokLTUsXlgeWhwOB73qK9ACv/Ss3RIfWQa2a9mQQWZ5XpnXuAPE3ZVmP3KN3ffr9tFoAhz8jIubfVh1MBTw4if6QfDQRuH6tUIZGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nlmgDukN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nlmgDukN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718900956; x=1750436956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ORMUU3U2mo5R6IWa5RO01868M8k1Zlq1n5ypSyQhzKs=;
  b=nlmgDukN0vfNZvNNgzlI061P37MamkqX3No6bMvZbs/I4pK38i0g++IU
   5Q+9FjrJ0ZRyU3gY1CMlB5OK+TauHWoAAvtDG+KhRQV+f996nynv6V5K9
   1LVOUJH7kj2OS+bwfWMUXL23efQOLnzF6DYLEQbGaWlx7q5mAffpoo3S3
   idXzsm+RYjtc1V1K+BKZ60oLPffUMQC2Hs+iH2NKxDnzsVcyHSd+mtHxp
   QfG/Q1UrL41z4uWIXsCP0dCPC//ACvpS1qtXiWmjT1gQUonIGPaZAbR/t
   ovhRNyNWpppaLtWob0jC7SdvJwNlQ/dVvQ6ErBIhvfeq5Qk72HKuM6D6N
   w==;
X-CSE-ConnectionGUID: Pnae7no2RsexXiaMspcThQ==
X-CSE-MsgGUID: Jl2NPIrwQlW05FKuKR9Jww==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19773063"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="19773063"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 09:29:15 -0700
X-CSE-ConnectionGUID: dy0w0PSTQgKgNWRU6g6AqQ==
X-CSE-MsgGUID: 2Kdjj/hqQbucrjK3ii9tFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="73033101"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jun 2024 09:29:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKKes-0007ky-2J;
	Thu, 20 Jun 2024 16:29:10 +0000
Date: Fri, 21 Jun 2024 00:28:37 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-bsp/v6.1.94-2024-06-20 177/676]
 arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb:
 /soc/i2c@e6510000/i2c-mux@71/i2c@7/audio-codec@44: failed to match any
 schema with compatible: ['ti,pcm3168a']
Message-ID: <202406210035.ag62hCvj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.94-2024-06-20
head:   d0503e6510818ad3d8f152b7825e5110b81d8f7c
commit: 25b834b52bc2a786b5d268be3f66bfea36efd68d [177/676] arm64: dts: renesas: ulcb-kf: Fix pca9548 i2c-mux node names
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240621/202406210035.ag62hCvj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210035.ag62hCvj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210035.ag62hCvj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a77951.dtsi:2770.25-2795.5: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
   arch/arm64/boot/dts/renesas/r8a77951.dtsi:2797.25-2822.5: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
   arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: codec@10: 'port' does not match any of the regexes: '^asahi-kasei,in[1-2]-single-end$', '^asahi-kasei,out[1-6]-single-end$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/ak4613.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: /soc/i2c@e6510000/i2c-mux@71/i2c@7/audio-codec@44: failed to match any schema with compatible: ['ti,pcm3168a']
   arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: sound@ec500000: ports:port@0:endpoint: Unevaluated properties are not allowed ('capture', 'playback' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: sound@ec500000: ports:port@1:endpoint: Unevaluated properties are not allowed ('playback' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: sound@ec500000: ports:port@2:endpoint: Unevaluated properties are not allowed ('playback' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
   arch/arm64/boot/dts/renesas/r8a77951.dtsi:2770.25-2795.5: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
   arch/arm64/boot/dts/renesas/r8a77951.dtsi:2797.25-2822.5: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
   arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: codec@10: 'port' does not match any of the regexes: '^asahi-kasei,in[1-2]-single-end$', '^asahi-kasei,out[1-6]-single-end$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/ak4613.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: /soc/i2c@e6510000/i2c-mux@71/i2c@7/audio-codec@44: failed to match any schema with compatible: ['ti,pcm3168a']
   arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: sound@ec500000: ports:port@0:endpoint: Unevaluated properties are not allowed ('capture', 'playback' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: sound@ec500000: ports:port@1:endpoint: Unevaluated properties are not allowed ('playback' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: sound@ec500000: ports:port@2:endpoint: Unevaluated properties are not allowed ('playback' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
   arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: codec@10: 'port' does not match any of the regexes: '^asahi-kasei,in[1-2]-single-end$', '^asahi-kasei,out[1-6]-single-end$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/ak4613.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: /soc/i2c@e6510000/i2c-mux@71/i2c@7/audio-codec@44: failed to match any schema with compatible: ['ti,pcm3168a']
   arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: sound@ec500000: ports:port@0:endpoint: Unevaluated properties are not allowed ('capture', 'playback' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: sound@ec500000: ports:port@1:endpoint: Unevaluated properties are not allowed ('playback' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: sound@ec500000: ports:port@2:endpoint: Unevaluated properties are not allowed ('playback' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
   arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: codec@10: 'port' does not match any of the regexes: '^asahi-kasei,in[1-2]-single-end$', '^asahi-kasei,out[1-6]-single-end$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/ak4613.yaml#
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: /soc/i2c@e6510000/i2c-mux@71/i2c@7/audio-codec@44: failed to match any schema with compatible: ['ti,pcm3168a']
   arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: sound@ec500000: ports:port@0:endpoint: Unevaluated properties are not allowed ('capture', 'playback' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: sound@ec500000: ports:port@1:endpoint: Unevaluated properties are not allowed ('playback' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: sound@ec500000: ports:port@2:endpoint: Unevaluated properties are not allowed ('playback' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
   arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: codec@10: 'port' does not match any of the regexes: '^asahi-kasei,in[1-2]-single-end$', '^asahi-kasei,out[1-6]-single-end$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/ak4613.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: /soc/i2c@e6510000/i2c-mux@71/i2c@7/audio-codec@44: failed to match any schema with compatible: ['ti,pcm3168a']
   arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: sound@ec500000: ports:port@0:endpoint: Unevaluated properties are not allowed ('capture', 'playback' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: sound@ec500000: ports:port@1:endpoint: Unevaluated properties are not allowed ('playback' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: sound@ec500000: ports:port@2:endpoint: Unevaluated properties are not allowed ('playback' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: codec@10: 'port' does not match any of the regexes: '^asahi-kasei,in[1-2]-single-end$', '^asahi-kasei,out[1-6]-single-end$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/ak4613.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: /soc/i2c@e6510000/i2c-mux@71/i2c@7/audio-codec@44: failed to match any schema with compatible: ['ti,pcm3168a']
   arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: sound@ec500000: ports:port@0:endpoint: Unevaluated properties are not allowed ('capture', 'playback' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: sound@ec500000: ports:port@1:endpoint: Unevaluated properties are not allowed ('playback' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: sound@ec500000: ports:port@2:endpoint: Unevaluated properties are not allowed ('playback' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
