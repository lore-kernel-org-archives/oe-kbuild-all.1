Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8981129BDBD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 04:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772856347; cv=none; b=sXZ9G4yBacxSe2yfu7hHbAmBk+BcdCjUMKYpXJFNCVKh2wTmG0ekArqflFr48zcXHhx+upJtBuq000mTtX4IDZDm5IepDaFllhLSQQyGkRgvzRtKnb2pliSJIOuylYMtah2Y7ve4P1Ulxi91a7+EHNt102Kr+asWxygduEl6DDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772856347; c=relaxed/simple;
	bh=1cCEN1RDGkPD8ziDuZ9SIMWTLmlNebYbtgy9cPF7KL4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bxikHEqqyo4/RxJL2YUcQKPRhlBb2myHcYmgwqolc/VYyJwEFMppiU5sh+QJ5S0tcvRvdrgDhS3oUEWQKtAV6mn6GltHxRjV7zS3i5jR0sRHt9pfvd4bSM+blcmk3e363Oun88m0SajMvcQ0ttNPyFczDa95yvCQBUTVKwDKry0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKO5rUF2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKO5rUF2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772856347; x=1804392347;
  h=date:from:to:cc:subject:message-id;
  bh=1cCEN1RDGkPD8ziDuZ9SIMWTLmlNebYbtgy9cPF7KL4=;
  b=lKO5rUF2rv2AieKmkyfKlyzlabzeWt6aTo+64JtZHtONcq+8VeIF43J3
   vBG5r0M4STFzanSPzf/8BWu125hIZiJs3WJxKMeTaDDwXI27TyN17gVvH
   kNr5ZH2FbXhjGSm5AbnMf6MCrjM2/q1lFshsX0xKVMT20S1Mnc+3P4l5N
   8uPPcsfhsO7Ew1IpLSzbTWWydsd6J2i6ViDsjAYA7WOZ4nAjfrP0DxMoU
   famxPNtGO1H7PJTcX98xsrBfW0gS/TmiUk0t5BCa9nkmmKLCmSh792jSv
   8t7IXzF5YkLaUVYB1wXhB95hjfEqfi9+cDsn6BTMkEgXp67urQw2JVN59
   A==;
X-CSE-ConnectionGUID: l4DzSdtIQfGVBxU3doIFKQ==
X-CSE-MsgGUID: j5FcbWGFSzSdpx08vaQ/ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77814835"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="77814835"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 20:05:46 -0800
X-CSE-ConnectionGUID: ZAtUPhWvQtWdEBsLscnjcw==
X-CSE-MsgGUID: 6r9fz7ASRgq2pd3LY5mOdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="224151074"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Mar 2026 20:05:44 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyiv3-000000001fd-0cdR;
	Sat, 07 Mar 2026 04:05:37 +0000
Date: Sat, 07 Mar 2026 12:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jianhui Zhou <jianhuizzzzz@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 34/207]
 include/linux/hugetlb.h:1214:16: error: implicit declaration of function
 'linear_page_index'
Message-ID: <202603071127.YdvMepoW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   49cb736d092aaa856283e33b78ec3afb3964d82f
commit: cd9119a9480d9d93fdf06792f8f9917cc4f9999c [34/207] mm/userfaultfd: fix hugetlb fault mutex hash calculation
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260307/202603071127.YdvMepoW-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071127.YdvMepoW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071127.YdvMepoW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/rsrc.c:9:
   include/linux/hugetlb.h: In function 'vma_hugecache_offset':
>> include/linux/hugetlb.h:1214:16: error: implicit declaration of function 'linear_page_index' [-Werror=implicit-function-declaration]
    1214 |         return linear_page_index(vma, address);
         |                ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from mm/show_mem.c:12:
   include/linux/hugetlb.h: In function 'vma_hugecache_offset':
>> include/linux/hugetlb.h:1214:16: error: implicit declaration of function 'linear_page_index' [-Werror=implicit-function-declaration]
    1214 |         return linear_page_index(vma, address);
         |                ^~~~~~~~~~~~~~~~~
   In file included from include/linux/swap.h:13,
                    from mm/show_mem.c:15:
   include/linux/pagemap.h: At top level:
>> include/linux/pagemap.h:1079:23: error: conflicting types for 'linear_page_index'; have 'long unsigned int(const struct vm_area_struct *, const long unsigned int)'
    1079 | static inline pgoff_t linear_page_index(const struct vm_area_struct *vma,
         |                       ^~~~~~~~~~~~~~~~~
   In file included from mm/show_mem.c:12:
   include/linux/hugetlb.h:1214:16: note: previous implicit declaration of 'linear_page_index' with type 'int()'
    1214 |         return linear_page_index(vma, address);
         |                ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/linear_page_index +1214 include/linux/hugetlb.h

  1210	
  1211	static inline pgoff_t vma_hugecache_offset(struct hstate *h,
  1212			struct vm_area_struct *vma, unsigned long address)
  1213	{
> 1214		return linear_page_index(vma, address);
  1215	}
  1216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
