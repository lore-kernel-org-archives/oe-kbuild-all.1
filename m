Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFEEA471
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Nov 2022 20:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667940543; x=1699476543;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Z7hz98bMIwelH5DxWjEgIQYvnXqKXzbCkcsLZx20YMc=;
  b=ZAyF69+acejjzkCpzfPp3ql8cQC/tL/NWsHqpNdnxD8ZSaNS1Zc/0Cow
   C6wfZICfvxjK1qheMD6OeC88VBlMax7YePvHPdXoFG6Qnf/q0H0mCBzeV
   1UnibHgYnCs/Q0RMrok1qEAjlUrlljvMwK9NUZ88i8wFkKLVYuXBrFvGr
   rtV5UEWJxF6a/Giay8f/l8d0hZCLaX9qjywqBr46kSkg6K8VU2gm5LVWs
   dcZxEjOjXY8MiEhGWQFYCIb3WaFl19+X/fGYcHOs/jJZh6iduYJz9UiNq
   hWME/8PlcahbN9z/Q0JwmeE8eO/dU2VPuhHvmdy4RAwOJnVp0RZv4NODD
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="310804314"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; 
   d="scan'208";a="310804314"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 12:49:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="669689462"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; 
   d="scan'208";a="669689462"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Nov 2022 12:49:01 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1osVWm-0000c0-1U;
	Tue, 08 Nov 2022 20:49:00 +0000
Date: Wed, 9 Nov 2022 04:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+115 bytes kernel size regression] [i386-tinyconfig]
 [0309f16088] mm: delay page_remove_rmap() until after the TLB has been
 flushed
Message-ID: <Y2rAuDLUYk+QcJal@2d882e5f7ced>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108194139.57604-4-torvalds@linux-foundation.org>


FYI, we noticed a +115 bytes kernel size regression due to commit:

commit: 0309f160889482100fd90a49f93b0ef49d58f128 (mm: delay page_remove_rmap() until after the TLB has been flushed)
url: https://github.com/intel-lab-lkp/linux/commits/Linus-Torvalds/mm-introduce-encoded-page-pointers-with-embedded-extra-bits/20221109-034318
base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
patch subject: [PATCH 4/4] mm: delay page_remove_rmap() until after the TLB has been flushed


Details as below (size data is obtained by `nm --size-sort vmlinux`):

9b569da9: mm: mmu_gather: prepare to gather encoded page pointers with flags
0309f160: mm: delay page_remove_rmap() until after the TLB has been flushed

+------------------------------+----------+----------+-------+
|            symbol            | 9b569da9 | 0309f160 | delta |
+------------------------------+----------+----------+-------+
| bzImage                      | 491712   | 491840   | 128   |
| nm.T.tlb_flush_rmaps         | 0        | 50       | 50    |
| nm.t.zap_pte_range           | 561      | 610      | 49    |
| nm.T.__tlb_remove_page_size  | 98       | 106      | 8     |
| nm.t.tlb_flush_mmu_tlbonly   | 124      | 129      | 5     |
| nm.T.tlb_flush_mmu           | 168      | 173      | 5     |
| nm.T.___pte_free_tlb         | 48       | 51       | 3     |
| nm.t.change_protection_range | 416      | 414      | -2    |
| nm.T.unmap_page_range        | 268      | 265      | -3    |
+------------------------------+----------+----------+-------+



Thanks


