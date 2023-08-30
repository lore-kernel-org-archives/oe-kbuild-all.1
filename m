Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3024A1106
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 04:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693368067; x=1724904067;
  h=date:from:to:cc:subject:message-id;
  bh=10O176ig/4IZGy9WWkitmpsNZUExSD6aDhv1ToS5Z5M=;
  b=REfhkvDfkyTMr1bQx7T9sRAd7dpTtJVCnqLMlnuE5xHxhtkEEtvewz6A
   2RwtvDtu8q3yXOdUKfFOSafD2/PfccSnrs4KLwc6NvTat7ne5AYe5PAiI
   X/jFpaUlWiZ3zzRR1ZSD0fxRL57stcSAgQh/m7GfxenR7aoO+ImIvWsgM
   sR1OAg9DpGubefXrDSBzKV0mvWa1tkUinfN8g7u8doZj4W8PRGhBCAPwO
   MHgfAn2Ymc1eG3OwGmoWCfyRHqZyrTMtGptj+hlWmme91oxbrfwe+DeBh
   2KEimnC1irFPl1B+oLkTqbNRXM8/Cz9jnycQWg0KaYV+fgh3+CSABFLJ3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="375501670"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="375501670"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 21:01:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="738957564"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="738957564"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Aug 2023 21:01:04 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbCO6-0009OZ-1S;
	Wed, 30 Aug 2023 04:01:03 +0000
Date: Wed, 30 Aug 2023 12:00:06 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+100 bytes kernel size regression] [i386-tinyconfig]
 [3380176e47] page-cache: ensure allocations are aligned to high order
Message-ID: <20230830040006.Qk2Sv%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +100 bytes kernel size regression due to commit:

commit: 3380176e470b852171a20d27ca80b312de7fcdb5 (page-cache: ensure allocations are aligned to high order)
https://git.kernel.org/cgit/linux/kernel/git/mcgrof/linux-next.git large-block-nobdev-20230829-minorder


Details as below (size data is obtained by `nm --size-sort vmlinux`):

2d8c401a: mm/truncate(): use rounded down indexes on truncate_inode_pages_range()
3380176e: page-cache: ensure allocations are aligned to high order

+--------------------------+----------+----------+-------+
|          symbol          | 2d8c401a | 3380176e | delta |
+--------------------------+----------+----------+-------+
| bzImage                  | 522720   | 522848   | 128   |
| nm.t.filemap_get_pages   | 704      | 757      | 53    |
| nm.T.page_cache_ra_order | 512      | 541      | 29    |
| nm.T.__filemap_get_folio | 506      | 524      | 18    |
+--------------------------+----------+----------+-------+



Thanks

