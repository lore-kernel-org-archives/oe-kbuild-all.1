Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6BC17EC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 04:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690604710; x=1722140710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IB4UJF8rx5mVASR3m1aVM7KN6xHmDfX5QNIPqFs7+80=;
  b=cfHYY46sd1+k9kbSTfIBJhm72gVkJg0mDYFOZ/TCInL90+d2sLM6NxVA
   yuapzK4vCPQyCY24NlwujtAZ4YjrCJXfkJfLdB2NDOWfjKeNZBRM/+/FR
   gFliAmvI/7AePZwiqJX/QY1976klULT3OYYmZVSvo7/GVI4AAzMnWqoV5
   HZNRZeKoJ8jUNvpT5RoddrrzRHFBuHB2IA+gnJgpIlVDK1EsHwV6uPsxY
   Vm8Gd27c8WHSA6AQkm4bK7nBhaokRcZCzs2gQeLG/7qw1aIFdkZ86dYTW
   7SIDjn75xt7vcOn4zE6khU4FMqatM4CzXJGZ8JPH5s1gEz9TvWb7U2qhP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="353634718"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="353634718"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 21:25:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="721488440"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="721488440"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 28 Jul 2023 21:25:08 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPbVr-0003p9-1a;
	Sat, 29 Jul 2023 04:25:07 +0000
Date: Sat, 29 Jul 2023 12:25:02 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
	Florian Westphal <fw@strlen.de>
Subject: [bpf-next:master 26/30] net/netfilter/nf_bpf_link.c:32:1: warning:
 'get_proto_defrag_hook' defined but not used
Message-ID: <202307291213.fZ0zDmoG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   eb03993a60780589e06e04a4dc23fda62b905ca6
commit: 91721c2d02d3a0141df8a4787c7079b89b0d0607 [26/30] netfilter: bpf: Support BPF_F_NETFILTER_IP_DEFRAG in netfilter link
config: x86_64-randconfig-x012-20230728 (https://download.01.org/0day-ci/archive/20230729/202307291213.fZ0zDmoG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291213.fZ0zDmoG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291213.fZ0zDmoG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nf_bpf_link.c:32:1: warning: 'get_proto_defrag_hook' defined but not used [-Wunused-function]
      32 | get_proto_defrag_hook(struct bpf_nf_link *link,
         | ^~~~~~~~~~~~~~~~~~~~~


vim +/get_proto_defrag_hook +32 net/netfilter/nf_bpf_link.c

    30	
    31	static const struct nf_defrag_hook *
  > 32	get_proto_defrag_hook(struct bpf_nf_link *link,
    33			      const struct nf_defrag_hook __rcu *global_hook,
    34			      const char *mod)
    35	{
    36		const struct nf_defrag_hook *hook;
    37		int err;
    38	
    39		/* RCU protects us from races against module unloading */
    40		rcu_read_lock();
    41		hook = rcu_dereference(global_hook);
    42		if (!hook) {
    43			rcu_read_unlock();
    44			err = request_module(mod);
    45			if (err)
    46				return ERR_PTR(err < 0 ? err : -EINVAL);
    47	
    48			rcu_read_lock();
    49			hook = rcu_dereference(global_hook);
    50		}
    51	
    52		if (hook && try_module_get(hook->owner)) {
    53			/* Once we have a refcnt on the module, we no longer need RCU */
    54			hook = rcu_pointer_handoff(hook);
    55		} else {
    56			WARN_ONCE(!hook, "%s has bad registration", mod);
    57			hook = ERR_PTR(-ENOENT);
    58		}
    59		rcu_read_unlock();
    60	
    61		if (!IS_ERR(hook)) {
    62			err = hook->enable(link->net);
    63			if (err) {
    64				module_put(hook->owner);
    65				hook = ERR_PTR(err);
    66			}
    67		}
    68	
    69		return hook;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
