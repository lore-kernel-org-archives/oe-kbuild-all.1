Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FB5101D1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAVvFrRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700399922; x=1731935922;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MiGJI3Y/dvd/K7eZkQCB3yteydq4frZd+mwiBduAApk=;
  b=TAVvFrRXG/Y1uPPG9GBOi4Dl/N0Vq1nOv0ue4y7bs6XFGNmbqFx2GK+2
   5+YrLCqDdELkHQg9fYCXydNZDYk4Nk6mj+SgO5ZKT5nZDGnpHwewHq2dH
   LZkOJVGl9lul9gfhbSD+43tlAaykUra8gP4hGQHsgFudSq7bHSScIhVpW
   YLJS45pgUI8RAOT4Txyvag5Ase2gcCj37BeigylMPUT0Tp6L8I+/GRzTw
   8IjgpwuogjLSz/UU+hRvEhrHzV01yn4sTmaO6Q0AQIP2X8N1vbkpBTSj1
   xoWj9iKyDibmN6styyZGlxD1u/SPKO9ymyCPzt/bQTR5c8bEG2Z4LxuVc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="395422001"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="395422001"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 05:18:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="909855581"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="909855581"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Nov 2023 05:18:40 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4hh8-00057X-0P;
	Sun, 19 Nov 2023 13:18:38 +0000
Date: Sun, 19 Nov 2023 21:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:tpm-dt 2/3] dtbs_check:
 Documentation/devicetree/bindings/security/tpm/ibm,vtpm.yaml: required:4:
 'ibm,#dma-address-cells' does not match
 '^([a-zA-Z#][a-zA-Z0-9,+\\-._@]{0,63}|\\$nodename)$'
Message-ID: <202311192130.PvrtUhdN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/l1k/linux tpm-dt
head:   dc58959d0000d44b65ac76843b9038052868fbe8
commit: bae8298e09023dfa965e612e36f3c35bd7bab29b [2/3] dt-bindings: tpm: Co=
nvert IBM vTPM bindings to DT schema
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311192130.P=
vrtUhdN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311192130.PvrtUhdN-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/security/tpm/ibm,vtpm.yaml: required:4=
: 'ibm,#dma-address-cells' does not match '^([a-zA-Z#][a-zA-Z0-9,+\\-._@]{0=
,63}|\\$nodename)$'
   	hint: 'required' must be valid DT property or node names
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/security/tpm/ibm,vtpm.yaml: required:5=
: 'ibm,#dma-size-cells' does not match '^([a-zA-Z#][a-zA-Z0-9,+\\-._@]{0,63=
}|\\$nodename)$'
   	hint: 'required' must be valid DT property or node names
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   Documentation/devicetree/bindings/security/tpm/tcg,tpm-tis.yaml: propert=
ies:oneOf: [{'description': 'SPI-attached TPM', 'items': [{'compatible': [{=
'enum': ['google,cr50', 'infineon,slb9670', 'st,st33htpm-spi', 'st,st33zp24=
-spi']}, {'const': 'tcg,tpm_tis-spi'}]}, {'allOf': [{'$ref': '/schemas/spi/=
spi-peripheral-props.yaml#'}]}, {'required': ['compatible', 'reg']}]}, {'de=
scription': 'I=B2C-attached TPM', 'items': [{'compatible': [{'enum': ['atme=
l,at97sc3204t', 'google,cr50', 'infineon,slb9635tt', 'infineon,slb9645tt', =
'infineon,slb9673', 'infineon,tpm_i2c_infineon', 'nuvoton,npct501', 'nuvoto=
n,npct601', 'st,st33zp24-i2c', 'winbond,wpct301']}]}, {'reg': {'maxItems': =
1, 'description': 'address of TPM on the I=B2C bus'}}, {'clock-frequency': =
{'maxItems': 1, 'description': 'clock frequency used to access TPM on the I=
=B2C bus'}}, {'required': ['compatible', 'reg']}]}, {'description': 'MMIO-a=
ccessed TPM', 'items': [{'compatible': [{'enum': ['at97sc3201', 'atmel,at97=
sc3204', 'nuvoton,npct650', 'socionext,synquacer-tpm-mmio']}, {'const': 'tc=
g,tpm-tis-mmio'}]}, {'reg': {'maxItems': 1, 'description': 'location and le=
ngth of the MMIO registers, length should be\nat least 0x5000 bytes\n'}}, {=
'required': ['compatible', 'reg']}]}] is not of type 'object', 'boolean'
   	from schema $id: http://json-schema.org/draft-07/schema#
   Documentation/devicetree/bindings/security/tpm/tcg,tpm-tis.yaml: propert=
ies: 'oneOf' should not be valid under {'$ref': '#/definitions/json-schema-=
prop-names'}
   	hint: A json-schema keyword was found instead of a DT property name.
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   Documentation/devicetree/bindings/security/tpm/tcg,tpm-tis.yaml: propert=
ies:oneOf: [{'description': 'SPI-attached TPM', 'items': [{'compatible': [{=
'enum': ['google,cr50', 'infineon,slb9670', 'st,st33htpm-spi', 'st,st33zp24=
-spi']}, {'const': 'tcg,tpm_tis-spi'}]}, {'allOf': [{'$ref': '/schemas/spi/=
spi-peripheral-props.yaml#'}]}, {'required': ['compatible', 'reg']}]}, {'de=
scription': 'I=B2C-attached TPM', 'items': [{'compatible': [{'enum': ['atme=
l,at97sc3204t', 'google,cr50', 'infineon,slb9635tt', 'infineon,slb9645tt', =
'infineon,slb9673', 'infineon,tpm_i2c_infineon', 'nuvoton,npct501', 'nuvoto=
n,npct601', 'st,st33zp24-i2c', 'winbond,wpct301']}]}, {'reg': {'maxItems': =
1, 'description': 'address of TPM on the I=B2C bus'}}, {'clock-frequency': =
{'maxItems': 1, 'description': 'clock frequency used to access TPM on the I=
=B2C bus'}}, {'required': ['compatible', 'reg']}]}, {'description': 'MMIO-a=
ccessed TPM', 'items': [{'compatible': [{'enum': ['at97sc3201', 'atmel,at97=
sc3204', 'nuvoton,npct650', 'socionext,synquacer-tpm-mmio']}, {'const': 'tc=
g,tpm-tis-mmio'}]}, {'reg': {'maxItems': 1, 'description': 'location and le=
ngth of the MMIO registers, length should be\nat least 0x5000 bytes\n'}}, {=
'required': ['compatible', 'reg']}]}] is not of type 'object', 'boolean'
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   Documentation/devicetree/bindings/security/tpm/tcg,tpm-tis.yaml:
--
>> Documentation/devicetree/bindings/security/tpm/ibm,vtpm.yaml: ibm,#dma-a=
ddress-cells: missing type definition
>> Documentation/devicetree/bindings/security/tpm/ibm,vtpm.yaml: ibm,#dma-s=
ize-cells: missing type definition
   Documentation/devicetree/bindings/security/tpm/tpm-common.yaml: powered-=
while-suspended: missing type definition

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
