Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B648050A6D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 05:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709271009; cv=none; b=eE+QS9YTMhDoEqDBnRLbu7yjM+mqVTZ96liM0gXYHnLihzLvgh7bU+WQDN4jSJ8qxWwffLhVEuHIp7M7RxspCOHdgl9ylK+Y+2ZIwPUpvkh0ajmeDYimc5S1EiudhFPas2ztzrb1cXF/d8aTkXPIhHKU0ITJTTgREi/991+D3hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709271009; c=relaxed/simple;
	bh=yUOV0dq5JKRNnbJJINmDoCKpgeqYWZeaU6kZotwZpuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqJ232RzTNH1WhSuLN6wtTQfkV/i4/XLO/z9LcP1KUes29yyjULna8lfrcTgSo/IXx6v55EEVukXMncU/002G/OKNXb5ZfIAs4GFT9qun4j7EGkjgzEsANDRCVjYFuNvZ7v9W1JNxwYNy/RCAwn2hKh9g6a4XgDCZvAFW8xx4GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwMTuae8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwMTuae8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709271007; x=1740807007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yUOV0dq5JKRNnbJJINmDoCKpgeqYWZeaU6kZotwZpuI=;
  b=FwMTuae8GD8T13GellbZjDwK+NeQsmvRJ1WTmGKzVoDD2pRAiSmQmN7H
   i7uVa4o8NGzFVEn9dcJmWAqJZztTtFiQnYqFOdY5DSgV+sRsbdJ78Amdl
   tTvnS7D4l5j/hY3cX1h02oo/hyA6Gj8TzuI0W+96CyWlpbZVzDkr7kblP
   AO0jU3gogU+FPHhwYq8FRj+4lq1aPBVOhtiJ1YQ5svMaE3RqeWgG0cV6j
   SVyi/VaX4ui3ib4rN3UDFVDIJCN2KVXU41q0EFl4nwsdXTAI5mTp00VJ7
   38J1cTaAs/zPn1LL0iPpzZEGNn2dd0duIF3b1GN4Ds6a3E7uEhFWEgeUa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="15226246"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="15226246"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 21:30:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="12766605"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Feb 2024 21:29:59 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfvT2-000DZ8-2R;
	Fri, 01 Mar 2024 05:29:56 +0000
Date: Fri, 1 Mar 2024 13:29:40 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Brendan Higgins <brendanhiggins@google.com>,
	David Gow <davidgow@google.com>, Kees Cook <keescook@chromium.org>,
	Rae Moar <rmoar@google.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Alan Maguire <alan.maguire@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	James Morris <jamorris@linux.microsoft.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>,
	Marco Pagani <marpagan@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thara Gopinath <tgopinath@microsoft.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Zahra Tarkhani <ztarkhani@microsoft.com>, kvm@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-um@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH v1 1/8] kunit: Run tests when the kernel is fully setup
Message-ID: <202403011330.telj6BqQ-lkp@intel.com>
References: <20240229170409.365386-2-mic@digikod.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240229170409.365386-2-mic@digikod.net>

Hi Mickaël,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d206a76d7d2726f3b096037f2079ce0bd3ba329b]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/kunit-Run-tests-when-the-kernel-is-fully-setup/20240301-011020
base:   d206a76d7d2726f3b096037f2079ce0bd3ba329b
patch link:    https://lore.kernel.org/r/20240229170409.365386-2-mic%40digikod.net
patch subject: [PATCH v1 1/8] kunit: Run tests when the kernel is fully setup
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240301/202403011330.telj6BqQ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403011330.telj6BqQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011330.telj6BqQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/kunit/executor.c:18:31: warning: 'final_suite_set' defined but not used [-Wunused-variable]
      18 | static struct kunit_suite_set final_suite_set = {};
         |                               ^~~~~~~~~~~~~~~


vim +/final_suite_set +18 lib/kunit/executor.c

    17	
  > 18	static struct kunit_suite_set final_suite_set = {};
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
