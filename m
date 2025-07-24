Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41C81B4F0A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 21:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753392553; cv=none; b=Ui5r/uQcEh81YkmEcagfIc29lyklrmqvW1XAn9AXciXuBVHvSVp/BzPiD12sKROiEO8u58B3TglZeJ158hib+BQGYOe7nxJ7iIusuO1wpsASTThsSeu0Za4AGsapSX1nakLZZzQZse8A+xChiettcOgsmz3HrJzN/scFOxs7IbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753392553; c=relaxed/simple;
	bh=Qzlk8ZMqYXj7hNnXQEdGvGw9ThmIx9DaiqS5uHORsQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=STeKNS0OHMuqFIwOCKSP+mjnJ/axwdjW3EW2Pp3IEsj0Si9n1bAGYYGLB+5w+dnusoyaPM7iB9375PJpPNU3M/2MG6aXQeEXa4pPx92BFa7QSw6VMbRXVfk901I22ocXdU7ONmZTsdRL1fvGfw5Ii+QKB0Sfv1X0nuyGJwAMPoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+QKO8X3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+QKO8X3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753392552; x=1784928552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qzlk8ZMqYXj7hNnXQEdGvGw9ThmIx9DaiqS5uHORsQ8=;
  b=X+QKO8X3Oyle0hn40UCgo6lOeonh3q4CdWY4q9shu6G3H8VH46Zdbwrg
   9rgrkadIGVD9QHHDKxfthptP0FwC/pSQcZGrKHf4A1PpbBFE5qvKUUGwS
   vOdAnCPiEOx7eNR4oCrn7BlZH1hkuECjcUHNaLg0eSTCaoz1TRsM2Eujg
   WGcvL+CTK0GFTcjVzZUM4KEtAg1rprQunXwXv9jlyHW22oaj19qhWEjuJ
   A+eIEoV2EnqwvHdpbGHDXha2g2SEc9LPn2XQb8VEGKyl3TnLvUSWeWHI2
   CONhStag5xt1Xuddtf3neg1xjByyeU4U64JjiKqYKIC43r/XuAYbrRoxl
   g==;
X-CSE-ConnectionGUID: MJN9F15ET2uMlusKxQggxQ==
X-CSE-MsgGUID: AKoaIo1vQGKF3GPRx2yUIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="67162679"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="67162679"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 14:29:11 -0700
X-CSE-ConnectionGUID: wryXTm0eRESFRezciUzTGA==
X-CSE-MsgGUID: BRLNeTiFSRCClvKbhKhijw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="164502851"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jul 2025 14:29:10 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uf3Uy-000Kq3-1O;
	Thu, 24 Jul 2025 21:29:08 +0000
Date: Fri, 25 Jul 2025 05:28:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.16.y 44/45]
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: sound
 (audio-graph-card): Unevaluated properties are not allowed
 ('simple-audio-card,bitclock-master', 'simple-audio-card,codec',
 'simple-audio-card,cpu', 'simple-audio-card,format', 'simple-audio-card,f...
Message-ID: <202507250529.Rw0elmQj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.16.y
head:   5970e23fb597e5a60b1284c83332aee45fb222d0
commit: ac46a60ec2fb958f1dc2e5871e122abb98ac0da9 [44/45] ODROID-M2: Add support audio output
config: arm64-randconfig-052-20250722 (https://download.01.org/0day-ci/archive/20250725/202507250529.Rw0elmQj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507250529.Rw0elmQj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507250529.Rw0elmQj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: sound (audio-graph-card): Unevaluated properties are not allowed ('simple-audio-card,bitclock-master', 'simple-audio-card,codec', 'simple-audio-card,cpu', 'simple-audio-card,format', 'simple-audio-card,frame-master', 'simple-audio-card,mclk-fs', 'simple-audio-card,name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/audio-graph-card.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
