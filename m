Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E633215A0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 05:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693372939; x=1724908939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kYOyUSCKV4OCRc1jJMdOCgyEKAMUJAvBetM21DGD1JE=;
  b=X9fYdm7wkZ4jhs++FB7MN/O7oRKvahn4ock8b9HDLdsNJqZsxdYeKF0l
   ctfxcT4eD6S/ioua5Y3CjxJiYuAzWx0aCrKsRU44JCkHL6eUcaapwqR/G
   kyQ0FzKC6YjFIXKw/8Gerbuw5kzVs4YhmZWXcKl7pcJkqYt2vvuCnjm4t
   o9SS7VID9wwYD5+wBvp8Im6wceDlf1pzDKBEH71/+csPZyM4TlrzIMZYx
   g7CrLjZ8qO5euXfdmFV0h87LfWJbYftituZKLzAClOlFpkTgGcVY6J4nt
   mwoNoyRVdnLAmGXyPvQrxkSkvwYoI25aX4rRYQrf074JfIP7F0wLBU/7A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="461927345"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="461927345"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 22:22:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="773983116"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="773983116"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Aug 2023 22:22:16 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbDeX-0009SF-0Q;
	Wed, 30 Aug 2023 05:22:10 +0000
Date: Wed, 30 Aug 2023 13:21:39 +0800
From: kernel test robot <lkp@intel.com>
To: Justin Stitt <justinstitt@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] init: fix -Wmissing-variable-declarations warning
Message-ID: <202308301325.eISSynqc-lkp@intel.com>
References: <20230829-missingvardecl-init-main-c-v1-1-ddf0f1a71215@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829-missingvardecl-init-main-c-v1-1-ddf0f1a71215@google.com>

Hi Justin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 706a741595047797872e669b3101429ab8d378ef]

url:    https://github.com/intel-lab-lkp/linux/commits/Justin-Stitt/init-fix-Wmissing-variable-declarations-warning/20230830-074037
base:   706a741595047797872e669b3101429ab8d378ef
patch link:    https://lore.kernel.org/r/20230829-missingvardecl-init-main-c-v1-1-ddf0f1a71215%40google.com
patch subject: [PATCH RFC] init: fix -Wmissing-variable-declarations warning
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230830/202308301325.eISSynqc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301325.eISSynqc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301325.eISSynqc-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: init/do_mounts_initrd.o: in function `handle_initrd':
>> do_mounts_initrd.c:(.init.text+0x1ec): undefined reference to `envp_init'
>> arm-linux-gnueabi-ld: do_mounts_initrd.c:(.init.text+0x1f0): undefined reference to `envp_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
