Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59849A938
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 20:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677787718; x=1709323718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OYds+K6S0Nr9AHRXN+04gSOPf7wTr7UO1ACYVXpqlB4=;
  b=OBwrnD7ZOfpJqyNH6mKEjocRtw2Gx0fkcxJvt2Bc15LGn0gM13DpeKdm
   fWmCZx87BWEMPNp2NB4BDVvTVu1JWmMy3pPCkPWpBF6rqdMxYKjom0y/f
   oq9gzSD5BY+Yq2KnMqekXkRbo8S/uyYFkVGKypBQMK9AtqMeoy/5jSZ6D
   j86Nwae9z+R43EePk1HkunQ/7QdWqeQS3vhVq+sNJKtuBp3lCNhuGg46a
   KNfv41B7EZg6sb/5eSSR7E3SKX4qU7xJL/HpglqshRmhtYAzld9hEubHr
   YR2NWmsKdi3Coov+Ih5xL6oQUPzlh+VQCoKyAAMe0PTB4NOPtr3TgJTjW
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="362433759"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="362433759"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 12:08:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="920843783"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="920843783"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Mar 2023 12:08:32 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXpE7-0000qo-2G;
	Thu, 02 Mar 2023 20:08:31 +0000
Date: Fri, 3 Mar 2023 04:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 bpf-next 1/3] bpf: add bpf_link support for
 BPF_NETFILTER programs
Message-ID: <202303030452.W2gRyUnd-lkp@intel.com>
References: <20230302172757.9548-2-fw@strlen.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302172757.9548-2-fw@strlen.de>

Hi Florian,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/bpf-add-bpf_link-support-for-BPF_NETFILTER-programs/20230303-013022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230302172757.9548-2-fw%40strlen.de
patch subject: [PATCH RFC v2 bpf-next 1/3] bpf: add bpf_link support for BPF_NETFILTER programs
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230303/202303030452.W2gRyUnd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/dafd9c7dce974be4bf60f89c8427a765acfcba77
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Florian-Westphal/bpf-add-bpf_link-support-for-BPF_NETFILTER-programs/20230303-013022
        git checkout dafd9c7dce974be4bf60f89c8427a765acfcba77
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030452.W2gRyUnd-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/syscall.o: in function `link_create':
>> kernel/bpf/syscall.c:4641: undefined reference to `bpf_nf_link_attach'


vim +4641 kernel/bpf/syscall.c

  4551	
  4552	#define BPF_LINK_CREATE_LAST_FIELD link_create.kprobe_multi.cookies
  4553	static int link_create(union bpf_attr *attr, bpfptr_t uattr)
  4554	{
  4555		enum bpf_prog_type ptype;
  4556		struct bpf_prog *prog;
  4557		int ret;
  4558	
  4559		if (CHECK_ATTR(BPF_LINK_CREATE))
  4560			return -EINVAL;
  4561	
  4562		prog = bpf_prog_get(attr->link_create.prog_fd);
  4563		if (IS_ERR(prog))
  4564			return PTR_ERR(prog);
  4565	
  4566		ret = bpf_prog_attach_check_attach_type(prog,
  4567							attr->link_create.attach_type);
  4568		if (ret)
  4569			goto out;
  4570	
  4571		switch (prog->type) {
  4572		case BPF_PROG_TYPE_EXT:
  4573		case BPF_PROG_TYPE_NETFILTER:
  4574			break;
  4575		case BPF_PROG_TYPE_PERF_EVENT:
  4576		case BPF_PROG_TYPE_TRACEPOINT:
  4577			if (attr->link_create.attach_type != BPF_PERF_EVENT) {
  4578				ret = -EINVAL;
  4579				goto out;
  4580			}
  4581			break;
  4582		case BPF_PROG_TYPE_KPROBE:
  4583			if (attr->link_create.attach_type != BPF_PERF_EVENT &&
  4584			    attr->link_create.attach_type != BPF_TRACE_KPROBE_MULTI) {
  4585				ret = -EINVAL;
  4586				goto out;
  4587			}
  4588			break;
  4589		default:
  4590			ptype = attach_type_to_prog_type(attr->link_create.attach_type);
  4591			if (ptype == BPF_PROG_TYPE_UNSPEC || ptype != prog->type) {
  4592				ret = -EINVAL;
  4593				goto out;
  4594			}
  4595			break;
  4596		}
  4597	
  4598		switch (prog->type) {
  4599		case BPF_PROG_TYPE_CGROUP_SKB:
  4600		case BPF_PROG_TYPE_CGROUP_SOCK:
  4601		case BPF_PROG_TYPE_CGROUP_SOCK_ADDR:
  4602		case BPF_PROG_TYPE_SOCK_OPS:
  4603		case BPF_PROG_TYPE_CGROUP_DEVICE:
  4604		case BPF_PROG_TYPE_CGROUP_SYSCTL:
  4605		case BPF_PROG_TYPE_CGROUP_SOCKOPT:
  4606			ret = cgroup_bpf_link_attach(attr, prog);
  4607			break;
  4608		case BPF_PROG_TYPE_EXT:
  4609			ret = bpf_tracing_prog_attach(prog,
  4610						      attr->link_create.target_fd,
  4611						      attr->link_create.target_btf_id,
  4612						      attr->link_create.tracing.cookie);
  4613			break;
  4614		case BPF_PROG_TYPE_LSM:
  4615		case BPF_PROG_TYPE_TRACING:
  4616			if (attr->link_create.attach_type != prog->expected_attach_type) {
  4617				ret = -EINVAL;
  4618				goto out;
  4619			}
  4620			if (prog->expected_attach_type == BPF_TRACE_RAW_TP)
  4621				ret = bpf_raw_tp_link_attach(prog, NULL);
  4622			else if (prog->expected_attach_type == BPF_TRACE_ITER)
  4623				ret = bpf_iter_link_attach(attr, uattr, prog);
  4624			else if (prog->expected_attach_type == BPF_LSM_CGROUP)
  4625				ret = cgroup_bpf_link_attach(attr, prog);
  4626			else
  4627				ret = bpf_tracing_prog_attach(prog,
  4628							      attr->link_create.target_fd,
  4629							      attr->link_create.target_btf_id,
  4630							      attr->link_create.tracing.cookie);
  4631			break;
  4632		case BPF_PROG_TYPE_FLOW_DISSECTOR:
  4633		case BPF_PROG_TYPE_SK_LOOKUP:
  4634			ret = netns_bpf_link_create(attr, prog);
  4635			break;
  4636	#ifdef CONFIG_NET
  4637		case BPF_PROG_TYPE_XDP:
  4638			ret = bpf_xdp_link_attach(attr, prog);
  4639			break;
  4640		case BPF_PROG_TYPE_NETFILTER:
> 4641			ret = bpf_nf_link_attach(attr, prog);
  4642			break;
  4643	#endif
  4644		case BPF_PROG_TYPE_PERF_EVENT:
  4645		case BPF_PROG_TYPE_TRACEPOINT:
  4646			ret = bpf_perf_link_attach(attr, prog);
  4647			break;
  4648		case BPF_PROG_TYPE_KPROBE:
  4649			if (attr->link_create.attach_type == BPF_PERF_EVENT)
  4650				ret = bpf_perf_link_attach(attr, prog);
  4651			else
  4652				ret = bpf_kprobe_multi_link_attach(attr, prog);
  4653			break;
  4654		default:
  4655			ret = -EINVAL;
  4656		}
  4657	
  4658	out:
  4659		if (ret < 0)
  4660			bpf_prog_put(prog);
  4661		return ret;
  4662	}
  4663	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
