Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788213A5E65
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 17:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772558846; cv=none; b=QsVIc/pjd7yd83TBkwHFZH8Kmhlz+hZvZXJiXV5Q+7HsBqepgwgUwWBzFkgT2g4xsETpvYPF4VtzsF8TMh/o9+unM0OtwEnW1LTpfVnJCJ8xQIDYPQuEuqCx97keUveUxucu2uxtjXdrkdz2gkJB7PHyrYfMayNGgSuqqG/7EUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772558846; c=relaxed/simple;
	bh=H09CzigIw7VeAJHHxpSok63bu1latf/JXhXN4L1NfZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYv4iHGHqHb1X3wX2EcVW50taX9BvHNM7p3xW+cEQa/Oh7FaHCzEtgm66sUGPwjk/IgxYeMufSH07elfTjlazuiBAyZV4+khVdlmdWik/cuXiMa/7ZFBt72IsYCfSX5TGYbPhGV76SgL8njlQQYB8oRPDlZpa9F8mGKXOYtJ0eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DZz0d35L; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZz0d35L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772558843; x=1804094843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H09CzigIw7VeAJHHxpSok63bu1latf/JXhXN4L1NfZM=;
  b=DZz0d35LGndWnM7yo/9+NDb56C5wFmiLGenWSLktWL0NCKOZVcO5+IUd
   LNJnmXLF2+Bw/0+TcwBSm5OSBXYGCFX1qGQnnU6GBLsvBcyvDoXa+FKGI
   uP/LcOpdTttuL0UWUkm3/MadGQADwsnsrMP72xVA7itwnv9/XkSTgRBI1
   +a2SAZztf83F2ET1Wl31JfrfxNtBPM79oipSqAvTEBTW9VGc10BE1sHD5
   eM0Y0lVGVi3FcJeKLPaLTD8tu1rBemX7zT1bWciS/uiADTzVuAVFqAv18
   uSafnTV7RjzaQhBtWnnS/TH6T3FtVTGXVcsJh/lild5oQQvRJujP7fNW8
   A==;
X-CSE-ConnectionGUID: 2MUx2wr7QUuk3rFBOZAhtA==
X-CSE-MsgGUID: LijgDwuOR0q+ZJYiwH87VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77474974"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="77474974"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 09:27:23 -0800
X-CSE-ConnectionGUID: 8ZhSIOPKR+OzFv7fTjk7gA==
X-CSE-MsgGUID: a3K4UJemS/285Bk9s+1SQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="218189779"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 03 Mar 2026 09:27:21 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxTWf-000000001Vx-2re1;
	Tue, 03 Mar 2026 17:27:17 +0000
Date: Tue, 3 Mar 2026 18:26:54 +0100
From: kernel test robot <lkp@intel.com>
To: Tommaso Cucinotta <tommaso.cucinotta@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
	Juri Lelli <juri.lelli@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/deadline: document new sched_getattr() feature for
 retrieving current parameters for DEADLINE tasks
Message-ID: <202603031858.JyW2vicC-lkp@intel.com>
References: <20260303104215.1324243-1-tommaso.cucinotta@santannapisa.it>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303104215.1324243-1-tommaso.cucinotta@santannapisa.it>

Hi Tommaso,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f74d204baf9febf96237af6c1d7eff57fba7de36]

url:    https://github.com/intel-lab-lkp/linux/commits/Tommaso-Cucinotta/sched-deadline-document-new-sched_getattr-feature-for-retrieving-current-parameters-for-DEADLINE-tasks/20260303-184545
base:   f74d204baf9febf96237af6c1d7eff57fba7de36
patch link:    https://lore.kernel.org/r/20260303104215.1324243-1-tommaso.cucinotta%40santannapisa.it
patch subject: [PATCH] sched/deadline: document new sched_getattr() feature for retrieving current parameters for DEADLINE tasks
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603031858.JyW2vicC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603031858.JyW2vicC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Checksumming on output with GSO
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
>> Documentation/scheduler/sched-deadline.rst:631: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
   Documentation/userspace-api/landlock:480: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.


vim +631 Documentation/scheduler/sched-deadline.rst

   615	
   616	 Specifying a periodic/sporadic task that executes for a given amount of
   617	 runtime at each instance, and that is scheduled according to the urgency of
   618	 its own timing constraints needs, in general, a way of declaring:
   619	
   620	  - a (maximum/typical) instance execution time,
   621	  - a minimum interval between consecutive instances,
   622	  - a time constraint by which each instance must be completed.
   623	
   624	 Therefore:
   625	
   626	  * a new struct sched_attr, containing all the necessary fields is
   627	    provided;
   628	  * the new scheduling related syscalls that manipulate it, i.e.,
   629	    sched_setattr() and sched_getattr() are implemented.
   630	
 > 631	 The leftover runtime and absolute deadline of a SCHED_DEADLINE task can be
   632	 read using the sched_getattr() syscall, setting the last syscall parameter
   633	 `flags' to the SCHED_GETATTR_FLAG_DL_DYNAMIC=1 value. This updates the
   634	 runtime left, converts the absolute deadline in CLOCK_MONOTONIC reference,
   635	 then returns these parameters to user-space. The absolute deadline is
   636	 returned as the number of nanoseconds since the CLOCK_MONOTONIC time
   637	 reference (boot instant), as a u64 in the sched_deadline field of sched_attr,
   638	 which can represent nearly 585 years since boot time (calling sched_getattr()
   639	 with flags=0 causes retrieval of the static parameters instead).
   640	
   641	 For debugging purposes, these parameters can also be retrieved through
   642	 /proc/<pid>/sched (entries dl.runtime and dl.deadline, both values in ns),
   643	 but: this is highly inefficient; the returned runtime left is not updated as
   644	 done by sched_getattr(); the deadline is provided in kernel rq_clock time
   645	 reference, that is not directly usable from user-space.
   646	
   647	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
