Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2A519D09C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Jul 2025 10:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752315690; cv=none; b=CHo6rnCI0zMSAp4cPrgp/dY+4mLcNH9GxGcXzAcxfJkqkd3S83gF+rbOaziGpw8H8OJSMtFEsYTlgXl3A+sXglqS9f070wy24W8q5YK5JEaEREDnsLeyiTrbq2tD9gO1F5KGDqYDSs8KRs/9rJ+ptR4QYF//eUasH0rTZZ9EyEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752315690; c=relaxed/simple;
	bh=VFsFxW1UxxnurzDEv8ET2iYZknJkN9+rJ9A1xKlpd/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sKiIJiqKkKNhI5pPT8TuSSc0E7VGWchZKsjFEPyymHbmz9nikwLRQnkB8zCVs4vbSGR4vA4/JPQ5opBTeOxv22snFQgArNh12SmEnkx/6klCNruYjmT2VqcupDpHfRMZhEWXpo8Dn6MZcOTybZ5xcsW1RoXIDavsjRbHX3X6Lh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIuw/6PU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIuw/6PU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752315689; x=1783851689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VFsFxW1UxxnurzDEv8ET2iYZknJkN9+rJ9A1xKlpd/k=;
  b=oIuw/6PUJ22rC7svzgrAgoIYkD+rbJwBKKhYNZOtQNU0Mee8J5QYv2oY
   rawvPbsOhfOZIM3zBGtmhFh6V4rcpj8Vq2OZi2q5q1TuH8qsjvhLyH2dg
   yhxu8TkV464VH6nxhjyTjH5N67ksbSaOAQidTeNfMj8s9jf9uwcDG5h+T
   9gVWAVBqEeFjXe8Rh+WiGb0nRDD6CebS2w2T1W7Gr9ovOZ/nAgCQmQBkr
   QbGqOLLso7K2PYoJasnxXfRG/jAvN32eN8AM7N+YaDo0qVh3iymgTXTBZ
   vSllcu1RyF4qoCWy5yZw49ImcsXJ+PF3eSM1rGWMMqra+ehpNWs0Hk959
   Q==;
X-CSE-ConnectionGUID: i6r5fyQ3T2eDqrMyW+LPUQ==
X-CSE-MsgGUID: NuCnXvdCQtejmUJgNWv+Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65943311"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="65943311"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 03:21:28 -0700
X-CSE-ConnectionGUID: jEL5C27PR26He151mS69tA==
X-CSE-MsgGUID: 5sz6gTfQRjGUD41xZkPWfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="155973491"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jul 2025 03:21:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaXMC-0007G7-33;
	Sat, 12 Jul 2025 10:21:24 +0000
Date: Sat, 12 Jul 2025 18:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>
Subject: [linux-next:master 8201/9053]
 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: mdio@3009800
 (mdio-mux-mmioreg): mdio@80:reg:0:0: 128 is greater than the maximum of 31
Message-ID: <202507121830.POx2KDVi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a62b7a37e6fcf4a675b1548e7c168b96ec836442
commit: a4fb40b240fecc3cf84e12277e5b66818a80e3ad [8201/9053] riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
config: arm64-randconfig-051-20250711 (https://download.01.org/0day-ci/archive/20250712/202507121830.POx2KDVi-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507121830.POx2KDVi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507121830.POx2KDVi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: mdio@3009800 (mdio-mux-mmioreg): mdio@80:reg:0:0: 128 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/ethernet@4070000: failed to match any schema with compatible: ['sophgo,cv1800b-dwmac', 'snps,dwmac-3.70a']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
