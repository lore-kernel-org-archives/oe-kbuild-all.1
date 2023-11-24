Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5A72FC44
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 15:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5kFosdu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840548; x=1732376548;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Zrv+ZY1SMHlKP5PjELK0lL117qBspp+i134AMTsQVQQ=;
  b=F5kFosdu5P/a1mtPqLMXX3H4yYk4N/9onWT+8PrT8BrtZhmVMIe4pQqT
   hnv2vYcgmut66dZS0NY7vbFhIsNQFWL47+C6EFg3F1cs+vVH6uc7Ss2oK
   YgOSbRDQk82K3zhYlqgTKvXyqogK6FMHXYzznP4vAad9PKAd69S+IhwX5
   /mYteHmbnQyrKtN4ulY6c0ix8i2431BzfF3aMKEmJtsNrmpvECt8J8KhG
   KeTSM9SYDFd/jrZaoXu6LWYlMqqxCiIFf7JXwxQH8U1bhuXpl0hCmbzy6
   io+KjPoy79l+UvqLcwuy+7K2+mHLZoX36w+KAX6dwMQxspIdHArgxvmKm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="395257439"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="395257439"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="767510979"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="767510979"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Nov 2023 07:42:24 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YJy-0002yM-06;
	Fri, 24 Nov 2023 15:42:22 +0000
Date: Fri, 24 Nov 2023 23:42:10 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:tpm-dt3 1/5] dtbs_check:
 Documentation/devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml:49:15: [warning]
 wrong indentation: expected 16 but found 14 (indentation)
Message-ID: <202311242110.OsSK8KIy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/l1k/linux tpm-dt3
head:   1fe3c7fd1f49799dfeb7a91e03f83d9d22068930
commit: 6ae45663e714374c1810fbd4b611b7d0385d5fc2 [1/5] dt-bindings: tpm: Consolidate TCG TIS bindings
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231124/202311242110.OsSK8KIy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311242110.OsSK8KIy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml:49:15: [warning] wrong indentation: expected 16 but found 14 (indentation)
--
>> Documentation/devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml: properties:compatible:items: 'oneOf' conditional failed, one must be fixed:
   	{'oneOf': [{'items': [{'enum': ['infineon,slb9673', 'nuvoton,npct75x']}, {'const': ['tcg,tpm-tis-i2c']}]}, {'items': [{'enum': ['infineon,slb9635tt', 'infineon,slb9645tt', 'infineon,tpm_i2c_infineon']}]}, {'items': [{'enum': ['atmel,at97sc3204t', 'google,cr50', 'nuvoton,npct501', 'nuvoton,npct601', 'st,st33zp24-i2c', 'winbond,wpct301']}]}]} is not of type 'array'
>> 	Documentation/devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml: properties:compatible:items:oneOf:0:items: 'oneOf' conditional failed, one must be fixed:
   		[{'enum': ['infineon,slb9673', 'nuvoton,npct75x']}, {'const': ['tcg,tpm-tis-i2c']}] is not of type 'object'
   		['tcg,tpm-tis-i2c'] is not of type 'integer', 'string'
   		from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml: properties:compatible:items: {'oneOf': [{'items': [{'enum': ['infineon,slb9673', 'nuvoton,npct75x']}, {'const': ['tcg,tpm-tis-i2c']}]}, {'items': [{'enum': ['infineon,slb9635tt', 'infineon,slb9645tt', 'infineon,tpm_i2c_infineon']}]}, {'items': [{'enum': ['atmel,at97sc3204t', 'google,cr50', 'nuvoton,npct501', 'nuvoton,npct601', 'st,st33zp24-i2c', 'winbond,wpct301']}]}]} is not of type 'array'
   	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
>> Documentation/devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml: properties:compatible:items: 'oneOf' conditional failed, one must be fixed:
   	{'oneOf': [{'items': [{'enum': ['infineon,slb9673', 'nuvoton,npct75x']}, {'const': ['tcg,tpm-tis-i2c']}]}, {'items': [{'enum': ['infineon,slb9635tt', 'infineon,slb9645tt', 'infineon,tpm_i2c_infineon']}]}, {'items': [{'enum': ['atmel,at97sc3204t', 'google,cr50', 'nuvoton,npct501', 'nuvoton,npct601', 'st,st33zp24-i2c', 'winbond,wpct301']}]}]} is not of type 'array'
>> 	Documentation/devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml: properties:compatible:items:oneOf:0:items: 'oneOf' conditional failed, one must be fixed:
   		[{'enum': ['infineon,slb9673', 'nuvoton,npct75x']}, {'const': ['tcg,tpm-tis-i2c']}] is not of type 'object'
   		['tcg,tpm-tis-i2c'] is not of type 'string'
   		from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
   	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
>> Documentation/devicetree/bindings/tpm/tcg,tpm_tis-spi.yaml: properties:compatible:items: 'oneOf' conditional failed, one must be fixed:
   	{'oneOf': [{'items': [{'enum': ['infineon,slb9670', 'st,st33htpm-spi', 'st,st33zp24-spi']}, {'const': 'tcg,tpm_tis-spi'}]}, {'items': [{'const': ['google,cr50']}]}]} is not of type 'array'
