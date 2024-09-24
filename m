Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F5514F9EE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 11:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727177541; cv=none; b=VVSRFqlMW9dhb9VhCGwHkAoed8x0ILnilHOZe0bnn6Qbtd0/APhbwY39deqSZOKQk0UrVm4TC03w8/x8Gun/pSJN/adpFkkPG0KSb5Ls+J01nsWISk6Z6NHg5LhasLuV1qxqeV7907XJ9xlb6zyT7bYrt6OhzNqfGjjYa2IbaIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727177541; c=relaxed/simple;
	bh=2nOc6gKxOyLPjH6Oo+mzkbCQJquBtcVta5tE65Htl78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AXMG9L8vQuSe03uatWQz+/9srKdnL5l0967SHPiYRO9t9ven19Zj2RE0VB7AkDP2GUoKScGWN+xGH5tlEv4D1OWWq+y9KNozMaDYDGcPj6SQ+f3cyMha/M/SNWDCFFBaz0Hi56qQDJb+4sOIEhIsONdMYQr6mGWEGtpDxd1BrVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+VAHgbC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+VAHgbC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727177540; x=1758713540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2nOc6gKxOyLPjH6Oo+mzkbCQJquBtcVta5tE65Htl78=;
  b=F+VAHgbCOuPY+2LO6JvfxcMBkhMkVxyMutMrBT55kGIkdYDPlf7GPpe6
   d6Q7xzBzIP2tw2urfJxK08/yHsL/L9qdKDL2qSYMpRQfGSIQgqLaqA9ED
   stTW6GqhqtKa2QzQoN7lKrO8xjz1tI0Gi6UNQJGDhoouTYe++WYYOLUkY
   MYP8p0ejH+h58cAyfemb15lg3uZ9Z5Rlw8MFoniXvGnrchq5e0C5IzLN4
   gQ00QdVx9uKWpyFpwtv3P1tgD7m9+Z3rj7tXRwE0GsnlyH3PlJ0hIc1E1
   C9SCZMqrxVLrWrWnFzo9A094birY3+nrSuRm/9W/+po1aFq6l0mI6xF7e
   g==;
X-CSE-ConnectionGUID: mlTYrd3wQxaxIeva2qdmfg==
X-CSE-MsgGUID: GbHWY6DuSo2iRvUToYoRdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26312103"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="26312103"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 04:32:19 -0700
X-CSE-ConnectionGUID: O4LZg1ZDTROg6/ylfSU8dA==
X-CSE-MsgGUID: ajGAiUSNR/OIIsJebMBxpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="71463153"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Sep 2024 04:32:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st3m9-000IJV-1E;
	Tue, 24 Sep 2024 11:32:13 +0000
Date: Tue, 24 Sep 2024 19:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1020/2441] kismet:
 WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS when
 selected by X86
Message-ID: <202409241937.RuvzrMc3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: dc5a05bb7d9999c314434d9e7b2ff1f66184c9e0 [1020/2441] PCI/MSI: Make arch_.*_msi_irq[s] fallbacks selectable
config: x86_64-kismet-CONFIG_PCI_MSI_ARCH_FALLBACKS-CONFIG_X86-0-0 (https://download.01.org/0day-ci/archive/20240924/202409241937.RuvzrMc3-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240924/202409241937.RuvzrMc3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241937.RuvzrMc3-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS when selected by X86
   WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
