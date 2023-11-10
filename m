Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D413C154BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 23:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RucS1Ywr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699658792; x=1731194792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cp4uLryiV6ximBuC3YLNsfXVAwtEgLKZ9lrsviUNxew=;
  b=RucS1YwriZc2JpuoQpehHrJhKyb0yKrSUGJnJD9+BIEJkLCgncWtSIc1
   WcLMfTKHwZDIeFSTplHI38NjijAEwzNeIoSVtlOYNhj516418N9unEXGZ
   EW7hIf0/P5L+LEngQPVpLeu0z0xR5U+OT5Eu7cyeyMWv1dpQE8Ej1P77x
   HM5Muk010s3QdxmxXQPiiOb0u8eDXjk/8fKWDlfpRO6JdexfkXbySAXnm
   AUYO45S8oaXpc8vg9CNm7tKa38Ry25ccJ1z8la+amk2+fLvSWUaYtA2SP
   26nPb8p6/OgqkLC4tq4Yvk1wrsSwSzHZ+T/QgYHDEzPHC5dFsAXwsFE/5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="375274642"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="375274642"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 15:26:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="937274497"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="937274497"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Nov 2023 15:26:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1atQ-000A1C-1s;
	Fri, 10 Nov 2023 23:26:28 +0000
Date: Sat, 11 Nov 2023 07:26:07 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Hruska <lhruska@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/4 v1] crash/vmcore: VMCOREINFO creation from
 non-kdump kernel
Message-ID: <202311110746.PACzMVRq-lkp@intel.com>
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
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/x86/mm linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Hruska/crash-vmcore-VMCOREINFO-creation-from-non-kdump-kernel/20231111-022332
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20231110150057.15717-2-lhruska%40suse.cz
patch subject: [RFC PATCH 1/4 v1] crash/vmcore: VMCOREINFO creation from non-kdump kernel
config: loongarch-randconfig-002-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110746.PACzMVRq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110746.PACzMVRq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110746.PACzMVRq-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/crash_dump.c: In function 'elfcorehdr_read_notes':
>> kernel/crash_dump.c:77:25: error: implicit declaration of function 'cc_platform_has' [-Werror=implicit-function-declaration]
      77 |                         cc_platform_has(CC_ATTR_MEM_ENCRYPT));
         |                         ^~~~~~~~~~~~~~~
>> kernel/crash_dump.c:77:41: error: 'CC_ATTR_MEM_ENCRYPT' undeclared (first use in this function)
      77 |                         cc_platform_has(CC_ATTR_MEM_ENCRYPT));
         |                                         ^~~~~~~~~~~~~~~~~~~
   kernel/crash_dump.c:77:41: note: each undeclared identifier is reported only once for each function it appears in
   kernel/crash_dump.c:78:1: warning: control reaches end of non-void function [-Wreturn-type]
      78 | }
         | ^
   cc1: some warnings being treated as errors


vim +/cc_platform_has +77 kernel/crash_dump.c

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
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
