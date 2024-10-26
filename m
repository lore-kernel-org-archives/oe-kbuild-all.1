Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB74C52F76
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 02:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729910267; cv=none; b=NUHzIdei7e/vKtx8s/nWJr9vukf3oedJPOyXcd3n3FCujHGIPb3DYDjBVHihVheYPJktDhn2HrKVHdIjPmOlXEJa+HaR6DIv34MeUT9uBwVcV2lj10ZK2iWzMrl1fgGpb15KgTleEfkFfzaCt6PcvItnxe/6I23eo8blp6rooA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729910267; c=relaxed/simple;
	bh=DKrpzk5eC9hTeqIA8cLE/F/XfTuvoIfaFWNTIWmrt54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n1x+Oz5wv02g0DjiFvE4YK9gbmw8I2FTUhYXtEQFfmOUQtosQKb4AQrT4/xa+rA0A271LsfVkcijs5qsU8T8ZzkTN692e5saSATMzt2Y1r9pCUdYi82iuPd+0okCgzDSaBNgCqQwuDtZ4AxwfI1JCrwIl+sl2acXkgNF3RYO4e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ES1Ukekn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ES1Ukekn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729910265; x=1761446265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DKrpzk5eC9hTeqIA8cLE/F/XfTuvoIfaFWNTIWmrt54=;
  b=ES1UkeknQcd5DwRlmeapudhIIjYEstHBnncqiSIp1xl4w5VzwSFD7Mow
   D4p/Y+yC+Nx4wDKvjyyZyich0EdEymd0zo70vCsUkdKZwsEMLz971diU1
   qrRMIonVl11n1RH5GwWzkCKSrS2+b9pZHEcFXxLEnD+4h+r6kiqNVFqO4
   6Tr0AEZxVnIGIbCYSvI96plWl6XrfLevjejEjbSRvY2DjR19lwqaZw5gh
   4PGnVSa7N8hzt3UDOxFei8QZH/xQHkWg5MOC9kxfCouoKL1bdIsfbW3Sg
   M7Gy1UITAhunTDr9U648JygtLkYfDIysyntCmUQN6Ri43NLgA8418wDBX
   Q==;
X-CSE-ConnectionGUID: 3fEsL147SrGzbOuW/0h0tw==
X-CSE-MsgGUID: jTerWXhGRqmSgATdva0kNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40964625"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="40964625"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 19:37:44 -0700
X-CSE-ConnectionGUID: OFz3sOlASlyHPvAelzI+Ww==
X-CSE-MsgGUID: yEz8Fs58Q7ao/hgP95x5AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="118550554"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Oct 2024 19:37:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4WgO-000ZBA-1o;
	Sat, 26 Oct 2024 02:37:40 +0000
Date: Sat, 26 Oct 2024 10:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: [linux-next:master 6626/7183] riscv32-linux-ld:
 mm/execmem.c:380:undefined reference to `__get_vm_area_node'
Message-ID: <202410261016.IO7C6Cml-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a39230ecf6b3057f5897bc4744a790070cfbe7a8
commit: a9c60bb0d0e58ca30b8bfd00bddbe5bf79bd120c [6626/7183] alloc_tag: populate memory for module tags as needed
config: riscv-randconfig-001-20241026 (https://download.01.org/0day-ci/archive/20241026/202410261016.IO7C6Cml-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261016.IO7C6Cml-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261016.IO7C6Cml-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: mm/execmem.o: in function `execmem_vmap':
   mm/execmem.c:376:(.text+0x96): undefined reference to `__get_vm_area_node'
>> riscv32-linux-ld: mm/execmem.c:380:(.text+0xba): undefined reference to `__get_vm_area_node'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
