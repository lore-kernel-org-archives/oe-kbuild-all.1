Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B0C24A07C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 07:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448958; cv=none; b=OYQaFstOvZtSpwXqI7CRXGSRnupFLaPfRr0DQMy0yY5wOXfhPpRsu9CgVv1wWG0yGxbvf0LgV7cb4QjgOnXfMkOXQqkFMzs8Pxym8j7zyf4TBTMLj7IpgiO3pcj1WRUmfOAwYamO3NCCuzh8xWe+DKQhWDSEbtB8nAU71uUsFko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448958; c=relaxed/simple;
	bh=Ls70bc1BDRiK3+aI3NL6HyWMKp8I8CB7Ky9HFk37fY0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uN8TigUobC5JqMWS+7wXb0ERyzD2HFadf8hkIOVCBHu8sYc0KEaD6UH/QMC0OU5fUJ27aZ68wLqAVsbpzbzVqudYIlKc50xDDekwhF/jYjvYYH3vsRK4Xq95NlVOt0SVa5ldIzJYvFdW6xqf8kvuCbrW0K6M+lNTpcQHZxByw+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFUi4gHp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFUi4gHp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777448957; x=1808984957;
  h=date:from:to:cc:subject:message-id;
  bh=Ls70bc1BDRiK3+aI3NL6HyWMKp8I8CB7Ky9HFk37fY0=;
  b=LFUi4gHpSY40AJjXRjSsT+7u2nUQVZANbc0EX718aFP/BrtBzUyosbGM
   k5PEdJUytcO3v53mzlr4xWYoC58b8ao7aXWSIiOkNgtrF7VrEwQZd3LyP
   1AJ8g3z0z5kWv/qZxYkxymSXlilBDoU9LekpSUP8UMoeW794ZBoscFqA0
   zrXI5A98Q3wc8bgc3NIEehq313j22m6E26f/7eYdv9+HxyJQfNEo81Hkh
   MCeiJ1RkBAkzWbn7hNtyKdF69rpiKlYo4Yh898s14g2Dj3I7a4Vw3oxFt
   6wi+y7MU48Oq2ANkhcU6BHQKJEXcSNMnYho14vYu/X01Nk8r778sxB+eJ
   g==;
X-CSE-ConnectionGUID: ytuFez9mTHiOmsYMhhWTQQ==
X-CSE-MsgGUID: tIj1b0t8SlegDNvgxVQarw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78430261"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="78430261"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 00:49:16 -0700
X-CSE-ConnectionGUID: bT7BxdbES2usyStk8SSWEA==
X-CSE-MsgGUID: cdJ3yFv1Q4KjkWNJjvBfMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="234060349"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 29 Apr 2026 00:49:14 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHzfQ-000000004SN-2iNV;
	Wed, 29 Apr 2026 07:49:08 +0000
