Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAD1252910
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 19:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762025812; cv=none; b=rsRP8zcBNtI+PwEZ5C9j2c9FzRSWbJB5yk0CAKbvBhqxG3QzuNNbIxwnCFGTDlPUG1WbE9J94iLEikt5QYhMDESdhf0X20G3850GjSS9kbRB8vHlO7FdGpW1mberwRSwHwmRtIIYUvAUZn2w0Sd2J81TPm6LLhiq+5/g+r6trvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762025812; c=relaxed/simple;
	bh=UNLgUNEbuilYnhoztX92QSHI2QpWIAoqAV+6Dwad9Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoKgokBO9OxB96t8ZhK3K42HFXa9q+E8P98zzQs7tjDeT6TDjaElliDMLxV2aST1f2KTe0kduJfpS9vUJVShewdUfdHPT5C5UnW3xufILVSYsapNAxlcxiEJd8jIDiMghNcdIcZ2DAxLkMcbWeVCqdPfkzzYunPFjPdDPRW5eD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFGA9Xre; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFGA9Xre"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762025811; x=1793561811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UNLgUNEbuilYnhoztX92QSHI2QpWIAoqAV+6Dwad9Fg=;
  b=NFGA9XrePbAP6aZsX8u3sdqsl6ALewBurG2AeDpYtQAtF7xqWmP4VZSY
   gnxD+KMZ8K3JlHmyFVaKrNRuL7xc1u4NSNdPpCNdkyen8T+K2wePCjXQa
   mdFlh9MZgzj7OPtwm0NjXWXCJTbBuWPXN1ImFRckzDCpxDYpu0Byicism
   kBAHKKv6rB6yGFetDg9I/Mhrok/FGwdhaNnRFfujYgActXMM73ss2BQOl
   X2h8Wy9rTuwE3CPslhE/NexZPawYVmIpOH+Lg7UjKY45ddpcKn1ut2LNq
   jc2Q5U/IQQWpHmkBEH0QnNA/MABborCoad0VB8zltZcaSS3QsQEf7CVmc
   Q==;
X-CSE-ConnectionGUID: F6jRuvZqSjqkA7/BXlCMag==
X-CSE-MsgGUID: PzkPpXcQQk+83XFRXaGufA==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="66774931"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="66774931"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 12:36:50 -0700
X-CSE-ConnectionGUID: /AXIaqu7T1CsP3LWinhpbA==
X-CSE-MsgGUID: xzImgq6JSjeWc0g6fZo9+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="186393320"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Nov 2025 12:36:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFHON-000Odw-2x;
	Sat, 01 Nov 2025 19:36:10 +0000
Date: Sun, 2 Nov 2025 03:35:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <david.laight.linux@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Laight <david.laight.linux@gmail.com>,
	u.kleine-koenig@baylibre.com, Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Li RongQing <lirongqing@baidu.com>, Yu Kuai <yukuai3@huawei.com>,
	Khazhismel Kumykov <khazhy@chromium.org>,
	Jens Axboe <axboe@kernel.dk>, x86@kernel.org
Subject: Re: [PATCH v4 next 6/9] lib: test_mul_u64_u64_div_u64: Test both
 generic and arch versions
Message-ID: <202511020341.TEhkaR65-lkp@intel.com>
References: <20251029173828.3682-7-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029173828.3682-7-david.laight.linux@gmail.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20251029]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/lib-mul_u64_u64_div_u64-rename-parameter-c-to-d/20251030-025633
base:   next-20251029
patch link:    https://lore.kernel.org/r/20251029173828.3682-7-david.laight.linux%40gmail.com
patch subject: [PATCH v4 next 6/9] lib: test_mul_u64_u64_div_u64: Test both generic and arch versions
config: i386-randconfig-052-20251102 (https://download.01.org/0day-ci/archive/20251102/202511020341.TEhkaR65-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511020341.TEhkaR65-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511020341.TEhkaR65-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/math/test_mul_u64_u64_div_u64.c:142:9: warning: "__div64_32" redefined
     142 | #define __div64_32 __div64_32
         |         ^~~~~~~~~~
   In file included from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from lib/math/test_mul_u64_u64_div_u64.c:9:
   arch/x86/include/asm/div64.h:78:9: note: this is the location of the previous definition
      78 | #define __div64_32
         |         ^~~~~~~~~~


vim +/__div64_32 +142 lib/math/test_mul_u64_u64_div_u64.c

   140	
   141	/* Compile the generic mul_u64_add_u64_div_u64() code */
 > 142	#define __div64_32 __div64_32
   143	#define div_s64_rem div_s64_rem
   144	#define div64_u64_rem div64_u64_rem
   145	#define div64_u64 div64_u64
   146	#define div64_s64 div64_s64
   147	#define iter_div_u64_rem iter_div_u64_rem
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
