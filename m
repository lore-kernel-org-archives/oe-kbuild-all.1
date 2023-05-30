Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384D712B9C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 09:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685439203; x=1716975203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=05BdlmfEmHrP3826u78d0bwZDk474BhNjCAib6bQs+I=;
  b=i5OcEsFlZntQ9OvKi7B0Uvc7MgrYOImQmSdvVSo36OBEE+he24g8J4so
   cFOuMyGkbzj3Fwn/KyXABfzEWSspJPogvjVDoOmSvy8TEloksEDvNzx7D
   9kwe9OZG4Xgs2GTEm7HPIz86zvawCtmzoED2ckFew6tk8/PJ+OnpZEOhx
   njjb/QOtOnj8Hr+JkvSWpXSkBrQGqYC7A9HT8mtCA7/FSKuggQU3tifpZ
   twM0N0sGuBrD3NasE/8X6oFLv2URlo1+66SGSZKHj4pA5s5cOwYm4RERl
   9gy0VBmtP0yHkxg7WCtQJdwu/DUqLjVyxW2boD8vQDUStHesO9A82fR66
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="354877284"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="354877284"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 02:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="656775530"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="656775530"
Received: from lkp-server01.sh.intel.com (HELO fd90924b3b99) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 May 2023 02:33:19 -0700
Received: from kbuild by fd90924b3b99 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3vjC-0000Fi-0P;
	Tue, 30 May 2023 09:33:18 +0000
Date: Tue, 30 May 2023 17:32:31 +0800
From: kernel test robot <lkp@intel.com>
To: jeffxu@chromium.org, dave.hansen@intel.com, luto@kernel.org,
	jorgelo@chromium.org, keescook@chromium.org, groeck@chromium.org,
	jannh@google.com, sroettger@google.com
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	jeffxu@google.com, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v1 4/6] PKEY:selftest pkey_enforce_api for mprotect
Message-ID: <202305301758.ddYd6um5-lkp@intel.com>
References: <20230519011915.846407-5-jeffxu@chromium.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519011915.846407-5-jeffxu@chromium.org>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ba0ad6ed89fd5dada3b7b65ef2b08e95d449d4ab]

url:    https://github.com/intel-lab-lkp/linux/commits/jeffxu-chromium-org/PKEY-Introduce-PKEY_ENFORCE_API-flag/20230519-093355
base:   ba0ad6ed89fd5dada3b7b65ef2b08e95d449d4ab
patch link:    https://lore.kernel.org/r/20230519011915.846407-5-jeffxu%40chromium.org
patch subject: [PATCH v1 4/6] PKEY:selftest pkey_enforce_api for mprotect
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/ee635a3d72bf9f400d3542d27d1df9d2813640dc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review jeffxu-chromium-org/PKEY-Introduce-PKEY_ENFORCE_API-flag/20230519-093355
        git checkout ee635a3d72bf9f400d3542d27d1df9d2813640dc
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305301758.ddYd6um5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from pkey_enforce_api.c:72:
   pkey-x86.h: In function 'expect_fault_on_read_execonly_key':
>> pkey-x86.h:165:13: warning: variable 'ptr_contents' set but not used [-Wunused-but-set-variable]
     165 |         int ptr_contents;
         |             ^~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
