Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B0E19D8B1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 14:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718373988; cv=none; b=Q7vNTYDBqXudTcEDwnJe2kW27W/KFsRbvkzshM7SMt1/N5mYVRrS4CyaQhjCoKZQLDo1DDqCgy79OBPgKF9xSmYSAzpRsobEZ21bP9WeCEzK8hgcksahXpFq6Sr6qJ52Nfncm9yqntjN9iIP25wIB+2fXWFXpTa8GhFkKlDXOFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718373988; c=relaxed/simple;
	bh=I8IQCKKFPz20W65jzBAJo/s/T7Cx8FDqxHVZKlc8+zI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WavIeB/prOw/np84YvfB7nzgRB6upfbkV+3r1QmH8AwaEUqYyHdmM/r5Q68YKNQ1TkG94wj6RzOHP71v6/L+N+fqmP468vtB+6RFqYdw1d/l+PhslwD/KIkxug/tuaJyvOCbmhd2pOmO/B9JDBLxZc5a2tdmN6+1MeHCYdw9zX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H06wUMFj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H06wUMFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718373986; x=1749909986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I8IQCKKFPz20W65jzBAJo/s/T7Cx8FDqxHVZKlc8+zI=;
  b=H06wUMFjPY4XWqwJoJCk0ocrZec2XexNaLdODXmBIMwmkwUcMvMT1Knl
   kgbGF8x4pONRVhU1CMjD9cnq8uBPuLCdvhqL0pmQXtozx5OAoumPvwa1h
   NCoHp3ukWfAcpr39lkHbhrLKI3l7+nFShzpl5nu39a3eaY0mcYMPCpwYW
   4VI2L5fOk5pVzQwpDiucssF68rpmbjFYFocc8mR5EiDrIKbepN8l0GhII
   fB3pRmTxsYXtBWqgDCF0wASavb5jeEU6HYYkNQ0tn+tIVhfmNaBRGHQK8
   rQKFOWBScMt9r/8vcnmJrEts4vmnsJzagfgDhtqKXDW4CKfYtcc8+sOM9
   g==;
X-CSE-ConnectionGUID: hrwy/i/xR4qUZ8cAjqRdaA==
X-CSE-MsgGUID: l4xHr4LJTNe9wBY/Z3plPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15488569"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="15488569"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 07:06:04 -0700
X-CSE-ConnectionGUID: lg7cT+F0THWdheOkjLqR8g==
X-CSE-MsgGUID: L8wxKc7URDSRR9R2+sLQ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="41190354"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Jun 2024 07:06:04 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI7Z3-0001NL-0j;
	Fri, 14 Jun 2024 14:06:01 +0000
Date: Fri, 14 Jun 2024 22:05:32 +0800
From: kernel test robot <lkp@intel.com>
To: "steve.jeong" <jkhpro1003@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.1.y 62/91]
 arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dts:16.5-15: Warning
 (reg_format): /fragment@0/__overlay__/spidev@0:reg: property has invalid
 length (4 bytes) (#address-cells == 2, #size-cells == 1)
Message-ID: <202406142142.RCKRalEo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   a50c6922e2b4c1d7c895bde521d13096ba16a863
commit: 0f3e23be0aac626b96e1f5fcee1620c5bcf9b799 [62/91] ODROID-M1: dtb/dtbo: Add spi overlay
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240614/202406142142.RCKRalEo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406142142.RCKRalEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406142142.RCKRalEo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dts:16.5-15: Warning (reg_format): /fragment@0/__overlay__/spidev@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dtbo: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dts:13.21-19.6: Warning (avoid_default_addr_size): /fragment@0/__overlay__/spidev@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dts:13.21-19.6: Warning (avoid_default_addr_size): /fragment@0/__overlay__/spidev@0: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dtbo: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dtbo: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'

vim +16 arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dts

     3	
     4	/ {
     5		fragment@0 {
     6			target = <&spi0>;
     7	
     8			__overlay__ {
     9				status = "okay";
    10	
    11				pinctrl-0 = <&spi0m1_cs0 &spi0m1_pins>;
    12	
  > 13				spidev: spidev@0 {
    14					status = "okay";
    15					compatible = "odroid,spi-dev";
  > 16					reg = <0>;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
