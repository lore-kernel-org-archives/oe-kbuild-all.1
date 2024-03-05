Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A9018046
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 04:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709611715; cv=none; b=ql8nORwxLmuX1Wfj++vlzvNK84ePsZGJgSTjHFy+kW2bwKK6bbgARw/kF4p98En+OkPsi4aqS/ahKMrtiP1BiSJt3xbmkwl+4fGjpRYi0Oy1TDawimvQu2vx5i+YF874zT2Ho2Fa3+hviirtHeICFrSp1OseMEJxi5QIXJ6oivY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709611715; c=relaxed/simple;
	bh=9YREpUsYj6Bb6cd7Mdj/6sXQ9pyz31B1Vnu245X0NvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rp5fmEFndHK0JHnRJsGfAfpkSmBNZKo41nkdAA5N3/2CCspOUKzzvxS8f5TUwdWBkGVdpyBt0nxEx/DtDmjGMVK+LIWittIOlnvIv8r2aBRmI7/HUox8KbbZ9rCGGU9Zpo9d4NYra2aHrp8lAIbfPXvEHQ/j2cafksrknWlzDAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIl6ejFD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIl6ejFD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709611713; x=1741147713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9YREpUsYj6Bb6cd7Mdj/6sXQ9pyz31B1Vnu245X0NvI=;
  b=UIl6ejFDMzSK79HJzWIzXlt17IWM3XQgRa/NSL63MkWBpmFQtLSrwPqo
   Xz48GDUkbs5WxVovPV2krjMzDfCT2NkihTa99+H37JhqWrhooQNQ/GaLl
   MS37er4zXWtO5YoPKIsChjSgWMGPLIgXPJZFRVRQuOy+hvau67y9XCLyG
   N/6gRzlXdhNyBkRCSvhgiNJLymqG4Ev8apflkvIKrlYREj0WDjyGmf9hR
   QYQuCUjcg44KQXlNCLziu/pB10Ua+s18jx2T6yEnvil53SHLd2Lwmw/qh
   okLOtNnXiC6vFbBJMhOiwTTac+twkHqWK/8w0JLQ8MVwoYF0rhr/ArUOH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4262834"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4262834"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 20:08:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9811516"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Mar 2024 20:08:31 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhM6O-00031L-2f;
	Tue, 05 Mar 2024 04:08:28 +0000
Date: Tue, 5 Mar 2024 12:08:03 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	David Bauer <mail@david-bauer.net>
Subject: [linusw-pinctrl:b4/awinic-aw9523 2/2] pinctrl-aw9523.c:undefined
 reference to `__devm_regmap_init_i2c'
Message-ID: <202403051235.HMdG0ybN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/awinic-aw9523
head:   70c38171f464ba4b47c120a90c11388a43fffa6a
commit: 70c38171f464ba4b47c120a90c11388a43fffa6a [2/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240305/202403051235.HMdG0ybN-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051235.HMdG0ybN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051235.HMdG0ybN-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/pinctrl/pinctrl-aw9523.o: in function `aw9523_probe':
>> pinctrl-aw9523.c:(.text+0x167c): undefined reference to `__devm_regmap_init_i2c'
>> sparc64-linux-ld: pinctrl-aw9523.c:(.text+0x16f8): undefined reference to `i2c_adapter_depth'
   sparc64-linux-ld: drivers/pinctrl/pinctrl-aw9523.o: in function `aw9523_driver_init':
>> pinctrl-aw9523.c:(.init.text+0x14): undefined reference to `i2c_register_driver'
   sparc64-linux-ld: drivers/pinctrl/pinctrl-aw9523.o: in function `aw9523_driver_exit':
>> pinctrl-aw9523.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
