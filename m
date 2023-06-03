Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30435EA0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 06:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685774308; x=1717310308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n++bioKmaR5f+rXXN73UPEhbqgbqm9htWdFWdI6DvHg=;
  b=M1Mr5XsCszrlGm/bCE2GjSzxFJoe7KuLfnB6X4HK1fOfmuMML+JNAOcY
   1pnyTmHTivsdyhbsKFcUTDVNVINzdr8RreDqyXHbR727V1n6FO6/UikNO
   5obDY/Kghr53Nl6PR60emYMZ6qQeychgW53/xTRhehSEKxmjpHapFcquk
   Esg26RFZkhXl+yaB4RrubSl0BvXN6idK5q891fnbkC2AW45jlFrmePdU/
   /6b9O9JaqfldrHV8XApJRI8Iy5LQmgnqo/tir6Ipc/0zxwdcIh36+BDr1
   93tCg4d5lQvZ7ZQcIwokG90kzIwM9SUk91wZKjG1FlN1W0dHZH8dFIhWs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="356055832"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="356055832"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 23:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="882310743"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="882310743"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Jun 2023 23:38:23 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5Ku6-0001O1-1M;
	Sat, 03 Jun 2023 06:38:22 +0000
Date: Sat, 3 Jun 2023 14:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
	song@kernel.org, yhs@fb.com, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com,
	jolsa@kernel.org, quentin@isovalent.com
Cc: oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: Re: [PATCH bpf-next 1/6] bpf: Support ->fill_link_info for
 kprobe_multi
Message-ID: <202306031438.0X2HPFQl-lkp@intel.com>
References: <20230602085239.91138-2-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602085239.91138-2-laoar.shao@gmail.com>

Hi Yafang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/bpf-Support-fill_link_info-for-kprobe_multi/20230602-165455
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230602085239.91138-2-laoar.shao%40gmail.com
patch subject: [PATCH bpf-next 1/6] bpf: Support ->fill_link_info for kprobe_multi
config: i386-randconfig-s002-20230601 (https://download.01.org/0day-ci/archive/20230603/202306031438.0X2HPFQl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/270f3eb6c142f1f0ec7d800b8ecaab1b101682a0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yafang-Shao/bpf-Support-fill_link_info-for-kprobe_multi/20230602-165455
        git checkout 270f3eb6c142f1f0ec7d800b8ecaab1b101682a0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306031438.0X2HPFQl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/bpf_trace.c:2554:24: sparse: sparse: cast removes address space '__user' of expression
>> kernel/trace/bpf_trace.c:2571:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned long long [usertype] *uaddrs @@
   kernel/trace/bpf_trace.c:2571:26: sparse:     expected void [noderef] __user *to
   kernel/trace/bpf_trace.c:2571:26: sparse:     got unsigned long long [usertype] *uaddrs
   kernel/trace/bpf_trace.c:2492:21: sparse: sparse: dereference of noderef expression
   kernel/trace/bpf_trace.c:2496:66: sparse: sparse: dereference of noderef expression

vim +/__user +2554 kernel/trace/bpf_trace.c

  2550	
  2551	static int bpf_kprobe_multi_link_fill_link_info(const struct bpf_link *link,
  2552							struct bpf_link_info *info)
  2553	{
> 2554		u64 *uaddrs = (u64 *)u64_to_user_ptr(info->kprobe_multi.addrs);
  2555		struct bpf_kprobe_multi_link *kmulti_link;
  2556		u32 ucount = info->kprobe_multi.count;
  2557	
  2558		if (!uaddrs ^ !ucount)
  2559			return -EINVAL;
  2560	
  2561		kmulti_link = container_of(link, struct bpf_kprobe_multi_link, link);
  2562		if (!uaddrs) {
  2563			info->kprobe_multi.count = kmulti_link->cnt;
  2564			return 0;
  2565		}
  2566	
  2567		if (!ucount)
  2568			return 0;
  2569		if (ucount != kmulti_link->cnt)
  2570			return -EINVAL;
> 2571		if (copy_to_user(uaddrs, kmulti_link->addrs, ucount * sizeof(u64)))
  2572			return -EFAULT;
  2573		return 0;
  2574	}
  2575	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
