Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFFF143885
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 12:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718800447; cv=none; b=Br+WI7f4ppbqvng462pXTnmk8yoPUr56teZFDXayE5uKOouNjsX5t6EFwGw0u9rVZOP9e/WBpxTxzmSsssp7uMQaB9YjeSKYgVG+dYwWZfDx1uxxTu4b98r0MVCbjz1t2+hJb/+dWqXLkTxvD8mDrQPBnsbvYwkbOpNEII3kDcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718800447; c=relaxed/simple;
	bh=R5RQlqK2WVesTPDuaRXG0vQ3vsX5Kkvfqf8dL50XmZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pXAk6GOYeIIUd0EEMkc7xDtl+3plaQ2RYAXxCyyFDj83TWMu1kSL/sikIGz1LClUwwc35L8lJtvDbKLpEaZn2d6dGvjaSrHJ7Bl1Y2T0XpgKacwmTIWypYZSVucPngm39sIP8/8e2A37ahsbUT+nGh7ZRauynkpgafjLRZaCa8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VrTwqZlK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VrTwqZlK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718800445; x=1750336445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R5RQlqK2WVesTPDuaRXG0vQ3vsX5Kkvfqf8dL50XmZY=;
  b=VrTwqZlKXTeCLlCYNnCLnPWcvdw7mxWsrZ9QLYAx83ZiFRFwLk1hrx60
   ZNLRWAmI6o6DOWAhgv0uMhlqJmOXDNbpIf/3uIEgl5aCcFpffWe4TJleF
   bGEv4k4DABC9fArs7SfTNkQHmT8ogRrttTJTd0r3K4sjLTpN6DX5J+6W4
   RBk0ZAiIGHll8VXIK6PafvyNDet+YMK/Aw8SOwMnL1H9txU90hH9hV1JL
   /GuGqyA+FSXe60NvwPin9a5OJ40eB0xJAFjy8Vt+gNDHD5q3JNY+45Pzo
   6ixyv7spZJwGrAXDyLe2vLy0OXYrMKQa6eta4al/vJDg+zGj6uaFzz/WA
   w==;
X-CSE-ConnectionGUID: v9XbMjHjQdeeFqvr8d5Rdw==
X-CSE-MsgGUID: brE0Da14TBmTn/71Qa3J0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15610876"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="15610876"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 05:34:04 -0700
X-CSE-ConnectionGUID: p48u2sWZSzyDLTlI4JXZyA==
X-CSE-MsgGUID: ePWOf20hRkWbYuo5EF+flg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="41808377"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Jun 2024 05:34:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJuVl-0006aW-04;
	Wed, 19 Jun 2024 12:34:01 +0000
Date: Wed, 19 Jun 2024 20:33:44 +0800
From: kernel test robot <lkp@intel.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [morimoto:renesas-bsp/v6.1.94-2024-06-19 176/668]
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb: /soc/mmc@85000000: failed
 to match any schema with compatible: ['renesas,sdhi-r9a09g011',
 'renesas,rcar-gen3-sdhi']
Message-ID: <202406192022.T2uIkOea-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.94-2024-06-19
head:   4a79b72d2136dc56d1d59e949b309f97da1f515a
commit: 7022f99c2a31f4f82bf6900889485bc45e0c1efe [176/668] arm64: dts: renesas: r9a09g011: Add eMMC and SDHI support
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240619/202406192022.T2uIkOea-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406192022.T2uIkOea-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406192022.T2uIkOea-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb: /soc/mmc@85000000: failed to match any schema with compatible: ['renesas,sdhi-r9a09g011', 'renesas,rcar-gen3-sdhi']
   arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb: /soc/mmc@85010000: failed to match any schema with compatible: ['renesas,sdhi-r9a09g011', 'renesas,rcar-gen3-sdhi']
   arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb: /soc/mmc@85020000: failed to match any schema with compatible: ['renesas,sdhi-r9a09g011', 'renesas,rcar-gen3-sdhi']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
