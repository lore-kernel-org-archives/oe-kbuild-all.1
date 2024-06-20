Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6251E497
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 13:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718890988; cv=none; b=VP8PkSJQA4NvuCjIBGhHUVLbUje+fF+R3V5vlP9Iy5DAsqrvLkGmJQd394TfcujezpIgfPL1nZHW+wq0nFi+Qpx7qNyoRAYU6itIYdGnt2c0eM0eNfWkmQco6gLcu5KryZ27KJ1p0oxJ2+EzPxjJdfogPHaXvPa8zsoWra9N1UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718890988; c=relaxed/simple;
	bh=Wsb6kWV1NvU414fhqG1SU6lGa/SDLKvnrCiEO9NR4zY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L2Eg6k/IiPSCqtuv1HU1JOl6RJ1mCbYe3uiq/zfBIGGQ7Kl/DZYaWIKRxde29KWbotcWTU5Fn6C1KOInaZXcSxcu4WTolYPJKoKfcGFwGXM91pj2wR2bxwoGD+5cFT5yxfCihO0cE8EV3rgbFsNiOeosmslgA9YWSzhFM008sVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNx/eZLu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNx/eZLu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718890986; x=1750426986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wsb6kWV1NvU414fhqG1SU6lGa/SDLKvnrCiEO9NR4zY=;
  b=XNx/eZLuMU5UbJ6KaKhI6tf/5fYim/56wmvN95k52u0N8gkZv54qQDL2
   g+P1KXvCw2QrcQG0qnhG3/4Z/46SsmqUw/uAsP4F01sGfCawnli21xlxc
   IH3ja8ZPYOe8bTeeUY0/BpKTOZEXiR6kIj0qZyWtI5I2nWHzP+BMBcuPY
   XzvT5y7Y6ORNw4uCSDfBrCFmVaOPOZD405vlGE0CrU2fvGerDYpbqnqJW
   4OFKB4GqGmwDhJetcVzaBWh+P2pdrHzUB7CYrtkaSQKq3p5M0S9jnRQ5i
   naDe443melZCXtuGalkJXP+sRHhnUFNJvQRRzPR53jR5cu7MpaT4C3APG
   w==;
X-CSE-ConnectionGUID: rIjn6g0SQ2uJiME+6iC7Jw==
X-CSE-MsgGUID: LBjdyZeBQo2vD+pXv//wVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="27288478"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="27288478"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 06:43:05 -0700
X-CSE-ConnectionGUID: UaOQ/13rRgOQDAs/EfY/1w==
X-CSE-MsgGUID: eg94AeQLSYOqEpY9u3+5HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="42351886"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Jun 2024 06:43:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKI45-0007eI-2n;
	Thu, 20 Jun 2024 13:43:01 +0000
Date: Thu, 20 Jun 2024 21:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/topic/gpio-logic-analyzer 4/4]
 arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: /i2c2-analyzer: failed
 to match any schema with compatible: ['gpio-sloppy-logic-analyzer']
Message-ID: <202406202124.VlNZN8QF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/gpio-logic-analyzer
head:   cccab611eb498007d77cbbd38578ca8058c484cf
commit: cccab611eb498007d77cbbd38578ca8058c484cf [4/4] dts: salvator: add GPIO-LA to I2C2 (snooping)
config: arm64-randconfig-051-20240620 (https://download.01.org/0day-ci/archive/20240620/202406202124.VlNZN8QF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406202124.VlNZN8QF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406202124.VlNZN8QF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: /i2c2-analyzer: failed to match any schema with compatible: ['gpio-sloppy-logic-analyzer']
--
   arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb: /i2c2-analyzer: failed to match any schema with compatible: ['gpio-sloppy-logic-analyzer']
--
   arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dtb: /i2c2-analyzer: failed to match any schema with compatible: ['gpio-sloppy-logic-analyzer']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
