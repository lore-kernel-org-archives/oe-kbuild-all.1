Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28293CCE7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 19:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695237547; x=1726773547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ptOzKmxjX00QqCWEZ2eL2CmdL3ePWiDm7tAxri9nrbE=;
  b=fl3S+pxy1PWApwQ9II92ZQ7Y9LcRmt6RVmbP2tEoCdmxV12X/ki6ela0
   YZNHMYiEV5Ix5ch+8n41i89rW4l/GTU2pfHaDSwUmWVQbDWQWNvNX7GZX
   dIDGwGveu+xQmBWqe7pyZs79rcimVnb97iYPWqsANsvhGVAJJsE89aCbI
   dXfwL8IqqSNowLtkc1EUUZlLlKwDlSKwBW2HMM4tryp3AMJlXCMb/AReo
   qE0THqwH9Xb0mKeXiwqdWq6j4rUgn2MoX0lslMM/BGy+mpZ7oVsNALs+F
   t/gEu4Jwtqil/jNcKFWzcAmFEKSBwqkk3W75vhpEcmEuqYwytT7ZwSzfL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="444412424"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="444412424"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 12:19:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="890059150"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="890059150"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2023 12:18:16 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj2j1-00093b-2N;
	Wed, 20 Sep 2023 19:19:03 +0000
Date: Thu, 21 Sep 2023 03:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 31/82]
 samples/hw_breakpoint/data_breakpoint.c:73:9: error: implicit declaration of
 function '__symbol_put'; did you mean '__symbol_get'?
Message-ID: <202309210348.8leZ8gtz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   bfed096c8fc5881926d6eb51eaafd9f8f75ec384
commit: e876a323e61b3d5ceb9623daecd910fe1d32319b [31/82] samples/hw_breakpoint: Fix kernel BUG 'invalid opcode: 0000'
config: x86_64-buildonly-randconfig-005-20230921 (https://download.01.org/0day-ci/archive/20230921/202309210348.8leZ8gtz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210348.8leZ8gtz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210348.8leZ8gtz-lkp@intel.com/

All errors (new ones prefixed by >>):

   samples/hw_breakpoint/data_breakpoint.c: In function 'hw_break_module_exit':
>> samples/hw_breakpoint/data_breakpoint.c:73:9: error: implicit declaration of function '__symbol_put'; did you mean '__symbol_get'? [-Werror=implicit-function-declaration]
      73 |         __symbol_put(ksym_name);
         |         ^~~~~~~~~~~~
         |         __symbol_get
   cc1: some warnings being treated as errors


vim +73 samples/hw_breakpoint/data_breakpoint.c

    69	
    70	static void __exit hw_break_module_exit(void)
    71	{
    72		unregister_wide_hw_breakpoint(sample_hbp);
  > 73		__symbol_put(ksym_name);
    74		printk(KERN_INFO "HW Breakpoint for %s write uninstalled\n", ksym_name);
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
