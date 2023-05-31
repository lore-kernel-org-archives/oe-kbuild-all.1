Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50F314294
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 16:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685551598; x=1717087598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S7ccSR/H+xAbzBgPH3RTweUwUU/MzIY0d2tD4VLFzRY=;
  b=c8uOgdc569V6OnC1UgnOQLZeTBFExzVm9aRFyFEQ82jjvJdoJz3FcCN7
   /t5iEOls1AhtMrHK6NB4ud4LEKmXwdYTY65mUN+qtNPF2PCk8+23s5s6w
   BfU0G/CyKdOH3j6FXjY64ZtFqXVK4ZZ/1nUthniQZDL+OhXELj4dtWXAp
   F7prCzbssuiQPZa2ZA37C16YeMvYYNBmGrft/XyhkeTkomeCt9J5UIDVo
   Vlaye/brKNbNreGIDiRhEslC7o6pAPxxGgIAuotNiOLWwbIUsf+hLUti/
   yHINo1LDEuvMlnK46QqjErhDTzt8/hagWbl3J+YzZw+QRpeS7dRacBtzb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="354138629"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="354138629"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 09:46:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="796775222"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="796775222"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 May 2023 09:46:34 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4Oy1-0001Ut-1R;
	Wed, 31 May 2023 16:46:33 +0000
Date: Thu, 1 Jun 2023 00:45:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bongkyu Kim <bongkyu7.kim@samsung.com>, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, longman@redhat.com,
	boqun.feng@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	jwook1.kim@samsung.com, lakkyung.jung@samsung.com,
	Bongkyu Kim <bongkyu7.kim@samsung.com>
Subject: Re: [PATCH] locking/rwsem: Optionally re-enable reader optimistic
 spinning
Message-ID: <202306010043.VJHcuCnb-lkp@intel.com>
References: <20230531003436.7082-1-bongkyu7.kim@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531003436.7082-1-bongkyu7.kim@samsung.com>

Hi Bongkyu,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/locking/core]
[also build test ERROR on linus/master v6.4-rc4 next-20230531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bongkyu-Kim/locking-rwsem-Optionally-re-enable-reader-optimistic-spinning/20230531-083658
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20230531003436.7082-1-bongkyu7.kim%40samsung.com
patch subject: [PATCH] locking/rwsem: Optionally re-enable reader optimistic spinning
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230601/202306010043.VJHcuCnb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8c4098eb89be5b82aded3d17b22f78013454d058
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bongkyu-Kim/locking-rwsem-Optionally-re-enable-reader-optimistic-spinning/20230531-083658
        git checkout 8c4098eb89be5b82aded3d17b22f78013454d058
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash kernel/locking/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306010043.VJHcuCnb-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/locking/rwsem.c:1097:20: error: function declaration isn't a prototype [-Werror=strict-prototypes]
    1097 | static inline bool rwsem_no_spinners(sem)
         |                    ^~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c: In function 'rwsem_no_spinners':
>> kernel/locking/rwsem.c:1097:20: warning: old-style function definition [-Wold-style-definition]
>> kernel/locking/rwsem.c:1097:20: error: type of 'sem' defaults to 'int' [-Werror=implicit-int]
   cc1: some warnings being treated as errors


vim +1097 kernel/locking/rwsem.c

  1096	
> 1097	static inline bool rwsem_no_spinners(sem)
  1098	{
  1099		return false;
  1100	}
  1101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
