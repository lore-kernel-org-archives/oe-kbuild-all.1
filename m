Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0861315A3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 01:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674091651; x=1705627651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=foB7AV7Vw0g59W11fVGu0cmPH8QA+toGr0siU2QdqNk=;
  b=K3msLWsyJGawoUWCX+YG8sZ8EdJa6szCgj0FXKHnlAMrBS5qlwUHi0Pq
   PvvXRJTnejMgAzA+fPCx5rFakpN06vqZiub1nZGDL/1U12M3LmJVSi8yQ
   YUXezvTXvabclMRUpGFFn2/vLS4xZ9Cny6ymKM02vvQrl+78BzKah2X4W
   DS5jnYMlEoCxUneHuMPv3tnZ4xE4DBwjVj1u6uXUZTgyycMusaeubwpXa
   JSO7Sk+z8Bar3Ay+BF6KwVNRkPF/kr0+b2si5FZ+NxheFotxk9kbrmkZc
   bqUZ6ktnEIPVLpNJ0VpLwtWvqSr056KKMbXHdzcmuJCMtOHvuUCc57VEV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="325207075"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="325207075"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 17:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609883150"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="609883150"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 17:27:30 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIJi8-0000wG-25;
	Thu, 19 Jan 2023 01:27:24 +0000
Date: Thu, 19 Jan 2023 09:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 27/27]
 kernel/bpf/trampoline.c:1256:15: error: implicit declaration of function
 'set_filter_ftrace_direct_multi'; did you mean
 'register_ftrace_direct_multi'?
Message-ID: <202301190924.fHmuncbT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   747784185d106a06b429736196d8817cb2d12a6f
commit: 747784185d106a06b429736196d8817cb2d12a6f [27/27] fix
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230119/202301190924.fHmuncbT-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=747784185d106a06b429736196d8817cb2d12a6f
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/tracing_multi_1
        git checkout 747784185d106a06b429736196d8817cb2d12a6f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/bpf/trampoline.c: In function 'trampoline_multi_reset_bmap':
>> kernel/bpf/trampoline.c:1256:15: error: implicit declaration of function 'set_filter_ftrace_direct_multi'; did you mean 'register_ftrace_direct_multi'? [-Werror=implicit-function-declaration]
    1256 |         err = set_filter_ftrace_direct_multi(tr->fops, ips, tr->multi.bmap->cnt,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               register_ftrace_direct_multi
   cc1: some warnings being treated as errors


vim +1256 kernel/bpf/trampoline.c

  1246	
  1247	static int trampoline_multi_reset_bmap(struct bpf_trampoline *tr)
  1248	{
  1249		unsigned long *ips;
  1250		int err;
  1251	
  1252		err = btf_bitmap_funcs_resolve(tr->multi.bmap, &ips);
  1253		if (err)
  1254			return err;
  1255		mutex_lock(&tr->mutex);
> 1256		err = set_filter_ftrace_direct_multi(tr->fops, ips, tr->multi.bmap->cnt,
  1257						     (unsigned long) tr->cur_image->image);
  1258		mutex_unlock(&tr->mutex);
  1259		kfree(ips);
  1260		return err;
  1261	}
  1262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
