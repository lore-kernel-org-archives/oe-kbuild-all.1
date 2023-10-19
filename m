Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F13929CF3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 15:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHlbTARz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697727821; x=1729263821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0adfqz2QZiIuPLb6UiEgoX9OLjvI4iwTK4nGfP8XBb4=;
  b=BHlbTARzkC8AewYkX/ThJ2847mcH7Z3HGrwE4mOiM2+zFBbBMZvQ2zWn
   fFN3rqyU2UIly2tG9YQDxPuKEcj9tRFkL+tF+MqMu15JSZitPqHZj4Mbt
   g/1Vd0wzRYFtrTtyX6w5Jk3VQD/v1QCbd945JmCk9pYOVQ5i0YZQKOexS
   VGm4fiQ2CrQ7gd/X9W6L5TLv1VMukQzxNP8Tfrvys1D067OOe+MqqSd+x
   y8YlDXgMhNt0NzVQxofWmZ7VE8u8xvwkiTz/hIeRjujm0NuhiZpEM4Mbb
   fXwIs6EY/JD/rMPpQ0+p1oIDVlvPl5mQ334swNSBrrdZwQjhcSaJgxrpR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="390160542"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="390160542"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 08:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="900781568"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="900781568"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2023 08:00:06 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtUXL-0002C3-12;
	Thu, 19 Oct 2023 15:02:11 +0000
Date: Thu, 19 Oct 2023 23:01:27 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Coddington <bcodding@redhat.com>,
	trond.myklebust@hammerspace.com, anna@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] NFSv4: Allow per-mount tuning of READDIR attrs
Message-ID: <202310192243.5P3bLEvI-lkp@intel.com>
References: <fbd3cd01c28e8c132058ae16b22eeae5ddaa8178.1697722160.git.bcodding@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbd3cd01c28e8c132058ae16b22eeae5ddaa8178.1697722160.git.bcodding@redhat.com>

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 401644852d0b2a278811de38081be23f74b5bb04]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Coddington/NFSv4-Always-ask-for-type-with-READDIR/20231019-213911
base:   401644852d0b2a278811de38081be23f74b5bb04
patch link:    https://lore.kernel.org/r/fbd3cd01c28e8c132058ae16b22eeae5ddaa8178.1697722160.git.bcodding%40redhat.com
patch subject: [PATCH v2 2/2] NFSv4: Allow per-mount tuning of READDIR attrs
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310192243.5P3bLEvI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310192243.5P3bLEvI-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#110: FILE: fs/nfs/sysfs.c:281:
+	struct nfs_server *server;
+	server = container_of(kobj, struct nfs_server, kobj);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
