Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1EDF50E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 12:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QthBm4C5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697285068; x=1728821068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K1d/ZvTHcdcyLYqRAUn7wsaxxkEwItS7DQ1PDzyDOF8=;
  b=QthBm4C5EatQ4RmRYClCIm2tlDkafnlqARNUkVfWPRY7GYTeuNryKqfU
   UhO+W0+KOY6fY4aS8Ce24w9KspHv2Z2VUZ2qumHBjbQ1AvD+gXOF2wml6
   OkfB0FF13IICyIY0zyrpcOuP3ziKcD3RoO9YuhNZQ84aq2NtukSe7bRFr
   roBiJfg5XfAdEMJKP+pojoQ6agEU4R/ydWH2FVcNXZt4YbXqw372djdnk
   mpchMcJ1gO4+AlnW3eifeoCwhjhh7vqioOnYqhFfSXrBwH+n1xkTu5XNh
   5irQJqvtW9P4o9LtWzFkvlH7G8g8UnyL8+QpOmhzJ8kNa0yibIM2YmyNh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="451803322"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="451803322"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 05:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="820965091"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="820965091"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 14 Oct 2023 05:04:25 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrdNX-00069L-26;
	Sat, 14 Oct 2023 12:04:23 +0000
Date: Sat, 14 Oct 2023 20:03:30 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [pinchartl:mtk/v6.6/pumpkin/camera 35/35] make[4]: *** No rule to
 make target
 'arch/arm64/boot/dts/mediatek/mt8365-pumpkin-ethernet-usb-local-mac.dtb',
 needed by 'arch/arm64/boot/dts/mediatek/'.
Message-ID: <202310142012.uG86Bq5n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.6/pumpkin/camera
head:   bbd4f3babd279c09914cf0d0eaa9bd7f75a42c51
commit: bbd4f3babd279c09914cf0d0eaa9bd7f75a42c51 [35/35] DNI: arm64: dts: mediatek: m8365-pumpkin: Add overlay for hardcoded eth
config: arm64-randconfig-001-20231014 (https://download.01.org/0day-ci/archive/20231014/202310142012.uG86Bq5n-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142012.uG86Bq5n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142012.uG86Bq5n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/arm64/boot/dts/mediatek/mt8365-pumpkin-ethernet-usb-local-mac.dtb', needed by 'arch/arm64/boot/dts/mediatek/'.
   make[4]: Target 'arch/arm64/boot/dts/mediatek/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
