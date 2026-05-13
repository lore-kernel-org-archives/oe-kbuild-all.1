Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0C237F00B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 12:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778674066; cv=none; b=NWIY9UXxWb+GMEXCD/cWOa0UtEU6GVFFFvu8npdlLL4VEfKF/KTwCRNA30z/h5TmnSPDFAyMBXZ3XFjZEzMp2AELWI1I6PLqZ1vZsU8IGiG/2XG4MKxPF10820Dvz9uSrlgsj9vPCvaacvR1IL3SwLBhkOMYAsYHXodluOEVisI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778674066; c=relaxed/simple;
	bh=/SRcLT2VJFVcrRbMYcawalbbtxYH31yLAWaLQ2fWM1A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A+SGyaHWwqJsyoVZjxHpN7f6Z1uiGdSvOb/mCJSJ6GCsKI8B6dtg7qpdZm362SwN/WynPD8zxhtow9ELxIeUTalk5t/coorGc959bVJof2wILNleoR6ck7qwNjXYYwe/fa87q88//jh/6N7ItT3Xjk6S/UIrDIUAfX3l2TWswpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ax2J8t9c; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ax2J8t9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778674065; x=1810210065;
  h=date:from:to:cc:subject:message-id;
  bh=/SRcLT2VJFVcrRbMYcawalbbtxYH31yLAWaLQ2fWM1A=;
  b=Ax2J8t9cLSU4BANkci4Vl9JOSAez9Ok0XhdIW8u52Edh24iD6lqK0fbd
   ZKkm+sR0HcODw/CSQjdibPq+yqv81AAqvahVkBE7BOFshU5wcze4vKftB
   X3GuuHjx9CeJ//gb0HVmFovxqmCGez5wlTn9BPF2pFZiDmkXIV7uNcHFb
   KucA4e3ppwOO+3SW3nI+lobiOBvIJ7t7aaX7Z7BVtbgAxpASLPMSepLf3
   BrLesV7g39Q8bdZCRutVBCOQZIn0Pa6pjkDhC36D6bjsY23iLvdSO6O9A
   /qZFYS3+ytku99yLNSJ3TXFkXzVPoQJVbWlIGAdBdUO3XynYPc13XxVwL
   g==;
X-CSE-ConnectionGUID: isFSNQ7SSQSJB3IKEhqehA==
X-CSE-MsgGUID: X5xXvrWdRlinaiQKJO3PfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="78743505"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="78743505"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 05:07:44 -0700
X-CSE-ConnectionGUID: YcxFxzAmSTWkXcXrXYBFjg==
X-CSE-MsgGUID: Y6L2SbbMQlWEpD+zsezgJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="237086537"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 13 May 2026 05:07:42 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN8NH-000000008Xx-3eib;
	Wed, 13 May 2026 12:07:39 +0000
Date: Wed, 13 May 2026 14:06:54 +0200
From: kernel test robot <lkp@intel.com>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-doc@vger.kernel.org
Subject: [linux-next:master 8363/14863]
 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml:
 properties:mediatek,audio-codec:items:0: 'anyOf' conditional failed, one must
 be fixed:
Message-ID: <202605131424.Bkw0s7qx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: 472d77bdc511d96434b3679ad022bfa35d3861c1 [8363/14863] ASoC: dt-bindings: mediatek,mt8173-rt5650-rt5514: convert to DT schema
config: arc-randconfig-2052-20260513 (https://download.01.org/0day-ci/archive/20260513/202605131424.Bkw0s7qx-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131424.Bkw0s7qx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605131424.Bkw0s7qx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml: properties:st,syscfg-dlyb:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml: properties:mediatek,audio-codec:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml: properties:mediatek,audio-codec:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
