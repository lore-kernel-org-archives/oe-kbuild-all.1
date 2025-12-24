Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A081A316188
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766574058; cv=none; b=cxwAxmhSt73cGXUdId5VaWjzyFOz+o94KxBloCjn6Tt6xs2njQVq7ahmPk3semRW6byCsqOtke062tuxL41Pd5/eo50kaDB08QfdaBjtAE3KwrxN70G0YAergTKiwcveThU7zPU5EcQKwjAvDp3/b7xFrY/EeYIh6XbRkcLhZ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766574058; c=relaxed/simple;
	bh=OWxnkEfJGWM/suUT6JL+oNjh+7nD4n2oy35epXNLMck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gCOAB5StSIDZH1l483FNaVSL+I++HqnCHUdIyxD4Tui4qE+3QrmKDl1fjfGDagrpFxY+Yth8olJdbj3W0zgIQhyN93FnO96yh+dpSkQeJARDdZ9qXVAjJAQCtn2LB5qfaGwJvbQTkY2IHoNt2+jbjjAKDWmPMdQs9uTnjeqly4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5Gje0Hf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5Gje0Hf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766574056; x=1798110056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OWxnkEfJGWM/suUT6JL+oNjh+7nD4n2oy35epXNLMck=;
  b=H5Gje0Hf0UTB9zDzwfr1r1AXITO4ewtr0jPyle/cAAxkBSy7Z1l2WmE4
   3A2KOag15fJI5ZdHmToayBZPK1uajiYn6h+YBZpJJhgleRMVrYgNXP2RJ
   nfE3xmlD19esS6vNmrtoyg46X3YLfsmSRfprd23YcEo+fCH85KFhjc5eP
   QDFt3DN4Qa+7qC/QJVi+Q0ukOjUd15904/vEKOs1vBtK6SGD6KkRnTQaj
   bSmEzleQL+pHYpBBfuHJTMn9c7caMLGRM0KhxQEs1YzJWfhHte2GpUzny
   WVDe/tS4RWrJvK9UIOW2umHqMSkALCuAP/0DCS6ZvBKw8BYEUZEgOJaAc
   Q==;
X-CSE-ConnectionGUID: gnpSdb6JQf+tcdEBinNshw==
X-CSE-MsgGUID: IX9HiulpTLyzzs0tGMs1aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="93884990"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="93884990"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 03:00:55 -0800
X-CSE-ConnectionGUID: mkiEJOjeSd2iRZAebsTteg==
X-CSE-MsgGUID: exSGdwoWTYOEvGpSeWUwmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="204133615"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 24 Dec 2025 03:00:53 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYMbp-000000006Bs-3yS4;
	Wed, 24 Dec 2025 11:00:49 +0000
Date: Wed, 24 Dec 2025 12:00:20 +0100
From: kernel test robot <lkp@intel.com>
To: Hai Pham <hai.pham.ud@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Khanh Le <khanh.le.xr@renesas.com>,
	Huy Bui <huy.bui.wm@renesas.com>,
	Phong Hoang <phong.hoang.wz@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000
 (renesas,hscif-r8a78000): 'power-domains' is a required property
Message-ID: <202512241145.6laLxtJK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: ad142a4ef7106326bbf5c67eb39f21ef77fe8be3 arm64: dts: renesas: r8a78000: Add initial Ironhide board support
date:   8 weeks ago
config: arm64-randconfig-2052-20251223 (https://download.01.org/0day-ci/archive/20251224/202512241145.6laLxtJK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241145.6laLxtJK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512241145.6laLxtJK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
