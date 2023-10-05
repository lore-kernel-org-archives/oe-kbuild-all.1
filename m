Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0B9EA2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 00:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5wbkvT8"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696467310; x=1728003310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GAiPZNkIH1f+2uGhotdsmvgn7jGQAxXlXPW572it6Gs=;
  b=S5wbkvT8S1zT4xU2uPGKs5tdfAA2nddnMVsuz3r6gcv/Ze7//5RMqNu6
   hjrCJQ7RecZx78vlJBAnnRcaAh7v2/CnCBSdkGDuauHywGTeZJcIF1bUl
   snMj5u5LnbbA827Plhr6fWPa+gs2/REhiKlUbKLIF2cnnSzB9h9yBmw9+
   BjhyS+4XEhx0TYQwXXf4Fc8m2I2obRHiydZ6TwRhkHO8QElBGd9qNaQQp
   lF99axfCD8mq/pVW8Ic6NKjUAHgsvuaCFGqZ9dEaZsGfeK2JwvTEX5GYH
   FfrWP82yjXFe619QexUv6GWfsUgnPbxPIvtADlgb91i3lHEOyR7BvZJ9p
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="447538997"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="447538997"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 17:52:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="998736571"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="998736571"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 04 Oct 2023 17:52:26 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoCbF-000Kou-08;
	Thu, 05 Oct 2023 00:52:22 +0000
Date: Thu, 5 Oct 2023 08:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 1/3] x86/boot/e820: Expose kexec range update,
 remove and table update functions
Message-ID: <202310050834.yzvi1BYv-lkp@intel.com>
References: <169645819587.11424.5389114333710932782.stgit@skinsburskii.>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169645819587.11424.5389114333710932782.stgit@skinsburskii.>

Hi Stanislav,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/master linus/master tip/auto-latest v6.6-rc4 next-20231004]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Kinsburskii/x86-boot-e820-Expose-kexec-range-update-remove-and-table-update-functions/20231005-062443
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/169645819587.11424.5389114333710932782.stgit%40skinsburskii.
patch subject: [RFC PATCH v3 1/3] x86/boot/e820: Expose kexec range update, remove and table update functions
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20231005/202310050834.yzvi1BYv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050834.yzvi1BYv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050834.yzvi1BYv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/e820.c:540:12: warning: no previous prototype for '__e820__range_remove' [-Wmissing-prototypes]
     540 | u64 __init __e820__range_remove(struct e820_table *table, u64 start, u64 size, enum e820_type old_type, bool check_type)
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/__e820__range_remove +540 arch/x86/kernel/e820.c

   539	
 > 540	u64 __init __e820__range_remove(struct e820_table *table, u64 start, u64 size, enum e820_type old_type, bool check_type)
   541	{
   542		int i;
   543		u64 end;
   544		u64 real_removed_size = 0;
   545	
   546		if (size > (ULLONG_MAX - start))
   547			size = ULLONG_MAX - start;
   548	
   549		end = start + size;
   550		printk(KERN_DEBUG "e820: remove [mem %#010Lx-%#010Lx] ", start, end - 1);
   551		if (check_type)
   552			e820_print_type(old_type);
   553		pr_cont("\n");
   554	
   555		for (i = 0; i < table->nr_entries; i++) {
   556			struct e820_entry *entry = &table->entries[i];
   557			u64 final_start, final_end;
   558			u64 entry_end;
   559	
   560			if (check_type && entry->type != old_type)
   561				continue;
   562	
   563			entry_end = entry->addr + entry->size;
   564	
   565			/* Completely covered? */
   566			if (entry->addr >= start && entry_end <= end) {
   567				real_removed_size += entry->size;
   568				memset(entry, 0, sizeof(*entry));
   569				continue;
   570			}
   571	
   572			/* Is the new range completely covered? */
   573			if (entry->addr < start && entry_end > end) {
   574				e820__range_add(end, entry_end - end, entry->type);
   575				entry->size = start - entry->addr;
   576				real_removed_size += size;
   577				continue;
   578			}
   579	
   580			/* Partially covered: */
   581			final_start = max(start, entry->addr);
   582			final_end = min(end, entry_end);
   583			if (final_start >= final_end)
   584				continue;
   585	
   586			real_removed_size += final_end - final_start;
   587	
   588			/*
   589			 * Left range could be head or tail, so need to update
   590			 * the size first:
   591			 */
   592			entry->size -= final_end - final_start;
   593			if (entry->addr < final_start)
   594				continue;
   595	
   596			entry->addr = final_end;
   597		}
   598		return real_removed_size;
   599	}
   600	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
