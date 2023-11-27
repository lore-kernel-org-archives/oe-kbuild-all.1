Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9AF7E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 00:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/RtA1d4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701044791; x=1732580791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HeyBg6KlsixGg0kBxFY1pBIF1SWCMqLqW8bCPiOgVvc=;
  b=Y/RtA1d4z/6+jOdKgerVSYLTnAxvAnJKvbDkBdY0JBeZgsinsDpL+fYW
   oGv1LHs8zh+CjNZg7tLKyQKKQTART2T9GEU9/5NjIozgyPRFH/s/z2ZRm
   5sV3Tg2STuoNFyPPVFHGtFg4mAdbOW8fLlKeYMvJVc8Deo46G89B357PY
   DkCib0PQ8l7pym2d5PQ/tFqXCWwQ4b6L/eM9m0lQ3+LGGNr+qvigUdLe2
   tZVaULlF77KQW/YZ0wKnFSlQxPO3SLoCMlDOwiu10AkqkpePVl5XUi5YU
   HBkzqcxaJ1heD6uEVdoenAuaplUYoN0fmVzhT7kFXUevBlD3iB1Qp8fLe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="389763177"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="389763177"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 16:26:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891568228"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="891568228"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Nov 2023 16:26:29 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7PSE-0005f0-33;
	Mon, 27 Nov 2023 00:26:26 +0000
Date: Mon, 27 Nov 2023 08:25:32 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:tpm-dt3 6/9] dtbs_check:
 Documentation/devicetree/bindings/reset/infineon,slb9670-reset.yaml:29:111:
 [warning] line too long (124 > 110 characters) (line-length)
Message-ID: <202311270709.Aj7eX0Y2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux tpm-dt3
head:   5abbd5ebad10f9f1c0e7162f3616037400867e78
commit: bf0afa8080dcaf325774f837cfe968c4e73c8398 [6/9] dt-bindings: reset: Add Infineon SLB9670 TPM reset driver
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311270709.Aj7eX0Y2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311270709.Aj7eX0Y2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/reset/infineon,slb9670-reset.yaml:29:111: [warning] line too long (124 > 110 characters) (line-length)

vim +29 Documentation/devicetree/bindings/reset/infineon,slb9670-reset.yaml

     8	
     9	maintainers:
    10	  - Lukas Wunner <lukas@wunner.de>
    11	
    12	description: |
    13	  The Infineon SLB9670 Trusted Platform Module requires a specific reset
    14	  sequence on its RST# pin which is documented in sections 5.4 and 5.5 of
    15	  the datasheet [1]. This driver performs the reset sequence using a GPIO.
    16	
    17	  The sequence with minimum wait intervals is as follows:
    18	  deassert RST#
    19	  wait at least 60 ms
    20	  assert RST#
    21	  wait at least 2 usecs
    22	  deassert RST#
    23	  wait at least 60 ms
    24	  assert RST#
    25	  wait at least 2 usecs
    26	  deassert RST#
    27	  wait at least 60 ms before issuing the first TPM command
    28	
  > 29	  [1] https://www.infineon.com/dgdl/Infineon-SLB%209670VQ2.0-DataSheet-v01_04-EN.pdf?fileId=5546d4626fc1ce0b016fc78270350cd6
    30	
    31	properties:
    32	  compatible:
    33	    enum:
    34	      - infineon,slb9670-reset
    35	
    36	  reset-gpios:
    37	    maxItems: 1
    38	    description: Reference to the GPIO connected to the RST# pin.
    39	
    40	  "#reset-cells":
    41	    const: 0
    42	
    43	required:
    44	  - compatible
    45	  - reset-gpios
    46	  - "#reset-cells"
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
