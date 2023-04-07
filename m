Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90AE7B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 05:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680846031; x=1712382031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NcE1BZK+4RRyv3/WdR1GLn5dfdb+3FJrIBWKDJknZuY=;
  b=eXeHVohbuwlTqSBPzbZMbifxAe2m0qUOBZGdfoDmD0xwMpLIz7yUfpig
   PXn8U9sOKOFKO8XfGVjXx9dc2SgLr2mBFpfECKC1wv/qengihv8Enk30t
   DHGIxDVi0zswZ4TdwcIUDbN9PH+sbLEf0LcxipgI4KsbFWxOsx5adZkSA
   v0G2fx/YyJ1LFfHDH0vxRq08PpX37LNJ1q3Zul1s1qZTg5mvxXLmTx5gf
   +R39beOmVQa7tOA8c4+scXSYwgWB8KB2RQrvh2JYNpJWhk9HRkMuL+UD5
   NQILHrPTTKEqJj7/E5GfqQ+AgDJMmRYn1T618nVLXPlYaONcY+haI4s9S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="408056320"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="408056320"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 22:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="689959713"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="689959713"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Apr 2023 22:40:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkepp-000SA6-1K;
	Fri, 07 Apr 2023 05:40:29 +0000
Date: Fri, 7 Apr 2023 13:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: "D. Wythe" <alibuda@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 4/5] bpf: add smc negotiator support in BPF
 struct_ops
Message-ID: <202304071344.m3ghV22r-lkp@intel.com>
References: <1680795034-86384-5-git-send-email-alibuda@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1680795034-86384-5-git-send-email-alibuda@linux.alibaba.com>

Hi Wythe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/D-Wythe/net-smc-move-smc_sock-related-structure-definition/20230406-233148
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/1680795034-86384-5-git-send-email-alibuda%40linux.alibaba.com
patch subject: [RFC PATCH bpf-next 4/5] bpf: add smc negotiator support in BPF struct_ops
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230407/202304071344.m3ghV22r-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4b65a6397e28b562750d5c411994667c30002963
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review D-Wythe/net-smc-move-smc_sock-related-structure-definition/20230406-233148
        git checkout 4b65a6397e28b562750d5c411994667c30002963
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304071344.m3ghV22r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/bpf_struct_ops.c:83:22: error: field 'data' has incomplete type
      83 |         struct _name data ____cacheline_aligned_in_smp;         \
         |                      ^~~~
   kernel/bpf/bpf_struct_ops_types.h:14:1: note: in expansion of macro 'BPF_STRUCT_OPS_TYPE'
      14 | BPF_STRUCT_OPS_TYPE(smc_sock_negotiator_ops)
         | ^~~~~~~~~~~~~~~~~~~


vim +/data +83 kernel/bpf/bpf_struct_ops.c

85d33df357b634 Martin KaFai Lau 2020-01-08  72  
85d33df357b634 Martin KaFai Lau 2020-01-08  73  /* bpf_struct_ops_##_name (e.g. bpf_struct_ops_tcp_congestion_ops) is
85d33df357b634 Martin KaFai Lau 2020-01-08  74   * the map's value exposed to the userspace and its btf-type-id is
85d33df357b634 Martin KaFai Lau 2020-01-08  75   * stored at the map->btf_vmlinux_value_type_id.
85d33df357b634 Martin KaFai Lau 2020-01-08  76   *
85d33df357b634 Martin KaFai Lau 2020-01-08  77   */
27ae7997a66174 Martin KaFai Lau 2020-01-08  78  #define BPF_STRUCT_OPS_TYPE(_name)				\
85d33df357b634 Martin KaFai Lau 2020-01-08  79  extern struct bpf_struct_ops bpf_##_name;			\
85d33df357b634 Martin KaFai Lau 2020-01-08  80  								\
85d33df357b634 Martin KaFai Lau 2020-01-08  81  struct bpf_struct_ops_##_name {						\
85d33df357b634 Martin KaFai Lau 2020-01-08  82  	BPF_STRUCT_OPS_COMMON_VALUE;				\
85d33df357b634 Martin KaFai Lau 2020-01-08 @83  	struct _name data ____cacheline_aligned_in_smp;		\
85d33df357b634 Martin KaFai Lau 2020-01-08  84  };
27ae7997a66174 Martin KaFai Lau 2020-01-08  85  #include "bpf_struct_ops_types.h"
27ae7997a66174 Martin KaFai Lau 2020-01-08  86  #undef BPF_STRUCT_OPS_TYPE
27ae7997a66174 Martin KaFai Lau 2020-01-08  87  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
