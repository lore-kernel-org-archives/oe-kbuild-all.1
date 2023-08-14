Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F892F44
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 16:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692031646; x=1723567646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S7eU2LOm69b6N0VWuLzfYtL5YuHAqcaGU/A4NisiWDg=;
  b=Ld/kVleI/Frwm1skEqqx6Z3vLrW8wtGiWcoa08hnIxPDuZbRM/M2Rc1W
   hLtAo4eGuWSDZEh/JgAMVRnn5A1TtCLF8bQuwpriZrvi15Vvygx3NAS+5
   Qw+Dy8lO6qz3Ll0lij4iRuQbEM1KKmTl5AFRiQXtaqo87Mk/e2Lh/APoz
   nr5wdePyRKz28n7XvQ141d/KABa2VlJYyPCJ1Gw+d9AXBOVhUAKS5VVc8
   N+PP4cgnuYXCDsD6S2RIXDKP2zvwed5qG/O2qDahgrZ94jbNy3PzZJgqS
   jy0GqV/5NU4G2ALO2RBsOLCHl65Dg/zD1HdeZ2vozb06HNboRSXwzk+Qw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="357048082"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="357048082"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 09:47:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="733517796"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="733517796"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Aug 2023 09:47:15 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVaip-0000IB-24;
	Mon, 14 Aug 2023 16:47:15 +0000
Date: Tue, 15 Aug 2023 00:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] iov_iter: Convert iterate*() to inline funcs
Message-ID: <202308150012.tLtBLImx-lkp@intel.com>
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
[cannot apply to next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/iov_iter-Convert-iterate-to-inline-funcs/20230811-224036
base:   linus/master
patch link:    https://lore.kernel.org/r/3710261.1691764329%40warthog.procyon.org.uk
patch subject: [RFC PATCH] iov_iter: Convert iterate*() to inline funcs
config: mips-randconfig-r091-20230814 (https://download.01.org/0day-ci/archive/20230815/202308150012.tLtBLImx-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150012.tLtBLImx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150012.tLtBLImx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/iov_iter.c:162:32: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> lib/iov_iter.c:162:32: sparse:    unsigned int *
>> lib/iov_iter.c:162:32: sparse:    unsigned long *
>> lib/iov_iter.c:162:32: sparse: sparse: cannot size expression

vim +162 lib/iov_iter.c

   133	
   134	static __always_inline
   135	size_t iterate_xarray(struct iov_iter *iter, size_t len, void *priv, __wsum *csum,
   136			      iov_step_f step)
   137	{
   138		struct folio *folio;
   139		size_t progress = 0;
   140		loff_t start = iter->xarray_start + iter->iov_offset;
   141		pgoff_t index = start / PAGE_SIZE;
   142		XA_STATE(xas, iter->xarray, index);
   143	
   144		rcu_read_lock();
   145		xas_for_each(&xas, folio, ULONG_MAX) {
   146			size_t remain, consumed, offset, part, flen;
   147	
   148			if (xas_retry(&xas, folio))
   149				continue;
   150			if (WARN_ON(xa_is_value(folio)))
   151				break;
   152			if (WARN_ON(folio_test_hugetlb(folio)))
   153				break;
   154	
   155			offset = offset_in_folio(folio, start);
   156			flen = min(folio_size(folio) - offset, len);
   157			start += flen;
   158	
   159			while (flen) {
   160				void *base = kmap_local_folio(folio, offset);
   161	
 > 162				part = min(flen, PAGE_SIZE - offset_in_page(offset));
   163				remain = step(base, progress, part, priv, csum);
   164				kunmap_local(base);
   165	
   166				consumed = part - remain;
   167				progress += consumed;
   168				len -= consumed;
   169	
   170				if (remain || len == 0)
   171					goto out;
   172				flen -= consumed;
   173				offset += consumed;
   174			}
   175		}
   176	
   177	out:
   178		rcu_read_unlock();
   179		iter->iov_offset += progress;
   180		iter->count -= progress;
   181		return progress;
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
