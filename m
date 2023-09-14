Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED6241E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 14:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694701414; x=1726237414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o0aFQeFvYE5Fl0e+udftt49nlFtoBvPIn/xz24Igkr4=;
  b=IrTv78yptuHESv95UOsOJK5r5M8pCwZaeWSBeslNiJN7zSESK0pPT/gS
   GErCNeCP4rCYdHIiVTeWDz4a7IUV3muBkW7phsnV8DTaoD46hdPA+alq7
   p9hPXH+laZ/qKRzkak5zAlZvoTaJ4dWLfQAunxb8kMav7yaqg8Dyz+AW9
   gk/VL6D3Mi+JTlE+Xf/LhP6WFPn9CFY/O/XAN3pk66d+LWVtQ8bSJ8C8f
   1Jl5WreIO8m798krDciZsZpjuyP7WFSg4GgxmuEldeEZu7RwC+nGVpCYv
   PscOIGCsrCeFGIN2BLCbTKmTPeb0Ll4ZMHfdZNTB44tFpOtjHMUAsy/Yk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="382778184"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="382778184"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 07:07:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="737924630"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="737924630"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Sep 2023 07:07:48 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgn0U-0001fN-1a;
	Thu, 14 Sep 2023 14:07:46 +0000
Date: Thu, 14 Sep 2023 22:07:27 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 4188/25020] htmldocs: Warning:
 MAINTAINERS.NXP references a file that doesn't exist:
 Documentation/devicetree/bindings/sound/fsl,dsp.txt
Message-ID: <202309142214.tZWA44NY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: 29594c4e553412a288d6e44c8704af8fab26d464 [4188/25020] LF-2358-1 script: add get_maintainer_nxp.sh and MAITAINERS.NXP
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309142214.tZWA44NY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309142214.tZWA44NY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,dsp.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/sound/imx-audio-si476x.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/sound/imx-audio-cdnhdmi.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,rpmsg-i2s.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/sound/imx-audio-rpmsg.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,spdif.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/net/can/fsl-flexcan.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/media/imx8-jpeg.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/display/mxsfb.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/net/fsl-fec.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/regulator/pfuze100.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/usb/cdns-usb3.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/usb/usb-xhci.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
