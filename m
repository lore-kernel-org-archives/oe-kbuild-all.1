Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FD87B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 00:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680826885; x=1712362885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mwos41muGQD3casmY4hYWsGcbwh+xd1exdR/RZigjn0=;
  b=DbR6iyTsympz6KV3wzSbm2svE+h8zQkRivsNrJBbfl3YTT7eoPtuCozx
   mRrQLxEioCyHVYt+pbYgymEluB0fM6tOROyme5iwAxvuN76WGleQu22w+
   apGXk/Wj7EvQdK944Ule9L1EFqMMc2HtpViWeUznUt3pJvl+sG1/QV3h/
   nQZvUcHyfUjCpTrGXmCfR26SIQRtqCfojdcgstTsy1xGFrV6rGtK5Ge8F
   HZIzuu5/bjZ2xKnlBiptiaE6oP/r54xpSgHEhcDm009mEsDhaKTfC8rQn
   b2mAKQnro9vay0SqzwhvYTSwpyTE0rRrRNqd6MqeoDid768o+CL4dcZtE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344645549"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="344645549"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 17:21:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="689880904"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="689880904"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Apr 2023 17:21:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkZqw-000Rva-0t;
	Fri, 07 Apr 2023 00:21:18 +0000
Date: Fri, 7 Apr 2023 08:21:10 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/2] drm: Add fdinfo memory stats
Message-ID: <202304070855.Cl06hUYU-lkp@intel.com>
References: <20230406215917.1475704-2-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406215917.1475704-2-robdclark@gmail.com>

Hi Rob,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/drm-Add-fdinfo-memory-stats/20230407-060118
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230406215917.1475704-2-robdclark%40gmail.com
patch subject: [RFC 1/2] drm: Add fdinfo memory stats
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230407/202304070855.Cl06hUYU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/eebbb3ec0a196240e1084554563ac4ae7e85dbb3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Clark/drm-Add-fdinfo-memory-stats/20230407-060118
        git checkout eebbb3ec0a196240e1084554563ac4ae7e85dbb3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070855.Cl06hUYU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_file.c: In function 'print_size':
>> drivers/gpu/drm/drm_file.c:883:31: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     883 |         drm_printf(p, "%s:\t%lu %s\n", stat, sz, units[u]);
         |                             ~~^              ~~
         |                               |              |
         |                               |              size_t {aka unsigned int}
         |                               long unsigned int
         |                             %u


vim +883 drivers/gpu/drm/drm_file.c

   871	
   872	static void print_size(struct drm_printer *p, const char *stat, size_t sz)
   873	{
   874		const char *units[] = {"B", "KiB", "MiB", "GiB"};
   875		unsigned u;
   876	
   877		for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
   878			if (sz < SZ_1K)
   879				break;
   880			sz /= SZ_1K;
   881		}
   882	
 > 883		drm_printf(p, "%s:\t%lu %s\n", stat, sz, units[u]);
   884	}
   885	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
