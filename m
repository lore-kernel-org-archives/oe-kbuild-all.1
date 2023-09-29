Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58895CA41
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 08:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695975951; x=1727511951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PZ8dl45xlwoU5TbK3whHx7n+d8csGN296jVDw7xyuiY=;
  b=OFq0Xku6GoRighsD97a8m3HNc+WzeXuWloEEZgxvI4BIvjHGRQDvvJSn
   gOL8sR82ASH5/sus6YlazmBBYH1RcgrE0FK/K8rNgcDJg8xvgjaUXnJ/m
   Qk3oer+8zfgRJoL8MivJoZZfylYkZb77mWlEcdFGeT02uq3odevlFnMGb
   D7uRDPQi65WZbS/MGUOjowGeilfjF7Vw8bxjkj8Y5t2x59+SxuXh343GQ
   TVGXSQNIarA6vUgg4/jid5lfwNZQkmnlAoAimKClhSHUUEltAIDkQj1Hw
   Abw5i6C9SezQplaIwKiKHCO9W/CnF2IEx7QW7HQEFFIFHLwmWt09yGTu5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="858425"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="858425"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 01:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="726520702"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="726520702"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Sep 2023 01:03:39 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm8TJ-0002bf-04;
	Fri, 29 Sep 2023 08:03:37 +0000
Date: Fri, 29 Sep 2023 16:03:02 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Pagani <marpagan@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] kunit: run test suites only after module
 initialization completes
Message-ID: <202309291509.Hhq09Gce-lkp@intel.com>
References: <20230927154828.122280-1-marpagan@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927154828.122280-1-marpagan@redhat.com>

Hi Marco,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc3 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Pagani/kunit-run-test-suites-only-after-module-initialization-completes/20230927-235155
base:   linus/master
patch link:    https://lore.kernel.org/r/20230927154828.122280-1-marpagan%40redhat.com
patch subject: [RFC PATCH] kunit: run test suites only after module initialization completes
config: csky-randconfig-002-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291509.Hhq09Gce-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291509.Hhq09Gce-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291509.Hhq09Gce-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/kunit/test.c: In function 'kunit_module_notify':
>> lib/kunit/test.c:790:21: error: implicit declaration of function 'module_refcount' [-Werror=implicit-function-declaration]
     790 |                 if (module_refcount(mod) == -1)
         |                     ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/module_refcount +790 lib/kunit/test.c

   779	
   780	static int kunit_module_notify(struct notifier_block *nb, unsigned long val,
   781				       void *data)
   782	{
   783		struct module *mod = data;
   784	
   785		switch (val) {
   786		case MODULE_STATE_LIVE:
   787			kunit_module_init(mod);
   788			break;
   789		case MODULE_STATE_GOING:
 > 790			if (module_refcount(mod) == -1)
   791				kunit_module_exit(mod);
   792			break;
   793		case MODULE_STATE_COMING:
   794		case MODULE_STATE_UNFORMED:
   795			break;
   796		}
   797	
   798		return 0;
   799	}
   800	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
