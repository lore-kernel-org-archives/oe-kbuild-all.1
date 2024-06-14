Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1156B1459E0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 22:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718404528; cv=none; b=t8Mh/W9E1vcqbcembNwriCD8DWHfg6QQegDJEVfKvTI0WWd0jY6QjbULkuEFdKef5zqZTnI7wwIMRQznLCm4x8cAoQDe9q5i5XfWnpWZuP5Hi5v/PNfHoAlgHqLGWw+2iNiuNQ7cFv5TGFlLPQxHXIqtrFvpJgHp3lOrsxOqjfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718404528; c=relaxed/simple;
	bh=daSFm0rC/lfTVzVy5f4BnS7jgh3e3HyPNL03G9dV61g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j8hTVnvXEjgNTUmzMTy9J9J1Y1tzVoc4qUnPsRJ3x+2/k5aPqOfSUlB8D5HcOp5w/u89iAnmejS8RJgchL7007lb8+aYAabDh60hk3JmBkcKGiP/097IL51PyvSkDYqB/mmnji/sji5B0H2vbRdQBXbi17hZmc95IniXReHJam0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwF82E1C; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwF82E1C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718404527; x=1749940527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=daSFm0rC/lfTVzVy5f4BnS7jgh3e3HyPNL03G9dV61g=;
  b=DwF82E1CMEO2uYBLnlXjSjPQFFJ93dSQce4OjXSu/VyBr4SMJCIe97GU
   k1EqeNQhMdmVKlmvhHnkZNWYLUF8fr7VekoFlxN8uNz/MHGIM+0OlkqPu
   vdXj4GIRUSqOAwdkABISXeNXkhvvAcjsPqJEjJ/BsAQgAiuTfTDSuPKzC
   nTaC/8yt3VORBDbp0Lblcwwsv6B8Z1hR5rE6LmNqfSG7tTbtkjDjCFLzQ
   fU8BNhiaF/VRqDvkh9bzkgvG0hv83oSe80Zh5WpmrEILnR7Mdt7enXENo
   Kc3EN+etE1Z0N+sRXJZiVSjgFpyRMGEhoNNmTf1xbCs+D7SrbKXpadXjL
   Q==;
X-CSE-ConnectionGUID: hTo4qyl6Qpq8wugsmWER2w==
X-CSE-MsgGUID: Sq28WnYcT768TIGKaib6+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="32788024"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="32788024"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 15:35:26 -0700
X-CSE-ConnectionGUID: QFYUDiBPQqinxdF0YafwLA==
X-CSE-MsgGUID: ZzV/rNY6ThquGgGkjqFGmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="40584889"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Jun 2024 15:35:25 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIFVz-0001s9-1h;
	Fri, 14 Jun 2024 22:35:23 +0000
Date: Sat, 15 Jun 2024 06:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:qwip 9/16]
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@41100000:
 ngpios:0:0: 16 is not one of [14, 24, 32]
Message-ID: <202406150651.6IyIQRWn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git qwip
head:   9956455899baf6f0007d2a58feff4a61a8ff4ea9
commit: b0d175d4bc5dc9929bf28683d37516857afea87f [9/16] riscv: dts: microchip: add an initial devicetree for the BeagleV Fire
config: riscv-randconfig-051-20240615 (https://download.01.org/0day-ci/archive/20240615/202406150651.6IyIQRWn-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150651.6IyIQRWn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150651.6IyIQRWn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@41100000: ngpios:0:0: 16 is not one of [14, 24, 32]
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@41200000: ngpios:0:0: 20 is not one of [14, 24, 32]
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@44000000: ngpios:0:0: 20 is not one of [14, 24, 32]
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
