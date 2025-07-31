Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8754C20B22
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 21:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753998483; cv=none; b=JgDm1C61qU1qLnQxwWOFVxqjZbZTHdZpjaSmm490+ZZpQwSC0t8TAv10J65MMTNz0RYOzcKpif0x+3W9+lvuJ3ej5UwEqoH/NQc7fpKsJ8QfwiYR+mxh2YOl8a2WGxVIIOa8w2Gdegm6KQVOf8Du/NeYhCgqfphzA82D5UQxNuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753998483; c=relaxed/simple;
	bh=sPgLamDwuPYUXqyti85dmBb4C7slGVN8MKmrf8/VXg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nATxUyXQBSktf2DAgXZ3PYQriDLxNpx7EVLSWeYJK8sOORFv3SyYZC4ZMrnu0vVgQNMfU5z4n3C1E3XxHQ6msbOizIb9YgqDajxO1hRcUTdJe62ru5GRnQkFpr15+WEDQsSFGjF9znDxnHTuAHcX37tl8s15m1uLqnxm4QQpCOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TPgyy7NJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TPgyy7NJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753998482; x=1785534482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sPgLamDwuPYUXqyti85dmBb4C7slGVN8MKmrf8/VXg4=;
  b=TPgyy7NJwXqqNN5Y5+84wfnajBNB62td6lSvJaFTgi7GuBctMsJPCll6
   p6P8mIdO21c+7Aw/nyvAxT3B54NxgPRIbKFxQwQUYYeiLIvlAzmADaMut
   W3XlDiuPBKeJshCKfkm5fEN3cw9GaM/oz9ZurGKyoRAWETEVggwPf3Yeo
   rPTHvB8Ef3T3+fa+X/qo5NK/FyXD/G2ZDPCL6+LUpKzEuwjJGbrrAI0tP
   eYEdM270gonYKA21OGD91YdRbqID1sQOp4jW/5347bGvfsog5HFUqxW+r
   AW+jpaGx1ahLlJrLiYQ/82GKFCX8K7LAMtw1SBQFyjSpyQXuE1hHHzW9L
   w==;
X-CSE-ConnectionGUID: tgRIanwhTWSAXLjOKm2KJA==
X-CSE-MsgGUID: 5sXQqbGyTpq6B5r0QG3jrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67784167"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="67784167"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 14:48:01 -0700
X-CSE-ConnectionGUID: Ahh6dCyaS5KNzokQAeqvCA==
X-CSE-MsgGUID: kT5X3gRiQJe2Pfx5Jz3v0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="164170689"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jul 2025 14:48:00 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhb82-00015X-1A;
	Thu, 31 Jul 2025 21:47:58 +0000
Date: Thu, 31 Jul 2025 23:47:46 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-CWF-SST-ANBZ22493 0/1] htmldocs:
 Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file
 that doesn't exist: Documentation/driver-api/ioasid.rst
Message-ID: <202507312333.gLP4gvaI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-CWF-SST-ANBZ22493
head:   6e920c19ef4a8f89209c5ac5530a793323f633b5
commit: 44bd8d48687633f2db2d10e687152ba61273db47 [0/1] docs: cgroup-v1: Add IOASIDs controller
reproduce: (https://download.01.org/0day-ci/archive/20250731/202507312333.gLP4gvaI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507312333.gLP4gvaI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/x86/sgx/2.Kernel-internals.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
