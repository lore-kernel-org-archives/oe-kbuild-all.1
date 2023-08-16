Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBE420E7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 16:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692203766; x=1723739766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/A6G/CFiI3d20jRlVjTUrj2/cF1dSIWa3OOC17yXBy4=;
  b=bGp3Cud1CGeXUkxK1ilCIwE6iHK5C+aT2ReHgIZmFlen2lD3YRxOUfre
   izfVvCKD2tzCSLb0FzKjKLQO8jHcL5C2Uu7FZsOnvi42pnmt/EFeISm2T
   2g+4YLJle4Gxo21Jpskqz/XqCsFrex95kkhMfQbOGitFPeXYsPlei9I5A
   rKAwBpQUi1+EyE+YnlNbj9rBEdOD4GerEcOlqJzZTBIdoRGNtusMwa0Wz
   jfPuQr8HhsyrwwvQpu1v0UtLAniDNOvNilO5/imKhKKNoPrIn+IR/DZfA
   vQycmVawX/gs4jUevFEKEFZ8mgMg63bATqF2MZTvP6uvFwPwvuA18Tu/a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436480199"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="436480199"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 09:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799678271"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="799678271"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Aug 2023 09:36:04 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWJV5-0000RL-2b;
	Wed, 16 Aug 2023 16:36:03 +0000
Date: Thu, 17 Aug 2023 00:35:57 +0800
From: kernel test robot <lkp@intel.com>
To: Anton Protopopov <aspsk@isovalent.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 530/10518] kernel/bpf/map_iter.c:201:17: warning:
 no previous declaration for 'bpf_map_sum_elem_count'
Message-ID: <202308170007.OzhdwITj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef66bf8aeb91fd331cf8f5dca8f9d7bca9ab2849
commit: 803370d3d37579e080e8c59f2360a072d0e45aff [530/10518] bpf: add a new kfunc to return current bpf_map elements count
config: x86_64-randconfig-r032-20230816 (https://download.01.org/0day-ci/archive/20230817/202308170007.OzhdwITj-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170007.OzhdwITj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170007.OzhdwITj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/map_iter.c:201:17: warning: no previous declaration for 'bpf_map_sum_elem_count' [-Wmissing-declarations]
    __bpf_kfunc s64 bpf_map_sum_elem_count(struct bpf_map *map)
                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_map_sum_elem_count +201 kernel/bpf/map_iter.c

   196	
   197	__diag_push();
   198	__diag_ignore_all("-Wmissing-prototypes",
   199			  "Global functions as their definitions will be in vmlinux BTF");
   200	
 > 201	__bpf_kfunc s64 bpf_map_sum_elem_count(struct bpf_map *map)
   202	{
   203		s64 *pcount;
   204		s64 ret = 0;
   205		int cpu;
   206	
   207		if (!map || !map->elem_count)
   208			return 0;
   209	
   210		for_each_possible_cpu(cpu) {
   211			pcount = per_cpu_ptr(map->elem_count, cpu);
   212			ret += READ_ONCE(*pcount);
   213		}
   214		return ret;
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
