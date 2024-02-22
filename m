Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7282112FB12
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 13:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708606857; cv=none; b=rJLZxI8zCxegdWNomUQGc7i837rAWnXvatf+2nrX2RQRrwK1NloHlhF8mfNqq3VHnabY74sMYWdh033RUXYmBgqYU9RU/FrNFToo7fXp6vC1NYQgI8aM5sEp4uclpYUvxQp0f1qh2Xv5AdYd20X+d49jsIBYXdBH5MMYMh22ziw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708606857; c=relaxed/simple;
	bh=kA5lYesZy5mCh+vieqtLlaC4rBHvlV7GELqFNwGPEG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l4Lg/JOFP4v/W0Jq6QCPoTOPI3d3gvmu9KCQaE3KALEwr0hANHTAdsHvagpvJHY2K6LzulkUu1dQ9t1mCb6zpyrZllNrJf6mlRhgeIE9JURIZCN2oYdpb4QY0ByN+XBoJgKpf6l6mV1e2jDZFkIe7vMQqSR6J2IhXaz8BwPu19c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddVCGW+p; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddVCGW+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708606855; x=1740142855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kA5lYesZy5mCh+vieqtLlaC4rBHvlV7GELqFNwGPEG8=;
  b=ddVCGW+pCnzeejP9qRoksUnC4dqsl5UnI3tZpuWiP4vMSvSYBOQD8ju8
   qRJ7HEE2XgG+KfEmakRjHG7Df57Z5cocRqGcIQ2Wbbo2dG4JbdYzQlnKh
   Wnk7IgRB6bdo7192G4gCAjaRQcmnmXAphhj0cIFB8/OmqqZZjhS/TVDTX
   fcYu1FPMMbcou9vJBlWwC/EyOFsGPG3BbMptI6WzxvBnzJZepGavgIdWs
   UwMKBS4DPQxdXI5JVcOZVDR/4Ela/NQjiDei+FKTxt2iD4ogzjrW6E5ri
   sr2RSzgpaiJa02wsJZEMHJUgHp4XEeVxK2ZZ/4HT52QZO7aJ6Yi6Pyw8t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="6606726"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="6606726"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 05:00:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5874118"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Feb 2024 05:00:51 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd8gy-0006KY-1Y;
	Thu, 22 Feb 2024 13:00:48 +0000
Date: Thu, 22 Feb 2024 21:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, lishuo <lishuo@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2532/3331] dtbs_check:
 Documentation/devicetree/bindings/gpu/phytium,dc.yaml:40:8: [warning] wrong
 indentation: expected 2 but found 7 (indentation)
Message-ID: <202402222050.6bOkmhbV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0b30804544e281a67d384ea10249544d92a69e2f
commit: ab9ff1e38569313e41ba5a036591f93cb55e5d87 [2532/3331] DRM: Phytium display DRM doc
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240222/202402222050.6bOkmhbV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402222050.6bOkmhbV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml:40:8: [warning] wrong indentation: expected 2 but found 7 (indentation)
   Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:76:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:82:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
--
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmin-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmax-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:clocks:items: 'anyOf' conditional failed, one must be fixed:
   	['description:Display controller reference clock source'] is not of type 'object', 'boolean'
   	'description:Display controller reference clock source' is not of type 'object', 'boolean'
   	from schema $id: http://json-schema.org/draft-07/schema#
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
   	['description:Display controller reference clock source'] is too short
   	False schema does not allow 1
   	hint: "minItems" is only needed if less than the "items" list length
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:reg: 'oneOf' conditional failed, one must be fixed:
   	[{'description': 'Offset and length of the memory mapped registers'}] is too short
   	False schema does not allow 1
   	hint: "minItems" is only needed if less than the "items" list length
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: 'Example' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'not', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
>> 	Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:clocks: 'anyOf' conditional failed, one must be fixed:
   		'maxItems' is a required property
   			hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
   		'minItems' is not one of ['maxItems', 'description', 'deprecated']
   			hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
   		'items' is not one of ['maxItems', 'description', 'deprecated']
   			hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
   		'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
   		'items' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
   		['description:Display controller reference clock source'] is valid under each of {'type': 'array', 'maxItems': 1, 'items': {'allOf': [{'$ref': '#/array'}], 'required': ['items']}}, {'type': 'array', 'items': {'$ref': '#/single'}}
   			hint: "items" can be a list defining each entry or a schema applying to all items. A list has an implicit size. A schema requires minItems/maxItems to define the size.
   		hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
   		from schema $id: http://devicetree.org/meta-schemas/clocks.yaml#
   	'minItems' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'allOf', 'anyOf', 'oneOf', '$ref']
   	'items' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'allOf', 'anyOf', 'oneOf', '$ref']
   	'type' is a required property
   		hint: DT nodes ("object" type in schemas) can only use a subset of json-schema keywords
   	from schema $id: http://devicetree.org/meta-schemas/clocks.yaml#
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
    	 $id: http://devicetree.org/schemas/dc/snps,dc.yaml
    	file: Documentation/devicetree/bindings/gpu/phytium,dc.yaml
--
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: ignoring, error in schema: properties: clocks: items
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml: i2c-alias: missing type definition
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-odd-pixels: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-even-pixels: missing type definition
   Documentation/devicetree/bindings/sound/audio-graph.yaml: convert-sample-format: missing type definition

vim +40 Documentation/devicetree/bindings/gpu/phytium,dc.yaml

    33	
    34	required:
    35	  - compatible
    36	  - reg
    37	  - interrupts
    38	
    39	Example:
  > 40	       /memreserve/ 0xf4000000 0x4000000; // (optional)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
