Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193001B7E9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 03:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712287887; cv=none; b=pRh6XW69liCoP+c74caaIS0rTbf0XTGcb2uv53YKAmgDzZa7h3er8W1qqz+TgdHqiATvcb4e7BosfhiRgKzd6xUaWL4A1gGqfWFpX84vWC6Yi1D9MYVoJSvatXt7ifTiAD5ENMrM75OQrKZSfpdZ0k9vSnhMaJLfOBkbTbBhoWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712287887; c=relaxed/simple;
	bh=Ro2rbcxoEX5wfvjEQvtz4PO53CHQgLnP0unAc8EHAlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f0xC7kWs8Ovc9bN9zl44WTBy70dQICnUjwbYLNbNr+D7vhxycMyZCsGtDUOCc258Dt+QTNSb60ucOyiC8mFvT+zp/KxXB3ehNL/RTw+6U/IEflBCgmOqQUmKrBq4Ojfox4ZulczTrLzNKH3i8yU3uybO0hhNutbMJqz5W+a8Osc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SDu/spYR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDu/spYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712287887; x=1743823887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ro2rbcxoEX5wfvjEQvtz4PO53CHQgLnP0unAc8EHAlw=;
  b=SDu/spYRP9Eyb1FLQQKBJNy2SxBzpVnDybaZVIhEPm72YfWemSm4ar1l
   XhGoCpbBpL3e+S4cOs948rOV/97qwQUXQhqyC0NjdQ9f0a/VlPdVYv44j
   PI6UHgibpQD5M/+Aym9BEA+GEPCVkOLoRJHGh5OLwLJGfqXQkwJ6NFFFi
   Tp7NyEzE/Kc9s80ahU3ipf7WFKI1pFWMmIXvA10NGB2YDoJhl7h3Ig5IE
   Kk8jSHw+qgeJrmQxI4nF8VYRMbD/HwUO+InK3V/x/2BxDRoo1wvyWclg3
   5fonMpbUDVpW8tme9+UfQfEaMQbhpcJONxQ+e0moOF7nwFXl/y5RCGPNp
   w==;
X-CSE-ConnectionGUID: 88yjYM5fSLGRGi+oydAMcA==
X-CSE-MsgGUID: 6K01T43YThW8pf5J5eS+Gg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="19038791"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="19038791"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 20:31:26 -0700
X-CSE-ConnectionGUID: 83DSOogCRvOLWNzixGjAqg==
X-CSE-MsgGUID: urr6/4pfQMuUMtHHBhld6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18971884"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Apr 2024 20:31:24 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsaIT-0001pq-39;
	Fri, 05 Apr 2024 03:31:21 +0000
Date: Fri, 5 Apr 2024 11:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: [linux-next:master 3790/3921] i2c-i801.c:undefined reference to
 `i2c_root_adapter'
Message-ID: <202404051113.QeCJIWYm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b3d5988ae2cb5cd945ddbc653f0a71706231fdd
commit: 71b494e043d2cb567f4f4748bcb0b6fb7bc32a01 [3790/3921] i2c: i801: Call i2c_register_spd for muxed child segments
config: arm64-randconfig-001-20240217 (https://download.01.org/0day-ci/archive/20240405/202404051113.QeCJIWYm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404051113.QeCJIWYm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051113.QeCJIWYm-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/i2c/busses/i2c-i801.o: in function `i801_notifier_call':
>> i2c-i801.c:(.text+0x114): undefined reference to `i2c_root_adapter'
>> i2c-i801.c:(.text+0x114): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `i2c_root_adapter'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
