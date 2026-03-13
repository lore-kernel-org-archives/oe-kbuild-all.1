Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6203161A3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Mar 2026 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773389194; cv=none; b=KiagTXGQTcaSigpYBZnAqhp8pN8C5r2oPp/G9nEH8FZ++3cYjUqL6pHfHoBgsUzm8iXPkrv2HF9QQZSuLGdfXfhsEOQynui5mlhL1gWWnKIKXtuXl8fGH7s6/Vu9FfhknPxIHKoA+OiYoxWJLXxl4iNn9Qr075pqSfMU8/HzzFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773389194; c=relaxed/simple;
	bh=BtMPu3iOSzFTX17F3r8GdSzBKmDkbGnfJl/P9Ya3Qbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkicyDE9V6ACRy8PKXZtgYJ9RWMCLrCqzBhbpxLfJlCnOfQyUmRYGCYdvrmF95bsbcIj48dlF59oO5pKb9XfNb+KxoXXKZ4tdkYXahCZFpiaFcYJ4qZElebsv7IunzCO//WYclxV/Qx2dUTDysC9WYxp+Pk3wfKo8aOh6qqE6mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqhI7IuV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqhI7IuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773389193; x=1804925193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BtMPu3iOSzFTX17F3r8GdSzBKmDkbGnfJl/P9Ya3Qbs=;
  b=cqhI7IuVBwlEfNc1z6yDf4AZ3bRpwVOXOftWnx4f4ItgHJSsKj1weQNF
   0vMfWcnwu0OhNHgdn14shLqm3Sep5k6104jz/nDyqK/oQTMwfLY+xlyrE
   We7zquKPsnTYwTFwLgAFOkguvWSWEwsDDrABSnpaHBuBfjwLdAlYsjaNa
   UlExfa/fbjaZYsoYAT6dKaGmUnlkToNa7GC89gDo/+BLI6fLstSRXBvFD
   ovX0+0DBLlC8cq1LUHNBCYTmMN8gWfUcNQQN2lbyESSbo39EA5pnNNmva
   puYZop/1nUyYxHT7njHU7ttaHJtvb59lcV5ccqpHy4ytB5N0U4sjp9T2Z
   Q==;
X-CSE-ConnectionGUID: zPkYPxfrSoeb7v6l4ePBAQ==
X-CSE-MsgGUID: 016hhCyrRC2MVZIXblR+ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74374934"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74374934"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 01:06:31 -0700
X-CSE-ConnectionGUID: gPjGOQENRu+9LBVWJC2E3Q==
X-CSE-MsgGUID: KKxPATFuTuOj68ORIwqO2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="217122672"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Mar 2026 01:06:24 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0xXI-000000003ax-3skA;
	Fri, 13 Mar 2026 08:06:20 +0000
Date: Fri, 13 Mar 2026 16:06:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Brendan Jackman <jackmanb@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v2 03/25] mm/percpu: Annotate static information into
 meminspect
Message-ID: <202603131622.xpsC6cMy-lkp@intel.com>
References: <20260311-minidump-v2-v2-3-f91cedc6f99e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-minidump-v2-v2-3-f91cedc6f99e@oss.qualcomm.com>

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on 343f51842f4ed7143872f3aa116a214a5619a4b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/kernel-Introduce-meminspect/20260311-042334
base:   343f51842f4ed7143872f3aa116a214a5619a4b9
patch link:    https://lore.kernel.org/r/20260311-minidump-v2-v2-3-f91cedc6f99e%40oss.qualcomm.com
patch subject: [PATCH v2 03/25] mm/percpu: Annotate static information into meminspect
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260313/202603131622.xpsC6cMy-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603131622.xpsC6cMy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603131622.xpsC6cMy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/percpu.c:90:
>> mm/percpu.c:3363:25: error: '__per_cpu_offset' undeclared here (not in a function); did you mean '__per_cpu_start'?
    3363 | MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
         |                         ^~~~~~~~~~~~~~~~
   include/linux/meminspect.h:94:33: note: in definition of macro 'MEMINSPECT_ENTRY'
      94 |                 .va = (void *)&(sym),                                           \
         |                                 ^~~
   mm/percpu.c:3363:1: note: in expansion of macro 'MEMINSPECT_SIMPLE_ENTRY'
    3363 | MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
         | ^~~~~~~~~~~~~~~~~~~~~~~


vim +3363 mm/percpu.c

  3362	
> 3363	MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
  3364	/*
  3365	 * pcpu_nr_pages - calculate total number of populated backing pages
  3366	 *
  3367	 * This reflects the number of pages populated to back chunks.  Metadata is
  3368	 * excluded in the number exposed in meminfo as the number of backing pages
  3369	 * scales with the number of cpus and can quickly outweigh the memory used for
  3370	 * metadata.  It also keeps this calculation nice and simple.
  3371	 *
  3372	 * RETURNS:
  3373	 * Total number of populated backing pages in use by the allocator.
  3374	 */
  3375	unsigned long pcpu_nr_pages(void)
  3376	{
  3377		return data_race(READ_ONCE(pcpu_nr_populated)) * pcpu_nr_units;
  3378	}
  3379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
