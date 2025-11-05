Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C9033A002
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 18:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762366286; cv=none; b=to59YLifKYSQyQmti/dKN3Mkgt9tw1g1zej+s91peiN83CEizU19ruvS/ziTPM52WSqdmiuLYoJCJZgFGHMEkj9b1fGoRCnC0+WwfvcXCUmbHwYEKLVVG0uUZEC8R1lTBPHc72x1+Xzd+atwNZghU+Tl4jvhwu/fCNzTaybZlRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762366286; c=relaxed/simple;
	bh=9loNyRUX1wS2cOs7DQJJEJ95uz7h+5PiXpPI+M3H/ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RTqTYE86p5lM848ZXH9jFYyyaZtIi1Esim2/IsuJ2twBz3YiZocUhbECcQ/lW5aSeF73H0waiX3H/TEJmZaeWLhxX2/C8yjXKARu1hlcEV6FGnMtLh1o2mhO8tm+BL+u9tJVSCF6gj59hHv4BEKxUBB5tGhx0k9r8qDsvQXOPIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/ZrUVJ1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/ZrUVJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762366284; x=1793902284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9loNyRUX1wS2cOs7DQJJEJ95uz7h+5PiXpPI+M3H/ao=;
  b=S/ZrUVJ13yChf1/6oswEEeHXM2zs7/QmzzMrADQkVRRnqDWZSepfANF6
   KzuZg5hEtm9bUnfgXWs6bR29666klolNU9UAgKxJ7h71x5Xh7VsQ0PRod
   EbEWWfQ8NuFfLqsmBr2L+Vb5W9xVqU8H8N7jERSwXH2Zsw8ELHLwDuKDl
   xJUsb9vzzpFCDj+wdlqPevmPMj0RT9T32j66sBghldguZrVO4kJAfKzfg
   BLU46OkOsIR4eiXMfqTS5N28G+sMF2sy/rODFKxoN8zXub7Rtq3u75j0n
   74IR4OyLZ4E0kdbLniVNj35+qInGpPc1USH1AY1z8yaN69cySj6vgAlO1
   A==;
X-CSE-ConnectionGUID: mVIbkuuFS+u6H9q9PBBbuQ==
X-CSE-MsgGUID: 5z2HjLZkRDK3Tn+EfFau7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64405189"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="64405189"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 10:11:23 -0800
X-CSE-ConnectionGUID: quFJjTh1TiuZnS0SxOxwUQ==
X-CSE-MsgGUID: 6FC3tLUgRj2h02UmRepFNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="187191632"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 05 Nov 2025 10:11:12 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGhwW-000Sy4-1H;
	Wed, 05 Nov 2025 18:10:18 +0000
Date: Thu, 6 Nov 2025 02:08:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Alexey Kardashevskiy <aik@amd.com>
Subject: [linux-next:master 5630/6507] ide.c:undefined reference to
 `tsm_ide_stream_unregister'
Message-ID: <202511060242.1PnkE9qI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84d39fb9d529f27d2f3d295430d1be0abdae7a6d
commit: a4438f06b1db15ce3d831ce82b8767665638aa2a [5630/6507] PCI/TSM: Report active IDE streams
config: sparc-randconfig-r113-20251105 (https://download.01.org/0day-ci/archive/20251106/202511060242.1PnkE9qI-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511060242.1PnkE9qI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511060242.1PnkE9qI-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: drivers/pci/ide.o: in function `pci_ide_stream_release':
>> ide.c:(.text+0x898): undefined reference to `tsm_ide_stream_unregister'
   sparc-linux-ld: drivers/pci/tsm.o: in function `connect_store':
   tsm.c:(.text+0x88c): undefined reference to `find_tsm_dev'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TSM
   Depends on [n]: VIRT_DRIVERS [=n]
   Selected by [y]:
   - PCI_TSM [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
