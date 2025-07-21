Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEC2221277
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 19:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753126220; cv=none; b=XWRFNB5wTeh9CNT7vGa+1zSFjbN+j7YG5yNqwFGoF3MKYkAmOxRnN+lkSge2SPrwBzwMkbZZXmysEeh5fqjKhK9mnIDHzL4G0NTuTpr04l4LTicweMvutY59Hco4/LVJVSmGrHp/Rpni9tJdIndhyJp470cMh4Dq8lSLil8ReL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753126220; c=relaxed/simple;
	bh=JvJIOHG7ACly5KJEdbrw0RxiAf7kM2lV/ffE50DPwek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aeRDHG8MduHagKdPwI+BRmLkqHr4vgPkpg8xkercmLXRqv48gVBLnmSfzXTS6CpKotvQU+qdUzYXQNI5BPJMbt+OrMuNGwCNcDWD1ytG6hM5l3vjYGV1vfv1wV24/ZdGU+eFnmU9eMqBlJWYELNqsbcb8Pj5/Sf2JpdUKtRrDBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DYJbyuf4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DYJbyuf4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753126220; x=1784662220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JvJIOHG7ACly5KJEdbrw0RxiAf7kM2lV/ffE50DPwek=;
  b=DYJbyuf4OkQLI+v/BT58ulaLIRx6Eh1eOsqEa3qmpAuvGYNWzzLwHfwK
   lk4QM/OrYF6wAfH9VZcgBGKUFjCZ0BgL2l1aNPVSmbFMZFNBzwB/hBYk0
   ap6GAJfo3GPeJ8+wrnfYal2yoUeRgY89X1um010cUMAqyMaK2NV4rxf7p
   8MgKy/CDmhVk6QeAp2NQ6oJCZu1RTIsps+TOesyDeaQH9SiDQL5RsiXj7
   ApOpQCQrnBASTqUyxvcofIPGK8BhDZAZwmF2Z3zWgHz01QtLqHN5H9Y2v
   /fL9YNBS+qKop5G/1pNvXCmvgrE+jPiIPKQJoWEs+T+4bvF/Vt8Engh6a
   A==;
X-CSE-ConnectionGUID: u+s45C4oT2CP+r0Yz+kQMA==
X-CSE-MsgGUID: GCsAOXiGROyFxukvm6omtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55312172"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="55312172"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 12:30:19 -0700
X-CSE-ConnectionGUID: Z0w4VIskThKtuD6tcfXfOg==
X-CSE-MsgGUID: w8X/SVhxRoi+3TFBvuskPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="164419390"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Jul 2025 12:30:09 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udwD9-000H6X-09;
	Mon, 21 Jul 2025 19:30:07 +0000
Date: Tue, 22 Jul 2025 03:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [linux-next:master 5907/11398]
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dtb: sdhci@2200000
 (mobileye,eyeq-sd4hc): $nodename:0: 'sdhci@2200000' does not match
 '^mmc(@.*)?$'
Message-ID: <202507220336.JhvVLL7k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   97987520025658f30bb787a99ffbd9bbff9ffc9d
commit: 2de84c70ffcd5dea6050fb343d1a61c0e22e2b5b [5907/11398] MIPS: mobileye: dts: eyeq5: add the emmc controller
config: mips-randconfig-052-20250722 (https://download.01.org/0day-ci/archive/20250722/202507220336.JhvVLL7k-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507220336.JhvVLL7k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507220336.JhvVLL7k-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/mobileye/eyeq5.dtsi:53.17-73.5: Warning (avoid_unnecessary_addr_size): /reserved-memory/nvram@461fe00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/mips/boot/dts/mobileye/eyeq5-epm5.dtb: sdhci@2200000 (mobileye,eyeq-sd4hc): $nodename:0: 'sdhci@2200000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml#
   arch/mips/boot/dts/mobileye/eyeq5-epm5.dtb: sdhci@2200000 (mobileye,eyeq-sd4hc): compatible:0: 'mobileye,eyeq-sd4hc' is not one of ['amd,pensando-elba-sd4hc', 'microchip,mpfs-sd4hc', 'microchip,pic64gx-sd4hc', 'socionext,uniphier-sd4hc']
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml#
   arch/mips/boot/dts/mobileye/eyeq5-epm5.dtb: sdhci@2200000 (mobileye,eyeq-sd4hc): Unevaluated properties are not allowed ('bus-width', 'compatible', 'max-frequency', 'mmc-ddr-1_8v', 'mmc-hs200-1_8v', 'mmc-hs400-1_8v', 'mmc-hs400-enhanced-strobe', 'sd-uhs-ddr50' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml#
   arch/mips/boot/dts/mobileye/eyeq5-epm5.dtb: /soc/sdhci@2200000: failed to match any schema with compatible: ['mobileye,eyeq-sd4hc', 'cdns,sd4hc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
