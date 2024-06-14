Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ACE146A8E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 22:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718403940; cv=none; b=S6mh74QniHxSK8hmSOMljA61iBSdWBzvF6N0rndFievOzBy2zyc+FIhn91sA379P/EouVEHkk86LVDhxdo+XSZOkntqlZv1swfE71PgX7tEg79pZd1aZd4CypYl7uCJGCYgn2v6cGKiaWm9KzgYNLpytjPNWs5zF6kyJCFWpsTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718403940; c=relaxed/simple;
	bh=5nv5otIaZL6bVRaNkKnDkfzCIbMMRr/JiaX/kYaA3zA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=suB5iR2cckWGumWruPddYrnKsNrG3PjNQh8R203NpwKg3RjN6W+w9rKFNIOQUCMZUkCfyBLCptsY9XdbrbvqM+6/3OArQGCCsF3+S/0QKBjZbJLje0eNZBL6+S5uyrkXbbt1dDe3AdO0SBuL+U+Vp6JYnAv6Xh6I+HumypLmcPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpvfJIOQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpvfJIOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718403939; x=1749939939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5nv5otIaZL6bVRaNkKnDkfzCIbMMRr/JiaX/kYaA3zA=;
  b=MpvfJIOQzF6U7CgbU8HGHxrC2ayInyqV9Jbte3uLiWKqsN0xIEIqATGE
   r7ws8tudJ6vrLEFU6xGTYx55Jy/YcQ8UC9hxGVcJBkhpLU89PK3y45Mgw
   t/S5t/5PC17ikimT4nPKQQJfKGL9HIA/ByfttuyF6LOc1kFjHRpgJ08NA
   xMX9j2zNOvii6xdIBuxPHtET4R1uWVGuqRMrpBOiv5ijWYEOhAzNIuz3J
   LYPv6q/T/K0VN5j4e9QZF9VwxafIQ1hZsBJbIhfmYWN/Jm9XtZVChPtPV
   rfNYFuChnRzYoSwCOgu/sN3jkEvQhE/gKAvZ1XWVjJICQJ/7hOpWT1m4o
   Q==;
X-CSE-ConnectionGUID: vByBRZoBTjW2iLFmp9Ti0Q==
X-CSE-MsgGUID: Kn8PKxc8TNWXleZuELabAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="37835239"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="37835239"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 15:25:38 -0700
X-CSE-ConnectionGUID: EeVPb/eBTH+vW7dNi/AWkA==
X-CSE-MsgGUID: uCsmz8AOSvWyAdJGrtHQoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="41340754"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jun 2024 15:25:26 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIFMJ-0001rb-0t;
	Fri, 14 Jun 2024 22:25:23 +0000
Date: Sat, 15 Jun 2024 06:24:48 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <steve@how2flow.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 3/3]
 arch/arm64/boot/dts/rockchip/overlays/odroidm1/circuitpython.dts:22.5-15:
 Warning (reg_format): /fragment@1/__overlay__/spidev@0:reg: property has
 invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Message-ID: <202406150642.tQPdZLLE-lkp@intel.com>
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
commit: 9eb2c8edd90cd32886b4fc8e844b627762b3d540 [3/3] ODROID-M1/S: dtb/dtbo: Add circuitpython overlay
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240615/202406150642.tQPdZLLE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150642.tQPdZLLE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150642.tQPdZLLE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/overlays/odroidm1/circuitpython.dts:22.5-15: Warning (reg_format): /fragment@1/__overlay__/spidev@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/circuitpython.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/circuitpython.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/circuitpython.dtbo: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/circuitpython.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/circuitpython.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/rockchip/overlays/odroidm1/circuitpython.dts:19.21-24.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/spidev@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/rockchip/overlays/odroidm1/circuitpython.dts:19.21-24.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/spidev@0: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/circuitpython.dtbo: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/circuitpython.dtbo: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'
--
>> arch/arm64/boot/dts/rockchip/overlays/odroidm1s/circuitpython.dts:22.5-15: Warning (reg_format): /fragment@1/__overlay__/spidev@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlays/odroidm1s/circuitpython.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1s/circuitpython.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1s/circuitpython.dtbo: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1s/circuitpython.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1s/circuitpython.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/rockchip/overlays/odroidm1s/circuitpython.dts:19.21-24.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/spidev@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/rockchip/overlays/odroidm1s/circuitpython.dts:19.21-24.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/spidev@0: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlays/odroidm1s/circuitpython.dtbo: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1s/circuitpython.dtbo: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'

vim +22 arch/arm64/boot/dts/rockchip/overlays/odroidm1/circuitpython.dts

     3	
     4	/ {
     5		fragment@0 {
     6			target = <&i2c3>;
     7	
     8			__overlay__ {
     9				status = "okay";
    10			};
    11		};
    12	
    13		fragment@1 {
    14			target = <&spi0>;
    15	
    16			__overlay__ {
    17				status = "okay";
    18	
  > 19				spidev: spidev@0 {
    20					status = "okay";
    21					compatible = "odroid,spi-dev";
  > 22					reg = <0>;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
