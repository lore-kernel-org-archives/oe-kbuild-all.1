Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D29734AAE3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Apr 2026 16:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775664830; cv=none; b=rFn5K6b/EhwKKh7eHZaIC7YNtWs8gEujpup9bTN4VA51j4ElKiOQNpbMA2wIWEhe31UR2zqI8jlbCjJNoOFv/WZwgioV8SF+NqsrmiZXdaeM6XBAYDGgjGlZs9mDvTo3Kez3R2hFIGuskF0jhYyBmk495rLwfhbaMyH2e2PSqzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775664830; c=relaxed/simple;
	bh=frIqSR913D6i1XmZ5VWS66nZbITYXIqEAg3+Ld0XFfo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vEfR55UZHUXeR2wBiPRsD/KSoqVVy/lMG9t0tKOGZ2gN5RmW9kpRY1FpDp1P+FDkbueaX57CR02mT+KBzzQZ+7bq01D2Q0nI1mKtV9DlMgUbJX0uXK3OeLQvJER4mxwKp1nNr9fCtbwHljy8M4yVATdNfqMDi93M3GvMsa0TgQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLBHV9pl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLBHV9pl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775664829; x=1807200829;
  h=date:from:to:cc:subject:message-id;
  bh=frIqSR913D6i1XmZ5VWS66nZbITYXIqEAg3+Ld0XFfo=;
  b=dLBHV9pl8E4/o7uDXNxYRdUmrtminWv6KZOCI//rgUUHj/H+lB7zkC4D
   heD0HXURhRcBw4zOxFQ2j1cPK1eesjiBpHwVygtztVK3bWwhNUT3QLoX0
   9UrxNIzcwxenFnzig+zCBUrr7X9+In4GDyuSSt77g8oxPE80QUZTwUMPG
   Kz0f5TAx4j69+XzznZ1UO7I7HwsdYZH4Z3Y5TBOHfR6U8+NNPmwDHBELC
   Qq8lOmlC5xsr7I7vg0OgHErNeTvohFrDyJwHa7dECoBlx0ofqUAm6Vw+l
   BrkjXohJVmj8chmdWz7XpUa6JCtOgVnSNutMKHU3QN3TbBPHlW9kb9la9
   Q==;
X-CSE-ConnectionGUID: xH3WqmkyQ2CnWuKNWBHclw==
X-CSE-MsgGUID: IWwUPkoMRv++9LiPxU5UWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="80541516"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="80541516"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 09:13:48 -0700
X-CSE-ConnectionGUID: d7hn807BR9aa/oGyu2oY/g==
X-CSE-MsgGUID: AguIt/S5SL+vWUfAqPfebQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="228404878"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 08 Apr 2026 09:13:48 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAVXF-00000000ATZ-0SER;
	Wed, 08 Apr 2026 16:13:45 +0000
Date: Wed, 08 Apr 2026 18:13:22 +0200
From: kernel test robot <lkp@intel.com>
To: Sen Wang <sen@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Warning: sound/soc/codecs/tas67524.c references a
 file that doesn't exist: Documentation/sound/codecs/tas675x.rst
Message-ID: <202604081804.ImZjoifC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Sen-Wang/ASoC-dt-bindings-Add-ti-tas67524/20260408-141601
head:   6d18e62ff6aa71d56585dca8035437bc9218eb19
commit: 6e3145ebbb92b213c028232cad30d7d99d2ecdbd ASoC: codecs: Add TAS67524 quad-channel audio amplifier driver
date:   10 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260408/202604081804.ImZjoifC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604081804.ImZjoifC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
>> Warning: sound/soc/codecs/tas67524.c references a file that doesn't exist: Documentation/sound/codecs/tas675x.rst
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,(Documentation/translations/[

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
