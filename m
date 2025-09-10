Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CC71EDA1E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 01:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757468358; cv=none; b=PUYY5dGFZTNdyIJbmvy0ffXy3pnCSDW5yIWP452EPqqFsF9MIhuH8EKrcw/+N11FrgGO64b9DKNGwypk1Z8vtieYdNfpe8KdI7kAn5x9m8dZ2Qj8TkJWlBKK5A2dZtINo/0oss+KPMevgYMDuTFTkoky+wIR417s87UnQEestCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757468358; c=relaxed/simple;
	bh=GWmdpp0EogrvTC9TsSq61OLSNkyGJ4QAbt4wB/Nj+VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9DtiIZWBiqkE1XFng7Stcf73OQnQpHqVWgytID8BK2lFU4ZOLGGcN7pxK2t9gT/a9ZUKhuw4hGPP6sZtqWs/AcqvS6i2q87h7kU/dquBmUdEKuHAe6LKlF4cDsGaJrlSNxs3Zk+/NFOP6sICy492NnSRWPfzNW8DZtxkUkA0mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDSbVQ37; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDSbVQ37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757468356; x=1789004356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GWmdpp0EogrvTC9TsSq61OLSNkyGJ4QAbt4wB/Nj+VA=;
  b=QDSbVQ37EiJZipmRwdzK8lJXufNZicvgKciaNYHcfv4b/OA3nghyxA7Y
   k8spDHQM1ao7OEjLloys/+1Qajf58U5ASgrNin3q82KeK5EwBwYJ/pC5x
   fuMv8UDv4VqyCEJU7yhiB6LmgIUOd70iV27Neyxoenj0ezhaf3ze9eqSp
   lLGieOaK+7f/5OQkq7v8RJckO4rV18h6GxMHNXGZjeVM9oMngwJHeCMfQ
   xESDA4BT2rOIH5eHYgJym3jNiWoq1q0+jehzKK9TbhWmm3Ryw1mVq9QvB
   ZLl/2YO7l+gbJiW1Ch0xIjSCuqlz86m7Xv2rZFUzURqBqndA/GwE4fh9v
   A==;
X-CSE-ConnectionGUID: UgPVf6MRSDeaYOqXalGVfg==
X-CSE-MsgGUID: t3LVTeOVSeq2ojKrTdXUlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59842947"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="59842947"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 18:39:14 -0700
X-CSE-ConnectionGUID: 8CUqBdplSfO00Pm//sWj7A==
X-CSE-MsgGUID: GGHTSNawTJ6p1TJCI6d28A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="172414600"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Sep 2025 18:39:08 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uw9nd-0005QN-0P;
	Wed, 10 Sep 2025 01:39:05 +0000
Date: Wed, 10 Sep 2025 09:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: Lei Liu <liulei.rjpt@vivo.com>, Michal Hocko <mhocko@suse.com>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>, Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
	Chris Li <chrisl@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Chen Yu <yu.c.chen@intel.com>, Usama Arif <usamaarif642@gmail.com>,
	Hao Jia <jiahao1@lixiang.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v0 1/2] mm: swap: Gather swap entries and batch async
 release core
Message-ID: <202509100935.w5zKofdt-lkp@intel.com>
References: <20250909065349.574894-2-liulei.rjpt@vivo.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909065349.574894-2-liulei.rjpt@vivo.com>

Hi Lei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Lei-Liu/mm-swap-Gather-swap-entries-and-batch-async-release-core/20250909-145620
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250909065349.574894-2-liulei.rjpt%40vivo.com
patch subject: [PATCH v0 1/2] mm: swap: Gather swap entries and batch async release core
config: x86_64-buildonly-randconfig-003-20250910 (https://download.01.org/0day-ci/archive/20250910/202509100935.w5zKofdt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509100935.w5zKofdt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509100935.w5zKofdt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swapfile.c:206:12: warning: 'async_swap_free_counts_show' defined but not used [-Wunused-function]
     206 | static int async_swap_free_counts_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/async_swap_free_counts_show +206 mm/swapfile.c

   205	
 > 206	static int async_swap_free_counts_show(struct seq_file *m, void *v)
   207	{
   208		seq_printf(m, "exiting_tasks:%d cache_counts:%d\n",
   209			   get_exiting_task_count(), cache_count);
   210		return 0;
   211	}
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
