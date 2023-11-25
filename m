Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C5231584
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 22:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nD2pWN5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700951209; x=1732487209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z2qF1yxkjQxwNjJSlS7e6s6wsk55BfzArxL0w4u/DX8=;
  b=nD2pWN5ljH9dt+zDf40ZG7gsZx8sNZDfergEga2hitUyziebaWl4MASx
   Tr/ZWJy2l54eIdOiXm3TdFs326nUtWQtQxGZqDBdZ8PgAgisWqqIA3xlq
   ir9OizmKwUspKjOVPfh22thUxkBzwYa3DJVqGtm4eD3yQCWJY3P0JOob9
   nygrtSc8QnX0BpIFp9YJinu91zenE+tA2QKoR23iw5+EIaUwiVs0HqtTo
   mPeWZJkxpISeezWMpEB0LCVG8Ydst7xnqxfzNaIr+psB4fwpKDMGTJkeq
   241o6FhzCBPm8+zCn52KSfRWCbSny6VFsoyz0ekECfeWPTJTUh7OsWHLy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="389691511"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="389691511"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 14:26:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="767781166"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="767781166"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Nov 2023 14:26:44 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r716o-0004Tg-1P;
	Sat, 25 Nov 2023 22:26:42 +0000
Date: Sun, 26 Nov 2023 06:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Tao <rtoax@foxmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Florent Revest <revest@chromium.org>,
	Kees Cook <keescook@chromium.org>,
	David Hildenbrand <david@redhat.com>,
	Stefan Roesch <shr@devkernel.io>, Andy Chiu <andy.chiu@sifive.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Joey Gouly <joey.gouly@arm.com>, Oleg Nesterov <oleg@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Ondrej Mosnacek <omosnace@redhat.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	rtoax@foxmail.com, rongtao@cestc.cn
Subject: Re: [PATCH] prctl: Get private anonymous memory region name
Message-ID: <202311260535.WXAlmfsl-lkp@intel.com>
References: <tencent_977CBF8E8CA6234A1B740A35655D5D7EAA0A@qq.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_977CBF8E8CA6234A1B740A35655D5D7EAA0A@qq.com>

Hi Rong,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Tao/prctl-Get-private-anonymous-memory-region-name/20231125-220925
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/tencent_977CBF8E8CA6234A1B740A35655D5D7EAA0A%40qq.com
patch subject: [PATCH] prctl: Get private anonymous memory region name
config: x86_64-randconfig-122-20231126 (https://download.01.org/0day-ci/archive/20231126/202311260535.WXAlmfsl-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260535.WXAlmfsl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260535.WXAlmfsl-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sys.c: In function 'prctl_get_vma':
>> kernel/sys.c:2371:3: error: a label can only be part of a statement and a declaration is not a statement
    2371 |   const struct anon_vma_name *anon_name = NULL;
         |   ^~~~~
   kernel/sys.c:2389:21: warning: passing argument 1 of 'anon_vma_name_put' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2389 |   anon_vma_name_put(anon_name);
         |                     ^~~~~~~~~
   In file included from kernel/sys.c:10:
   include/linux/mm_inline.h:363:60: note: expected 'struct anon_vma_name *' but argument is of type 'const struct anon_vma_name *'
     363 | static inline void anon_vma_name_put(struct anon_vma_name *anon_name)
         |                                      ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~


vim +2371 kernel/sys.c

  2361	
  2362	static int prctl_get_vma(unsigned long opt, unsigned long addr,
  2363				 unsigned long buf, unsigned long arg)
  2364	{
  2365		struct mm_struct *mm = current->mm;
  2366		const char __user *u_buf;
  2367		int error;
  2368	
  2369		switch (opt) {
  2370		case PR_GET_VMA_ANON_NAME:
> 2371			const struct anon_vma_name *anon_name = NULL;
  2372	
  2373			u_buf = (const char __user *)buf;
  2374			error = 0;
  2375	
  2376			mmap_read_lock(mm);
  2377			anon_name = madvise_get_anon_name(mm, addr);
  2378			if (!anon_name) {
  2379				mmap_read_unlock(mm);
  2380				error = -EFAULT;
  2381				break;
  2382			}
  2383	
  2384			if (copy_to_user((char __user *)u_buf, anon_name->name,
  2385					 strlen(anon_name->name) + 1))
  2386				error = -EFAULT;
  2387	
  2388			mmap_read_unlock(mm);
  2389			anon_vma_name_put(anon_name);
  2390			break;
  2391		default:
  2392			error = -EINVAL;
  2393		}
  2394		return error;
  2395	}
  2396	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
