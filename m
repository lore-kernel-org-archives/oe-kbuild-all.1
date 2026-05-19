Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6851328B7B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 14:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200266; cv=none; b=hWfYKrBLafd1bQagpV6eUXhysURR7WdxyM41E2mspBBDMseZ1FdRudpVwW8WT838j/A9oC7kkZ5540B64DuGWFNdjcsQ5KAgD0i+84Sglx0kZfHUTJmmQ0GSro29+we6wF8pHXlk6SxwHF+Woyjum+gkumJ/Hiu57Yqv/aDHnks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200266; c=relaxed/simple;
	bh=UGhl/0smlB9BNc48jVthHrGWj+JiTUqdTPARV5Qabf8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=maVfgioMI1TQrs2HQUf3v2vTqUdUK9MCsNHPuvEYmxRtGMmqWPZ67aAQRLCIefr54ehMum0e8peR0cPqT+mnV5XvgbLruWLIyG6kd1zIq69Dg00lTIgVZdTymXa3Y4x8xgsifDwKJRwwFLu6IMrYtAjofK5EpTz6ZSZTSuMY0Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mw7fE7zY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mw7fE7zY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779200265; x=1810736265;
  h=date:from:to:cc:subject:message-id;
  bh=UGhl/0smlB9BNc48jVthHrGWj+JiTUqdTPARV5Qabf8=;
  b=mw7fE7zYu0S3appj0bbNh0/i8n/i7jlNfNffgbjVw0YYYYC1HN0B1dyB
   CgD3M8Mbz5dKVKwINqPv63RjclIJaQDHdHojxgS+MeOjTvJ/6YhvgteRk
   X5cm+3QakQFqqUzR2hW0HIojVT61hT3xNmtGuQN1qXCJ7K3qizWEG2J6/
   PkNU8XzsHTwCRCMPP/j9ZL3CVMkUsXQ0vGNDKdhXy9suxbQ7xHCNzYOGG
   AvyFF/sX41E5S5JIeSWrbNXr/j0fLNzhkKR5hvZg2ZUVqiYOC12Y4ZxI1
   7DKdSzMi0Wev19HaePGeGszgBqHsojkEMVuzMEDHmhU/+oMvoRxmWqsBv
   Q==;
X-CSE-ConnectionGUID: YP4QV6vCRSCaHLjHXHDImQ==
X-CSE-MsgGUID: c2V7OGyiRjWJx525Igv0Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102754697"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="102754697"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 07:17:44 -0700
X-CSE-ConnectionGUID: eEnoy91VTzG4/51U+9RyUQ==
X-CSE-MsgGUID: Ed7iV5fVTl+sRDAe+2kwkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="238947510"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 19 May 2026 07:17:44 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPLFa-000000001A3-30E0;
	Tue, 19 May 2026 14:17:00 +0000
Date: Tue, 19 May 2026 22:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 224/224] ld.lld:
 error: undefined symbol: drm_dsc_pps_payload_pack
Message-ID: <202605192237.RyzdrJ8T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Langyan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   cdd6fbc4d780cb61492a768f9641a353ea08dbfb
commit: 65ce1f5834e9598e5120048010b4fe220e70473c [224/224] drm/panel: ilitek-ili9882t: Switch Tianma TL121BVMS07 to DSC 120Hz mode
config: arm-randconfig-r131-20260519 (https://download.01.org/0day-ci/archive/20260519/202605192237.RyzdrJ8T-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605192237.RyzdrJ8T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605192237.RyzdrJ8T-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_dsc_pps_payload_pack
   >>> referenced by panel-ilitek-ili9882t.c
   >>>               drivers/gpu/drm/panel/panel-ilitek-ili9882t.o:(tianma_il79900a_init) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
