Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC863156237
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766671095; cv=none; b=btIZh+lBM4OrdpMEKBeEp/Oew5AEgyFf1aCI4T4y/jsxwJ21vMr6KNXC8NIUuQECabopxT6LFhlHnSwzN19mtUP1zRvyAn7NHyFXJZ4NUgFPKqD90q4PhosAS4+ZkUPPHvj6goCdqcMb6XUkmG6OspiBPMFCc7LEcKcPbVYK0Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766671095; c=relaxed/simple;
	bh=EVW7WvpyAnQ0PmrM2VYSXncQByT0gM1voPblJfbSuYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HyWU1dgQq9dLwa/NncIkwMU+BXyomcT1OIGWYpsFbXIzLOlbvYwu3kQ/od50t/LSWVNMovoLOOUOlpmMvDIOHX3QuO5oYAjHIZPT6WUb/LnRAZHWuGjJ3ZLUT+0d8AzBL/DfchMj0cFE7o4Smv9FADgLaeeeP6gxMSQfNvL6Nfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7O84Mqa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7O84Mqa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766671093; x=1798207093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EVW7WvpyAnQ0PmrM2VYSXncQByT0gM1voPblJfbSuYA=;
  b=C7O84Mqa+36cDPqPAzlu+TziKvfZ/ADGNXnAh1RZsT8ojnDQnA52OTZc
   yMKcXiJG8/TPUwPWA52qHu4DR7KpYiE+NB3To+xizs0qHkhvFViuuTApA
   vRB/5lixVMBHN6ZYwn5FNcfoO6cjaKeH5wruZ0mehHoN8AqjLieCBUjyk
   gpL3WM29AzaclkukqU/RHjf6N3jXFR9qX1gubHy5xHP0ZUGDBj4uUOU1y
   ot8EHockHvvKIvYJxOxpjVFzdwdQSt2DINvwKpdJ5nCyWwFFkH7SCgX7D
   CTXfuyOpqbC6wwn6jt8oWk/oFF1Mfi131WiuvlYEmtzjHiEptR1ckmJNX
   g==;
X-CSE-ConnectionGUID: tLtwjenFRVqksjI8ir2m+g==
X-CSE-MsgGUID: YurrFrIsS0uiSFmthF9HsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79191951"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="79191951"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 05:58:13 -0800
X-CSE-ConnectionGUID: s1s79gihRIqfxpJt202JTw==
X-CSE-MsgGUID: My2RAp+dQWGn/Pc76kkY5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="204723098"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 25 Dec 2025 05:58:12 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYlqz-000000006bI-1PI7;
	Thu, 25 Dec 2025 13:58:09 +0000
Date: Thu, 25 Dec 2025 14:57:12 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 10/10]
 Documentation/devicetree/bindings/gpu/phytium,dc.yaml:40:8: [warning] wrong
 indentation: expected 2 but found 7 (indentation)
Message-ID: <202512251441.n6oaTKbj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   52a3b0aa13aa2325ca2caf528fbcaba06ad3bab5
commit: ab9ff1e38569313e41ba5a036591f93cb55e5d87 [10/10] DRM: Phytium display DRM doc
config: arm64-randconfig-2052-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251441.n6oaTKbj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e3ef26df85c317665a2c505a0d9bc179fe67bdaf)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251441.n6oaTKbj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251441.n6oaTKbj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml:40:8: [warning] wrong indentation: expected 2 but found 7 (indentation)
   Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:76:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:82:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
--
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
   False schema does not allow 1
   ['description:Display controller reference clock source'] is too short
   hint: "minItems" is only needed if less than the "items" list length
   from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:reg: 'oneOf' conditional failed, one must be fixed:
   False schema does not allow 1
   [{'description': 'Offset and length of the memory mapped registers'}] is too short
   hint: "minItems" is only needed if less than the "items" list length
   from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: 'Example' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'not', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
   from schema $id: http://devicetree.org/meta-schemas/base.yaml
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:clocks:items: 'anyOf' conditional failed, one must be fixed:
   ['description:Display controller reference clock source'] is not of type 'object', 'boolean'
   'description:Display controller reference clock source' is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
   $id: http://devicetree.org/schemas/dc/snps,dc.yaml
   file: Documentation/devicetree/bindings/gpu/phytium,dc.yaml
   Documentation/devicetree/bindings/mfd/rockchip,rk809.yaml: ^(LDO_REG[1-9]|DCDC_REG[1-5]|SWITCH_REG[1-2])$: Missing additionalProperties/unevaluatedProperties constraint
--
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: ignoring, error in schema: properties: clocks: items
   /usr/local/lib/python3.13/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml'
   /usr/local/lib/python3.13/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml'
   /usr/local/lib/python3.13/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml'
   /usr/local/lib/python3.13/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml'
   Documentation/devicetree/bindings/sound/audio-graph.yaml: convert-sample-format: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-odd-pixels: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-even-pixels: missing type definition
   Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml: ti,x-plate-ohms: missing type definition
   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml: i2c-alias: missing type definition
   Traceback (most recent call last):

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
