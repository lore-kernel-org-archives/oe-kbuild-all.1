Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BB28F72
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 03:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720670345; cv=none; b=AM/E7WwZtJGr6unHjosFUvfSqT6Qf7yVw42Ry9xA45d89NeuhtOPzOZzSyD9lU6QhQ8fe3PfwaeG++5FwzjDogATlyiP59E94I6pO7wxs+1WicnPAuQ94Azx0npWUMAEfK/tp/U8SrdWEA9+zjCXFFkvDEGMkmSBbgUvbRSW3SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720670345; c=relaxed/simple;
	bh=tfu4eXEWAWxRGP/M4FaRIAqjsY2W52peVL5YX/YtraA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E4CWlGrn1NhpyCXS/JjDdQEoEEki26M6BWsUr5Xyp/PHPGQT8ghYkRIxzFt5wZI/s48Q2JIJ7rx/2TR/HjkQUgHDzk0klcBIOdRumt0Phm/4kNBt2lGgH1Dvo6oL/eP7KVTYVhNZ1yQ+c9oK8Y/mXiOO9B5tCxutv7bbO3ObnnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkERrl53; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkERrl53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720670343; x=1752206343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tfu4eXEWAWxRGP/M4FaRIAqjsY2W52peVL5YX/YtraA=;
  b=FkERrl53rlfSCx2IZ0YJLDkaKVml5+39iA8VKOVnheM/MUX9y9rD1UTn
   T+Ns7Rrd+CLwY7eYEwkfBohdBEg3++QHdjCV1I46V6fBSB4slt18XkrrY
   AyQ9lfNdDIZ6sVzuzQwgZ7vjA/ZMY2KaFrpYfaRGvLlcE97fVErXq22zA
   9EJLpd0/2pD2s75WjkQB6BafgB4ze4lQK9PwZ2gsLW/owLg1LJ55Vw0aZ
   5n9VePR6n1DIVJVms9Olsuy+35WSoKTqabZS7sBoxihXZuWeW+odfH0lT
   0/aJ1TIm4hso9eQpxkMQtgwnQjZDI3gTwLRvAOntlWCHLKECOLuzXcq90
   Q==;
X-CSE-ConnectionGUID: wBoqWA9XQSyl65p2zvfj9A==
X-CSE-MsgGUID: npFPDuD3TReDdYjoHRwqKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18168815"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="18168815"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 20:59:02 -0700
X-CSE-ConnectionGUID: S2N4EUteSJW3pUxZUTlAWA==
X-CSE-MsgGUID: bnvNQwVoTUeUcBUZxxnLlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="52730049"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jul 2024 20:59:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRkxP-000Yiw-2w;
	Thu, 11 Jul 2024 03:58:59 +0000
Date: Thu, 11 Jul 2024 11:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 11303/11381]
 Documentation/devicetree/bindings/media/i2c/ovti,ox03c10.yaml:67:1: [error]
 syntax error: found character '\t' that cannot start any token (syntax)
Message-ID: <202407111104.EcSLshN2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ee366aa641d84d61e265cd4f571394aa4e7d4e6d
commit: b8b4012c0f748f0bccb8aeb4f2730e7a67577a38 [11303/11381] LF-12188-12: dt-bindings: media: add binding doc for OX03C10
config: arc-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407111104.EcSLshN2-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111104.EcSLshN2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111104.EcSLshN2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/regulator/nxp,pf5300-regulator.yaml:47:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf5300-regulator.yaml:55:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:21:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:22:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:23:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:24:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:67:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:75:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:83:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:127:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
>> Documentation/devicetree/bindings/media/i2c/ovti,ox03c10.yaml:67:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
   Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml:68:21: [error] syntax error: mapping values are not allowed here (syntax)
   Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.yaml:55:7: [error] no new line character at the end of file (new-line-at-end-of-file)
   Documentation/devicetree/bindings/rtc/nxp,pcf2131.yaml:10:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:38:18: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:38:20: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:38:22: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:18: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:20: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:22: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:24: [warning] too few spaces after comma (commas)
--
>> Documentation/devicetree/bindings/media/i2c/ovti,ox03c10.yaml:67:1: found a tab character where an indentation space is expected
   Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml: ^display-controller@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint
--
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/phy/fsl,samsung-hdmi-phy.yaml: ignoring, error in schema: properties: clock-names
>> Documentation/devicetree/bindings/media/i2c/ovti,ox03c10.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/vendor-prefixes.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml: ignoring, error in schema: properties: out-default: description
   Documentation/devicetree/bindings/display/fsl,lcdif.yaml: ignoring, error parsing file
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'

vim +67 Documentation/devicetree/bindings/media/i2c/ovti,ox03c10.yaml

    55	
    56	examples:
    57	  - |
    58	      #include <dt-bindings/clock/fsl,imx95-clock.h>
    59	      #include <dt-bindings/gpio/gpio.h
    60	
    61	      i2c {
    62	          #address-cells = <1>;
    63	          #size-cells = <0>;
    64	
    65	          camera@36 {
    66	              compatible = "ovti,ox03c10";
  > 67		      reg = <0x36>;
    68		      clocks = <&serializer1>;
    69		      fsin-gpios = <&serializer1 0 GPIO_ACTIVE_HIGH>;
    70	
    71		      port {
    72	                  ox03c10_to_mipi_csi2: endpoint {
    73	                      remote-endpoint = <&mipi_csi2_from_ox03c10>;
    74			  };
    75		      };
    76		  };
    77	      };
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
