Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A41411CA4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 09:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IF+F6Y0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700473660; x=1732009660;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PcyxtkqAZhVdqLqoOEUW5e1kcW3MraJlOz5BCfQLAuU=;
  b=IF+F6Y0AlnesDP6g/o5uPRYEAb2ww04nAk3wb5t8UUSe3R4GihQ5snNy
   vQYmsaLXw7wb1K+nJxw998W/Av15zt297kSE/mDRBgCyAQCCKpXtoNqiq
   8n8oo8gtsfPTDi0FAPb+1dMhfgtA2Ttf+YaoWo4WlV+bg4ETimT6mMeAM
   UA0uPGtFcd5yuK/PVp2pEkZzHj9BpNRPwn/K6oOS54vGOT3FizjGdIYvB
   3XDL+AB9ZuUOkf99MmA24eOAVWymB9nNicyRiPUPyVQQKM47050+lekSo
   D9dAE0M4TT6Xgp9NkfznWOJTThcTuPlWETZgo+LSoK6vxTJn4B1F/eXSQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="388727234"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="388727234"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 01:47:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="939760774"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="939760774"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Nov 2023 01:47:37 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r50sR-0006IH-1u;
	Mon, 20 Nov 2023 09:47:35 +0000
Date: Mon, 20 Nov 2023 17:47:08 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:tpm-dt 2/3] dtbs_check:
 Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml: required:4:
 'ibm,#dma-address-cells' does not match
 '^([a-zA-Z#][a-zA-Z0-9,+\\-._@]{0,63}|\\$nodename)$'
