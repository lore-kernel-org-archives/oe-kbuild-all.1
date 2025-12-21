Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C52123BF91
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766320682; cv=none; b=uwOeJfWnVaTlXOU2hkWhLGzkma2e3T2ybk+qyI3IrMKIQ/1ucEBZWotUK9xieo61DLCgq+Vgdv7uS+/+aRZlWVW6fM9B7n1f0EN/0z6eDG8kWciKwoy7NBFjoS3aEHBbZCt7JvriKeK2bpeGHi6GqAayWbZANOOGcQOAbKgB9h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766320682; c=relaxed/simple;
	bh=Exm20J/F7QXWjAs2l1Cv+RU/KQ0cszKrykYUgF/vu/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Su+20X88Zn0ouZnV/ZN1Hm/zmxY2QIZ9fNns5vJTQhNzyrnMminfJi5H3UZ7gf8PkYFcDwYjN4Feu1NQrXmgRcBV1XabsnlqaqsstEfRxo+9TBtD2r5ZSMnsLq6Dr4kwW/lEHoEI8cQICncECEiAIH9v7hee/76UO51D9bfHtCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXlXs8GH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXlXs8GH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766320681; x=1797856681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Exm20J/F7QXWjAs2l1Cv+RU/KQ0cszKrykYUgF/vu/0=;
  b=EXlXs8GHYzdpZxKXvfCida8S09HgnOEl5OS7o8wSbXweQ8rUCCxiu+cv
   XWmn5kEKhrD8A2EHp0ORF/mwj3/P9tlRqWH5B4D3WQWHvFAaJBRnGIBl9
   v0SlX+DuMV5XCNx2SkH5Bq5oAnM44IUH4MAvnBnsk841B0W5v4dQvlnog
   zaFxdhr/rfTyVPtH6YqujfvPLcqROMhnfL11DDbojcotHvIgIPov4VVcB
   S9UKGiB5gkkXp8EcUsV83hrvb1zua9tZ+21xTIM1pWWBjr6TEMztkm2LR
   SF7CHgPPXc3vvmctiZ3MXrSXkR8Nt8AV9kL+09AXUDMuW+9RIGH4jmvGC
   A==;
X-CSE-ConnectionGUID: f/Qwk3dBTRyWY631RqXuuA==
X-CSE-MsgGUID: q0AhUCphTHCkDdwPcUIjPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="70778332"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="70778332"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 04:38:00 -0800
X-CSE-ConnectionGUID: 7jBlt3rqT9uFOFrVaKgwpg==
X-CSE-MsgGUID: aysWff40QmGINTdUv+Miqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199592121"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2025 04:37:59 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXIhB-0000000053Q-3Axy;
	Sun, 21 Dec 2025 12:37:57 +0000
Date: Sun, 21 Dec 2025 13:37:46 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sashal:spec 1/131] htmldocs:
 Documentation/dev-tools/kernel-api-spec.rst: WARNING: document isn't
 included in any toctree [toc.not_included]
Message-ID: <202512211329.2JmvrzuC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: 0255afb0b87746723affbefad17b2caa26d29180 [1/131] kernel/api: introduce kernel API specification framework
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211329.2JmvrzuC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211329.2JmvrzuC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/admin-guide/kernel-api-spec.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/mediatek-mdp.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
--
   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/dev-tools/kernel-api-spec.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/netlink_spec/index.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> MAINTAINERS:30080: WARNING: unknown document: '../admin-guide/kernel-api-spec' [ref.doc]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
