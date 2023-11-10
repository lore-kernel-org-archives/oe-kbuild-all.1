Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0886E3C695
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 21:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwm2UC9z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699653404; x=1731189404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PouTC5QeZER28FIBbwSGTeb4c3TPWPuG1KoD3cbPcwg=;
  b=dwm2UC9zdxpuMtZBqGkz6Ss2+o8MvtbgsES61+FhmhTeJkrEiIVqtvK+
   MQn6Rzg0N1cp0WQe2Kc8Bkvw3e3+sG2YWBvigHoDZJfgBr3PwvbbC6PAn
   GNAmGOPa2iTsWnVwcIpAbFkbV/s48ZTgEvpXCXI2am89/O/qcpTq3HOOr
   bsT2VbwdjEWhMVHW1ewmCRMUkw0E2IvmHBozPe9l3XwaPdcoK++9Acggj
   qp8J+mHqUIuTLsSPA1+N6POzysxrqxuY55EBA6iH+ILAzKn4d4LK9EvB2
   TWLvNiG639Tk/Fc5q/R5IsNmVFv1GIAEWWmMwKdLzEiZiQDZ4BqVm3Fn0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="370439546"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="370439546"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 13:56:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="757299346"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="757299346"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Nov 2023 13:56:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ZUV-0009wc-0T;
	Fri, 10 Nov 2023 21:56:39 +0000
Date: Sat, 11 Nov 2023 05:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Hruska <lhruska@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/4 v1] crash/vmcore: VMCOREINFO creation from
 non-kdump kernel
Message-ID: <202311110545.vOE0m9Y8-lkp@intel.com>
References: <20231110150057.15717-2-lhruska@suse.cz>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110150057.15717-2-lhruska@suse.cz>

Hi Lukas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/x86/mm linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Hruska/crash-vmcore-VMCOREINFO-creation-from-non-kdump-kernel/20231111-022332
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20231110150057.15717-2-lhruska%40suse.cz
patch subject: [RFC PATCH 1/4 v1] crash/vmcore: VMCOREINFO creation from non-kdump kernel
config: loongarch-randconfig-002-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110545.vOE0m9Y8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110545.vOE0m9Y8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110545.vOE0m9Y8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/crash_dump.c: In function 'elfcorehdr_read_notes':
   kernel/crash_dump.c:77:25: error: implicit declaration of function 'cc_platform_has' [-Werror=implicit-function-declaration]
      77 |                         cc_platform_has(CC_ATTR_MEM_ENCRYPT));
         |                         ^~~~~~~~~~~~~~~
   kernel/crash_dump.c:77:41: error: 'CC_ATTR_MEM_ENCRYPT' undeclared (first use in this function)
      77 |                         cc_platform_has(CC_ATTR_MEM_ENCRYPT));
         |                                         ^~~~~~~~~~~~~~~~~~~
   kernel/crash_dump.c:77:41: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/crash_dump.c:78:1: warning: control reaches end of non-void function [-Wreturn-type]
      78 | }
         | ^
   cc1: some warnings being treated as errors


vim +78 kernel/crash_dump.c

    60	
    61	/*
    62	 * Architectures may override this function to read from notes sections
    63	 */
    64	ssize_t __weak elfcorehdr_read_notes(char *buf, size_t count, u64 *ppos)
    65	{
    66		struct kvec kvec = { .iov_base = buf, .iov_len = count };
    67		struct iov_iter iter;
    68	
    69		if (!is_kdump_kernel()) {
    70			memcpy(buf, __va(*ppos), count);
    71			return count;
    72		}
    73	
    74		iov_iter_kvec(&iter, ITER_DEST, &kvec, 1, count);
    75	
    76		return read_from_oldmem(&iter, count, ppos,
  > 77				cc_platform_has(CC_ATTR_MEM_ENCRYPT));
  > 78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