>> 	Documentation/devicetree/bindings/tpm/tcg,tpm_tis-spi.yaml: properties:compatible:items:oneOf:1:items: 'oneOf' conditional failed, one must be fixed:
   		[{'const': ['google,cr50']}] is not of type 'object'
   		['google,cr50'] is not of type 'integer', 'string'
   		from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/tpm/tcg,tpm_tis-spi.yaml: properties:compatible:items: {'oneOf': [{'items': [{'enum': ['infineon,slb9670', 'st,st33htpm-spi', 'st,st33zp24-spi']}, {'const': 'tcg,tpm_tis-spi'}]}, {'items': [{'const': ['google,cr50']}]}]} is not of type 'array'
   	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
>> Documentation/devicetree/bindings/tpm/tcg,tpm_tis-spi.yaml: properties:compatible:items: 'oneOf' conditional failed, one must be fixed:
   	{'oneOf': [{'items': [{'enum': ['infineon,slb9670', 'st,st33htpm-spi', 'st,st33zp24-spi']}, {'const': 'tcg,tpm_tis-spi'}]}, {'items': [{'const': ['google,cr50']}]}]} is not of type 'array'
>> 	Documentation/devicetree/bindings/tpm/tcg,tpm_tis-spi.yaml: properties:compatible:items:oneOf:1:items: 'oneOf' conditional failed, one must be fixed:
   		[{'const': ['google,cr50']}] is not of type 'object'
   		['google,cr50'] is not of type 'string'
   		from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
   	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#

vim +49 Documentation/devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml

     1	# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
     2	%YAML 1.2
     3	---
     4	$id: http://devicetree.org/schemas/tpm/tcg,tpm-tis-i2c.yaml#
     5	$schema: http://devicetree.org/meta-schemas/core.yaml#
     6	
     7	title: I²C-attached Trusted Platform Module conforming to TCG TIS specification
     8	
     9	maintainers:
    10	  - Lukas Wunner <lukas@wunner.de>
    11	
    12	description: |
    13	  The Trusted Computing Group (TCG) has defined a multi-vendor standard
    14	  for accessing a TPM chip.  It can be transported over various buses,
    15	  one of them being I²C.  The standard is named:
    16	  TCG PC Client Specific TPM Interface Specification (TIS)
    17	  https://trustedcomputinggroup.org/resource/pc-client-work-group-pc-client-specific-tpm-interface-specification-tis/
    18	
    19	  The I²C interface was not originally part of the standard, but added
    20	  in 2017 with a separate document:
    21	  TCG PC Client Platform TPM Profile Specification for TPM 2.0 (PTP)
    22	  https://trustedcomputinggroup.org/wp-content/uploads/PC-Client-Specific-Platform-TPM-Profile-for-TPM-2p0-v1p05p_r14_pub.pdf
    23	
    24	  Recent TPM 2.0 chips conform to this generic standard, others use a
    25	  vendor-specific I²C interface.
    26	
    27	properties:
    28	  compatible:
    29	    items:
    30	      oneOf:
    31	        # Generic TPM 2.0 chips
    32	        - items:
    33	            - enum:
    34	                - infineon,slb9673
    35	                - nuvoton,npct75x
    36	            - const:
    37	                - tcg,tpm-tis-i2c
    38	
    39	        # Infineon TPM 1.2 chips with vendor-specific I²C interface
    40	        - items:
    41	            - enum:
    42	                - infineon,slb9635tt
    43	                - infineon,slb9645tt
    44	                - infineon,tpm_i2c_infineon
    45	
    46	        # Other TPM 1.2 and 2.0 chips with vendor-specific I²C interface
    47	        - items:
    48	            - enum:
  > 49	              - atmel,at97sc3204t # TPM 1.2
    50	              - google,cr50 # TPM 2.0 (Titan H1 running Cr50 firmware)
    51	              - nuvoton,npct501 # TPM 1.2
    52	              - nuvoton,npct601 # TPM 2.0
    53	              - st,st33zp24-i2c # TPM 2.0
    54	              - winbond,wpct301 # TPM 1.2
    55	
    56	  reg:
    57	    description: address of TPM on the I²C bus
    58	
    59	  clock-frequency:
    60	    description: clock frequency used to access TPM on the I²C bus
    61	
    62	allOf:
    63	  - $ref: tpm-common.yaml#
    64	  - if:
    65	      properties:
    66	        compatible:
    67	          contains:
    68	            const: infineon,slb9635tt
    69	    then:
    70	      properties:
    71	        clock-frequency:
    72	          maximum: 100000
    73	  - if:
    74	      properties:
    75	        compatible:
    76	          contains:
    77	            const: infineon,slb9645tt
    78	    then:
    79	      properties:
    80	        clock-frequency:
    81	          maximum: 400000
    82	
    83	required:
    84	  - compatible
    85	  - reg
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
