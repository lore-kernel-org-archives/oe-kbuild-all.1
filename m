Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3AF22EE2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 10:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHuZLckn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702464723; x=1734000723;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=azxtPodpWsrfROV8QwGyX4v9jxYAoOU1Lvp6luubsYY=;
  b=eHuZLcknwdhTpQrRG3xF1nbH8j4O2qlo4KJCU3gGvP6ZiaAdXWObgDdC
   tJCdpbdHh2Jey2rGk0gXM5gtV8YFqOU1J4nNx+l/ha5q6Tc3M2mKGqh0O
   6g1fn6firjHLGo3OTuutvtYxtgiE4p3Cf+6Mbj9B+E61sHEEVdj4XVhG8
   E1CSnNlKp9zPE5Yappao7fyGJbvs2+GrLNnDyQS6P8ASXmck05GzdBsws
   mWVr3IBUcdV+5zRxuPccQE8Yw+9XkOQDyRZZd0Xq9b1gjmCuAuHP6O6h5
   VGXPy3BS9F83t+rgPqqmI0yvc0zzhequwkTWyWmZkv8DQQXem/oU02Vy9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="375100206"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="375100206"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 02:52:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1021068080"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="1021068080"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Dec 2023 02:52:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDMqN-000KQl-0H;
	Wed, 13 Dec 2023 10:51:59 +0000
Date: Wed, 13 Dec 2023 18:51:10 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/5] lib: move pci_iomap.c to drivers/pci/
Message-ID: <ZXmMnhe3YpLOqYam@171f04e7aea4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213104922.13894-3-pstanner@redhat.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v5 2/5] lib: move pci_iomap.c to drivers/pci/
Link: https://lore.kernel.org/stable/20231213104922.13894-3-pstanner%40redhat.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



