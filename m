Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B81C18735E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 23:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718408910; cv=none; b=E57zf76lrhf7lr9Fy6DxxHtM0VudIfiarBJSepycCujtMVskKl9ItLHgmNo38F3iOvoDE8HUCwAk3hTqAE7qcwSA8gKw1MjplFyuARuEIX6+Wole9dh6I4bDmDLTYJVLWzjsU+wI84PpgcBVvd2hdgyTjAm6mdwu20MDVkwOc8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718408910; c=relaxed/simple;
	bh=RkJ0aSL2qb6AvKDiTltajr9e/gfCOypCBUtGcDPi10M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a/dhahqq2l0RQY6bGjyhfojbNnttHAS9LFas4U5Q19t0oGw8Szg3mgCfQqj+g97MIljf1OKXbijEX5aeB6/ieiY9LjzDEyscOBBtphgeptJdlqctQU+JOCa2nRMzKVWXNUjmoFfrq51Wm1DyoJdPdYM5YHhrQP4fNNLgeOvI6pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9PSsQvc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9PSsQvc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718408909; x=1749944909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RkJ0aSL2qb6AvKDiTltajr9e/gfCOypCBUtGcDPi10M=;
  b=m9PSsQvcI2H4twcJWtdQ0RLrok+Lzi1fRA0xvU6jjbdoavdDeyKYjFJn
   8X8NXMM6mnBuNvXD1ONXVGhPtteVphFLVW4FjLJd9ZxQbchmiuBF2EYDF
   BSy0Gi81uaPqx013+nbybfCgXPuBVciy7iEdezYq6FVpK2gCsXdyTwENI
   lhJ2W4WnB6m9FlURiUs2wkiJgFAngOCoRwuKMtwBlzE7H1l3NUbcLvDQ4
   YJPAxxp1PYiTlNcal8vNbCngOfCa8R35ago0UOHR7IpEu8wZTWrb2W0Uo
   lXyq6o3Jc25lyokZKnffHlrnlpa5rAUCK/d8dcPXiI9NdYdoYoI5GjnGp
   A==;
X-CSE-ConnectionGUID: 4qku1tGnSwSkc56VsjiUbA==
X-CSE-MsgGUID: 208NTiaiSxmL/m4Mk3P8Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25894724"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="25894724"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 16:48:28 -0700
X-CSE-ConnectionGUID: xuP+doEkStC3mL+5sAz4NQ==
X-CSE-MsgGUID: DEOEnpUcQjSvBv0K6qHSKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="40501642"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jun 2024 16:48:28 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIGef-0001up-1W;
	Fri, 14 Jun 2024 23:48:25 +0000
Date: Sat, 15 Jun 2024 07:47:50 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:spi-6.10 7/7]
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: adc@0: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202406150702.FSreHlYt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git spi-6.10
head:   d3ce3d4947eb18b954433276d84d8e61ef033b53
commit: d3ce3d4947eb18b954433276d84d8e61ef033b53 [7/7] dts for adxl
config: riscv-randconfig-051-20240615 (https://download.01.org/0day-ci/archive/20240615/202406150702.FSreHlYt-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150702.FSreHlYt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150702.FSreHlYt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: adc@0: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
