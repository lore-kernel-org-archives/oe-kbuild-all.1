Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6049C17D8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Dec 2023 01:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9nJ29nb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701482012; x=1733018012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/EWI4W0lem8ZxHvDowSWZ8Ss/9HSn96HIQ9608YObB4=;
  b=O9nJ29nbyTmfThbJMcsSm8JAu2INf8d3hzMTP59SVoUcxoJabMR/2T8s
   Gc9exDtr9sdJPVFyptvZr+qg2Ha3lqff4/OCeSEpki9i22uiGj6OGXAyE
   6tkGN3XKGjsaIcuBXUKqlCERMrB/aXadX32BMokoH96GBCqTgEyCcBopw
   VN26/yPvevjByxqbQcPcCtaTfwRljq3SQYnkeseraZzGj5GRXG9yaeJhu
   QopqfxD8p79hwg6otNetxpWu278IxKEQiweKFO/ckKs8jSC+KHx8duZ1+
   h5dJeL1YnX6z/QdJuQ7vtLjucQCCDELLbynCjXhBOokh5kl2MVQE9XtNI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="591370"
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; 
   d="scan'208";a="591370"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 17:53:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="773616518"
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; 
   d="scan'208";a="773616518"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 01 Dec 2023 17:53:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9FC9-0004X6-0X;
	Sat, 02 Dec 2023 01:53:25 +0000
Date: Sat, 2 Dec 2023 09:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Marchevsky <davemarchevsky@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: kernel/bpf/helpers.c:1960:13: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202312020920.S1lRh7FH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: c3c510ce431cd99fa10dcd50d995c8e89330ee5b bpf: Add 'owner' field to bpf_{list,rb}_node
date:   5 months ago
config: hexagon-randconfig-r121-20231119 (https://download.01.org/0day-ci/archive/20231202/202312020920.S1lRh7FH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312020920.S1lRh7FH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312020920.S1lRh7FH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/helpers.c:1960:13: sparse: sparse: Using plain integer as NULL pointer
   kernel/bpf/helpers.c:2059:13: sparse: sparse: Using plain integer as NULL pointer
   kernel/bpf/helpers.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   kernel/bpf/helpers.c:2419:18: sparse: sparse: context imbalance in 'bpf_rcu_read_lock' - wrong count at exit
   kernel/bpf/helpers.c:2424:18: sparse: sparse: context imbalance in 'bpf_rcu_read_unlock' - unexpected unlock

vim +1960 kernel/bpf/helpers.c

  1944	
  1945	static int __bpf_list_add(struct bpf_list_node_kern *node,
  1946				  struct bpf_list_head *head,
  1947				  bool tail, struct btf_record *rec, u64 off)
  1948	{
  1949		struct list_head *n = &node->list_head, *h = (void *)head;
  1950	
  1951		/* If list_head was 0-initialized by map, bpf_obj_init_field wasn't
  1952		 * called on its fields, so init here
  1953		 */
  1954		if (unlikely(!h->next))
  1955			INIT_LIST_HEAD(h);
  1956	
  1957		/* node->owner != NULL implies !list_empty(n), no need to separately
  1958		 * check the latter
  1959		 */
> 1960		if (cmpxchg(&node->owner, NULL, BPF_PTR_POISON)) {
  1961			/* Only called from BPF prog, no need to migrate_disable */
  1962			__bpf_obj_drop_impl((void *)n - off, rec);
  1963			return -EINVAL;
  1964		}
  1965	
  1966		tail ? list_add_tail(n, h) : list_add(n, h);
  1967		WRITE_ONCE(node->owner, head);
  1968	
  1969		return 0;
  1970	}
  1971	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
