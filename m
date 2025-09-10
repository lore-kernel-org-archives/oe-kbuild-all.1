Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF7E25A2B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 03:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757474006; cv=none; b=IF2QpKYSJhI01YjB5uonkKhciNtmgNsWjuselw2dWQcqc2inatOotiw91EpTA8cSjkGd1reJr4rY5Pq3BWae8GRaVIt7h0MAoQ/ArKtELEwwa9Srx14RAeaUAiFPwBWcf4D9lj7KeOAsIEhJ1m8s2JLGYceGMyRvipUCfzbK5Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757474006; c=relaxed/simple;
	bh=azEefx45TdCa/zkD0xRHe2VIoxx9ubvwiW/L4N+YSNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7WkHQ8SAb1YCkuOkMOxlyRSzhS8OvwEeWAge79qYutsLJ9PNpiiFtXAQVF/WCKANVkqPIB5BmfrgYQ38Te1fQv6CvWFFFN+gJmmxImZLAJUleLhuOBgBSbdOlHrrppra/Ke10dlQWVU0Qhds9OwHahlfp+6QVBPxJEwjH6grZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRiZucUD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRiZucUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757474005; x=1789010005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=azEefx45TdCa/zkD0xRHe2VIoxx9ubvwiW/L4N+YSNk=;
  b=XRiZucUDu7Nt2Jg8GYyFUVIiN9wHVelv4YuVqq0Qcwsk11m/0pjSLY7p
   yLMlocZBGiG0oiBqdiuZIUcESM8tUrNTm9eFE+RScvd9T+ncw0UEP5WiE
   fqFMxbgEyg+lYxLwCxUIn1w/bFP5jpjUkUzoVK8bM0IYqLW8mXzxwGt4L
   G+iOtOE82CZjGzR5aqoDfb+OXvNIhD0RW/J2ycWwDPT8bMLJk1F4sC/k0
   IXI79HH7r6qDOljAfeROxg7C3OchL1Gug2mwvY9uFz+jJhdeqK9Iytma6
   BwqNceu8OoxQjD7u0qS5MQ3UHiS9N3VMLOp+Z70WjMbdMKzQRo2iaApD+
   w==;
X-CSE-ConnectionGUID: xq1jilryRbuuXGykEOExXw==
X-CSE-MsgGUID: 9lYD7scvTOORWiB2E802cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59724049"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59724049"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 20:13:24 -0700
X-CSE-ConnectionGUID: wLsWgiNTSWqdjV2TetIDAA==
X-CSE-MsgGUID: E5jKlrrtSwSIRX/feJzu6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="196935786"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Sep 2025 20:13:17 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwBGl-0005Ur-0q;
	Wed, 10 Sep 2025 03:13:15 +0000
Date: Wed, 10 Sep 2025 11:12:38 +0800
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
	Chen Yu <yu.c.chen@intel.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>, Hao Jia <jiahao1@lixiang.com>,
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
Message-ID: <202509101043.MFfNJgKH-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Lei-Liu/mm-swap-Gather-swap-entries-and-batch-async-release-core/20250909-145620
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250909065349.574894-2-liulei.rjpt%40vivo.com
patch subject: [PATCH v0 1/2] mm: swap: Gather swap entries and batch async release core
config: sparc-randconfig-002-20250910 (https://download.01.org/0day-ci/archive/20250910/202509101043.MFfNJgKH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509101043.MFfNJgKH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509101043.MFfNJgKH-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: kernel/exit.o: in function `do_exit':
>> exit.c:(.text+0x19f0): undefined reference to `exiting_task_count'
>> sparc64-linux-ld: exit.c:(.text+0x1a14): undefined reference to `exiting_task_count'
   sparc64-linux-ld: exit.c:(.text+0x2124): undefined reference to `exiting_task_count'
   sparc64-linux-ld: mm/memory.o: in function `unmap_page_range':
>> memory.c:(.text+0x46a4): undefined reference to `add_to_swap_gather_cache'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