Date: Wed, 29 Apr 2026 09:48:45 +0200
From: kernel test robot <lkp@intel.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Subject: [linux-next:master 1033/1887]
 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: timer@10001200
 (renesas,r9a07g044-mtu3): interrupt-names: ['tgia0', 'tgib0', 'tgic0',
 'tgid0', 'tciv0', 'tgie0', 'tgif0', 'tgia1', 'tgib1', 'tciv1', 'tciu1',
 'tgia2', 'tgib2', 'tciv2', 'tciu2', 'tgia3', '...
Message-ID: <202604290921.6v5S7ygG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9974969c14031a097d6b45bcb7a06bb4aa525c40
commit: 6afd8c292d678091d3ba873295cddc1d0502f476 [1033/1887] dt-bindings: timer: renesas,rz-mtu3: Remove TCIU8 interrupt
config: arm64-randconfig-2055-20260427 (https://download.01.org/0day-ci/archive/20260429/202604290921.6v5S7ygG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604290921.6v5S7ygG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604290921.6v5S7ygG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: timer@10001200 (renesas,r9a07g044-mtu3): interrupt-names: ['tgia0', 'tgib0', 'tgic0', 'tgid0', 'tciv0', 'tgie0', 'tgif0', 'tgia1', 'tgib1', 'tciv1', 'tciu1', 'tgia2', 'tgib2', 'tciv2', 'tciu2', 'tgia3', 'tgib3', 'tgic3', 'tgid3', 'tciv3', 'tgia4', 'tgib4', 'tgic4', 'tgid4', 'tciv4', 'tgiu5', 'tgiv5', 'tgiw5', 'tgia6', 'tgib6', 'tgic6', 'tgid6', 'tciv6', 'tgia7', 'tgib7', 'tgic7', 'tgid7', 'tciv7', 'tgia8', 'tgib8', 'tgic8', 'tgid8', 'tciv8', 'tciu8'] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: timer@10001200 (renesas,r9a07g044-mtu3): interrupts: [[0, 170, 1], [0, 171, 1], [0, 172, 1], [0, 173, 1], [0, 174, 1], [0, 175, 1], [0, 176, 1], [0, 177, 1], [0, 178, 1], [0, 179, 1], [0, 180, 1], [0, 181, 1], [0, 182, 1], [0, 183, 1], [0, 184, 1], [0, 185, 1], [0, 186, 1], [0, 187, 1], [0, 188, 1], [0, 189, 1], [0, 190, 1], [0, 191, 1], [0, 192, 1], [0, 193, 1], [0, 194, 1], [0, 195, 1], [0, 196, 1], [0, 197, 1], [0, 198, 1], [0, 199, 1], [0, 200, 1], [0, 201, 1], [0, 202, 1], [0, 203, 1], [0, 204, 1], [0, 205, 1], [0, 206, 1], [0, 207, 1], [0, 208, 1], [0, 209, 1], [0, 210, 1], [0, 211, 1], [0, 212, 1], [0, 213, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dtb: timer@10001200 (renesas,r9a07g044-mtu3): interrupt-names: ['tgia0', 'tgib0', 'tgic0', 'tgid0', 'tciv0', 'tgie0', 'tgif0', 'tgia1', 'tgib1', 'tciv1', 'tciu1', 'tgia2', 'tgib2', 'tciv2', 'tciu2', 'tgia3', 'tgib3', 'tgic3', 'tgid3', 'tciv3', 'tgia4', 'tgib4', 'tgic4', 'tgid4', 'tciv4', 'tgiu5', 'tgiv5', 'tgiw5', 'tgia6', 'tgib6', 'tgic6', 'tgid6', 'tciv6', 'tgia7', 'tgib7', 'tgic7', 'tgid7', 'tciv7', 'tgia8', 'tgib8', 'tgic8', 'tgid8', 'tciv8', 'tciu8'] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dtb: timer@10001200 (renesas,r9a07g044-mtu3): interrupts: [[0, 170, 1], [0, 171, 1], [0, 172, 1], [0, 173, 1], [0, 174, 1], [0, 175, 1], [0, 176, 1], [0, 177, 1], [0, 178, 1], [0, 179, 1], [0, 180, 1], [0, 181, 1], [0, 182, 1], [0, 183, 1], [0, 184, 1], [0, 185, 1], [0, 186, 1], [0, 187, 1], [0, 188, 1], [0, 189, 1], [0, 190, 1], [0, 191, 1], [0, 192, 1], [0, 193, 1], [0, 194, 1], [0, 195, 1], [0, 196, 1], [0, 197, 1], [0, 198, 1], [0, 199, 1], [0, 200, 1], [0, 201, 1], [0, 202, 1], [0, 203, 1], [0, 204, 1], [0, 205, 1], [0, 206, 1], [0, 207, 1], [0, 208, 1], [0, 209, 1], [0, 210, 1], [0, 211, 1], [0, 212, 1], [0, 213, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: timer@10001200 (renesas,r9a07g044-mtu3): interrupt-names: ['tgia0', 'tgib0', 'tgic0', 'tgid0', 'tciv0', 'tgie0', 'tgif0', 'tgia1', 'tgib1', 'tciv1', 'tciu1', 'tgia2', 'tgib2', 'tciv2', 'tciu2', 'tgia3', 'tgib3', 'tgic3', 'tgid3', 'tciv3', 'tgia4', 'tgib4', 'tgic4', 'tgid4', 'tciv4', 'tgiu5', 'tgiv5', 'tgiw5', 'tgia6', 'tgib6', 'tgic6', 'tgid6', 'tciv6', 'tgia7', 'tgib7', 'tgic7', 'tgid7', 'tciv7', 'tgia8', 'tgib8', 'tgic8', 'tgid8', 'tciv8', 'tciu8'] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: timer@10001200 (renesas,r9a07g044-mtu3): interrupts: [[0, 170, 1], [0, 171, 1], [0, 172, 1], [0, 173, 1], [0, 174, 1], [0, 175, 1], [0, 176, 1], [0, 177, 1], [0, 178, 1], [0, 179, 1], [0, 180, 1], [0, 181, 1], [0, 182, 1], [0, 183, 1], [0, 184, 1], [0, 185, 1], [0, 186, 1], [0, 187, 1], [0, 188, 1], [0, 189, 1], [0, 190, 1], [0, 191, 1], [0, 192, 1], [0, 193, 1], [0, 194, 1], [0, 195, 1], [0, 196, 1], [0, 197, 1], [0, 198, 1], [0, 199, 1], [0, 200, 1], [0, 201, 1], [0, 202, 1], [0, 203, 1], [0, 204, 1], [0, 205, 1], [0, 206, 1], [0, 207, 1], [0, 208, 1], [0, 209, 1], [0, 210, 1], [0, 211, 1], [0, 212, 1], [0, 213, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: timer@10001200 (renesas,r9a07g054-mtu3): interrupt-names: ['tgia0', 'tgib0', 'tgic0', 'tgid0', 'tciv0', 'tgie0', 'tgif0', 'tgia1', 'tgib1', 'tciv1', 'tciu1', 'tgia2', 'tgib2', 'tciv2', 'tciu2', 'tgia3', 'tgib3', 'tgic3', 'tgid3', 'tciv3', 'tgia4', 'tgib4', 'tgic4', 'tgid4', 'tciv4', 'tgiu5', 'tgiv5', 'tgiw5', 'tgia6', 'tgib6', 'tgic6', 'tgid6', 'tciv6', 'tgia7', 'tgib7', 'tgic7', 'tgid7', 'tciv7', 'tgia8', 'tgib8', 'tgic8', 'tgid8', 'tciv8', 'tciu8'] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: timer@10001200 (renesas,r9a07g054-mtu3): interrupts: [[0, 170, 1], [0, 171, 1], [0, 172, 1], [0, 173, 1], [0, 174, 1], [0, 175, 1], [0, 176, 1], [0, 177, 1], [0, 178, 1], [0, 179, 1], [0, 180, 1], [0, 181, 1], [0, 182, 1], [0, 183, 1], [0, 184, 1], [0, 185, 1], [0, 186, 1], [0, 187, 1], [0, 188, 1], [0, 189, 1], [0, 190, 1], [0, 191, 1], [0, 192, 1], [0, 193, 1], [0, 194, 1], [0, 195, 1], [0, 196, 1], [0, 197, 1], [0, 198, 1], [0, 199, 1], [0, 200, 1], [0, 201, 1], [0, 202, 1], [0, 203, 1], [0, 204, 1], [0, 205, 1], [0, 206, 1], [0, 207, 1], [0, 208, 1], [0, 209, 1], [0, 210, 1], [0, 211, 1], [0, 212, 1], [0, 213, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: timer@10001200 (renesas,r9a07g043-mtu3): interrupt-names: ['tgia0', 'tgib0', 'tgic0', 'tgid0', 'tciv0', 'tgie0', 'tgif0', 'tgia1', 'tgib1', 'tciv1', 'tciu1', 'tgia2', 'tgib2', 'tciv2', 'tciu2', 'tgia3', 'tgib3', 'tgic3', 'tgid3', 'tciv3', 'tgia4', 'tgib4', 'tgic4', 'tgid4', 'tciv4', 'tgiu5', 'tgiv5', 'tgiw5', 'tgia6', 'tgib6', 'tgic6', 'tgid6', 'tciv6', 'tgia7', 'tgib7', 'tgic7', 'tgid7', 'tciv7', 'tgia8', 'tgib8', 'tgic8', 'tgid8', 'tciv8', 'tciu8'] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: timer@10001200 (renesas,r9a07g043-mtu3): interrupts: [[0, 170, 1], [0, 171, 1], [0, 172, 1], [0, 173, 1], [0, 174, 1], [0, 175, 1], [0, 176, 1], [0, 177, 1], [0, 178, 1], [0, 179, 1], [0, 180, 1], [0, 181, 1], [0, 182, 1], [0, 183, 1], [0, 184, 1], [0, 185, 1], [0, 186, 1], [0, 187, 1], [0, 188, 1], [0, 189, 1], [0, 190, 1], [0, 191, 1], [0, 192, 1], [0, 193, 1], [0, 194, 1], [0, 195, 1], [0, 196, 1], [0, 197, 1], [0, 198, 1], [0, 199, 1], [0, 200, 1], [0, 201, 1], [0, 202, 1], [0, 203, 1], [0, 204, 1], [0, 205, 1], [0, 206, 1], [0, 207, 1], [0, 208, 1], [0, 209, 1], [0, 210, 1], [0, 211, 1], [0, 212, 1], [0, 213, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc-cru-csi-ov5645.dtb: timer@10001200 (renesas,r9a07g054-mtu3): interrupt-names: ['tgia0', 'tgib0', 'tgic0', 'tgid0', 'tciv0', 'tgie0', 'tgif0', 'tgia1', 'tgib1', 'tciv1', 'tciu1', 'tgia2', 'tgib2', 'tciv2', 'tciu2', 'tgia3', 'tgib3', 'tgic3', 'tgid3', 'tciv3', 'tgia4', 'tgib4', 'tgic4', 'tgid4', 'tciv4', 'tgiu5', 'tgiv5', 'tgiw5', 'tgia6', 'tgib6', 'tgic6', 'tgid6', 'tciv6', 'tgia7', 'tgib7', 'tgic7', 'tgid7', 'tciv7', 'tgia8', 'tgib8', 'tgic8', 'tgid8', 'tciv8', 'tciu8'] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc-cru-csi-ov5645.dtb: timer@10001200 (renesas,r9a07g054-mtu3): interrupts: [[0, 170, 1], [0, 171, 1], [0, 172, 1], [0, 173, 1], [0, 174, 1], [0, 175, 1], [0, 176, 1], [0, 177, 1], [0, 178, 1], [0, 179, 1], [0, 180, 1], [0, 181, 1], [0, 182, 1], [0, 183, 1], [0, 184, 1], [0, 185, 1], [0, 186, 1], [0, 187, 1], [0, 188, 1], [0, 189, 1], [0, 190, 1], [0, 191, 1], [0, 192, 1], [0, 193, 1], [0, 194, 1], [0, 195, 1], [0, 196, 1], [0, 197, 1], [0, 198, 1], [0, 199, 1], [0, 200, 1], [0, 201, 1], [0, 202, 1], [0, 203, 1], [0, 204, 1], [0, 205, 1], [0, 206, 1], [0, 207, 1], [0, 208, 1], [0, 209, 1], [0, 210, 1], [0, 211, 1], [0, 212, 1], [0, 213, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc-cru-csi-ov5645.dtb: timer@10001200 (renesas,r9a07g044-mtu3): interrupt-names: ['tgia0', 'tgib0', 'tgic0', 'tgid0', 'tciv0', 'tgie0', 'tgif0', 'tgia1', 'tgib1', 'tciv1', 'tciu1', 'tgia2', 'tgib2', 'tciv2', 'tciu2', 'tgia3', 'tgib3', 'tgic3', 'tgid3', 'tciv3', 'tgia4', 'tgib4', 'tgic4', 'tgid4', 'tciv4', 'tgiu5', 'tgiv5', 'tgiw5', 'tgia6', 'tgib6', 'tgic6', 'tgid6', 'tciv6', 'tgia7', 'tgib7', 'tgic7', 'tgid7', 'tciv7', 'tgia8', 'tgib8', 'tgic8', 'tgid8', 'tciv8', 'tciu8'] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc-cru-csi-ov5645.dtb: timer@10001200 (renesas,r9a07g044-mtu3): interrupts: [[0, 170, 1], [0, 171, 1], [0, 172, 1], [0, 173, 1], [0, 174, 1], [0, 175, 1], [0, 176, 1], [0, 177, 1], [0, 178, 1], [0, 179, 1], [0, 180, 1], [0, 181, 1], [0, 182, 1], [0, 183, 1], [0, 184, 1], [0, 185, 1], [0, 186, 1], [0, 187, 1], [0, 188, 1], [0, 189, 1], [0, 190, 1], [0, 191, 1], [0, 192, 1], [0, 193, 1], [0, 194, 1], [0, 195, 1], [0, 196, 1], [0, 197, 1], [0, 198, 1], [0, 199, 1], [0, 200, 1], [0, 201, 1], [0, 202, 1], [0, 203, 1], [0, 204, 1], [0, 205, 1], [0, 206, 1], [0, 207, 1], [0, 208, 1], [0, 209, 1], [0, 210, 1], [0, 211, 1], [0, 212, 1], [0, 213, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc-cru-csi-ov5645.dtb: timer@10001200 (renesas,r9a07g044-mtu3): interrupt-names: ['tgia0', 'tgib0', 'tgic0', 'tgid0', 'tciv0', 'tgie0', 'tgif0', 'tgia1', 'tgib1', 'tciv1', 'tciu1', 'tgia2', 'tgib2', 'tciv2', 'tciu2', 'tgia3', 'tgib3', 'tgic3', 'tgid3', 'tciv3', 'tgia4', 'tgib4', 'tgic4', 'tgid4', 'tciv4', 'tgiu5', 'tgiv5', 'tgiw5', 'tgia6', 'tgib6', 'tgic6', 'tgid6', 'tciv6', 'tgia7', 'tgib7', 'tgic7', 'tgid7', 'tciv7', 'tgia8', 'tgib8', 'tgic8', 'tgid8', 'tciv8', 'tciu8'] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc-cru-csi-ov5645.dtb: timer@10001200 (renesas,r9a07g044-mtu3): interrupts: [[0, 170, 1], [0, 171, 1], [0, 172, 1], [0, 173, 1], [0, 174, 1], [0, 175, 1], [0, 176, 1], [0, 177, 1], [0, 178, 1], [0, 179, 1], [0, 180, 1], [0, 181, 1], [0, 182, 1], [0, 183, 1], [0, 184, 1], [0, 185, 1], [0, 186, 1], [0, 187, 1], [0, 188, 1], [0, 189, 1], [0, 190, 1], [0, 191, 1], [0, 192, 1], [0, 193, 1], [0, 194, 1], [0, 195, 1], [0, 196, 1], [0, 197, 1], [0, 198, 1], [0, 199, 1], [0, 200, 1], [0, 201, 1], [0, 202, 1], [0, 203, 1], [0, 204, 1], [0, 205, 1], [0, 206, 1], [0, 207, 1], [0, 208, 1], [0, 209, 1], [0, 210, 1], [0, 211, 1], [0, 212, 1], [0, 213, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtb: timer@10001200 (renesas,r9a07g043-mtu3): interrupt-names: ['tgia0', 'tgib0', 'tgic0', 'tgid0', 'tciv0', 'tgie0', 'tgif0', 'tgia1', 'tgib1', 'tciv1', 'tciu1', 'tgia2', 'tgib2', 'tciv2', 'tciu2', 'tgia3', 'tgib3', 'tgic3', 'tgid3', 'tciv3', 'tgia4', 'tgib4', 'tgic4', 'tgid4', 'tciv4', 'tgiu5', 'tgiv5', 'tgiw5', 'tgia6', 'tgib6', 'tgic6', 'tgid6', 'tciv6', 'tgia7', 'tgib7', 'tgic7', 'tgid7', 'tciv7', 'tgia8', 'tgib8', 'tgic8', 'tgid8', 'tciv8', 'tciu8'] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtb: timer@10001200 (renesas,r9a07g043-mtu3): interrupts: [[0, 170, 1], [0, 171, 1], [0, 172, 1], [0, 173, 1], [0, 174, 1], [0, 175, 1], [0, 176, 1], [0, 177, 1], [0, 178, 1], [0, 179, 1], [0, 180, 1], [0, 181, 1], [0, 182, 1], [0, 183, 1], [0, 184, 1], [0, 185, 1], [0, 186, 1], [0, 187, 1], [0, 188, 1], [0, 189, 1], [0, 190, 1], [0, 191, 1], [0, 192, 1], [0, 193, 1], [0, 194, 1], [0, 195, 1], [0, 196, 1], [0, 197, 1], [0, 198, 1], [0, 199, 1], [0, 200, 1], [0, 201, 1], [0, 202, 1], [0, 203, 1], [0, 204, 1], [0, 205, 1], [0, 206, 1], [0, 207, 1], [0, 208, 1], [0, 209, 1], [0, 210, 1], [0, 211, 1], [0, 212, 1], [0, 213, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-du-adv7513.dtb: timer@10001200 (renesas,r9a07g043-mtu3): interrupt-names: ['tgia0', 'tgib0', 'tgic0', 'tgid0', 'tciv0', 'tgie0', 'tgif0', 'tgia1', 'tgib1', 'tciv1', 'tciu1', 'tgia2', 'tgib2', 'tciv2', 'tciu2', 'tgia3', 'tgib3', 'tgic3', 'tgid3', 'tciv3', 'tgia4', 'tgib4', 'tgic4', 'tgid4', 'tciv4', 'tgiu5', 'tgiv5', 'tgiw5', 'tgia6', 'tgib6', 'tgic6', 'tgid6', 'tciv6', 'tgia7', 'tgib7', 'tgic7', 'tgid7', 'tciv7', 'tgia8', 'tgib8', 'tgic8', 'tgid8', 'tciv8', 'tciu8'] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-du-adv7513.dtb: timer@10001200 (renesas,r9a07g043-mtu3): interrupts: [[0, 170, 1], [0, 171, 1], [0, 172, 1], [0, 173, 1], [0, 174, 1], [0, 175, 1], [0, 176, 1], [0, 177, 1], [0, 178, 1], [0, 179, 1], [0, 180, 1], [0, 181, 1], [0, 182, 1], [0, 183, 1], [0, 184, 1], [0, 185, 1], [0, 186, 1], [0, 187, 1], [0, 188, 1], [0, 189, 1], [0, 190, 1], [0, 191, 1], [0, 192, 1], [0, 193, 1], [0, 194, 1], [0, 195, 1], [0, 196, 1], [0, 197, 1], [0, 198, 1], [0, 199, 1], [0, 200, 1], [0, 201, 1], [0, 202, 1], [0, 203, 1], [0, 204, 1], [0, 205, 1], [0, 206, 1], [0, 207, 1], [0, 208, 1], [0, 209, 1], [0, 210, 1], [0, 211, 1], [0, 212, 1], [0, 213, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-pmod.dtb: timer@10001200 (renesas,r9a07g043-mtu3): interrupt-names: ['tgia0', 'tgib0', 'tgic0', 'tgid0', 'tciv0', 'tgie0', 'tgif0', 'tgia1', 'tgib1', 'tciv1', 'tciu1', 'tgia2', 'tgib2', 'tciv2', 'tciu2', 'tgia3', 'tgib3', 'tgic3', 'tgid3', 'tciv3', 'tgia4', 'tgib4', 'tgic4', 'tgid4', 'tciv4', 'tgiu5', 'tgiv5', 'tgiw5', 'tgia6', 'tgib6', 'tgic6', 'tgid6', 'tciv6', 'tgia7', 'tgib7', 'tgic7', 'tgid7', 'tciv7', 'tgia8', 'tgib8', 'tgic8', 'tgid8', 'tciv8', 'tciu8'] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-pmod.dtb: timer@10001200 (renesas,r9a07g043-mtu3): interrupts: [[0, 170, 1], [0, 171, 1], [0, 172, 1], [0, 173, 1], [0, 174, 1], [0, 175, 1], [0, 176, 1], [0, 177, 1], [0, 178, 1], [0, 179, 1], [0, 180, 1], [0, 181, 1], [0, 182, 1], [0, 183, 1], [0, 184, 1], [0, 185, 1], [0, 186, 1], [0, 187, 1], [0, 188, 1], [0, 189, 1], [0, 190, 1], [0, 191, 1], [0, 192, 1], [0, 193, 1], [0, 194, 1], [0, 195, 1], [0, 196, 1], [0, 197, 1], [0, 198, 1], [0, 199, 1], [0, 200, 1], [0, 201, 1], [0, 202, 1], [0, 203, 1], [0, 204, 1], [0, 205, 1], [0, 206, 1], [0, 207, 1], [0, 208, 1], [0, 209, 1], [0, 210, 1], [0, 211, 1], [0, 212, 1], [0, 213, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
