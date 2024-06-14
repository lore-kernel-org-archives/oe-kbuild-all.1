Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E18F18F2C8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 23:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718406990; cv=none; b=m13VTmb8LT5+D97PDVrxZcOzCoDfjrEYET10ujfQ0JPk6oXPZUeSis5RbnSXxde8ZfryFeL0+PRq3BR4ehbYpj/0hyftqyn9bzsuZX5VeyechvKVLcsS2aM9BHg3uN0SBqFRJBvwARukBcOscMScA8I7oSWkGcO0bb5pqZcAYJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718406990; c=relaxed/simple;
	bh=QI+G+0yk6JOOB7CTLJuIp+A5Tx8bdm+cg9pT6OMwvZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U627XX4e99G/fP3Nl04C6MpOHO0jNH0zVLL0ht6hGsoJdner472SEHUTPyDgH6X7/jFe/L1kqHNEumpFgBg7ElAMVAzDyjwBZIvVwBWbaXn9mdVNfsHhXXAe8F77VoeTDEpKEKnyIEd9+a35CPHJ5IJifWP75TgMaC2rRGjGfc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kb9WakCc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kb9WakCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718406988; x=1749942988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QI+G+0yk6JOOB7CTLJuIp+A5Tx8bdm+cg9pT6OMwvZI=;
  b=Kb9WakCcwElei+IPN/CQTtacu+cbcUr429JDQCCrZO6qc0KYD5jtBIQz
   AMm3RDnTTuSIr/V9lsZ+6dY98y9msdne6YO6wY1JJ58jYJaaXVBCJj1es
   EpOPMFatkmItcEOY49oyUdFv5dsoZKItWKk5lhOEet55l231F8Z/sxnOh
   pvboJ1pExY2bDG0c46W8PQRcHswa0be8tDIk1lvemo5K8EU+Nf5ooNe+8
   WkU57/J//eSedgvmqJgBePnqFOky/CFxXZxt44iE1sWHzA4EMDe7DdOOJ
   Q/1QObLB+3MT7AQjw7JB+R9bYfXea8z44e1tieYP32NSjGzQfbLnKBHak
   A==;
X-CSE-ConnectionGUID: xZxIOPpPQPK1VhzKUO9YKw==
X-CSE-MsgGUID: stTo77yOTPuGYgxsj0TSsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="32791071"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="32791071"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 16:16:28 -0700
X-CSE-ConnectionGUID: 7JJaIkalTS60xdnRlCePyA==
X-CSE-MsgGUID: H1laSko8R8KSADdID/QHMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="40496682"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jun 2024 16:16:26 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIG9g-0001tZ-27;
	Fri, 14 Jun 2024 23:16:24 +0000
Date: Sat, 15 Jun 2024 07:16:14 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:qwip 10/16]
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: mmc-slot@1:
 $nodename:0: 'mmc-slot@1' does not match '^mmc(@.*)?$'
Message-ID: <202406150744.gzLIab3I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git qwip
head:   9956455899baf6f0007d2a58feff4a61a8ff4ea9
commit: 89c7a50bba25cd37dfddc1f9cd63083660b0c8f3 [10/16] riscv: dts: microchip: enable qspi adc/mmc-spi-slot on BeagleV Fire
config: riscv-randconfig-051-20240615 (https://download.01.org/0day-ci/archive/20240615/202406150744.gzLIab3I-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150744.gzLIab3I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150744.gzLIab3I-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: mmc-slot@1: $nodename:0: 'mmc-slot@1' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: mmc-slot@1: Unevaluated properties are not allowed ('disable-wp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@41100000: ngpios:0:0: 16 is not one of [14, 24, 32]
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@41200000: ngpios:0:0: 20 is not one of [14, 24, 32]
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@44000000: ngpios:0:0: 20 is not one of [14, 24, 32]
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
