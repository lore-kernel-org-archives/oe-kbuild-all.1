Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B7B7F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 02:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASKpeGnj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702089588; x=1733625588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4DFFZMBp+ZPcplqSQoIADxsKbC+G8aveCf9BOlMo7Dk=;
  b=ASKpeGnjh1Nf9o/Pe/VhhCU/qMmXWxExwLoX+VapZRzIjp+dyjMul1pU
   Jrw2npaGog5YkwHG0f6QTq9KyOHz6OC5elFh41iCPljdIyCHmz2b9Vr4S
   n9gHSFwPmLwkGulxTvynNVnp9+IZ/QTaFzJu+160GYEw2w6npJv+VOr2l
   he7gkIdmL1T0rvj2FXkMzK7e01kbuB5QO7z7eqKIO41aK5OjZqHOl4Kla
   IPJEfyVqvSe7IqOQhQQEqrd2qBhovxK2+31C7PCHpsMzak7/GQ2l3omd7
   i0rV0+Wn9Dd4xCm9S+wnKvtKcYbd4Nmq0op0PMiifzUtRTtKW8iOVc1DE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="374000898"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="374000898"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 18:39:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="945606813"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="945606813"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 08 Dec 2023 18:39:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBnFn-000EiP-1Q;
	Sat, 09 Dec 2023 02:39:43 +0000
Date: Sat, 9 Dec 2023 10:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] cdx: Enable COMPILE_TEST
Message-ID: <202312091016.deeonCay-lkp@intel.com>
References: <20231207163128.2707993-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207163128.2707993-1-robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc4 next-20231208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring/cdx-Explicitly-include-correct-DT-includes-again/20231208-003335
base:   linus/master
patch link:    https://lore.kernel.org/r/20231207163128.2707993-1-robh%40kernel.org
patch subject: [PATCH 1/2] cdx: Enable COMPILE_TEST
config: m68k-kismet-CONFIG_REMOTEPROC-CONFIG_CDX_CONTROLLER-0-0 (https://download.01.org/0day-ci/archive/20231209/202312091016.deeonCay-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312091016.deeonCay-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091016.deeonCay-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for REMOTEPROC when selected by CDX_CONTROLLER
   
   WARNING: unmet direct dependencies detected for REMOTEPROC
     Depends on [n]: HAS_DMA [=n]
     Selected by [y]:
     - CDX_CONTROLLER [=y] && CDX_BUS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
