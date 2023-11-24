Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8649320B0D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWaLgv6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700832082; x=1732368082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YBu33gyDzpFS19gtf1YvRqlEcr+xRwDlgCwrqg5C7xw=;
  b=jWaLgv6GUSSstbfRSaCRKxDC495iuN9GsNU/pKbUWkClX/5Se8YTenSr
   qe7cIHiv4JnOt/T14m7KBLjqa3KK6EDNoI2Fey3HsRsHuM9i94cfahcH1
   5JudWLJEHnSJehpO1KTqz731iKyzG4aJl2bLe+Pmq48VeuqkwqIQvFhEo
   3y7cJzMf7HUSNGgcDNAdJuVY/zpWPwlQbus43DbF7OIH+tPoJRRPnZpak
   3GuD0BmDKr2G09bolm/3F7vEJGIzheWRpteiaIu6vi2VeQOfG4uOfQInH
   n/eE2BtcVmI55c+v75gKvpqJgVfV2zcgQRw3LCG01l1xA06bkGgc2A8vo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="456765169"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="456765169"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 05:20:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="767477151"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="767477151"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Nov 2023 05:20:30 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6W6e-0002o5-0N;
	Fri, 24 Nov 2023 13:20:28 +0000
Date: Fri, 24 Nov 2023 21:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Gao <wegao@suse.com>, tglx@linutronix.de, mingo@redhat.com,
	peterz@infradead.org, dvhart@infradead.org, dave@stgolabs.net,
	andrealmeid@igalia.com, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, wei gao <wegao@suse.com>
Subject: Re: [PATCH v1] futex: Add compat_sys_futex_waitv for 32bit
 compatibility
Message-ID: <202311241440.BxBAsQ2i-lkp@intel.com>
References: <20231123053140.16062-1-wegao@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123053140.16062-1-wegao@suse.com>

Hi Wei,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/asm]
[also build test ERROR on tip/locking/core linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Gao/futex-Add-compat_sys_futex_waitv-for-32bit-compatibility/20231123-133427
base:   tip/x86/asm
patch link:    https://lore.kernel.org/r/20231123053140.16062-1-wegao%40suse.com
patch subject: [PATCH v1] futex: Add compat_sys_futex_waitv for 32bit compatibility
config: x86_64-buildonly-randconfig-005-20231123 (https://download.01.org/0day-ci/archive/20231124/202311241440.BxBAsQ2i-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241440.BxBAsQ2i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241440.BxBAsQ2i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: arch/x86/entry/syscall_32.o:(.rodata+0xe08): undefined reference to `__ia32_compat_sys_futex_waitv'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
