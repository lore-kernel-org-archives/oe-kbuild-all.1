Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08650139CE5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 05:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718948611; cv=none; b=Wn6vkxqXnARdiSQpfiGMsXRyI8L8avNojQvR47qhtudIuRAXfybMzwfaBvKsevtgdaOybY5kFhHY0Y6TR3oSxopoO6ScEWtKOkqtx7v/Qpv5cx/Jyc820dIrvMuv0L8PCSy3/MvJiNsgaUsaWOX+/hCnO13xvHF60hSSFT+ZOVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718948611; c=relaxed/simple;
	bh=Xf7qF6bnD/qVShDE2tKXjpZG+iRsJpV4Xe1ySp5/jmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pUPAg++S2h/zJKS41eLVCKrNZsMybZnwreArP0ZvlKmWCpEVPBsEgdeeJNkB/Xzx7YJhfWagDjid61zdXYMds6Ym1nPxWrnNYP1T5ngaYsl7mlcgbi8L1vofgieqUkkOj45lZmhn0kzQ5CxsJIhFRuSoXd5IUEMHagKVhADN8PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJqzRMcU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJqzRMcU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718948610; x=1750484610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xf7qF6bnD/qVShDE2tKXjpZG+iRsJpV4Xe1ySp5/jmk=;
  b=BJqzRMcU1hfw4gJnzeLQTD0rKMrSTaEipRO6ShzCEwn+h+fVkgZl5dbG
   H/fpuGgZl6gwVtcg8HQB89Aft1k5exfhiZD6AvwZKQwnVy2R6X52Rx+V1
   8Qr0+8P9vyfqIT4BCE7CRnNBhNBKRCnJoaXuu1VpQqJYEm9H+JI0hJMc+
   033HQDQiCL+UvfTV5Hr8Lktrrbymns+H5ixGPyXlVJWYdk0TwNpHUuHxr
   EmAjmtUkaRwkq8x13J5ZNv5v4ZJb4XKg+D3BJM0TAcRHlBrQW2ozngio+
   jJp2LzZv0QJx1uk4QUe12Gc85S0HkrXQZUYjgozmYXj/Cl+YX319nPPss
   A==;
X-CSE-ConnectionGUID: Brv9w+pdSbqbTsWsRgdW5g==
X-CSE-MsgGUID: p7f1TDNMTreLzQNlZ8j4sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19848756"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="19848756"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 22:43:30 -0700
X-CSE-ConnectionGUID: y7cr2vFMSUy4d6Qppgkc1A==
X-CSE-MsgGUID: lSvx8eFbQEe4DTsYz9+jTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="46938959"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jun 2024 22:43:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKX3W-0008Gs-0X;
	Fri, 21 Jun 2024 05:43:26 +0000
Date: Fri, 21 Jun 2024 13:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-doc@vger.kernel.org
Subject: [netdev-net-next:main 6/7] htmldocs: Warning: MAINTAINERS references
 a file that doesn't exist:
 Documentation/devicetree/bindings/net/fsl-fman.yaml
Message-ID: <202406211320.diuZ3XYk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
head:   86474deeb5c3e57258839a4389ec75c7a871d4af
commit: 243996d172a68fba79765cfe20ab910c29ec5f50 [6/7] dt-bindings: net: Convert fsl-fman to yaml
reproduce: (https://download.01.org/0day-ci/archive/20240621/202406211320.diuZ3XYk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211320.diuZ3XYk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/net/fsl-fman.yaml
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
