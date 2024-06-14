Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFC219D895
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 06:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718345502; cv=none; b=Y4Xb9xAqE3Z2ijPG8e7/cmIHmVTOqaNlvy004C9TOzdbfldJCvHvrXLVSDcqZfffb3Ko4ISvTTUE6FpFpQAVT8NP4Nzn2FrotycMKboS8o+Kc+D0XSwST16NCPn14/PHJpZBbFqmFmd8zcASU9onFf92jZGemsokvcRbL/bizBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718345502; c=relaxed/simple;
	bh=fCSpFa3BCmpyBFoc3w6qWD+KKz95DHvuj6MvxX7dIhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WQaI+zcb32AjwMaS//F5qkYzA4QQ43XrBXml7W1y37bw1JGObeXMNKlRL72VucK/ldmARgn1E9cuEodv5W9SIsvnyRH9w0VoECwDRXSRvaCW/Pdw1nr9+AhCkiWOBBvTTrKtJsORPNAN0nByFkDzVDL4UljRj42wAg4AHYgh+aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QpBgE65M; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpBgE65M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718345501; x=1749881501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fCSpFa3BCmpyBFoc3w6qWD+KKz95DHvuj6MvxX7dIhs=;
  b=QpBgE65ME5o3kRKX/uIkrhUry27kEYeGb9id62NasNVGAAYvc6dI41zj
   q/wJXQXMUD61FS6zcFeWSsuHuF26XCMVfPhcAeOhSI0a8galK4GKl3P+a
   nMVzqs/EfnYH1DBRUhZgmrohZowhA6boMa52cBNSHJ4wzCyCwsD35yYI4
   GF3H33jGQMY25wuRj0L/rvTWGPcjjauCWUDIgX1IRMyzojqQ40lIouuGZ
   vTFZ49D4EweX5KpztdzmQ8Hs4CtzYtDRBCAYmVhbUdBcog/oe7Xyhs5UR
   UgI36/WgLY8B5SuGmHQxsBuFv9/7DVBkMk8AjIeAZ+K1qTntbTmBYiiD0
   w==;
X-CSE-ConnectionGUID: RrgJqfSsQ6egAC+aJ5kKLQ==
X-CSE-MsgGUID: /oTPznNUQDGuouBv1CX03w==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25791796"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="25791796"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 23:11:41 -0700
X-CSE-ConnectionGUID: /FBI/fHVR76nUsrsL7eajg==
X-CSE-MsgGUID: oLGx+q7ZRQuiZzWsMnNOUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="41071453"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jun 2024 23:11:40 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI09x-0000uU-2v;
	Fri, 14 Jun 2024 06:11:37 +0000
Date: Fri, 14 Jun 2024 14:10:57 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 4380/15964]
 arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft32.dts:23.5-15: Warning
 (reg_format): /fragment@0/__overlay__/display@0:reg: property has invalid
 length (4 bytes) (#address-cells == 2, #size-cells == 1)
Message-ID: <202406141410.rxK0nQd3-lkp@intel.com>
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
commit: 202e04f3b41d30752e0c8f1ca34760b272ef8908 [4380/15964] ODROID-N2: dtb/dtbo: Add hktft32 (3.2inch LCD).
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240614/202406141410.rxK0nQd3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141410.rxK0nQd3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141410.rxK0nQd3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft32.dts:23.5-15: Warning (reg_format): /fragment@0/__overlay__/display@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft32.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft32.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft32.dtbo: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft32.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft32.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft32.dts:16.23-29.6: Warning (avoid_default_addr_size): /fragment@0/__overlay__/display@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft32.dts:16.23-29.6: Warning (avoid_default_addr_size): /fragment@0/__overlay__/display@0: Relying on default #size-cells value
   arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft32.dtbo: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft32.dtbo: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'

vim +23 arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft32.dts

     6	
     7	/ {
     8		fragment@0 {
     9			target = <&spicc0>;
    10	
    11			__overlay__ {
    12				status = "okay";
    13	
    14				cs-gpios = <&gpio GPIOX_10 GPIO_ACTIVE_LOW>;
    15	
  > 16				display: display@0 {
    17					#address-cells = <0x1>;
    18					#size-cells = <0x0>;
    19	
    20					status = "okay";
    21	
    22					compatible = "hardkernel,hktft32";
  > 23					reg = <0>;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
