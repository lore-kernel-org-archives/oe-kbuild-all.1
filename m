Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF7417545
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Mar 2024 00:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710722041; cv=none; b=Ujon39KPjYh7/+Q7A0ngGY2kBHVQ+WyhYh5TqDbyhu7OU9OzryEMK+NYvPC9dVe2aNv+WJRYgZuT1x3JWQRwpYgh5qoVhPH5PCzPs9PKuOAMSQFqEVH+tOfZxDmxnIr1T6oGNrDHhpME7Oe9Z17rl+npSHh1AKXjE6UCHoES2WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710722041; c=relaxed/simple;
	bh=MHg0NKKUw3YHEBfoEYMc8wiQax3U8R5I7t7SEw8GybU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a7+cYVZTGA4FB+QJhKTf+gSyhBIIsg+lShsQcW8gTPQY9ztx8dCzIJsHx5u2xGvykz/eAY1EZ6Eg1uFrgYkNZf1P32II80nDiwyPUIBdWxjHCvaY51t1fPD7SWJgdi5n0Jm/BQ6Mp33SqtJQXaeDRm+aXKRLxcn6v7h047wVEw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wz+QrkqA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wz+QrkqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710722040; x=1742258040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MHg0NKKUw3YHEBfoEYMc8wiQax3U8R5I7t7SEw8GybU=;
  b=Wz+QrkqAMTLa744Klsw5Nr7xwPv0o5//gWe5diYUt834KLt6gWACcTm4
   uCyH0brYWKeGPIHg5mQrMKdp8MeTHF+6ialskGlseGd1bZZ0r9vMnxl+3
   LnlB0pDh5NDbgx70Gkx/ymOpzxpQy78QWH9wwhiuV+spFWN4pvf5nxXPn
   uOH4XAoxRuVO6+GR5LYsH2WBXUO2jzw7t1Cs/xe2G5CjUsOLWNipOWg5Y
   aMvnlaeZXwjtKhHr0XSka6OhpuWvT/1dgSQEFgxzJrvHmfLk2UqFmuMTB
   BtNML2aiaN5QgGB8WaigWPGXqbUPEwI7DS5YXJeYfk2xCEtOcyo/jxIiJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5357929"
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="5357929"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 17:33:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="13773951"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Mar 2024 17:33:58 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rm0wt-000GYh-1h;
	Mon, 18 Mar 2024 00:33:55 +0000
Date: Mon, 18 Mar 2024 08:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: ERROR: modpost: "ebus_dma_irq_enable"
 [drivers/parport/parport_pc.ko] undefined!
Message-ID: <202403180855.4Mss6APq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   906a93befec826475ab3d4facacc57a0b0a002a5
commit: f73edc8951b2de515b5ecc8a357ccd47dd41077e kbuild: unify two modpost invocations
date:   1 year, 6 months ago
config: sparc-randconfig-002-20240317 (https://download.01.org/0day-ci/archive/20240318/202403180855.4Mss6APq-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240318/202403180855.4Mss6APq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403180855.4Mss6APq-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux.o: section mismatch in reference: leon_pci_init (section: .text) -> pci_assign_unassigned_resources (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: grpci2_of_driver (section: .data) -> grpci2_of_match (section: .init.rodata)
>> ERROR: modpost: "ebus_dma_irq_enable" [drivers/parport/parport_pc.ko] undefined!
>> ERROR: modpost: "ebus_dma_unregister" [drivers/parport/parport_pc.ko] undefined!
>> ERROR: modpost: "ebus_dma_register" [drivers/parport/parport_pc.ko] undefined!
>> ERROR: modpost: "ebus_dma_enable" [drivers/parport/parport_pc.ko] undefined!
>> ERROR: modpost: "ebus_dma_prepare" [drivers/parport/parport_pc.ko] undefined!
>> ERROR: modpost: "ebus_dma_request" [drivers/parport/parport_pc.ko] undefined!
>> ERROR: modpost: "ebus_dma_residue" [drivers/parport/parport_pc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
