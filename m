Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73811135A63
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 06:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720505469; cv=none; b=NG9bT+OEnMsaKX6MNGNh7R+UWnM7c6WB2sbLD3TWfe2EeMPgnOS3b03ZhdTfPBtRc3IXMvDJ9ufbi+2r3cjJlDljlekzLOh+MTUhqyZvR2QdRMqEtrchod7uZDqiH1m+NAMYyylx7lu6siIbs7c/HpyPoP1uy+lq9mlMFj58ZJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720505469; c=relaxed/simple;
	bh=3zV6Yz5eL2RRFoIWXpAfZV3++4xDlTGm44TJ2MEgJPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DrllufOxWXpwXti809QSo0bWOu/jvw4NmkD6dPsOUugAMKIf/z4Tj3bJpsoGle3z2tKIw9mMBofb/HY7iVDdaRzDZx3Iy+bDrIgaJtIqg3UZ47Xa/9QcnTnbG5dzb/f6o+nrI5GXxCSqRp6NJyhUQoOf72QHp9vlXKcQUnIDh8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9Vwi7DF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9Vwi7DF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720505467; x=1752041467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3zV6Yz5eL2RRFoIWXpAfZV3++4xDlTGm44TJ2MEgJPk=;
  b=O9Vwi7DFfZuq3oxLR2RyD0v4ef/GUeiVr0thyTqHCB2Sm804IIQsI6An
   AU2UynUxmYGTaSShXToIFDiN4KRjSKh5UUOWTb7s6HvOWZsMmZ8VecCx/
   xD/QNQIN2u1V7h00ipYsW+QxoR+gL9zqATyQp6ciQyP+WH22TRA3K/zmh
   4B35fgWURzqB+be3XRMC1jIOcIKrD+PBkSEdWmqm/TFVEP1mN6canIj6B
   qRgxw7FNJEr2h/f3ZIl4LqbX2j2Jg42weIVtMPDzf5kojKpFlQZFMbzWc
   /5LmO5FlonErGpjeZpaij47pWZlh4FvIt/Lg5KcZ4Zqf5GsH8tuE2OrzJ
   Q==;
X-CSE-ConnectionGUID: +SEbJV2QR++sspx1tXCWSg==
X-CSE-MsgGUID: 0yLUhc3sT0Wy2MKZrCgRog==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21549787"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="21549787"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 23:11:07 -0700
X-CSE-ConnectionGUID: tTznJp6BRiev7WFFTyoIUg==
X-CSE-MsgGUID: J5Gz5OmGTw6vour0fD/ryw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="47829222"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jul 2024 23:11:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR447-000WNT-2e;
	Tue, 09 Jul 2024 06:11:03 +0000
Date: Tue, 9 Jul 2024 14:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-iio-backend-add-debugfs 11/17] powerpc-linux-ld:
 drivers/iio/adc/adi-axi-adc.o:(.sbss+0x0): multiple definition of `d';
 drivers/iio/industrialio-backend.o:(.sbss+0x0): first defined here
Message-ID: <202407091427.2WYgeGPS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/dev-iio-backend-add-debugfs
head:   4120536adfc0bc741c466d38ae50ffb9760576e3
commit: e18cc5c6741984280b0142955a2ea49bc6bf5484 [11/17] iio: backend: add debugFs interface
config: powerpc-randconfig-002-20240709 (https://download.01.org/0day-ci/archive/20240709/202407091427.2WYgeGPS-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091427.2WYgeGPS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407091427.2WYgeGPS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> powerpc-linux-ld: drivers/iio/adc/adi-axi-adc.o:(.sbss+0x0): multiple definition of `d'; drivers/iio/industrialio-backend.o:(.sbss+0x0): first defined here
   powerpc-linux-ld: drivers/iio/dac/ad9739a.o:(.sbss+0x0): multiple definition of `d'; drivers/iio/industrialio-backend.o:(.sbss+0x0): first defined here
   powerpc-linux-ld: drivers/iio/dac/adi-axi-dac.o:(.sbss+0x0): multiple definition of `d'; drivers/iio/industrialio-backend.o:(.sbss+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
