Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A51EDDB1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 08:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQ9hWTi+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700467947; x=1732003947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iDoN4VArDMbnGfRVcZ84OMqsii/vglSRn7wrWiTKT3c=;
  b=SQ9hWTi+pm3MQmGa75ceKgWgj4nlMKP6M94LN+tcn9BLtagv1+Nsuoos
   xkzqGnRfCqJOPiaR7nOXYhpZ9b6JRc4048/nweGxhaYEFaiW4uNUl54pK
   dOJwgsLbJsBv79UhmbuSs8Wl8RcO3RKeGCk+GAqRncg51x80yIrCOKHKV
   spZz8pKenRd9lJXLieGVI5rQEVffanzcUE/ID6m1CywkHHJneF2UWIspZ
   xGyjMXIxpt6r+0MxiXWqH+JSsAj9cpu8AA7Wmx2YrQdWXuwE3zygJo9eE
   xZx3Il9srCNdBZrDF+oQyq+sNE1/RWKTY9Q5vESaToBysnNDQUBvoLMmy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="391359157"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="391359157"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 00:12:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="801081084"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="801081084"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 20 Nov 2023 00:12:24 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4zOI-0006Co-1Y;
	Mon, 20 Nov 2023 08:12:22 +0000
Date: Mon, 20 Nov 2023 16:11:35 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, linux-doc@vger.kernel.org
Subject: [arm-platforms:kvm-arm64/asahi-base-6.6 6/16] dtbs_check:
 Documentation/devicetree/bindings/spi/apple,spi.yaml:10:11: [error] string
 value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <202311201628.TX3Fdb1b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/asahi-base-6.6
head:   7e253da2519f4c34d6ef6660c9c2caecc193678a
commit: 8a95ad8df8049a24febbecbff35f203f4b86cd7d [6/16] Merge remote-tracking branch 'asahi/bits/060-spi' into kvm-arm64/asahi-base-6.6
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231120/202311201628.TX3Fdb1b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201628.TX3Fdb1b-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/spi/apple,spi.yaml:10:11: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +10 Documentation/devicetree/bindings/spi/apple,spi.yaml

58fdf82c56ee6c Hector Martin 2021-12-12   8  
58fdf82c56ee6c Hector Martin 2021-12-12   9  allOf:
58fdf82c56ee6c Hector Martin 2021-12-12 @10    - $ref: "spi-controller.yaml#"
58fdf82c56ee6c Hector Martin 2021-12-12  11  
58fdf82c56ee6c Hector Martin 2021-12-12  12  maintainers:
58fdf82c56ee6c Hector Martin 2021-12-12  13    - Hector Martin <marcan@marcan.st>
58fdf82c56ee6c Hector Martin 2021-12-12  14  
58fdf82c56ee6c Hector Martin 2021-12-12  15  properties:
58fdf82c56ee6c Hector Martin 2021-12-12  16    compatible:
58fdf82c56ee6c Hector Martin 2021-12-12  17      items:
58fdf82c56ee6c Hector Martin 2021-12-12  18        - enum:
58fdf82c56ee6c Hector Martin 2021-12-12  19            - apple,t8103-spi
58fdf82c56ee6c Hector Martin 2021-12-12  20            - apple,t6000-spi
58fdf82c56ee6c Hector Martin 2021-12-12  21        - const: apple,spi
58fdf82c56ee6c Hector Martin 2021-12-12  22  
58fdf82c56ee6c Hector Martin 2021-12-12  23    reg:
58fdf82c56ee6c Hector Martin 2021-12-12  24      maxItems: 1
58fdf82c56ee6c Hector Martin 2021-12-12  25  
58fdf82c56ee6c Hector Martin 2021-12-12  26    clocks:
58fdf82c56ee6c Hector Martin 2021-12-12  27      maxItems: 1
58fdf82c56ee6c Hector Martin 2021-12-12  28  
58fdf82c56ee6c Hector Martin 2021-12-12  29    interrupts:
58fdf82c56ee6c Hector Martin 2021-12-12  30      maxItems: 1
58fdf82c56ee6c Hector Martin 2021-12-12  31  
58fdf82c56ee6c Hector Martin 2021-12-12  32    power-domains:
58fdf82c56ee6c Hector Martin 2021-12-12  33      maxItems: 1
58fdf82c56ee6c Hector Martin 2021-12-12  34  
58fdf82c56ee6c Hector Martin 2021-12-12  35  required:
58fdf82c56ee6c Hector Martin 2021-12-12  36    - compatible
58fdf82c56ee6c Hector Martin 2021-12-12  37    - reg
58fdf82c56ee6c Hector Martin 2021-12-12  38    - clocks
58fdf82c56ee6c Hector Martin 2021-12-12  39    - interrupts
58fdf82c56ee6c Hector Martin 2021-12-12  40    - '#address-cells'
58fdf82c56ee6c Hector Martin 2021-12-12  41    - '#size-cells'
58fdf82c56ee6c Hector Martin 2021-12-12  42  

:::::: The code at line 10 was first introduced by commit
:::::: 58fdf82c56ee6cbecefb801f9fb98a7ca6929866 dt-bindings: spi: apple,spi: Add binding for Apple SPI controllers

:::::: TO: Hector Martin <marcan@marcan.st>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
