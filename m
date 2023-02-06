Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C753C2C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 11:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675684559; x=1707220559;
  h=date:from:cc:subject:message-id:mime-version;
  bh=PZyJvQ9+AVuVx7FsCLnVNtt3nRkIw/5S6wFRUkRy+H8=;
  b=JCC54lHXzNQQ9+vAIaljH1nlVSMe2WkjuuHCiyenhPS+4DuzKOc3B15A
   5/Enj76wOI88TC1iYFCDvV/nLEsWmMgwNwHDfoDknK4/qclWPKJVO1RkX
   Q5MqrS6THjfqyJAm4OAyJU/BIPWk+vdI4zsY2UCkNvN+EZ3F2njVUlZA9
   riHP/uUHCIz99RCUx28Bz/m6vvDrGAQpi2+uAfwSwcvigrGEU9rXYuwS5
   ss2MBN9v1krpETgz87ZEAuLMBksFUCovi3PItqnkjAaK5SvPF+hmGk/aK
   QsToJj1BkUi4XAIlNjUCvYZHWGFpq9uv2CIBSQ+VqJFzD8wfleSuhqTpJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="308830726"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="308830726"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 03:55:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="696852400"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="696852400"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Feb 2023 03:55:56 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP06F-0002Wh-06;
	Mon, 06 Feb 2023 11:55:55 +0000
Date: Mon, 6 Feb 2023 19:55:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 1/25]
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c:4161:38: warning:
 format '%lu' expects argument of type 'long unsigned int', but argument 3
 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202302061950.yLfakIRr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   be535132af28d98d8382ffa03d11c8acd7b5da30
commit: 924fb3ec50f5156d21e4f484358fb36f75b91ca8 [1/25] Merge 6.2-rc7 into usb-next
config: i386-randconfig-a015-20230206 (https://download.01.org/0day-ci/archive/20230206/202302061950.yLfakIRr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=924fb3ec50f5156d21e4f484358fb36f75b91ca8
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout 924fb3ec50f5156d21e4f484358fb36f75b91ca8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/intel_execlists_submission.c: In function 'intel_execlists_dump_active_requests':
>> drivers/gpu/drm/i915/gt/intel_execlists_submission.c:4161:38: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    4161 |         drm_printf(m, "\tOn hold?: %lu\n",
         |                                    ~~^
         |                                      |
         |                                      long unsigned int
         |                                    %u
    4162 |                    list_count_nodes(&engine->sched_engine->hold));
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                    |
         |                    size_t {aka unsigned int}


vim +4161 drivers/gpu/drm/i915/gt/intel_execlists_submission.c

0212bdef5a4de34 drivers/gpu/drm/i915/intel_lrc.c                     Chris Wilson       2019-01-15  4150  
5bc4b43d5c6c969 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4151  void intel_execlists_dump_active_requests(struct intel_engine_cs *engine,
5bc4b43d5c6c969 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4152  					  struct i915_request *hung_rq,
5bc4b43d5c6c969 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4153  					  struct drm_printer *m)
5bc4b43d5c6c969 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4154  {
5bc4b43d5c6c969 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4155  	unsigned long flags;
5bc4b43d5c6c969 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4156  
5bc4b43d5c6c969 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4157  	spin_lock_irqsave(&engine->sched_engine->lock, flags);
5bc4b43d5c6c969 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4158  
5bc4b43d5c6c969 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4159  	intel_engine_dump_active_requests(&engine->sched_engine->requests, hung_rq, m);
5bc4b43d5c6c969 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4160  
5bc4b43d5c6c969 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26 @4161  	drm_printf(m, "\tOn hold?: %lu\n",
924fb3ec50f5156 drivers/gpu/drm/i915/gt/intel_execlists_submission.c Greg Kroah-Hartman 2023-02-06  4162  		   list_count_nodes(&engine->sched_engine->hold));
5bc4b43d5c6c969 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4163  
5bc4b43d5c6c969 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4164  	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
5bc4b43d5c6c969 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4165  }
5bc4b43d5c6c969 drivers/gpu/drm/i915/gt/intel_execlists_submission.c John Harrison      2023-01-26  4166  

:::::: The code at line 4161 was first introduced by commit
:::::: 5bc4b43d5c6c9692ddc7b96116650cdf9406f3da drm/i915: Fix up locking around dumping requests lists

:::::: TO: John Harrison <John.C.Harrison@Intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
