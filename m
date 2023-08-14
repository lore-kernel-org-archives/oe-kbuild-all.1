Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DD2C137
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 16:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692032252; x=1723568252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0LWbnAzO+cSBOBo5n+pT2/MqTkVVq1EQMemLIar6X2w=;
  b=A533aZQZewmMtUjh2iNiVGP0WPYm/ch4YQ/riURJpYZMauez7rHOXsjY
   wQD4RFxr2yLFtnxVQ0orOfgP+JGsSPo6ab/qvdELoXr+c53NR2DJR7k9N
   BThHuQi+wnC9mtc6Iwkb1VyQ4t8e0ehQeZjoZgCAhm8pe063WIQ4sqi58
   I0neyxHG0N8dJtkV+s5AQ5SOKs8qp9mgUoVUMqAmiNxvZbfgJNMN7iwiu
   WhdHxbGM7GvrG3fpjZnWM6GSNoV9EGbAaGIwidRAlK8PP55DfJandn0nx
   cddBsapeQZc6A5MjsYoWa96gINRJu836TN6XDQb61eDWUuj3kvVqmv5Xl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="458448585"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="458448585"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 09:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="683372416"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="683372416"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Aug 2023 09:57:27 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVash-0000Ib-25;
	Mon, 14 Aug 2023 16:57:27 +0000
Date: Tue, 15 Aug 2023 00:57:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] iov_iter: Convert iterate*() to inline funcs
Message-ID: <202308150047.KCr8lu3v-lkp@intel.com>
References: <3710261.1691764329@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3710261.1691764329@warthog.procyon.org.uk>

Hi David,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5-rc6]
[cannot apply to hch-configfs/for-next next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/iov_iter-Convert-iterate-to-inline-funcs/20230811-224036
base:   linus/master
patch link:    https://lore.kernel.org/r/3710261.1691764329%40warthog.procyon.org.uk
patch subject: [RFC PATCH] iov_iter: Convert iterate*() to inline funcs
config: x86_64-randconfig-x063-20230814 (https://download.01.org/0day-ci/archive/20230815/202308150047.KCr8lu3v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150047.KCr8lu3v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150047.KCr8lu3v-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/iov_iter.c:423:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got void [noderef] __user *iter_to @@
   lib/iov_iter.c:423:39: sparse:     expected void *to
   lib/iov_iter.c:423:39: sparse:     got void [noderef] __user *iter_to
   lib/iov_iter.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   lib/iov_iter.c: note: in included file:
   include/net/checksum.h:33:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:33:39: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:33:39: sparse:     got unsigned int
   include/net/checksum.h:41:45: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:41:45: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:41:45: sparse:     got unsigned int
   lib/iov_iter.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression

vim +423 lib/iov_iter.c

   415	
   416	#ifdef CONFIG_ARCH_HAS_COPY_MC
   417	static size_t copy_to_user_iter_mc(void __user *iter_to, size_t progress,
   418					   size_t len, void *from, __wsum *csum)
   419	{
   420		if (access_ok(iter_to, len)) {
   421			from += progress;
   422			instrument_copy_to_user(iter_to, from, len);
 > 423			len = copy_mc_to_user(iter_to, from, len);
   424		}
   425		return len;
   426	}
   427	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
