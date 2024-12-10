Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1951A4E77
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733834563; cv=none; b=gGQVai2Q3rKTRYUpdeeazItF75Q8wm1spNKPr0uKdhWNtNOpbH+1n3nHfegGeWQSTniL4CY9KWIbqq3IhFXR/J86bSHIIFkNO6GHypt3QNEcCo1usFXGNseLuY+9n+9YpvBSd13hG6xoZs89/ddkRv7a151NByPQYvsBPH5bnZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733834563; c=relaxed/simple;
	bh=FKpcB3MEcv9bVy7k7khv93pfJgAbXYQmLRdUCV7XMDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=itvOzVcUHGykMnGC9CC8rhg/HuSzPdZVagj0NUVKTtXy/KrogzcPFZxNpz78yAKPwaPqcVjRYs21iNgzudZ8Jf4mGJYOfNWXyg6G3pReThySEqdU8H/XaKwzNf/Lwg/J0ihDmekCtDImtssII7ksDfrCIYVSu01e+QyjKX9NBiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgVW3grD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgVW3grD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733834561; x=1765370561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FKpcB3MEcv9bVy7k7khv93pfJgAbXYQmLRdUCV7XMDM=;
  b=DgVW3grDVQsdHKTxBlZ15GK9VcJqSCaZfrlZkazbPs7gg7S12emah7HU
   N16MbHAHk1ZiZnyiyd/TmvgOVohO2CWa20gsBPPZ7LtjeTWwIUZjLMktT
   PpFy8yHdha9/YAkNCPlFJQfzb/oN6ja+wH5Hocb+vXb9Yv6mR7EvtwbZ7
   FzPUzlA6qVCgJquBH+L9PZNR747Vjkfo6mQHAH7YOMomqi63q6R0mThJ2
   oTBoKjc65ojVLGv0GLJW8B02r/Qo/WpPzo2xAyYZHufPXd5KuzTSBiPbA
   A5NxiOouf3vPeIt+UAVUiSPD+KQVps8jjrP2OwrwiheYf7llDeODrJyqD
   g==;
X-CSE-ConnectionGUID: LSYxV+CwTWa7wIQNuY5tjw==
X-CSE-MsgGUID: utCFw9JmTxW8lO/y5VciVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45557321"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45557321"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 04:42:41 -0800
X-CSE-ConnectionGUID: 9d/Dvm67Tv+k32DV6T21dQ==
X-CSE-MsgGUID: 8IV8GeK4S0yX9YQPZz4z8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95741296"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Dec 2024 04:42:38 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKzZT-0005Xp-2t;
	Tue, 10 Dec 2024 12:42:35 +0000
Date: Tue, 10 Dec 2024 20:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: drivers/usb/typec/ucsi/ucsi_yoga_c630.c:101:30: sparse: sparse:
 symbol 'yoga_c630_ucsi_ops' was not declared. Should it be static?
Message-ID: <202412102033.J4vZNaaR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7cb1b466315004af98f6ba6c2546bb713ca3c237
commit: 2ea6d07efe5388d47afdb49079423334c97fe22b usb: typec: ucsi: add Lenovo Yoga C630 glue driver
date:   6 months ago
config: hexagon-randconfig-r122-20241210 (https://download.01.org/0day-ci/archive/20241210/202412102033.J4vZNaaR-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce: (https://download.01.org/0day-ci/archive/20241210/202412102033.J4vZNaaR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412102033.J4vZNaaR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/typec/ucsi/ucsi_yoga_c630.c:101:30: sparse: sparse: symbol 'yoga_c630_ucsi_ops' was not declared. Should it be static?

vim +/yoga_c630_ucsi_ops +101 drivers/usb/typec/ucsi/ucsi_yoga_c630.c

   100	
 > 101	const struct ucsi_operations yoga_c630_ucsi_ops = {
   102		.read = yoga_c630_ucsi_read,
   103		.sync_write = yoga_c630_ucsi_sync_write,
   104		.async_write = yoga_c630_ucsi_async_write,
   105	};
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
