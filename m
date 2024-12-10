Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE262153D9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 10:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828161; cv=none; b=VWBSYqdmRKC7xcsYb9J+d7vQXcvZPSywIY/ysPVp1xd6pKDGzyDu0kCRf9vUZSTUByybTvmzpfkPBam3FeytddpBjAHBScsuKhgMOMuWMcVnsAw/eUmc+CD/5HCYNs7KG1dnlxAxOZkaSZnt3KB0Y9TaTwUgvhxKiTmSNf1EyIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828161; c=relaxed/simple;
	bh=jXX/DBxudNQfHu4Q/vRKdtzuFd9nNKzqaCt/A48wjWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VKPCG4+iuFPBrUqtSYAMf/5vv/zzuxX9e4SmjfK7P+oFmf2ugYiApXidcU1NklkgwNLKfclkuWe3Q1w99e3fQGYIPi+MZwcEFkWn5FJrLDTOcZKLY7kIRuOS3oKYIb++Bf+Y0MikfkpjZCsKVYLq4vZBrkz/BK3kgIgFbp/+Xmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3QFVPbj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3QFVPbj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733828159; x=1765364159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jXX/DBxudNQfHu4Q/vRKdtzuFd9nNKzqaCt/A48wjWs=;
  b=l3QFVPbjWBVhoGOArvuUIdorBSm8oWA5FfK3B1j2EIzrsqLDvoL3Zp4k
   FjYlhTGsKoSPTC/N36aQXU1n9gtHnRzd1kfr83Uvfo0qqtQZHacTJht+A
   e147vt8TlLm6Z29MP427eB25DbnFvwQsjIzpPgdxlRyXlJH9ua0fgtJvS
   y3swF/9FLrk+Z5eJuNxIVmsydnfXDaDypDRH2NpSuoR2Z5d+prTTlo34v
   /xfzR0PvdUhuMvCTrXY5rn3hMjkZOCioh3izFXhFSVzrUjl6JSSHyK9tY
   +68yMDa//0AKm9YA8o5YP55e4LUuZmbxoliUU0XegdG87sVb6r39HDPmQ
   g==;
X-CSE-ConnectionGUID: 6rGZ0jmTS2OVvJ8lvkpcZQ==
X-CSE-MsgGUID: 4CtgH1RMSGu0xhMg9c5O7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34086383"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="34086383"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 02:55:58 -0800
X-CSE-ConnectionGUID: WXGQ0LtET4yuyQr0V5B+mw==
X-CSE-MsgGUID: GbDaBJRwSXmXaQhW7kdLPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95568300"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Dec 2024 02:55:56 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKxuE-0005RO-2C;
	Tue, 10 Dec 2024 10:55:54 +0000
Date: Tue, 10 Dec 2024 18:55:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1610/1610] rnpgbevf_main.c:(.text+0xb6bc):
 multiple definition of `remove_mbx_irq';
 drivers/net/ethernet/mucse/rnpvf/rnpvf_main.o:rnpvf_main.c:(.text+0xc0b0):
 first defined here
Message-ID: <202412101859.KXPZLAMD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c0c5f5fdc62998e0c68e6c77d6aae2566185bfd5
commit: bf177ad1d8f72824180b44563c09f37562f645de [1610/1610] drivers: initial support for rnpgbevf drivers from Mucse Technology
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20241210/202412101859.KXPZLAMD-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412101859.KXPZLAMD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101859.KXPZLAMD-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnp/rnp_mbx.o:(.data.rel.local+0x0): multiple definition of `mbx_ops_generic'; drivers/net/ethernet/intel/ixgbe/ixgbe_mbx.o:(.data.rel.ro.local+0x0): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpm/rnpm_main.o: in function `.LANCHOR3':
   rnpm_main.c:(.bss+0x110): multiple definition of `mpe_pkt_version'; drivers/net/ethernet/mucse/rnp/rnp_main.o:rnp_main.c:(.bss+0x60): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpm/rnpm_main.o: in function `.LANCHOR3':
   rnpm_main.c:(.bss+0x114): multiple definition of `mpe_src_port'; drivers/net/ethernet/mucse/rnp/rnp_main.o:rnp_main.c:(.bss+0x64): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpm/rnpm_mbx.o:(.data.rel.local+0x0): multiple definition of `mbx_ops_generic'; drivers/net/ethernet/intel/ixgbe/ixgbe_mbx.o:(.data.rel.ro.local+0x0): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpm/rnpm_pcs.o:(.data.rel.local+0x0): multiple definition of `pcs_ops_generic'; drivers/net/ethernet/mucse/rnp/rnp_pcs.o:(.data.rel.local+0x0): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpm/rnpm_ptp.o: in function `.LANCHOR1':
   rnpm_ptp.c:(.data.rel.ro.local+0x0): multiple definition of `mac_ptp'; drivers/net/ethernet/mucse/rnp/rnp_ptp.o:rnp_ptp.c:(.data.rel.ro.local+0x0): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.o: in function `.LANCHOR7':
   rnpgbe_main.c:(.data.rel.ro+0x0): multiple definition of `rnp10_netdev_ops'; drivers/net/ethernet/mucse/rnp/rnp_main.o:rnp_main.c:(.data.rel.ro+0x0): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.o:(.data.rel.local+0x0): multiple definition of `mbx_ops_generic'; drivers/net/ethernet/intel/ixgbe/ixgbe_mbx.o:(.data.rel.ro.local+0x0): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.o: in function `mbx_cookie_zalloc':
   rnpgbe_mbx_fw.c:(.text+0x128): multiple definition of `mbx_cookie_zalloc'; drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.o:rnpm_mbx_fw.c:(.text+0x6a4): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sriov.o: in function `check_ari_mode':
   rnpgbe_sriov.c:(.text+0x2acc): multiple definition of `check_ari_mode'; drivers/net/ethernet/mucse/rnp/rnp_sriov.o:rnp_sriov.c:(.text+0x2af8): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ptp.o: in function `.LANCHOR1':
   rnpgbe_ptp.c:(.data.rel.ro.local+0x0): multiple definition of `mac_ptp'; drivers/net/ethernet/mucse/rnp/rnp_ptp.o:rnp_ptp.c:(.data.rel.ro.local+0x0): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.o: in function `remove_mbx_irq':
>> rnpgbevf_main.c:(.text+0xb6bc): multiple definition of `remove_mbx_irq'; drivers/net/ethernet/mucse/rnpvf/rnpvf_main.o:rnpvf_main.c:(.text+0xc0b0): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.o: in function `register_mbx_irq':
   rnpgbevf_main.c:(.text+0xbc28): multiple definition of `register_mbx_irq'; drivers/net/ethernet/mucse/rnpvf/rnpvf_main.o:rnpvf_main.c:(.text+0xc61c): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
