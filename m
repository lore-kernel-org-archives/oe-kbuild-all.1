Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6914A15B1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 08:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677141178; x=1708677178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0TEY6K3RfV2UZzUTFc+AYlryF+jA5jYmqCHAV1IjsI4=;
  b=BESGvUXpa5MC8yYOoS59Kjxa2xtp5DuyOU6pE/n73YbAu29otRBkUHO9
   F4q31mfIuM9s7wOjUW70/dyyXEqoBbKehSOM6r5FMOq+K491YYgK6mC+x
   iOi7K0El2wyEIO1m7efvSnVvaQq19WovEu1kRXqAflzOLXCtiEloET37q
   5iZmHa05MrARRRCIpxVCswGFyk7PZezooWm7AKzr0YYM61z1Dvq0hdUF8
   yfb6iXrxp+9OGzxNH7cRAr0aVkRrBbNkKK6yWYG4Qx5+arstjVRIO+fsO
   llrTlui4V5PhSH+JBVSiGlUJxeqFXo6UlIfhGuB6q+KNq1StExfvWKhlu
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="316880073"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="316880073"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 00:32:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="796221789"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="796221789"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Feb 2023 00:32:53 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pV724-0001B3-32;
	Thu, 23 Feb 2023 08:32:52 +0000
Date: Thu, 23 Feb 2023 16:32:14 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>, paul@paul-moore.com,
	linux-security-module@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, jmorris@namei.org, keescook@chromium.org,
	john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
	stephen.smalley.work@gmail.com, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, mic@digikod.net
Subject: Re: [PATCH v6 04/11] LSM: syscalls for current process attributes
Message-ID: <202302231639.YHlfovm7-lkp@intel.com>
References: <20230222200838.8149-5-casey@schaufler-ca.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222200838.8149-5-casey@schaufler-ca.com>

Hi Casey,

I love your patch! Yet something to improve:

[auto build test ERROR on tip/perf/core]
[also build test ERROR on acme/perf/core shuah-kselftest/next shuah-kselftest/fixes v6.2]
[cannot apply to linus/master next-20230223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Casey-Schaufler/LSM-Maintain-a-table-of-LSM-attribute-data/20230223-050902
patch link:    https://lore.kernel.org/r/20230222200838.8149-5-casey%40schaufler-ca.com
patch subject: [PATCH v6 04/11] LSM: syscalls for current process attributes
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230223/202302231639.YHlfovm7-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/04ba82c1bd629c2114ad851b4723d6e8b0f9d08f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Casey-Schaufler/LSM-Maintain-a-table-of-LSM-attribute-data/20230223-050902
        git checkout 04ba82c1bd629c2114ad851b4723d6e8b0f9d08f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302231639.YHlfovm7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:89,
                    from arch/powerpc/kernel/syscalls.c:19:
   include/linux/security.h:1356:1: error: expected identifier or '(' before '{' token
    1356 | {
         | ^
   include/linux/security.h:1363:1: error: expected identifier or '(' before '{' token
    1363 | {
         | ^
>> include/linux/security.h:1353:19: error: 'security_getselfattr' declared 'static' but never defined [-Werror=unused-function]
    1353 | static inline int security_getselfattr(u64 __user attr,
         |                   ^~~~~~~~~~~~~~~~~~~~
>> include/linux/security.h:1360:19: error: 'security_setselfattr' declared 'static' but never defined [-Werror=unused-function]
    1360 | static inline int security_setselfattr(u64 __user attr,
         |                   ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +1353 include/linux/security.h

  1352	
> 1353	static inline int security_getselfattr(u64 __user attr,
  1354					       struct lsm_ctx __user *ctx,
  1355					       size_t __user *size);
  1356	{
  1357		return -EINVAL;
  1358	}
  1359	
> 1360	static inline int security_setselfattr(u64 __user attr,
  1361					       struct lsm_ctx __user *ctx,
  1362					       size_t __user size);
  1363	{
  1364		return -EINVAL;
  1365	}
  1366	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
