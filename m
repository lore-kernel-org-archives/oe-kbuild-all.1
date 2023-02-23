Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B14315A9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 12:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677156604; x=1708692604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eASNSwL36ptZ/4xtIdgPWLQrNC65cNYiYtDWNhiD6Og=;
  b=dFKv4g3nj7P4q5j3ca3KYLo6aX8qSzB/NhlJO2B3hFv6HBctLCmgPKJO
   jAE74YYHP8myHsBJgNScB9eT5TejRczc1MB2OHZFyBg3CpXRu8k3LwQXt
   6oiNl5AjQ036rlCceOxJtLRAAJY2kAYDPWj7U2VloFqJ4v8ECUmI7DH1R
   h+Vs6gM2ysUudI1qw5j4yivEdo7l63rx2zua8wEGMOXKgVR4Is4TiU0gf
   5o2HVftdDdV/ZsEZpUBPRqya6C+Wad7JEomzZlq0JyrOlPy7fh578FaJx
   J+RZT9xOhI4g9u+5ZrdttD31oigcEpKfRcYrDn+2Ylb8QI01Z+y4BIEcu
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="335407714"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="335407714"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 04:50:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="741259700"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="741259700"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 23 Feb 2023 04:50:00 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVB2t-0001L7-2c;
	Thu, 23 Feb 2023 12:49:59 +0000
Date: Thu, 23 Feb 2023 20:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>, paul@paul-moore.com,
	linux-security-module@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, jmorris@namei.org, keescook@chromium.org,
	john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
	stephen.smalley.work@gmail.com, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, mic@digikod.net
Subject: Re: [PATCH v6 04/11] LSM: syscalls for current process attributes
Message-ID: <202302232007.dcqfhRnw-lkp@intel.com>
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

I love your patch! Perhaps something to improve:

[auto build test WARNING on tip/perf/core]
[also build test WARNING on acme/perf/core shuah-kselftest/next shuah-kselftest/fixes v6.2]
[cannot apply to linus/master next-20230223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Casey-Schaufler/LSM-Maintain-a-table-of-LSM-attribute-data/20230223-050902
patch link:    https://lore.kernel.org/r/20230222200838.8149-5-casey%40schaufler-ca.com
patch subject: [PATCH v6 04/11] LSM: syscalls for current process attributes
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230223/202302232007.dcqfhRnw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/04ba82c1bd629c2114ad851b4723d6e8b0f9d08f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Casey-Schaufler/LSM-Maintain-a-table-of-LSM-attribute-data/20230223-050902
        git checkout 04ba82c1bd629c2114ad851b4723d6e8b0f9d08f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302232007.dcqfhRnw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/lsm_syscalls.c:61:5: warning: no previous prototype for 'lsm_name_to_attr' [-Wmissing-prototypes]
      61 | u64 lsm_name_to_attr(const char *name)
         |     ^~~~~~~~~~~~~~~~


vim +/lsm_name_to_attr +61 security/lsm_syscalls.c

    51	
    52	/**
    53	 * lsm_name_to_attr - map an LSM attribute name to its ID
    54	 * @name: name of the attribute
    55	 *
    56	 * Look the given @name up in the table of know attribute names.
    57	 *
    58	 * Returns the LSM attribute value associated with @name, or 0 if
    59	 * there is no mapping.
    60	 */
  > 61	u64 lsm_name_to_attr(const char *name)
    62	{
    63		int i;
    64	
    65		for (i = 0; i < ARRAY_SIZE(lsm_attr_names); i++)
    66			if (!strcmp(name, lsm_attr_names[i].name))
    67				return lsm_attr_names[i].attrs;
    68		return 0;
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
