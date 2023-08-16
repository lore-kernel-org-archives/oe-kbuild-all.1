Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9C6125D2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 15:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692198144; x=1723734144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YHr8qotILcwaWrSBPNLEZRePCvsFg0279hOp41I7C38=;
  b=cjQ/wYfpVe1n+y02qp15up0QFDIMPiwJjMkrb1gjnB+IunOxZbEqLFNA
   knUW0MxvUoaI/fFKm8s59AZp+MPxj5C0h5xgbuDrhFDQgW3m88ZU3ZiYZ
   vAz8H17dNsMMw12aWtLCsI0wtLGjYWWkuDWCS1HfT8a3/vDQq7SQm5VFj
   0gTgs4L/3234rwKlMN3Xr9JkVGFRebJIHUqrQDDvZ1kiO2UtQ1mo9RQPF
   UF/1CZ25mICgLBAm6lfZLWfV5z8HLgZe6xvR4iEc1CEzFYDAOiEnxMiTL
   e5T/YkSnzhE8V6PvOiexvWH0/MLuSYh+QZywT3TDtiolfYrj0mP8qlSRw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403531586"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="403531586"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 08:02:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="980763509"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="980763509"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 16 Aug 2023 08:02:20 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWI2K-0000Nu-0J;
	Wed, 16 Aug 2023 15:02:17 +0000
Date: Wed, 16 Aug 2023 23:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: kernel/bpf/helpers.c:1757:7: warning: no previous declaration for
 'bpf_obj_new_impl'
Message-ID: <202308162255.nWBAw9u6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
commit: 958cf2e273f0929c66169e0788031310e8118722 bpf: Introduce bpf_obj_new
date:   9 months ago
config: x86_64-randconfig-x012-20230816 (https://download.01.org/0day-ci/archive/20230816/202308162255.nWBAw9u6-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308162255.nWBAw9u6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308162255.nWBAw9u6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/helpers.c:1757:7: warning: no previous declaration for 'bpf_obj_new_impl' [-Wmissing-declarations]
    void *bpf_obj_new_impl(u64 local_type_id__k, void *meta__ign)
          ^~~~~~~~~~~~~~~~


vim +/bpf_obj_new_impl +1757 kernel/bpf/helpers.c

  1752	
  1753	__diag_push();
  1754	__diag_ignore_all("-Wmissing-prototypes",
  1755			  "Global functions as their definitions will be in vmlinux BTF");
  1756	
> 1757	void *bpf_obj_new_impl(u64 local_type_id__k, void *meta__ign)
  1758	{
  1759		struct btf_struct_meta *meta = meta__ign;
  1760		u64 size = local_type_id__k;
  1761		void *p;
  1762	
  1763		if (unlikely(!bpf_global_ma_set))
  1764			return NULL;
  1765		p = bpf_mem_alloc(&bpf_global_ma, size);
  1766		if (!p)
  1767			return NULL;
  1768		if (meta)
  1769			bpf_obj_init(meta->field_offs, p);
  1770		return p;
  1771	}
  1772	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
