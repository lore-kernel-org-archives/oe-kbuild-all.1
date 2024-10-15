Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9F418B488
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728986026; cv=none; b=ikLhgM+3+iLgrQ3Ai+crjCWiSf2ZXRCuhUCz0piUuEf1rW3kuotv+HrPCpN/JWzwe484o5ryd+cDCpzjlYDEweNJpl8Ymvnp86QDyQ1Io9KKaybKWtAFiUWhwA5wxQqZTXV1bfDMWyoM5kVzoQyePg45KeRrngTDM4UL6FMpgXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728986026; c=relaxed/simple;
	bh=Hu4RltzNhLWA0o2PBYSRJomW5r/qQ/Y3ujr9dOLjEE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gtwiyhqxOkLDoA9DFlnPLICwuAE408/um+zO3cc6hkll9f8br2LvvxW4blWwz1ie5aBMT6uZ4GfZfjuNc3jgH1Fz7xDKoKxgDXZJ5MdaHD64lWloGcAAWeHbrDEcvJODx4NPuNpDm5mrnK4+Dn1Mx6p9VpUFFQl7lshQO7YwWig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZ1wq4hx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZ1wq4hx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728986024; x=1760522024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hu4RltzNhLWA0o2PBYSRJomW5r/qQ/Y3ujr9dOLjEE0=;
  b=IZ1wq4hxalZy+rpyoTPYjSBvkSWzSdFQdCHBweXfjq5h5b4Ts+75YZE3
   FJDtwH3uZApjqtwKBWA1EHAa4syqYHV8NgkUKHCm2Sv9dkx/QFw/7a20o
   IkH8gpJKCn28j90vqamLJAlfYfHEZThj6uuxwffL3jZ5fXqCRBFAeNGVz
   1GHpZcZuhaxJsM9EoNVN2Yhg79AbdNFsOm9Gp9oNj/Gl6nzt82soYTdrl
   WeFBTwq0QezpefYVlf8C9USJOOrg2+6fG8eb3z1JAlE9pVWjI4oXTZf8v
   BRgyjwB7jfuRjeAK88ldiCxfHAL8Cw9w3ZNUNw1PiUMYauT8+eyAo49of
   g==;
X-CSE-ConnectionGUID: sgC1KjZSRpChA+OxFUTNTQ==
X-CSE-MsgGUID: yaCueq6iTkmOHzRs8g47oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45840923"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45840923"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 02:53:43 -0700
X-CSE-ConnectionGUID: mrAbbLExSx6QqeW7ht9A/g==
X-CSE-MsgGUID: miXSB7NMQOG0e1oJUzEgzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="82621642"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Oct 2024 02:53:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0eFI-000Hu1-12;
	Tue, 15 Oct 2024 09:53:40 +0000
Date: Tue, 15 Oct 2024 17:52:42 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip-rt-rebase 188/440] kismet: WARNING: unmet
 direct dependencies detected for ERRATA_ANDES_CMO when selected by
 ARCH_R9A07G043
Message-ID: <202410151738.AD7WDtDZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip-rt-rebase
head:   08788bbb26e6f92122914516e7d36ade297a3f3e
commit: 5f6eeb7dbc55b8b2859a8776e825e68b6b2e5730 [188/440] soc: renesas: Kconfig: Select the required configs for RZ/Five SoC
config: riscv-kismet-CONFIG_ERRATA_ANDES_CMO-CONFIG_ARCH_R9A07G043-0-0 (https://download.01.org/0day-ci/archive/20241015/202410151738.AD7WDtDZ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241015/202410151738.AD7WDtDZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151738.AD7WDtDZ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ERRATA_ANDES_CMO when selected by ARCH_R9A07G043
   WARNING: unmet direct dependencies detected for ERRATA_ANDES_CMO
     Depends on [n]: ERRATA_ANDES [=y] && MMU [=n] && ARCH_R9A07G043 [=y]
     Selected by [y]:
     - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]
   
   WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
     Depends on [n]: RISCV_DMA_NONCOHERENT [=n]
     Selected by [y]:
     - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
