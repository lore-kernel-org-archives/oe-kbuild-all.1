Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17918F5D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 11:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693480250; x=1725016250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O3UskZztiSHiG62oxbXUlE5RV3C35EYtv8AyacANeBw=;
  b=cO/9g0fOdnHqeqpQnUd9JRW3lhgCRpnXJ34ito9kE7txY0yF7PP7xg98
   nV8KTZzmLl6TJMXgMkKE89/F9KAMngQLeppIFOIhevosU8F4cInwpbOv9
   mCj+verCrqiBr/3LJNPJowLHzmWK0Mqu8fKxz3F/9VGKikZdIz3mCl92E
   bjYl4GrLae0N8t2CeBuFoOA9B5VEwqOeBeT6UaqBh8UrwIAAOFN7FzSWo
   iQDKjSkm75r3x6EYJSwbwsIzLPeocy92gb/i40tk6HfcrLPxjx5bF4AVB
   6dV7ai8mdcnx7JIlqP+nMD87jY+sf3tOstE24m4Y8RnWQApOCBDF5x8gY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="366099748"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="366099748"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 04:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="854136946"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="854136946"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 Aug 2023 04:10:46 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbfZU-00004N-0A;
	Thu, 31 Aug 2023 11:10:44 +0000
Date: Thu, 31 Aug 2023 19:10:07 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next] bpf, sockmap: Rename sock_map_get_from_fd to
 sock_map_prog_attach
Message-ID: <202308311959.Snzn4Unt-lkp@intel.com>
References: <20230831014346.2931397-1-xukuohai@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831014346.2931397-1-xukuohai@huaweicloud.com>

Hi Xu,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Kuohai/bpf-sockmap-Rename-sock_map_get_from_fd-to-sock_map_prog_attach/20230831-094551
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230831014346.2931397-1-xukuohai%40huaweicloud.com
patch subject: [PATCH bpf-next] bpf, sockmap: Rename sock_map_get_from_fd to sock_map_prog_attach
config: parisc-randconfig-r012-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311959.Snzn4Unt-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311959.Snzn4Unt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311959.Snzn4Unt-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/syscall.c: In function 'bpf_prog_attach':
>> kernel/bpf/syscall.c:3825:23: error: implicit declaration of function 'sock_map_prog_attach'; did you mean 'sock_map_prog_detach'? [-Werror=implicit-function-declaration]
    3825 |                 ret = sock_map_prog_attach(attr, prog);
         |                       ^~~~~~~~~~~~~~~~~~~~
         |                       sock_map_prog_detach
   cc1: some warnings being treated as errors


vim +3825 kernel/bpf/syscall.c

  3782	
  3783	#define BPF_F_ATTACH_MASK_BASE	\
  3784		(BPF_F_ALLOW_OVERRIDE |	\
  3785		 BPF_F_ALLOW_MULTI |	\
  3786		 BPF_F_REPLACE)
  3787	
  3788	#define BPF_F_ATTACH_MASK_MPROG	\
  3789		(BPF_F_REPLACE |	\
  3790		 BPF_F_BEFORE |		\
  3791		 BPF_F_AFTER |		\
  3792		 BPF_F_ID |		\
  3793		 BPF_F_LINK)
  3794	
  3795	static int bpf_prog_attach(const union bpf_attr *attr)
  3796	{
  3797		enum bpf_prog_type ptype;
  3798		struct bpf_prog *prog;
  3799		u32 mask;
  3800		int ret;
  3801	
  3802		if (CHECK_ATTR(BPF_PROG_ATTACH))
  3803			return -EINVAL;
  3804	
  3805		ptype = attach_type_to_prog_type(attr->attach_type);
  3806		if (ptype == BPF_PROG_TYPE_UNSPEC)
  3807			return -EINVAL;
  3808		mask = bpf_mprog_supported(ptype) ?
  3809		       BPF_F_ATTACH_MASK_MPROG : BPF_F_ATTACH_MASK_BASE;
  3810		if (attr->attach_flags & ~mask)
  3811			return -EINVAL;
  3812	
  3813		prog = bpf_prog_get_type(attr->attach_bpf_fd, ptype);
  3814		if (IS_ERR(prog))
  3815			return PTR_ERR(prog);
  3816	
  3817		if (bpf_prog_attach_check_attach_type(prog, attr->attach_type)) {
  3818			bpf_prog_put(prog);
  3819			return -EINVAL;
  3820		}
  3821	
  3822		switch (ptype) {
  3823		case BPF_PROG_TYPE_SK_SKB:
  3824		case BPF_PROG_TYPE_SK_MSG:
> 3825			ret = sock_map_prog_attach(attr, prog);
  3826			break;
  3827		case BPF_PROG_TYPE_LIRC_MODE2:
  3828			ret = lirc_prog_attach(attr, prog);
  3829			break;
  3830		case BPF_PROG_TYPE_FLOW_DISSECTOR:
  3831			ret = netns_bpf_prog_attach(attr, prog);
  3832			break;
  3833		case BPF_PROG_TYPE_CGROUP_DEVICE:
  3834		case BPF_PROG_TYPE_CGROUP_SKB:
  3835		case BPF_PROG_TYPE_CGROUP_SOCK:
  3836		case BPF_PROG_TYPE_CGROUP_SOCK_ADDR:
  3837		case BPF_PROG_TYPE_CGROUP_SOCKOPT:
  3838		case BPF_PROG_TYPE_CGROUP_SYSCTL:
  3839		case BPF_PROG_TYPE_SOCK_OPS:
  3840		case BPF_PROG_TYPE_LSM:
  3841			if (ptype == BPF_PROG_TYPE_LSM &&
  3842			    prog->expected_attach_type != BPF_LSM_CGROUP)
  3843				ret = -EINVAL;
  3844			else
  3845				ret = cgroup_bpf_prog_attach(attr, ptype, prog);
  3846			break;
  3847		case BPF_PROG_TYPE_SCHED_CLS:
  3848			ret = tcx_prog_attach(attr, prog);
  3849			break;
  3850		default:
  3851			ret = -EINVAL;
  3852		}
  3853	
  3854		if (ret)
  3855			bpf_prog_put(prog);
  3856		return ret;
  3857	}
  3858	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
