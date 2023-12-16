Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8D110F1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 00:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOhvKEvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702687482; x=1734223482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sMqiUaqIt83I++89ssQD4uYGMUo6CBbU9ub2+R+axio=;
  b=IOhvKEvfNlhYRAuipt/Q45MvAO7f27wcjKGbBB14y64cs9zxhW+lFphL
   wbVhPZuWfHS7viOy49bOux8c45vkqBC367g+8NXM3hTnScmUzt5ZlM2W5
   0Lzrx9mkNZh53h2QYcSmW7HwoFbva4EFfr6TFV5SoRdQZBh+o2W0cru29
   cYhdEXg+ar6rIWyIrfzyOBRaXkgx/24J07Zq1pZgK17wMjMmZMmIGHvyr
   PfUmTDgYEvr1x980V0XDvSEqSOpdJe3dYlGs9uANkUHiy44iU7T9kNkwm
   olbzrvpbD524smyPvjU+z9hYDfOIKUB/TOadv1TPusRuZ+6QMqrkh2boy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="16902490"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="16902490"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 16:44:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="845292822"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="845292822"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Dec 2023 16:44:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEInF-0000xc-0H;
	Sat, 16 Dec 2023 00:44:37 +0000
Date: Sat, 16 Dec 2023 08:44:15 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/4] drm/ttm: improve idle/busy handling
Message-ID: <202312160809.nvmiBwrJ-lkp@intel.com>
References: <20231213144222.1871-3-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213144222.1871-3-christian.koenig@amd.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc5 next-20231215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-ttm-replace-busy-placement-with-flags-v3/20231213-224456
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231213144222.1871-3-christian.koenig%40amd.com
patch subject: [PATCH 3/4] drm/ttm: improve idle/busy handling
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231216/202312160809.nvmiBwrJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312160809.nvmiBwrJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312160809.nvmiBwrJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kernel-doc: drivers/gpu/drm/ttm/ttm_resource.c:301: warning: Function parameter or struct member 'busy' not described in 'ttm_resource_compatible'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
