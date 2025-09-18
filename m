Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BB01E3DE5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Sep 2025 17:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758217724; cv=none; b=M80mpoea3Uu288P19DzTp+Q2Rre+Y9KB5vn+qgza9SLKM6Dvz7mgR3wO8qIrukJ/68V678dHVqMlvXotb+PmO1Ijj8iO5d0R6EikKpUsctVYtQKXS/4Y+bsZMx7uZN8My8ypcYLE7m9ELpqlB1Jq6Td3WtohvFs/UIDAD3q5DzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758217724; c=relaxed/simple;
	bh=Yv00vPnnkM37D5LqnzM7aXBFa+QT++4jqB0iU5emjgk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SBjgmkrgiUY8eDhVBuQIm5aNyghd/tZOuO0m577N0w+fZLvBpflnuyTnjxuYfVO7iNmmDPhLgTqbQTB88mG1uXq2lyadbuvusGWlNXJp8b46/J2lwHp+q1pBg0y6M46ON/wmcGItkpoLdpvwUwnC1jaiETGq70QnqMX2KLEPZ9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KT5qvDx5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KT5qvDx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758217722; x=1789753722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yv00vPnnkM37D5LqnzM7aXBFa+QT++4jqB0iU5emjgk=;
  b=KT5qvDx5NCp4n74NEyM/JKnrVd6s+fxyxqFJwLuPasg2z67qQvg2n1Ct
   c352AeuAh1eQmXMeZET71nEO769/pB2OT8idmN6rBXrEPyE7xnbDox3yv
   0poOH+9ntSzkrabuL67sSUHxFYkG1fa0xdKRbWzO0h1AzIJvIUP4/Z7Ej
   UgapjZGP+SeEZVjZMcV5bZ6Lh+Fg6Rl+h/AvuVrSFVpJzRtIDXe3sUqTA
   Is46zoaPOcuWkbr3q6NgOaq5ywmPq+0uNHNolSMfkykfk134iWNyNa1qU
   vKr0IfVxKSH8imAG20MA6YHhzBCOFmaC6GBO4jdk6gN612bdLUcaP1q6p
   g==;
X-CSE-ConnectionGUID: MrYJQIhQQ2+UD2r04iiGng==
X-CSE-MsgGUID: QzU+lUb6QiGfMcaCyaqMUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60448287"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="60448287"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 10:48:42 -0700
X-CSE-ConnectionGUID: xMEB0dXOSfSdVTdrePyWwQ==
X-CSE-MsgGUID: 4XIaEw+YSd6mIm+D9GDQBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="175430924"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Sep 2025 10:48:40 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzIkH-0003Zv-0s;
	Thu, 18 Sep 2025 17:48:37 +0000
Date: Fri, 19 Sep 2025 01:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject: [lee-mfd:for-mfd-next 13/54] powerpc64-linux-ld:
 gpio-stmpe.c:undefined reference to `stmpe_reg_read'
Message-ID: <202509190117.YHQJ7VVS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   ac41dc6e81e6bac3d37d6623f60af1189f14a3c3
commit: 9d2182e9a7b9e26cd6ee9b4831bc8538e5b0b10f [13/54] mfd: stmpe-i2c: Add missing MODULE_LICENSE
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20250919/202509190117.YHQJ7VVS-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509190117.YHQJ7VVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509190117.YHQJ7VVS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> powerpc64-linux-ld: warning: discarding dynamic section .glink
>> powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `stmpe_set_bits'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/gpio/gpio-stmpe.o: in function `stmpe_gpio_get':
   gpio-stmpe.c:(.text+0x4c0): undefined reference to `stmpe_reg_read'
   powerpc64-linux-ld: drivers/gpio/gpio-stmpe.o: in function `stmpe_gpio_get_direction':
   gpio-stmpe.c:(.text+0x600): undefined reference to `stmpe_reg_read'
   powerpc64-linux-ld: drivers/gpio/gpio-stmpe.o: in function `stmpe_gpio_irq_sync_unlock':
   gpio-stmpe.c:(.text+0x798): undefined reference to `stmpe_reg_read'
>> powerpc64-linux-ld: gpio-stmpe.c:(.text+0x81c): undefined reference to `stmpe_reg_read'
>> powerpc64-linux-ld: gpio-stmpe.c:(.text+0xbc8): undefined reference to `stmpe_reg_write'
   powerpc64-linux-ld: drivers/gpio/gpio-stmpe.o: in function `stmpe_gpio_irq':
   gpio-stmpe.c:(.text+0x1194): undefined reference to `stmpe_block_read'
   powerpc64-linux-ld: gpio-stmpe.c:(.text+0x1458): undefined reference to `stmpe_reg_write'
   powerpc64-linux-ld: gpio-stmpe.c:(.text+0x14b8): undefined reference to `stmpe_reg_write'
   powerpc64-linux-ld: drivers/gpio/gpio-stmpe.o: in function `stmpe_gpio_disable':
   gpio-stmpe.c:(.text+0x15ec): undefined reference to `stmpe_disable'
   powerpc64-linux-ld: drivers/gpio/gpio-stmpe.o: in function `stmpe_gpio_set':
   gpio-stmpe.c:(.text+0x172c): undefined reference to `stmpe_set_bits'
   powerpc64-linux-ld: gpio-stmpe.c:(.text+0x1754): undefined reference to `stmpe_reg_write'
   powerpc64-linux-ld: drivers/gpio/gpio-stmpe.o: in function `stmpe_gpio_direction_output':
   gpio-stmpe.c:(.text+0x195c): undefined reference to `stmpe_set_bits'
   powerpc64-linux-ld: drivers/gpio/gpio-stmpe.o: in function `stmpe_gpio_direction_input':
   gpio-stmpe.c:(.text+0x1a54): undefined reference to `stmpe_set_bits'
   powerpc64-linux-ld: drivers/gpio/gpio-stmpe.o: in function `stmpe_gpio_request':
   gpio-stmpe.c:(.text+0x1bcc): undefined reference to `stmpe_set_altfunc'
   powerpc64-linux-ld: drivers/gpio/gpio-stmpe.o: in function `stmpe_dbg_show_one':
   gpio-stmpe.c:(.text+0x1eb8): undefined reference to `stmpe_reg_read'
   powerpc64-linux-ld: gpio-stmpe.c:(.text+0x2034): undefined reference to `stmpe_reg_read'
   powerpc64-linux-ld: gpio-stmpe.c:(.text+0x20d4): undefined reference to `stmpe_reg_read'
   powerpc64-linux-ld: gpio-stmpe.c:(.text+0x2108): undefined reference to `stmpe_reg_read'
   powerpc64-linux-ld: gpio-stmpe.c:(.text+0x21d8): undefined reference to `stmpe_reg_read'
   powerpc64-linux-ld: drivers/gpio/gpio-stmpe.o: in function `stmpe_gpio_probe':
   gpio-stmpe.c:(.text+0x286c): undefined reference to `stmpe_enable'
>> powerpc64-linux-ld: gpio-stmpe.c:(.text+0x2930): undefined reference to `stmpe_disable'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
