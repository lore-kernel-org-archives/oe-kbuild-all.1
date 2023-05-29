Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDED020EA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 08:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685348386; x=1716884386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GiIE/uGGQFdSa2NJDrGRY+RO7m2JHN27QODpnLXZVFE=;
  b=Npz1EC5lgcUwufJ3VETmZjKJP6sBl7nWcMB9znsBj4A6Kixyiqu2x8U5
   GeS4plHFeFVY/FLz+l+FnE5s0TLoNtdN1cP+SBIuuGn3nFDi+3CsgyHEC
   GM+/P4vWh2day58Hgrht0SIQIqs6KrZphkU6ZLpuAEMt1zi2eufMlyfOi
   4hd0yyqrtY/AgiYdyWODEjDBFDDd1pXUb9I8r5lp2xtqwAIYxBAD5LQIH
   q6+j9fwnlXNZE5xSxSz4A/8lCCqR/k932AssDBbh/u9h4XVu3NX2odrk0
   djSPl/mNTtKIQDtMv2P5kJSZ/Qe9jhCSzp000+G98XyC9Od+x99qEVOZ8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="418134390"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; 
   d="scan'208";a="418134390"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 01:19:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="775849942"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; 
   d="scan'208";a="775849942"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 May 2023 01:19:42 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3Y6P-000KwU-1u;
	Mon, 29 May 2023 08:19:41 +0000
Date: Mon, 29 May 2023 16:19:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org, chao@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, Sheng Yong <shengyong@oppo.com>
Subject: Re: [PATCH] f2fs: add f2fs_ioc_[get|set]_extra_attr
Message-ID: <202305291515.JQ8RLQH1-lkp@intel.com>
References: <20230529013502.2230810-1-shengyong@oppo.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230529013502.2230810-1-shengyong@oppo.com>

Hi Sheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev next-20230525]
[cannot apply to linus/master v6.4-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sheng-Yong/f2fs-add-f2fs_ioc_-get-set-_extra_attr/20230529-093611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230529013502.2230810-1-shengyong%40oppo.com
patch subject: [PATCH] f2fs: add f2fs_ioc_[get|set]_extra_attr
config: x86_64-randconfig-x093-20230529 (https://download.01.org/0day-ci/archive/20230529/202305291515.JQ8RLQH1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/519a8b3bbd4d743ae67c32dfef61e8bfa0951cc5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sheng-Yong/f2fs-add-f2fs_ioc_-get-set-_extra_attr/20230529-093611
        git checkout 519a8b3bbd4d743ae67c32dfef61e8bfa0951cc5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305291515.JQ8RLQH1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "zstd_max_clevel" [fs/f2fs/f2fs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