Message-ID: <202311201733.zuuJdbeD-lkp@intel.com>
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
head:   53901226bf29376be01e41c76f8d799aea10ca54
commit: 42a9189ce71c2d13925f1cb89dd492201e8bcc9f [2/3] dt-bindings: tpm: Co=
nvert IBM vTPM bindings to DT schema
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231120/202311201733.z=
uuJdbeD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201733.zuuJdbeD-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml: required:4: 'ibm,#d=
ma-address-cells' does not match '^([a-zA-Z#][a-zA-Z0-9,+\\-._@]{0,63}|\\$n=
odename)$'
   	hint: 'required' must be valid DT property or node names
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml: required:5: 'ibm,#d=
ma-size-cells' does not match '^([a-zA-Z#][a-zA-Z0-9,+\\-._@]{0,63}|\\$node=
name)$'
   	hint: 'required' must be valid DT property or node names
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/tpm/tpm-common.yaml: properties:oneOf:=
 [{'memory-region': {'description': 'reserved memory allocated for firmware=
 event log', 'maxItems': 1}}, {'allOf': [{'linux,sml-base': {'description':=
 'base address of reserved memory allocated for firmware event log', '$ref'=
: '/schemas/types.yaml#/definitions/uint32-array', 'minItems': 2, 'maxItems=
': 2}}, {'linux,sml-size': {'description': 'size of reserved memory allocat=
ed for firmware event log', '$ref': '/schemas/types.yaml#/definitions/uint3=
2'}}]}] is not of type 'object', 'boolean'
   	from schema $id: http://json-schema.org/draft-07/schema#
>> Documentation/devicetree/bindings/tpm/tpm-common.yaml: properties: 'oneO=
f' should not be valid under {'$ref': '#/definitions/json-schema-prop-names=
'}
   	hint: A json-schema keyword was found instead of a DT property name.
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/tpm/tpm-common.yaml: properties:oneOf:=
 [{'memory-region': {'description': 'reserved memory allocated for firmware=
 event log', 'maxItems': 1}}, {'allOf': [{'linux,sml-base': {'description':=
 'base address of reserved memory allocated for firmware event log', '$ref'=
: '/schemas/types.yaml#/definitions/uint32-array', 'minItems': 2, 'maxItems=
': 2}}, {'linux,sml-size': {'description': 'size of reserved memory allocat=
ed for firmware event log', '$ref': '/schemas/types.yaml#/definitions/uint3=
2'}}]}] is not of type 'object', 'boolean'
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/tpm/tcg,tpm-tis.yaml: properties:oneOf=
: [{'description': 'SPI-attached TPM', 'items': [{'compatible': [{'enum': [=
'google,cr50', 'infineon,slb9670', 'st,st33htpm-spi', 'st,st33zp24-spi']}, =
{'const': 'tcg,tpm_tis-spi'}]}, {'allOf': [{'$ref': '/schemas/spi/spi-perip=
heral-props.yaml#'}]}, {'required': ['compatible', 'reg']}]}, {'description=
': 'I=B2C-attached TPM', 'items': [{'compatible': [{'enum': ['atmel,at97sc3=
204t', 'google,cr50', 'infineon,slb9635tt', 'infineon,slb9645tt', 'infineon=
,slb9673', 'infineon,tpm_i2c_infineon', 'nuvoton,npct501', 'nuvoton,npct601=
', 'st,st33zp24-i2c', 'winbond,wpct301']}]}, {'reg': {'maxItems': 1, 'descr=
iption': 'address of TPM on the I=B2C bus'}}, {'clock-frequency': {'maxItem=
s': 1, 'description': 'clock frequency used to access TPM on the I=B2C bus'=
}}, {'required': ['compatible', 'reg']}]}, {'description': 'MMIO-accessed T=
PM', 'items': [{'compatible': [{'enum': ['at97sc3201', 'atmel,at97sc3204', =
'nuvoton,npct650', 'socionext,synquacer-tpm-mmio']}, {'const': 'tcg,tpm-tis=
-mmio'}]}, {'reg': {'maxItems': 2, 'description': 'location and length of t=
he MMIO registers, length should be\nat least 0x5000 bytes\n'}}, {'required=
': ['compatible', 'reg']}]}] is not of type 'object', 'boolean'
   	from schema $id: http://json-schema.org/draft-07/schema#
>> Documentation/devicetree/bindings/tpm/tcg,tpm-tis.yaml: properties: 'one=
Of' should not be valid under {'$ref': '#/definitions/json-schema-prop-name=
s'}
   	hint: A json-schema keyword was found instead of a DT property name.
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/tpm/tcg,tpm-tis.yaml: properties:oneOf=
: [{'description': 'SPI-attached TPM', 'items': [{'compatible': [{'enum': [=
'google,cr50', 'infineon,slb9670', 'st,st33htpm-spi', 'st,st33zp24-spi']}, =
{'const': 'tcg,tpm_tis-spi'}]}, {'allOf': [{'$ref': '/schemas/spi/spi-perip=
heral-props.yaml#'}]}, {'required': ['compatible', 'reg']}]}, {'description=
': 'I=B2C-attached TPM', 'items': [{'compatible': [{'enum': ['atmel,at97sc3=
204t', 'google,cr50', 'infineon,slb9635tt', 'infineon,slb9645tt', 'infineon=
,slb9673', 'infineon,tpm_i2c_infineon', 'nuvoton,npct501', 'nuvoton,npct601=
', 'st,st33zp24-i2c', 'winbond,wpct301']}]}, {'reg': {'maxItems': 1, 'descr=
iption': 'address of TPM on the I=B2C bus'}}, {'clock-frequency': {'maxItem=
s': 1, 'description': 'clock frequency used to access TPM on the I=B2C bus'=
}}, {'required': ['compatible', 'reg']}]}, {'description': 'MMIO-accessed T=
PM', 'items': [{'compatible': [{'enum': ['at97sc3201', 'atmel,at97sc3204', =
'nuvoton,npct650', 'socionext,synquacer-tpm-mmio']}, {'const': 'tcg,tpm-tis=
-mmio'}]}, {'reg': {'maxItems': 2, 'description': 'location and length of t=
he MMIO registers, length should be\nat least 0x5000 bytes\n'}}, {'required=
': ['compatible', 'reg']}]}] is not of type 'object', 'boolean'
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
--
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing=
 type definition
>> Documentation/devicetree/bindings/tpm/tpm-common.yaml: powered-while-sus=
pended: missing type definition

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
