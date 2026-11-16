Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796969;
	b=T6f9yLYCpn/xPyYA/IutSOGLNACGWqgzIBrnAtrV9SUy4qoAo/oldvMKqZqdwpUahiRj
	 adIiFAor1rbuZ7gMhce7hnJBvNh6uFYoQfE5rfK05rMbIoQPKuocPqyM6it6lGlPZLlRK
	 ovwC8roKdCluBayTb1ZnA8BRM/fIbt2T59eZK9xz0Vh3OK/WJqWcZjhSqQ7F8gOiJPcTY
	 Qx/5FGtTv3F0whSuhdAdsIH4gIcglhjFnuMj5Y00u8937D/SguuK2WbLrknJSiSHmGQmO
	 jrOfeK6brp6II4l9BiAmcIwXBt4GFhSunelUfDF4oG6bcsA/T/ieKDdAcAfKVGJyLOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796969;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=sRHTt+iR+IRXpQ1t+pHVns6pksLULRysfnI5/gnbViE=;
	b=gRJS79sq7rkKsaT5KyzZSJbNZgSQlQpazysw2kYy+Hm+1YdUAzP/SDEav/8Rmi23Gn+X
	 7qFpap0TjgHByEsvEnSUGpJZU9JQprCGw5XbJ4jw9S1+GdkBvlTrS/8lJs2hw81WiB5Uo
	 hOVSq9SZDpOphZD+kf/6tBSwR4jesy4a0LNu334URO366TWkmvG81nj2GceO4qs86eQap
	 gUjF230Jbu65uMwKjnGBPQI49qGAteoFOYpJBbrBX112wop+J1yYkHMS+Bmcf9jCA/B4p
	 tKbNS1AjVwMTs3q3nK/uNa/sYagOtaI5sFkFfgcQpdKWDETc/3l6Uhl9T9/4QR9I9gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="hndk2/Dz";
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80370606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 02:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80370606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hndk2/Dz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794796969; x=1826332969;
  h=date:from:to:cc:subject:message-id;
  bh=z3KAbZwDTyUpQrv0QcPgbayZxUZR6lOUKybZK/r3PYc=;
  b=hndk2/DzTus8480JSCI2IJWG2h74HYlgvxd4HgJbtrZCcTRcI3Isau1Q
   +E4BW3VRFm3QOIi0yAxXrCvRDXG85iv9XiVqw6FYa73KxCr0wM2KYmjf9
   mVVRdE6p8YInVGu2KPrG2e0qdTcfbmSNTOPNgpharPvW1KoDbyiXAoAp6
   5t43iavEBLtuvtCnAzggdzQhLwvoKNFszk4iOWUc4rCeJ6wMRH+keDkcC
   kNfa/F+ZzRAgJpVp6fSHLxzjq8hNI1uRB2qKuaN+DS2DYdcn/xMr8Gj0W
   nEYUqBAO28igkX3+E7SHVyAviNs1QCR5LZcR6NGT4e4oWpl0fAr/4/M0b
   w==;
X-CSE-ConnectionGUID: BQ37IcVWThWfSnuehOvpbw==
X-CSE-MsgGUID: h3egWxaVTZKMztWhpqCqWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3628796"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3628796"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 18:42:48 -0800
X-CSE-ConnectionGUID: gQDp+rmcSAe91sib3bsIPQ==
X-CSE-MsgGUID: PRNSlFrGSqWiB6QxJ6qCwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9269497"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Nov 2026 18:42:46 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSmg8-000000017ho-082U;
	Mon, 16 Nov 2026 02:42:44 +0000
Date: Mon, 16 Nov 2026 10:42:33 +0800
From: kernel test robot <lkp@intel.com>
To: Aary Patil <aary.patil@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [thesofproject:topic/sof-dev-rebase 16/67] alpha-linux-ld:
 sound/soc/sof/mediatek/mt8365/mt8365.o:undefined reference to `sof_of_pm'
Message-ID: <202611161039.NPI67TL9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Aary,

First bad commit (maybe != root cause):

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   862d4ac42408c74e989139ede5a7348ead782ec9
commit: 9089b6943d8f12edf396b282b7cc1047b3a82556 [16/67] ASoC: SOF: mediatek: Add mt8365 support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20261116/202611161039.NPI67TL9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611161039.NPI67TL9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611161039.NPI67TL9-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `.init.text' of fs/nfs/blocklayout/blocklayout.o: defined in discarded section `.exit.text' of fs/nfs/blocklayout/blocklayout.o
   `.exit.text' referenced in section `.init.text' of fs/nfs/blocklayout/blocklayout.o: defined in discarded section `.exit.text' of fs/nfs/blocklayout/blocklayout.o
>> alpha-linux-ld: sound/soc/sof/mediatek/mt8365/mt8365.o:(.data.rel+0xa0): undefined reference to `sof_of_pm'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
