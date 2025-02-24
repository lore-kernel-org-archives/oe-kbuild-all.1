Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E2D1FC0EB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 22:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740435055; cv=none; b=V65P80/oTnMuNktdWQUCWEPDIEUnYDG2l0MPaNJU0nRvlKlzlbqGaHvbO7rOK9Eoo1/8PcmRmaHiT5wYYPL22Na6CsL1LlldI9m2lTw1y56ltI4KWt1vCjvqqLHlHYc9nNkoLlj6zeOpPWaJsnlno6v/AuY0VTP0atblaVklLQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740435055; c=relaxed/simple;
	bh=JOGG2m2ml/QBvRq4zwsQR+VOFZnYGLYLlXmzldWXVno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BrhVF8N/RXEk8xhiByMPBadl1bo+KQsNOZR4mU5YXsOpMCCKao5xlr1o3jMcxJL1duXMm0j5Ifku0cFnTspvb1mTgu+EParop3FIkwCww1OSQZSOcgN5zJOp+6pMnwidPZxAHXXKNeVKe4TsV427eqtH8fnzEA3MOvuNV6BGS+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZ6c/OoD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZ6c/OoD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740435054; x=1771971054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JOGG2m2ml/QBvRq4zwsQR+VOFZnYGLYLlXmzldWXVno=;
  b=jZ6c/OoDQ4gOKXhWvGR+TdfGY2g5OHOR5wMGonj5Qtjog/10GWdGbOv0
   UHf26mU1nfu9j3LrxsHvT7eG3E9m+3ejQwV3x4VFr9TFsHnMkEJjIDV8z
   OfMfri91MUtTuA+oUQkNrreo7GzQmr5H66ytpTHHHuDiumlD7WkP52/0V
   3CjwG2AotIZ5D8iVHyPE9bO3/0mZx3FeAHzudgoJ1nFGuvBv2fIL15E0X
   MLftGJvjR/Slx9uvm6p1qWtPl3HCI7XQr5M0inj4vuMJvesKVslDCbxZS
   cJc8IHVhfcDzUgPCpRkKSnpXE70byGgWnVv483LAdLyvPQddAG89Nwr0/
   g==;
X-CSE-ConnectionGUID: tmdk36g8RCicEciSDfJOOg==
X-CSE-MsgGUID: uX3Zc6cyQ7KxrXzjXIGB3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40919209"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="40919209"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 14:10:54 -0800
X-CSE-ConnectionGUID: kiwEVd69RvSQRUMDqx5fmQ==
X-CSE-MsgGUID: /Y/PxrbZTkK3/9SkH1S7MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="121285017"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 24 Feb 2025 14:10:52 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmgf1-0009Nz-0e;
	Mon, 24 Feb 2025 22:10:47 +0000
Date: Tue, 25 Feb 2025 06:09:49 +0800
From: kernel test robot <lkp@intel.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 5345/5954]
 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo.dtb:
 gpio@27: 'reset-gpios' does not match any of the regexes:
 '^(.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
Message-ID: <202502250657.z4e1UeVZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4ef7aa6a88280d015c6533a210e46efd55bdb57f
commit: 9f889cf1783680835d3ed401279075690b7f078a [5345/5954] arm64: dts: rockchip: add overlay for PX30 Ringneck Haikou Video Demo adapter
config: arm64-randconfig-051-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250657.z4e1UeVZ-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250657.z4e1UeVZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502250657.z4e1UeVZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo.dtb: gpio@27: 'reset-gpios' does not match any of the regexes: '^(.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/nxp,pcf8575.yaml#
>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
