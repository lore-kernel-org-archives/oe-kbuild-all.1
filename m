Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81682566FC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Sep 2025 20:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759179200; cv=none; b=exOgC5LskjD5oelHmZyX/cg6sMIwQbv/rpbhmhLKEf/8jcNAaHKrOipwAPRwkjidNB6AS6qvNFRlPm+C5ZjSvVTGj/2WoGfOfYqRMCJ1ml/0nXkyGAoJWERETlvetl7qupSZ+BOtL/ILK9FZO1Lwn53hBs/k7d1JDi/0d5L6Rwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759179200; c=relaxed/simple;
	bh=1lf7Fqtg/5YJ3Un6TbzIkZeDyTlJs+Fxby7daGYMzaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TTerZatthoqoV++yzFKbGauGtS3H/nx4Ganzk363cLa2nRYj0yAjLaTRdZfz9tLeKC9WzLip6GG9XzCkbdjtwYlCbGibGpKShAJGCkzL3ZNdOp6rXtQ+6l1F07DbqHAGh60rard2Ru0xWvFhOF/hOwpt504b8pR3zNt3eSRjhEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Msl7PkLA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Msl7PkLA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759179199; x=1790715199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1lf7Fqtg/5YJ3Un6TbzIkZeDyTlJs+Fxby7daGYMzaI=;
  b=Msl7PkLAqT7Sn4nGtukHhH4VQff3ZvnjscsaeYelsVVWkPwfscWP5pHb
   kIeylW4YZq63JU6D98tpjdra9SBcpURYlY6PmOC0ht1gsp69xripTB04V
   zDkYUjEX95okyH0cPNoHnZMHKUUByUSUPITERSzyO/srydyAhT/cco2lR
   9r8V1xiHDdsn0UckUNj/rBzvNG+umisGQ6vYNGkybmOsaeEpFBLiGaAQL
   k61zQscdcfXyaUw+LJQDSa2zHlGayOI3z6FoyXo6+fwEhKhGPNPuVZMfd
   7p3CIF4ybufVVbGPrpu6w6PL7eIxC266WVVNKhL1fsYAITc9FpFpA7n93
   w==;
X-CSE-ConnectionGUID: ZIVy23zsRKmPQY4zrfS+vQ==
X-CSE-MsgGUID: RIqBBEESQN24VKRJqptzeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61345712"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; 
   d="scan'208";a="61345712"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 13:53:18 -0700
X-CSE-ConnectionGUID: /NWpcwObSoCo2Mc6ze0tXw==
X-CSE-MsgGUID: sbCiMNLASDO4MWmXck/ulQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; 
   d="scan'208";a="179096093"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 29 Sep 2025 13:53:17 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v3Kry-000000005z7-40WJ;
	Mon, 29 Sep 2025 20:53:14 +0000
Date: Mon, 29 Sep 2025 22:52:24 +0200
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [linuxsecuritymodule:main 1/1] htmldocs: Warning: README.md
 references a file that doesn't exist: Documentation/API/obsolete
Message-ID: <202509292208.v7fqEzib-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/LinuxSecurityModule/kernel main
head:   3df91be27cdd585c3fe381b42b1816a260682759
commit: 3df91be27cdd585c3fe381b42b1816a260682759 [1/1] lsm: add a LSM specific README.md and SECURITY.md
reproduce: (https://download.01.org/0day-ci/archive/20250929/202509292208.v7fqEzib-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509292208.v7fqEzib-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: README.md references a file that doesn't exist: Documentation/API/obsolete
>> Warning: README.md references a file that doesn't exist: Documentation/API/obsolete
>> Warning: README.md references a file that doesn't exist: Documentation/API/obsolete
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Using alabaster theme
   ERROR: Cannot find file ./include/linux/pci.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
