Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6831946DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 05:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758691221; cv=none; b=JtidnePlyvT0mEYgO2Q2W3g7UiVrZ5jpSqc7kaNqmIEmzNM4A5TRZ9dLOArSwqaUJMmTaUKOl+iFs3djG85Iz/91g9z1iznnISB418k8YhgPwIbNkHnGpb/wNJJuGfbKGBej1uXilQdfgfWyNO/kMnvsGrF/raEahpvFZZxdTB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758691221; c=relaxed/simple;
	bh=bkPNPHg5wn+CVYmGCoUuNHLV7A1kmCwF1w7iFA4I5Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oWVJst9cLJIEM28pl4K9p6FZ4FVXP1N9aXTu6qqOoPme2Ew3y4IkLMgxxesR5inkMz+X4tu67DQwj6kVUtQTPqwMuzTf4D/kNXKT3OEVPaJSRoMH5H8Ppbulwd2cTn4FIbWfkn4r31RFKtYMI+aa0SFwfz3U6ZLw0IVo+yG8jD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mY5WZiFH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mY5WZiFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758691219; x=1790227219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bkPNPHg5wn+CVYmGCoUuNHLV7A1kmCwF1w7iFA4I5Rw=;
  b=mY5WZiFH8Y3KxJA8klG41DAgs17XU1mECu7mi2Uq/JFTnnf2txoH60Lv
   g1KOrZMGZnWzSriEkmytFMBu/EZkzjU1gymbJmsVCRChjig6oT9wGhwJI
   z3qOF8S0cCSSho/aV+4RMn5sMCSLxHu0+AlTQAEU1d9POx/RJ8HmwXo24
   B5eMIKRLqO3nGTVm/I1oqRy6kdgk7YwLJZlZc7yBqaba0QY5ozchDjaoP
   MO86qrufdeOk69yCxN9l66NoN5pxyWSHRE0O1rwLXHujLVieLdI4NaBGP
   005UAAjeOLq3+Lvq1ZYvlmvP9+zJrvVSNfMkoJoEB78rON3A74bzRiP5w
   w==;
X-CSE-ConnectionGUID: pnupFH2dTh6AxdqgPlgtVQ==
X-CSE-MsgGUID: ZxmkyoLmTFWZUSwrFkkljg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60870553"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="60870553"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 22:20:19 -0700
X-CSE-ConnectionGUID: 3Q2emHnYT1218jGsX9qw4Q==
X-CSE-MsgGUID: liqkk8K6ShKEXfJYjPwcKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="176064200"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 23 Sep 2025 22:20:17 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1HvL-000000004PB-0vKi;
	Wed, 24 Sep 2025 05:20:15 +0000
Date: Wed, 24 Sep 2025 07:19:39 +0200
From: kernel test robot <lkp@intel.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-doc@vger.kernel.org
Subject: [robh:for-next 69/71] htmldocs: Warning:
 Documentation/devicetree/bindings/media/mediatek-mdp.txt references a file
 that doesn't exist: Documentation/devicetree/bindings/media/mediatek-vpu.txt
Message-ID: <202509240722.Mo8pMeFA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   8682e2221ee075c28a63071e03be66d3bd2df5e6
commit: 7614aef620a93e3e113fff27dd4760b0e56f88b3 [69/71] dt-bindings: media: Convert MediaTek mt8173-vpu bindings to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20250924/202509240722.Mo8pMeFA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509240722.Mo8pMeFA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/media/mediatek-mdp.txt references a file that doesn't exist: Documentation/devicetree/bindings/media/mediatek-vpu.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/trace/rv/da_monitor_instrumentation.rst references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
