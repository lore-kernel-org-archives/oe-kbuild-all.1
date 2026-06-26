Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289673AA19B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 06:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782453936; cv=none; b=WV4lPLG6yhAaDTWUCGD8QEhhxBQcpyw8kqz/RhOweJbqaK6I6Bzs+z6yId38i+3jwdEeC7RIBqVIvMbWanejMKO7wIqPQ/H09VW3C1OjED1IQDIr1iXkVcSwwOpJ8wWl902t8I8/SqpSKrbZxE5m36rJWucclNLThS/KlzAveuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782453936; c=relaxed/simple;
	bh=dT7MX0WfXC++oDnyN+rwSBLVEdZXSKQeW57y85ZLgfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Axlm2TeuF9OzjizkBSHqaf9lqJBZitqLe2tWdOYnUR23/M9yhbvmbuAfwsk7g09kGS9NFsOAMJYzXHy/9oX5z9kiEDGSkEQNa6xf4kvLFslwb9yzZ2NINZPSpVzxYgMbe7VTCsgO1u1m+XQyKbpOpW2xN7U2wUxlMKKJXeUoHC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtJJLjNr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtJJLjNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782453934; x=1813989934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dT7MX0WfXC++oDnyN+rwSBLVEdZXSKQeW57y85ZLgfQ=;
  b=DtJJLjNrYNSSttEYzZ9n9Fsio9IYUspXvj6BNVn7YyPxvpV3fqMufDYz
   OoIVWAoOpaV327yulVqNo7qHZ6y9yycpNRteEM0Ytu0BYzx7KIFrsuksb
   Y6e9HqCxV/HREIqj1WDFsujvERKa7QK/1CsCNhy+4Vkb8XsVama12afZb
   W+DTBHOTrH9nR77C+f18aZGfypPqiXlh8z1gTu3U3CgncjHeAnU2ENtl9
   Pv7K7FEhNd+PGr5nm+HqpPJDUNFjVhr2hzpJSJml+9yf+CxaOHe+1K4om
   zvbqdHRT7hIXRpN0H0z4MF1YcV66nI2jmGvcig+ICMKZVTtppgbQmi1jm
   A==;
X-CSE-ConnectionGUID: uMFq57WHQkaXqFrT156gHA==
X-CSE-MsgGUID: BJa1l7AtQ6SrbTZGfovooA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="82362243"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="82362243"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 23:05:33 -0700
X-CSE-ConnectionGUID: 8O85bc2USKWYU4tHFPl8Cw==
X-CSE-MsgGUID: k5CiFcU2SQqlFNeUo0Gzpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="289346606"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 25 Jun 2026 23:05:29 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wczgs-000000006f3-41Nw;
	Fri, 26 Jun 2026 06:05:26 +0000
Date: Fri, 26 Jun 2026 08:05:09 +0200
From: kernel test robot <lkp@intel.com>
To: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hui Zhu <zhuhui@kylinos.cn>
Subject: Re: [PATCH v7] mm: assert exclusive nid/zonenum bits at the
 page/folio access sites
Message-ID: <202606260757.WdVU9G1N-lkp@intel.com>
References: <20260626032012.1049667-1-hui.zhu@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626032012.1049667-1-hui.zhu@linux.dev>

Hi Hui,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Zhu/mm-assert-exclusive-nid-zonenum-bits-at-the-page-folio-access-sites/20260626-112119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260626032012.1049667-1-hui.zhu%40linux.dev
patch subject: [PATCH v7] mm: assert exclusive nid/zonenum bits at the page/folio access sites
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260626/202606260757.WdVU9G1N-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606260757.WdVU9G1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606260757.WdVU9G1N-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
>> include/linux/mm.h:2:2: error: unterminated conditional directive
       2 | #ifndef _LINUX_MM_H
         |  ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
>> include/linux/mm.h:2:2: error: unterminated conditional directive
       2 | #ifndef _LINUX_MM_H
         |  ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
>> include/linux/mm.h:2:2: error: unterminated conditional directive
       2 | #ifndef _LINUX_MM_H
         |  ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:13:
   In file included from include/linux/pagemap.h:8:
>> include/linux/mm.h:2:2: error: unterminated conditional directive
       2 | #ifndef _LINUX_MM_H
         |  ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:13:
   In file included from include/linux/pagemap.h:17:
   In file included from include/linux/hugetlb_inline.h:5:
>> include/linux/mm.h:2:2: error: unterminated conditional directive
       2 | #ifndef _LINUX_MM_H
         |  ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:9:
>> include/linux/mm.h:2:2: error: unterminated conditional directive
       2 | #ifndef _LINUX_MM_H
         |  ^
   6 errors generated.


vim +2 include/linux/mm.h

^1da177e4c3f415 Linus Torvalds 2005-04-16 @2  #ifndef _LINUX_MM_H
^1da177e4c3f415 Linus Torvalds 2005-04-16  3  #define _LINUX_MM_H
^1da177e4c3f415 Linus Torvalds 2005-04-16  4  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
