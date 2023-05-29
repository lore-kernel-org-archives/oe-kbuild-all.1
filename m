Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAD862D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 02:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685328335; x=1716864335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nDuK5PbbtO0SQaGCfPW+dDAIjl9/rb82uJP3V0ECB3o=;
  b=c2VfHEActnAKMOlM1H+0d9NCZzaMe9wyWc26O/Dy90HAETMXfkzxi/w2
   iwYFC1WoW8zRu/lkvSSvRj9XhCPIFZjosC/pHtZ3KGbYX3OXL5aGi3GLY
   vNmPVCauCm4mB9xmYo6f2llPREHNPwNZ5xf5TSkSWP4yCIpGX8r5Fnfig
   hhnSiaNu2M+SUzcAwLd8nBFUJwg6WMETCqjw16mJLKs8hufApg1dinUCg
   NaKjodRv/JMNXmP5llMKW22X90tm4mxOyyvUs4oTr8Ex7AWkzkqjmCM7B
   zsQ/cSK6Oo49Wz8tI5HNF87aw5NnzRObje8cbd97ZLvEqd80MvpXvF+0U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="382853044"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; 
   d="scan'208";a="382853044"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 19:45:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="656328279"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; 
   d="scan'208";a="656328279"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 May 2023 19:45:30 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3Ssz-000Krq-1x;
	Mon, 29 May 2023 02:45:29 +0000
Date: Mon, 29 May 2023 10:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 2/8] bpf: Support ->fill_link_info for
 kprobe_multi
Message-ID: <202305291024.nGHfS0BE-lkp@intel.com>
References: <20230528142027.5585-3-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230528142027.5585-3-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/bpf-Support-show_fdinfo-for-kprobe_multi/20230528-222347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230528142027.5585-3-laoar.shao%40gmail.com
patch subject: [RFC PATCH bpf-next 2/8] bpf: Support ->fill_link_info for kprobe_multi
config: x86_64-randconfig-s043-20230528 (https://download.01.org/0day-ci/archive/20230529/202305291024.nGHfS0BE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/025a35eef533c935bbcad95fd50bd973538ef4f7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yafang-Shao/bpf-Support-show_fdinfo-for-kprobe_multi/20230528-222347
        git checkout 025a35eef533c935bbcad95fd50bd973538ef4f7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305291024.nGHfS0BE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/bpf_trace.c:2571:23: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [usertype] *uaddrs @@     got void [noderef] __user * @@
   kernel/trace/bpf_trace.c:2571:23: sparse:     expected unsigned long long [usertype] *uaddrs
   kernel/trace/bpf_trace.c:2571:23: sparse:     got void [noderef] __user *
>> kernel/trace/bpf_trace.c:2591:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned long long [usertype] * @@
   kernel/trace/bpf_trace.c:2591:41: sparse:     expected void [noderef] __user *to
   kernel/trace/bpf_trace.c:2591:41: sparse:     got unsigned long long [usertype] *
   kernel/trace/bpf_trace.c:2492:21: sparse: sparse: dereference of noderef expression
   kernel/trace/bpf_trace.c:2496:66: sparse: sparse: dereference of noderef expression

vim +2571 kernel/trace/bpf_trace.c

  2566	
  2567	static int bpf_kprobe_multi_link_fill_link_info(const struct bpf_link *link,
  2568							struct bpf_link_info *info)
  2569	{
  2570		struct bpf_kprobe_multi_link *kmulti_link;
> 2571		u64 *uaddrs = u64_to_user_ptr(info->kprobe_multi.addrs);
  2572		u32 ucount = info->kprobe_multi.count;
  2573		int i;
  2574	
  2575		if (!uaddrs ^ !ucount)
  2576			return -EINVAL;
  2577	
  2578		kmulti_link = container_of(link, struct bpf_kprobe_multi_link, link);
  2579		if (!uaddrs) {
  2580			info->kprobe_multi.count = kmulti_link->cnt;
  2581			return 0;
  2582		}
  2583	
  2584		if (!ucount)
  2585			return 0;
  2586	
  2587		if (ucount != kmulti_link->cnt)
  2588			return -EINVAL;
  2589	
  2590		for (i = 0; i < ucount; i++)
> 2591			if (copy_to_user(uaddrs + i, kmulti_link->addrs + i,
  2592					 sizeof(u64)))
  2593				return -EFAULT;
  2594		return 0;
  2595	}
  2596	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
