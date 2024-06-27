Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6182878C60
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 08:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719476545; cv=none; b=od0YxhnO9JGl7R2hL6CoHL8GBJhFEzgxBCvJiQlwGhc4dUm1ZEorJzOQ/C9AKZTsCO4XTpYGBRegCc6lWYkWNUN3lSEF2+ITw59GuNDcsBul/l9pO/eJRkkansOsoCacVp9z9JDIBo4RCpqx4I+7uU8L0QJHw92J0GDUF5xh3Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719476545; c=relaxed/simple;
	bh=ISghhUtE2r7Igcl7j300LIauJ552orZpNkP3zZDTho8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S0seRYOcEVit3bInk2YQxb4woly7s8ZylJ46YrLslFG7SRmH9uNZr82xjySJPDRcF3KFRUQbqMdlWeYhuDldLW0FZXslck7k4xEorCaXz+9YIkyJOMJPsfjQjmMEkIzf6enjOaeQpD1UAlpu32joHeoWmBefjgyZM5KEl27MSzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2ccMgUO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2ccMgUO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719476543; x=1751012543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ISghhUtE2r7Igcl7j300LIauJ552orZpNkP3zZDTho8=;
  b=e2ccMgUOixuZaLKHpfNB3GHYb6bl3/IrgKN5SEV8ftJETsJiPbb3f84M
   6Vs1uM8KPEG+PU7dH8vwnYs6ZmgCbjY5LogE41B1x1rPxTSJZx8FKYiQ/
   LtfRQW9mR5I0xZewGZBJuT1onvpKvp75EwlrrN22ngr3FQHO9OCB/iwrY
   yh4ywBRGldM/Yh2JWX4gEx6fssAmz3KrCBrgJJDltL8cp73r+36P7Y0+l
   novpa2xBxR9Q+hndkCWl/KlsBAo+n27K6YxAca/DnpoO8HNqiJgRAny/U
   UXecKbTtKAER87p8QPUWXQL1BSq43HQbIgmRXTiNX37+32xq6C/odXqqi
   w==;
X-CSE-ConnectionGUID: HHgYlZhmR4mgXiLTkC0UvQ==
X-CSE-MsgGUID: 90xZnY90T8mlnK6EzUJl3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16409299"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="16409299"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 01:22:22 -0700
X-CSE-ConnectionGUID: ndon4cR8S4WVm0r8v0UuBA==
X-CSE-MsgGUID: 0JzQBNuLSgGWf3kQc4/Axw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="44362463"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jun 2024 01:22:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMkOZ-000G3A-1o;
	Thu, 27 Jun 2024 08:22:19 +0000
Date: Thu, 27 Jun 2024 16:22:13 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-iio-ad9467-new-devs 6/9] arceb-elf-ld:
 drivers/iio/adc/adi-axi-adc.o:(.bss+0x8): multiple definition of `d';
 drivers/iio/industrialio-backend.o:(.bss+0x0): first defined here
Message-ID: <202406271635.uXCKUZbz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/dev-iio-ad9467-new-devs
head:   07a190d5bdd96dcb948ba00339145f0bb2b461e9
commit: b649e7b925e48f2b8a29b04b71c46b7b24508787 [6/9] iio: backend: add debugFs interface
config: arc-randconfig-001-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271635.uXCKUZbz-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271635.uXCKUZbz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271635.uXCKUZbz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arceb-elf-ld: drivers/iio/adc/adi-axi-adc.o:(.bss+0x8): multiple definition of `d'; drivers/iio/industrialio-backend.o:(.bss+0x0): first defined here
   arceb-elf-ld: drivers/iio/dac/adi-axi-dac.o:(.bss+0x10): multiple definition of `d'; drivers/iio/industrialio-backend.o:(.bss+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
