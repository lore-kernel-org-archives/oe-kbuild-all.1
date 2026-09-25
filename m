Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43314396585
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 06:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790318542; cv=none; b=uo9nSOST4E8/iOSsxRS7+zT33qfbF0NH1+/UlOB6boP3a51IUpvEE1IJ6sWb4QF/JYrs+dSQr6f+fX7qExZ/VDU/HaprK+u6wRgI3PhlmvpkplfBjN3BfwlEqY/4TRqoIYvsJiC8luaTqroapJO0PJqVljaaRwvGoOj88z0DrJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790318542; c=relaxed/simple;
	bh=/tFfjc4uKi3YwU00tf8ZPnQ2E4qE6et5xsJed/Fn4BM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hGLpJFobmYjjoB8GYqlNfN0+2JOyaPm2Co04SW02yhxnrnGwULN5faBFcvT5epfH4p8Due9YPsea0K7fGFK7WzX344s9ptK+tnWd1NFR5eukVfHd8u1ZPWL8uUDauBEEpjLHzKnB+L+i+bKlJsr9ipBN8ysK7hrY4+KKI8N+Uas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cy17cXVT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cy17cXVT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790318540; x=1821854540;
  h=date:from:to:cc:subject:message-id;
  bh=/tFfjc4uKi3YwU00tf8ZPnQ2E4qE6et5xsJed/Fn4BM=;
  b=Cy17cXVT23YuHXtY2K/LgvxtPC7ysKEXJy10egEPA/9ItBF0I967dyYZ
   IpNelj1l0TLJfmmUbNm1P1nwuwOhfSzgNG/5ZC1XRBI0O7YsAX2bmN+f8
   9TYw6tuavQRuR8zU1B5sI/CZgM2++lZaSn87QNyzwti5bUaf6GcMCaNFR
   QW2JeAx4hKno/vec7MRI5KTe+TrA/gW8foIJJELlu3MVDIsSgTfir9+U/
   g86qE7l6zy7AyiGX4tSQMqjTYrUdun+0qCOl6arsFydyM3HNi/6/qnZMM
   vp5isV7cUuFI/ZbZ8gASj1yPsRi3tuU/MVqOjmQMDXsHMu97i8XHjSTxm
   g==;
X-CSE-ConnectionGUID: 9UnOANqPRtm2cWsd8ehrHw==
X-CSE-MsgGUID: dWoh50ecTeWJhvVgdK30NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="102462797"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="102462797"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 23:42:20 -0700
X-CSE-ConnectionGUID: VTx10zQNRYqa+P6frv0L3A==
X-CSE-MsgGUID: mOXpLMoORpigjBp65rdolw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273468824"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 24 Sep 2026 23:42:18 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9zdP-000000000dG-3vpH;
	Fri, 25 Sep 2026 06:42:15 +0000
Date: Fri, 25 Sep 2026 08:42:11 +0200
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [linux-next:master 6099/10113]
 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dtb:
 aop-cmd-db@81c60000 (qcom,cmd-db): Unevaluated properties are not allowed
 ('no-map', 'reg' were unexpected)
Message-ID: <202609250843.0CNK3oSc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
commit: 7e38885d78f7b008c085a0cde7173242d02d2b01 [6099/10113] arm64: dts: qcom: glymur: Add Asus Zenbook A14 (UX3407NA)
config: arm64-randconfig-2403-20260923 (https://download.01.org/0day-ci/archive/20260925/202609250843.0CNK3oSc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250843.0CNK3oSc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609250843.0CNK3oSc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/qcom,cmd-db.yaml
>> arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dtb: aop-cmd-db@81c60000 (qcom,cmd-db): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/qcom,cmd-db.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dtb: adsp-rpc-remote-heap (shared-dma-pool): Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
