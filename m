Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3D05679
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OL0K5nrj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700392360; x=1731928360;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2PWrkVV0o0lA2ydbts7dqY4vCxwZiOODco8iIh+86aA=;
  b=OL0K5nrj9lYr5fizWefhp9nv8ILyJORmtyiEOpDaJo8cfrBh7mYbF9++
   NUMojXYVFDtxlqHCdo/A56GBuNQhIR+dym8xaLU3m4FsKZ48SiTJhseCS
   ckl5F2YFTEaaswOkUAOBI7pekcsxZAlcGj+qbqgP/jcyyL3QsHNtf66Km
   uV3R4OgBTEJrOWhSLJBbDvRi6m6x3BF+tRroRnTFeTSfVZa0hS/03Ip9d
   M2+ij+9H4qJJbflHRUpgHkbxwAfbYuHvndLORZ/P7qYhVFz6b18Wtv0VD
   kQB/opFUOrz8ZDniMxsA1YVdP3+nfW0LSmf86Qru/KgQIl839HcUQ1rfe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="390344059"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="390344059"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 03:12:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="836486873"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="836486873"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Nov 2023 03:12:38 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4fjA-00051e-34;
	Sun, 19 Nov 2023 11:12:36 +0000
Date: Sun, 19 Nov 2023 19:11:00 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:tpm-dt 1/3] dtbs_check:
 Documentation/devicetree/bindings/security/tpm/tcg,tpm-tis.yaml:
 properties:oneOf: [{'description': 'SPI-attached TPM', 'items':
 [{'compatible': [{'enum': ['google,cr50', 'infineon,slb9670',
 'st,st33htpm-spi', 'st,st33zp24-spi']}, {'const': 't...
Message-ID: <202311191913.uVFWycP6-lkp@intel.com>
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
commit: 8796428230dbdb8c911cf73082bb56a53812687f [1/3] dt-bindings: tpm: Co=
nsolidate TCG TIS bindings
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311191913.u=
VFWycP6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311191913.uVFWycP6-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/security/tpm/tcg,tpm-tis.yaml: propert=
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
>> Documentation/devicetree/bindings/security/tpm/tcg,tpm-tis.yaml: propert=
ies: 'oneOf' should not be valid under {'$ref': '#/definitions/json-schema-=
prop-names'}
   	hint: A json-schema keyword was found instead of a DT property name.
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/security/tpm/tcg,tpm-tis.yaml: propert=
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
>> Documentation/devicetree/bindings/security/tpm/tcg,tpm-tis.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/s=
ecurity/tpm-common.yaml
>> Documentation/devicetree/bindings/security/tpm/tpm-common.yaml: properti=
es:oneOf: [{'memory-region': {'description': 'reserved memory allocated for=
 firmware event log', 'maxItems': 1}}, {'allOf': [{'linux,sml-base': {'desc=
ription': 'base address of reserved memory allocated for firmware event log=
', '$ref': '/schemas/types.yaml#/definitions/uint32-array', 'minItems': 2, =
'maxItems': 2}}, {'linux,sml-size': {'description': 'size of reserved memor=
y allocated for firmware event log', '$ref': '/schemas/types.yaml#/definiti=
ons/uint32'}}]}] is not of type 'object', 'boolean'
   	from schema $id: http://json-schema.org/draft-07/schema#
>> Documentation/devicetree/bindings/security/tpm/tpm-common.yaml: properti=
es: 'oneOf' should not be valid under {'$ref': '#/definitions/json-schema-p=
rop-names'}
   	hint: A json-schema keyword was found instead of a DT property name.
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/security/tpm/tpm-common.yaml: properti=
es:oneOf: [{'memory-region': {'description': 'reserved memory allocated for=
 firmware event log', 'maxItems': 1}}, {'allOf': [{'linux,sml-base': {'desc=
ription': 'base address of reserved memory allocated for firmware event log=
', '$ref': '/schemas/types.yaml#/definitions/uint32-array', 'minItems': 2, =
'maxItems': 2}}, {'linux,sml-size': {'description': 'size of reserved memor=
y allocated for firmware event log', '$ref': '/schemas/types.yaml#/definiti=
ons/uint32'}}]}] is not of type 'object', 'boolean'
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/security/tpm/tpm-common.yaml: 'oneOf' =
conditional failed, one must be fixed:
   	'unevaluatedProperties' is a required property
   	'additionalProperties' is a required property
   	hint: Either unevaluatedProperties or additionalProperties must be pres=
ent
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
--
>> Documentation/devicetree/bindings/security/tpm/tpm-common.yaml: powered-=
while-suspended: missing type definition

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
