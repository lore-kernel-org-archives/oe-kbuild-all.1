Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD803DD523
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 05:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790314271; cv=none; b=YWpaoJypbIXrXv+9E4NA2WDVJwV+/Yy+HdNIZq0mEjgqTGomYY6jFIM3d7rce2eL+Jm1PrvKNxYw+5IeN9tfknfaoA2+hpxsE0mftOVlbW31ZdQNmsOZ04i3yC8gsIpoHYxX4ldEB+Qw8j5uyDXj8s88U3jxRj8b/QdXySWX0XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790314271; c=relaxed/simple;
	bh=CwKYRieg37gmdnMA1DfYuZbGfEeMCtCrEiqac79Z6zo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gvfl87JhOSpwy1COGrnhYYsPkai/Rtl2zm7gfvvDiLJCnA7mxbGVWY6QGUlL9RNGLNFEKQtVVcJCzkdl/nzktw4pmc33xrLh2O2Z48d4FNLAIwAMsBKCfYErNk43JftKf8gBkLeB4PZorwpfmwRJAkTS+5BK/+oU3XfDkm3j5TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DawhM1k9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DawhM1k9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790314270; x=1821850270;
  h=date:from:to:cc:subject:message-id;
  bh=CwKYRieg37gmdnMA1DfYuZbGfEeMCtCrEiqac79Z6zo=;
  b=DawhM1k9pbh6AzuSkbLfJBSzp/lSp8iPtA+jEaesz+zmFHRgt4c/fygr
   W+3fQmLc7MQbCUoeX7uMIoiN5pv8/b9upz7gXFgFnBMD/SCO9h4c+rZJe
   mQJq7HuI6dyot617C3hxbirooMvktd4BpYQr71yic1HzQ4HbASbLbfO7l
   5pcT3yVSFZS+WCTzIRveQKmCfmD9TFrHB7D18U5jfUzH2PbNZSoXw7jNV
   9yra7ntF8Sn+kkYrlsG7BSCiny54gO6xnKUg06hmTeJM4o8l9brw4E2fQ
   jEVIRO0nWcuFxqQvsOrWOncNkC1M8iavXqazrxH1MxhBbcKlf9Mjs1dFc
   g==;
X-CSE-ConnectionGUID: qPwO25rNR5KYsf0Bp1lnYQ==
X-CSE-MsgGUID: wpDWg1WvSBOAhdS/WKltOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="108587373"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="108587373"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 22:31:09 -0700
X-CSE-ConnectionGUID: bq47cIOLQDqqpD0zzWNL3w==
X-CSE-MsgGUID: qFBzM5tvRRibxZ8ZNi7VTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="277994244"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 24 Sep 2026 22:31:07 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9yWX-000000000bK-1Jpg;
	Fri, 25 Sep 2026 05:31:05 +0000
Date: Fri, 25 Sep 2026 07:30:57 +0200
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>, linux-doc@vger.kernel.org
Subject: [lee-mfd:for-mfd-next 30/35] htmldocs: Warning:
 Documentation/devicetree/bindings/leds/leds-cpcap.txt references a file that
 doesn't exist: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
Message-ID: <202609250750.y6ENIshd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   319633b06ff2bfc2a7a60d2cfcab2e681a343b27
commit: ed7977e8eacb7efffda85be34af62631d0f03939 [30/35] dt-bindings: mfd: motorola-cpcap: Convert to DT schema
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260925/202609250750.y6ENIshd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609250750.y6ENIshd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/translations/pt_BR/process/security-bugs.rst: :doc:`regular path submission </../../../process/submitting-patches>`
>> Warning: Documentation/devicetree/bindings/leds/leds-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
