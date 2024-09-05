Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC0616BE15
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 20:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725568297; cv=none; b=eAVTWM+FIquUGVCkJuyz1fdmEiBiAGfTFsYSdWTr52XmlwexmerkXu5fLx67ybiQMJMky26Yyf63+25g+Gza42/r0xTY7AeVl347/xYt/fVrKyVVr03sIeDSpkSByygYAtuCnwFrGpweYmwfxEAuGa6AGVbxUE+hal3CB3xwpNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725568297; c=relaxed/simple;
	bh=eN1ioHbr6kEXOQvEnEaZ0JpYUacPy+OkHGZpT4JfOto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Be0hH+Z23fDWaaFXpr8wJbbdL8o12dYpOAgkkzD9Si6SaEEQlk8BsNJnBVXnEkUBPBjyw3g++ATuRFtPk+ErswHWo1QPs7dk3sacZ+g3YSP+syMw0BX2oA3AV2tLphiGb19GaQAscOaEzITbUjnpvGQ5tzi6yDwwGBw6YiP73cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcMoh5cp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcMoh5cp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725568296; x=1757104296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eN1ioHbr6kEXOQvEnEaZ0JpYUacPy+OkHGZpT4JfOto=;
  b=XcMoh5cp0EgHcyXwcf1Zqq60fka5wFUlHqbrIKybsHl/coG0V4RNr3H0
   zIluD10hZqjIhhUsuPheSaZrrWrgCq1bimctFESEqyqP/kAUVZsATuAcV
   mHVb3FcKVxgcnJIKGQXKvaqMtCaiuQS1RFuXS6Lt2rQtSNKI0vjUMFdjJ
   7efTi5ks4hdzj4d64M8Ivu+n5uyshzzqxQ0Unubn6SvFgy28NPY8UCOFx
   av0uuzVled7NOk6/oXR9bAOAvOO02MYwFZCXT1kd0ezAIsTFrGlhKrtn9
   xy78ofeC/q4/w/lD8rzVwvLIxj3Xz0cFA3OhQ9tKhF1vvFPf7H6oGPdh8
   Q==;
X-CSE-ConnectionGUID: b/Yp0ftwQ6W+UTbYZXpCIw==
X-CSE-MsgGUID: /oDZNu5jTwqnVloV4qMQiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24476438"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="24476438"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 13:31:35 -0700
X-CSE-ConnectionGUID: uD+AjhwIRU+FDnfv87Hfnw==
X-CSE-MsgGUID: 4UzlZBMMSR2AFDO/hsAqEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="66072204"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Sep 2024 13:31:34 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smJ8d-000AHy-1x;
	Thu, 05 Sep 2024 20:31:31 +0000
Date: Fri, 6 Sep 2024 04:31:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 9241/9692]
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: video-codec@fdb50000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202409060425.Vywu5oAA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ad40aff1edffeccc412cde93894196dca7bc739e
commit: ce48b8c976ce439c336def6e06bf8224a8ff9125 [9241/9692] arm64: dts: rockchip: Add Hardkernel ODROID-M2
config: arm64-randconfig-051-20240905 (https://download.01.org/0day-ci/archive/20240906/202409060425.Vywu5oAA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409060425.Vywu5oAA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409060425.Vywu5oAA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
