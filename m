Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DAE2222BF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 13:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762177860; cv=none; b=ExTL9iqYF+oYz9gYIQxf8k0ukRAPgZcINqMz5BZYRy7uixHGoGakiZQh8TgM/5mma4s48YKFvmunnDq4IorAYdven6CxrmVGaoCyT9yWezJz3Knh1rItkqGhA4qiZd8/74EmoNypMpHkhKgobFqhtsGcxXe+TaKAHEENXFqx+D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762177860; c=relaxed/simple;
	bh=F6l5stcoXNysGsO1+GlrND65w1cBnNuDkPiI3HT4l0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D56fDiw5QFXtroVizU1fPUvo1OoGsXhfKkFlM7BC5rbyrgv72FMVyKqmZSaG0nhDOK38bFirKE7V7edo0TZxgs7wJ9gDlxrz13zKZR4LE/zUVmA8KInEFrGB6igsdBb0GNEFGkgJpmSnL9YjtVjld2buLu5v1NnRiRdL7GLvH5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVoW58kn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVoW58kn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762177859; x=1793713859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F6l5stcoXNysGsO1+GlrND65w1cBnNuDkPiI3HT4l0c=;
  b=ZVoW58knC8UP0Ym0DWnqhpKwBO5VtLYOZNmsSwLDMuNYzMEOdcTxt0Vm
   sRFcP4BRuHzdKRUV+fsIn205dzMJI/3/HBDP8djSsonwg+zxV0PIPlNQL
   cNKgg1UJScGdr0A0faNxrBbFndEC0nhL0VOqhl+kLmpliGJFRGlspVQXr
   WpaZHFKOpIwvOK6HLy6dk8OfTbyHdloj7a5QbVlPAkDPP21CRhk0ArFND
   sPAxHRCnSHnbUUntfkC25TW59KQz71oKcah3ZrirlqA9eALR0E7Pjk8j/
   RjkhTMDUsyyPDnut64qIv3HADgeMiQHqxtk/WlMox03HpdHWIy3hKQl4t
   w==;
X-CSE-ConnectionGUID: cdnYpvV8QNWSFWjkbr37AA==
X-CSE-MsgGUID: BlHT7ziKTUOYmwfSbXwDwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64176863"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64176863"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 05:50:59 -0800
X-CSE-ConnectionGUID: 5uALy7E9QzisXs2sWBL5Cg==
X-CSE-MsgGUID: dPUTE84hS0WiL7h8E8MC1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="191974361"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 03 Nov 2025 05:50:58 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vFuxT-000000001kK-3gm0;
	Mon, 03 Nov 2025 13:50:55 +0000
Date: Mon, 3 Nov 2025 14:50:46 +0100
From: kernel test robot <lkp@intel.com>
To: sheetal <sheetal@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Thierry Reding <treding@nvidia.com>
Subject: [linux-next:master 4717/5674]
 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb:
 dma-controller@9440000 (nvidia,tegra264-adma): interrupts: [[0, 144, 4], [0,
 145, 4], [0, 146, 4], [0, 147, 4], [0, 148, 4], [0, 149, 4], [0, 150, 4],
 [0, 151, 4], [0, 152, 4], [0, 153, 4], [0...
Message-ID: <202511031425.0hG03rm3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9823120909776bbca58a3c55ef1f27d49283c1f3
commit: 0867951a1c9230074f61a045d19d76a406e20489 [4717/5674] arm64: tegra: Add Tegra264 audio support
config: arm64-randconfig-2052-20251101 (https://download.01.org/0day-ci/archive/20251103/202511031425.0hG03rm3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511031425.0hG03rm3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511031425.0hG03rm3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: dma-controller@9440000 (nvidia,tegra264-adma): interrupts: [[0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 147, 4], [0, 148, 4], [0, 149, 4], [0, 150, 4], [0, 151, 4], [0, 152, 4], [0, 153, 4], [0, 154, 4], [0, 155, 4], [0, 156, 4], [0, 157, 4], [0, 158, 4], [0, 159, 4], [0, 160, 4], [0, 161, 4], [0, 162, 4], [0, 163, 4], [0, 164, 4], [0, 165, 4], [0, 166, 4], [0, 167, 4], [0, 168, 4], [0, 169, 4], [0, 170, 4], [0, 171, 4], [0, 172, 4], [0, 173, 4], [0, 174, 4], [0, 175, 4], [0, 176, 4], [0, 177, 4], [0, 178, 4], [0, 179, 4], [0, 180, 4], [0, 181, 4], [0, 182, 4], [0, 183, 4], [0, 184, 4], [0, 185, 4], [0, 186, 4], [0, 187, 4], [0, 188, 4], [0, 189, 4], [0, 190, 4], [0, 191, 4], [0, 192, 4], [0, 193, 4], [0, 194, 4], [0, 195, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4], [0, 200, 4], [0, 201, 4], [0, 202, 4], [0, 203, 4], [0, 204, 4], [0, 205, 4], [0, 206, 4], [0, 207, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra210-adma.yaml
   arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: ahub@9630000 (nvidia,tegra264-ahub): admaif@9610000:dma-names:40: 'rx21' does not match '^[rt]x(1[0-9]|[1-9]|20)$'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-ahub.yaml
   arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: ahub@9630000 (nvidia,tegra264-ahub): admaif@9610000:dma-names:41: 'tx21' does not match '^[rt]x(1[0-9]|[1-9]|20)$'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-ahub.yaml
   arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: ahub@9630000 (nvidia,tegra264-ahub): admaif@9610000:dma-names:42: 'rx22' does not match '^[rt]x(1[0-9]|[1-9]|20)$'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-ahub.yaml
   arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: ahub@9630000 (nvidia,tegra264-ahub): admaif@9610000:dma-names:43: 'tx22' does not match '^[rt]x(1[0-9]|[1-9]|20)$'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-ahub.yaml
   arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: ahub@9630000 (nvidia,tegra264-ahub): admaif@9610000:dma-names:44: 'rx23' does not match '^[rt]x(1[0-9]|[1-9]|20)$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
