Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307363B3BE5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 21:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782251322; cv=none; b=MlHwkNtRSJuEMXKri+LUMM7Vxlv9nlxJ+jBlep+pHzVZ4ELiu40n/AEt5ED+XZAtlAAyunI3IqY4mG9Ktxg2eyPU88q1wRkee5IVskNZbzWizBTBTVBC+HmW58gkVLoO+PtLqc6penwZHibwFeEFMIIphnUvvL7wow2BluZPybM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782251322; c=relaxed/simple;
	bh=q3jqxHxSj/gigkFp3ablA9pKEjl6q/KSN8MpCg+OD2I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HbjdF5v2YEn6fA2QPlMca29JnaRMfbHnWYm0gy5UQlCWtXacE9TkyWg4glg8es2BATgedF0ivVnP3j2DRESPZsKx8ORgsLeuNUVhXk9Ic7VyKWHTI6nJ3kbxoCZz8PLQtn2HHXs5LhkFd2WCUMuIrdpYcMSIRij0XjqH5/H5YKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIygBERM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIygBERM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782251319; x=1813787319;
  h=date:from:to:cc:subject:message-id;
  bh=q3jqxHxSj/gigkFp3ablA9pKEjl6q/KSN8MpCg+OD2I=;
  b=jIygBERMY54YN04Mr6d8iQRPqWJlGiHnXbHOwsawKjapfN9AF7fOJLe3
   EIqfH9wH2uGwBcTS3xBSMdWrcOIkesygqbsYx9JW+zsT7w1uyCuEA3voT
   WoLZefuIMKva0eX6E8NCwrorGz+rHpSukI581U01niOOQO2HnNKWq3qPt
   iMly/e5x0nmSoKSJGKfO2pdps1gdwsmP5M+4aV6OKYBUr0vJHRDFKSSzG
   5x1N5fDOzRD1CqLOlFLgEsUoR+HpmtDFTLcZMPHkRiuVSJmJ8tj4ipDMo
   HHrrJxoNWUDukPsvJoquoXVzw/DKpI4+XAgAy6ODs+lh7ifRR/IJjYIBW
   g==;
X-CSE-ConnectionGUID: vrZjgP7aRQ+ydLfX5X17yA==
X-CSE-MsgGUID: yt/+vW3rSZ2JulH+pMcuTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83196686"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="83196686"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 14:48:39 -0700
X-CSE-ConnectionGUID: QnHX8cPZTt23PlNgkbHdsA==
X-CSE-MsgGUID: uJX9ZDzPSHKDMveutP301g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="248469265"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Jun 2026 14:48:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc8yw-000000002uP-2VnU;
	Tue, 23 Jun 2026 21:48:34 +0000
Date: Wed, 24 Jun 2026 05:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v3 5/12] s390-linux-ld:
 fs/configfs/dir.c:1972: undefined reference to `init_net'
Message-ID: <202606240517.uY0IHg6U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v3
head:   59472df96a84fb076a2b47a90a0bb353c80f239c
commit: 1d7a1a4141d31c9803b2584fc68335d2a9137998 [5/12] fs/configfs: add 'fill_subsystem' and 'clear_subsystem' callbacks
config: s390-randconfig-002-20260624 (https://download.01.org/0day-ci/archive/20260624/202606240517.uY0IHg6U-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240517.uY0IHg6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240517.uY0IHg6U-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: fs/configfs/dir.o: in function `configfs_unregister_subsystem':
   fs/configfs/dir.c:2090: undefined reference to `init_net'
   s390-linux-ld: fs/configfs/dir.o: in function `configfs_register_subsystem':
   fs/configfs/dir.c:1925: undefined reference to `init_net'
   s390-linux-ld: fs/configfs/dir.o: in function `configfs_link_subsystems':
   fs/configfs/dir.c:1967: undefined reference to `init_net'
>> s390-linux-ld: fs/configfs/dir.c:1972: undefined reference to `init_net'
   s390-linux-ld: fs/configfs/mount.o: in function `configfs_ns_id':
   fs/configfs/mount.c:33: undefined reference to `init_net'
   s390-linux-ld: fs/configfs/mount.o:fs/configfs/mount.c:126: more undefined references to `init_net' follow

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
