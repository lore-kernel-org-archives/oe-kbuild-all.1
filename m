Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C817474
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 22:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674252191; x=1705788191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QYXlMgJUIcide3f1cr2KL/BY26jMUjJCH3xokMlYD7E=;
  b=NajzJhxEP6ihwOcVYV4Mlyh5HRGR3nX+8vehMTNYAnshT6khBebl0Nkh
   mQIEVJl0RsO6eke6/LOX27lRXxPh75o1VzHdkGCKc5JG5Vi0TR18G59zZ
   NesJR3NLlIYDcO+r8YQfjr6PHbkFuaj0hNQv5wuQHLUhOKCH6au3djxVh
   Mh0zL6+Qw2G2C5Kf5WVFePwiZAKgTPqv2gJMvXkRdd5svWgyYkkC9gpk7
   AEFJ+QTJFVhN7cj8DTYUNkuZMtO5Xnmt5VVPL4haohqIamojUX4MZEWU4
   wFYWpNbDfbZ8OEWsksZjhTMeV2t/+BViWn7itDOCNxhPUrTG5Z7DfqY5O
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="309280105"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="309280105"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 14:02:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834557430"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="834557430"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Jan 2023 14:02:28 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIzSu-00031M-06;
	Fri, 20 Jan 2023 22:02:28 +0000
Date: Sat, 21 Jan 2023 06:01:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/attach_btfid 1/2] net/bpf/test_func_2.c:8:5:
 warning: no previous prototype for 'bpf_test_func2_globl'
Message-ID: <202301210506.eoJ8o8sU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/attach_btfid
head:   cfc34e8e2edc1d8ab7dde3a065bf708448ee9680
commit: 52454dab859150561a4e93ff6c98a7d9be86679c [1/2] bpf: Add multiple bpf_test_func functions
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230121/202301210506.eoJ8o8sU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=52454dab859150561a4e93ff6c98a7d9be86679c
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/attach_btfid
        git checkout 52454dab859150561a4e93ff6c98a7d9be86679c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/bpf/test_func_2.c:8:5: warning: no previous prototype for 'bpf_test_func2_globl' [-Wmissing-prototypes]
       8 | int bpf_test_func2_globl(int a)
         |     ^~~~~~~~~~~~~~~~~~~~
--
>> net/bpf/test_func_1.c:9:5: warning: no previous prototype for 'bpf_test_func1_globl' [-Wmissing-prototypes]
       9 | int bpf_test_func1_globl(struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~~~~
--
>> net/bpf/test_func_3.c:9:5: warning: no previous prototype for 'bpf_test_func3_globl' [-Wmissing-prototypes]
       9 | int bpf_test_func3_globl(struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/bpf_test_func2_globl +8 net/bpf/test_func_2.c

     7	
   > 8	int bpf_test_func2_globl(int a)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
