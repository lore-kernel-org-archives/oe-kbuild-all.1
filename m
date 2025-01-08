Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6981AB511
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736331843; cv=none; b=cOBxcgeijo6hgbRo9NMSvgkoWD59/UdCffwHbfwBGYaDI5UOvKYrV4RCeHOPyWUHPw0Le8vY6PRZA1H/25TSDV4zeleopvkvtGO2G7Edf7UkQYsSqc/o0FEWvXxqEMfni7RXCrvgXb47SEObAVatsOeQOHK05NScmAt3KINKz6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736331843; c=relaxed/simple;
	bh=1bcpOyut/EwSvrpsXMhPoVZ1lWehL4zTiWUSrCDuES4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZhDl58S0P2MTcdYWGZU7CakkI59XaX/E9j+PU7n96K6mDvPiLY94xZ6nSmOPpwt84PfKjXuw/dpUN3JErOm8dNmyUZL4FcLYZFloRIxzVO2UUzK6IKxUsmQWwPoZMKEzhnYqO+UGyQD470HmQr/+EXZOScC8JbEYco5UdXOgo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TpjAk3TK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TpjAk3TK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736331838; x=1767867838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1bcpOyut/EwSvrpsXMhPoVZ1lWehL4zTiWUSrCDuES4=;
  b=TpjAk3TKsTkh7F8kYcW2Hxl6gsqi3phU+I0Q6nlfZEvkKNHhM8QDukJf
   oDEwEGjrCz3p6i3HL4mOY+Li7YqWbt/4TxcNXkQLsfXMQUXCL4FGGEz3Q
   epEqt7SLFEItPKOT54akgB61KjAC+Ai3DUbgCQpjf7Rk0/GUjlyxFRUHV
   MYFMPEoCDV3umV00dTNSYCg6jldf4dLKhBX7jKlajQhiFeqP7F5MRLAHk
   xqEa7zgpEC4gRSPZ604cQ5LAChceOVrHKZgWvIUTYJnNNAt+f77jS1by2
   BthKtLLdeaRF+gY3tzJVI7tNpPN460yHYfSGozQPaIu3/a2CFxtadtakk
   w==;
X-CSE-ConnectionGUID: MGW0Ekd0TDeBvsXyyGVa9g==
X-CSE-MsgGUID: nuSUFcgJS4WcUrv0BwTr6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="40220484"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="40220484"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 02:23:58 -0800
X-CSE-ConnectionGUID: w6UHqv0IRc+1AfPsudV7SA==
X-CSE-MsgGUID: JQBf+rTiTfWx2nwysUU6Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108153049"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Jan 2025 02:23:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVTE7-000Fv9-2M;
	Wed, 08 Jan 2025 10:23:51 +0000
Date: Wed, 8 Jan 2025 18:23:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>,
	Barret Rhoden <brho@google.com>, Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>, kernel-team@meta.com
Subject: Re: [PATCH bpf-next v1 20/22] bpf: Introduce rqspinlock kfuncs
Message-ID: <202501081832.WyLcpM5w-lkp@intel.com>
References: <20250107140004.2732830-21-memxor@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107140004.2732830-21-memxor@gmail.com>

Hi Kumar,

kernel test robot noticed the following build errors:

[auto build test ERROR on f44275e7155dc310d36516fc25be503da099781c]

url:    https://github.com/intel-lab-lkp/linux/commits/Kumar-Kartikeya-Dwivedi/locking-Move-MCS-struct-definition-to-public-header/20250107-220615
base:   f44275e7155dc310d36516fc25be503da099781c
patch link:    https://lore.kernel.org/r/20250107140004.2732830-21-memxor%40gmail.com
patch subject: [PATCH bpf-next v1 20/22] bpf: Introduce rqspinlock kfuncs
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20250108/202501081832.WyLcpM5w-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081832.WyLcpM5w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081832.WyLcpM5w-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/alpha/include/generated/asm/rqspinlock.h:1,
                    from include/linux/bpf.h:33,
                    from include/linux/security.h:35,
                    from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from init/main.c:21:
>> include/asm-generic/rqspinlock.h:15:10: fatal error: asm/qspinlock.h: No such file or directory
      15 | #include <asm/qspinlock.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +15 include/asm-generic/rqspinlock.h

13d8f36ca2ecdf Kumar Kartikeya Dwivedi 2025-01-07  11  
13d8f36ca2ecdf Kumar Kartikeya Dwivedi 2025-01-07  12  #include <linux/types.h>
ebea887f32c13b Kumar Kartikeya Dwivedi 2025-01-07  13  #include <vdso/time64.h>
83c0f407f3dad2 Kumar Kartikeya Dwivedi 2025-01-07  14  #include <linux/percpu.h>
ea74a398e7e95d Kumar Kartikeya Dwivedi 2025-01-07 @15  #include <asm/qspinlock.h>
13d8f36ca2ecdf Kumar Kartikeya Dwivedi 2025-01-07  16  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
