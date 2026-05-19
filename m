Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FCE3A8384
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 10:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186142; cv=none; b=Vt+pYW2OgjnbSIkXnk+FSpmDO5cFw2M1TTIsmwUk++acdrpXsvHVr/sxC741BDRc+PGNt/fkSsnkVAaxc6qQiDWcQkmGFJT0VzXhynuIqB3R4wB0Gv3PfVbCMHOHI/ZnqmAtmdzV2p1AjWt4SevwGHxU1b/XV0kkWwkkD5pWIoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186142; c=relaxed/simple;
	bh=ewdPDTiQhFrvxbPxw/3DPaoZdfhQjx/FTRinF4ewakw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlgcCwj5HoR2kKHFQRqFzMNliFgxpN4l6peM+eMl65cME1DQ7q2DR/6YhDGeu143QqMdYTu+Ooz4QlbYVLLzW48UAeNOr33c3Tj8Tjd9S2Gu8/hmmWLXrPg3yK0E9EeonzYxX/RnxABt3pGW5vV6Ke0W0iM3fJXS28W+ognAZCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwRszU8L; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwRszU8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779186141; x=1810722141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ewdPDTiQhFrvxbPxw/3DPaoZdfhQjx/FTRinF4ewakw=;
  b=PwRszU8LLvQuJE6JWmVf3p/t1vLckWOU/lzWNbUKZO6SF9pa6At1IVK6
   Az+Zph7ZseqGggKqcD44pszQfg0y5ZS24VMNQ20ruLGO3h6CR6DxFl03u
   9e0adRnaYlxz6d7WdlABLDxeDD4XMhVrMzVkcQPe+SWBB9g0G7TFgLlTQ
   n6WBIRqH5Ih6BFtdGenoVhOwrPkvtS/9XAMzcUdM63Gjr9vghB3dgKCbw
   OpxIbXJVINfc2bp7U4ShBRyqNq6TuTGu8EM1x63JdW3vKs65r8sjrsSSn
   PQdhUxp+0HHi6eAL4cPWPuLaVO4tV3SEusLIyqU6S0LSB6PhfNpi6STNq
   w==;
X-CSE-ConnectionGUID: tZDWLHVGRfigvEpqtXbSnA==
X-CSE-MsgGUID: GMDM/tZpQFW+XrLSdfas/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97493561"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="97493561"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:22:20 -0700
X-CSE-ConnectionGUID: P9Y9iyfgQkGfFLA8L0a1QQ==
X-CSE-MsgGUID: QqzttTygREOSCCLLS030/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="237107315"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 19 May 2026 03:22:14 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPHaW-00000000A9l-0SGx;
	Tue, 19 May 2026 10:22:12 +0000
Date: Tue, 19 May 2026 12:21:39 +0200
From: kernel test robot <lkp@intel.com>
To: Leonardo Bras <leobras.c@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@linux-foundation.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v4 4/4] slub: apply new pw_queue_on() interface
Message-ID: <202605191244.2uTAvERx-lkp@intel.com>
References: <20260519012754.240804-5-leobras.c@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519012754.240804-5-leobras.c@gmail.com>

Hi Leonardo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5200f5f493f79f14bbdc349e402a40dfb32f23c8]

url:    https://github.com/intel-lab-lkp/linux/commits/Leonardo-Bras/Introducing-pw_lock-and-per-cpu-queue-flush-work/20260519-112741
base:   5200f5f493f79f14bbdc349e402a40dfb32f23c8
patch link:    https://lore.kernel.org/r/20260519012754.240804-5-leobras.c%40gmail.com
patch subject: [PATCH v4 4/4] slub: apply new pw_queue_on() interface
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260519/202605191244.2uTAvERx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191244.2uTAvERx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
>> Documentation/locking/pwlocks.rst:3: WARNING: Title overline too short.
--
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:191: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/locking/pwlocks.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]


vim +3 Documentation/locking/pwlocks.rst

     2	
   > 3	=========
     4	PW (Per-CPU Work) locks
     5	=========
     6	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
