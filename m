Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8518134FF61
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 20:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769025634; cv=none; b=pIkhnxIDDuyMLhTiAk+uijjS8V5XfXwfi3BX26b/N32+JPw8DM0tVWLLjtRjPc+hW7c8FABYY57cXKu1oRertvn/xp+dOK00DwPcJLqFh1fhrK0IuTaWcRiNXHL7eRySE7qHkp1BB95/RKym7C5L1tkpHsK1Itawa634C377pdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769025634; c=relaxed/simple;
	bh=n3ESNd/ERl2OPDWk6Al3sMScCa+PyECZk2ZSqQtnSCg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fG+hw0ei1Str9PIj8m8zjpm/7kznTeF4xnAJEZnp725ORizxmczoiVrlmwsZhTeFR/m3h0hGc2npezSLMXk6NoPJnoJTNvR987yOCjXo9oGmHUXkdUGlfzFuOBbpr15yjraszHctH6MeB6Dt9RgMhTEQNygkq6XxEZtfXDuKJ+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6b5UmfK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6b5UmfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769025632; x=1800561632;
  h=date:from:to:cc:subject:message-id;
  bh=n3ESNd/ERl2OPDWk6Al3sMScCa+PyECZk2ZSqQtnSCg=;
  b=l6b5UmfKJ4WSPc4Hwwt3Gixt1uLKYyk9yfgnyR4hS9miMaJkN2w/DBl6
   6y89ErElZFq9QaXiXEsFl9Cgd7b3EBl4M+APZRldBKLBPdm8knigFpgCm
   H0hnCgOUG8tfnz9NWHkKIvSBOqmDkArnUhlEheYGPNGcFSjCqlXCQR6BJ
   GJ+qMtX0oadCPL4+wCrsPuEZTFjzk7ppBcFoIkvVXqwO+W9gZfOp8WTaO
   BOjHUcbAgt2qPaJRnqhR7f3xpAjo890oe/fAArK1WtkxiuwdSkMMgL2z0
   ZPaAwm/y/ko7m+vm4VG0BRlVdLqVraSTdIy9jxbZ00UccTlzotzSVgWhX
   A==;
X-CSE-ConnectionGUID: qarxpwQ3R/mQy/bJgZApSw==
X-CSE-MsgGUID: ro2WyZrPREmjXAd9T1E2pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70233195"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70233195"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 12:00:31 -0800
X-CSE-ConnectionGUID: ywdXeKtlRgKDQKXSnERkMA==
X-CSE-MsgGUID: c4TjxpWmTvK6zENnpfI5uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="229513802"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jan 2026 12:00:29 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vieNP-000000000Mj-0KmQ;
	Wed, 21 Jan 2026 20:00:27 +0000
Date: Wed, 21 Jan 2026 21:00:18 +0100
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>,
 linux-doc@vger.kernel.org
Subject: [linux-next:master 7293/8780]
 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2:
 [warning] wrong indentation: expected 2 but found 1 (indentation)
Message-ID: <202601212046.sQ0IKH27-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
commit: a8e3d66ff5c0c37e7c10b3e486d2c5047bf9cf2b [7293/8780] dt-bindings: arm: mediatek: audsys: Support mt8192-audsys variant
config: microblaze-randconfig-2052-20260121 (https://download.01.org/0day-ci/archive/20260121/202601212046.sQ0IKH27-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601212046.sQ0IKH27-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601212046.sQ0IKH27-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
>> Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)

vim +52 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml

     8	
     9	maintainers:
    10	  - Eugen Hristev <eugen.hristev@collabora.com>
    11	
    12	description:
    13	  The MediaTek AUDSYS controller provides various clocks to the system.
    14	
    15	properties:
    16	  compatible:
    17	    oneOf:
    18	      - items:
    19	          - enum:
    20	              - mediatek,mt2701-audsys
    21	              - mediatek,mt6765-audsys
    22	              - mediatek,mt6779-audsys
    23	              - mediatek,mt7622-audsys
    24	              - mediatek,mt8167-audsys
    25	              - mediatek,mt8173-audsys
    26	              - mediatek,mt8183-audiosys
    27	              - mediatek,mt8183-audsys
    28	              - mediatek,mt8186-audsys
    29	              - mediatek,mt8192-audsys
    30	              - mediatek,mt8516-audsys
    31	          - const: syscon
    32	      - items:
    33	          # Special case for mt7623 for backward compatibility
    34	          - const: mediatek,mt7623-audsys
    35	          - const: mediatek,mt2701-audsys
    36	          - const: syscon
    37	
    38	  reg:
    39	    maxItems: 1
    40	
    41	  '#clock-cells':
    42	    const: 1
    43	
    44	  audio-controller:
    45	    type: object
    46	
    47	required:
    48	  - compatible
    49	  - '#clock-cells'
    50	
    51	allOf:
  > 52	 - if:
    53	     properties:
    54	       compatible:
    55	         contains:
    56	           enum:
    57	             - mediatek,mt2701-audsys
    58	             - mediatek,mt7622-audsys
    59	   then:
    60	     properties:
    61	       audio-controller:
    62	         $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
    63	
    64	 - if:
    65	     properties:
    66	       compatible:
    67	         contains:
    68	           const: mediatek,mt8183-audiosys
    69	   then:
    70	     properties:
    71	       audio-controller:
    72	         $ref: /schemas/sound/mediatek,mt8183-audio.yaml#
    73	
    74	 - if:
    75	     properties:
    76	       compatible:
    77	         contains:
    78	           const: mediatek,mt8192-audsys
    79	   then:
    80	     properties:
    81	       audio-controller:
    82	         $ref: /schemas/sound/mt8192-afe-pcm.yaml#
    83	
  > 84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
