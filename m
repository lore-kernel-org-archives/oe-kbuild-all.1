Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4DD1B0F0A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 23:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746572601; cv=none; b=GSVG40lmeXzFj2NszcfmJ4xaqM43iTvSr9YM1f+M7x75DqtywxPvllIhSZR/ZBJz6j6PfSeDSy6InpKty5WGuriHYgx8chSMQUgJeGZIo+e7J1D/3ejCTiXKnGChyPRL80ZHz9AHRQern1fllckGgqgv5AyETKrHCF+/fbeSkOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746572601; c=relaxed/simple;
	bh=QUCCAlFse+Z80XXPxw2y8k/IRJcEPJPiF/az1tRXZGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yrd/9zPNyATdwJ9XhQ2G7tQ5Xspi40XM4bcrc2hNsy3djGSSpgpP8b93nTwESouetZg7RFifwCGZHhh3pUMLwlQUDlDmz91IxmdIpptZBFFMvWWDg7Bu+9RjZmmMa+TI9a+rluqeCexZTFXiSlah4MZ5k3sFoyhIuB81CEtCESM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eO06a8LN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eO06a8LN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746572600; x=1778108600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QUCCAlFse+Z80XXPxw2y8k/IRJcEPJPiF/az1tRXZGs=;
  b=eO06a8LN4eXzoVlSauwr2k1301fQHzXsRjG4ygPNy83NBJRm6c/rqlZE
   Xe+JSkwDIybNcB+THv8LlF06IxD81DswTA0hCzn6hUicCKRYPK9Cq9+rv
   aB0KpOxT4CQNsVKU2UWZHCmB4NU4Knck8sJjRIvF4L5zCNnoITbMETntW
   81WSj1L34DgdApBA4Nv4INe5ZRRyDPnhY5+R0wlTfa6ycIDf3B7IHCTrl
   cjB6y61fAQOls8MUuEGZT5NXpG4IGU0xLi3O6LlCltwyUJj8n7GvNFu5R
   rz3BLD7+u6MnG9CgXKd47Z5XWJPMY3fFPwOhA8bWlvxqX4VXS8ZhierYK
   w==;
X-CSE-ConnectionGUID: ZgDIEt2dSvG20vHIxnW7yQ==
X-CSE-MsgGUID: F9trZDINSg26Y/YNrWSUPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="70779197"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="70779197"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 16:03:20 -0700
X-CSE-ConnectionGUID: UexHMtx9TgyKwyiph4PU9g==
X-CSE-MsgGUID: 62EbT2GbSVKkxUCbIvTs8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="140944377"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 May 2025 16:03:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCRJj-0006uv-1v;
	Tue, 06 May 2025 23:03:15 +0000
Date: Wed, 7 May 2025 07:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: Zelong Dong <zelong.dong@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>
Subject: [linux-next:master 8038/8679]
 arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dtb:
 reset-controller@2000 (amlogic,a5-reset): compatible:0: 'amlogic,a5-reset'
 is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset',
 'amlogic,meson-axg-reset', 'amlogic,meson-a1-reset', 'a...
Message-ID: <202505070602.hk569jPL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: f0911f29478992f37e91c208fe44c2ea5b378b61 [8038/8679] arm64: dts: amlogic: Add A5 Reset Controller
config: arm64-randconfig-051-20250506 (https://download.01.org/0day-ci/archive/20250507/202505070602.hk569jPL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505070602.hk569jPL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505070602.hk569jPL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dtb: reset-controller@2000 (amlogic,a5-reset): compatible:0: 'amlogic,a5-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset', 'amlogic,meson-a1-reset', 'amlogic,meson-s4-reset', 'amlogic,c3-reset', 'amlogic,t7-reset']
   	from schema $id: http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dtb: reset-controller@2000 (amlogic,a5-reset): compatible: ['amlogic,a5-reset', 'amlogic,meson-s4-reset'] is too long
   	from schema $id: http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dtb: /soc/bus@fe000000/reset-controller@2000: failed to match any schema with compatible: ['amlogic,a5-reset', 'amlogic,meson-s4-reset']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
