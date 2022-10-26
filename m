Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D354A4E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Oct 2022 01:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666747711; x=1698283711;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=f8cB2/u+MXcmqTpzkbq552ZcDKRVro2VUy8b8TL+180=;
  b=Qasdwp7r6+hyJeGjuUPkrq//d1HpiMQt1PvL0F7VD1dmtq36aTDcVKnO
   XRGzw+JlJsZNN6agwePRUJ402bvsL34HldWfpcbZBWOSFpOugQkVA1k1F
   J027o0GNVm6A6MHuOUhlD4nPf1nKv5dijkS0GURQE1CCO5MO2E2UU+9kW
   USZXCNeFyTyKVb+BVyqnG7Og+m0S6YtbQvBo9Q4AVnmqahwTpSf0ktxyV
   r3cOIipFkPx6traAueWJYHw208UrRMB8/BaRNN0DXMPPgnA+IKbl5DGL9
   v9pNQswRSZ1xh3KDKICQZrs5UY8AOlb9T6TZl2BVTPh+kuA8kcYAdUnFA
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="308926210"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; 
   d="scan'208";a="308926210"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 18:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="695179476"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; 
   d="scan'208";a="695179476"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Oct 2022 18:28:29 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1onVDY-0006nk-23;
	Wed, 26 Oct 2022 01:28:28 +0000
Date: Wed, 26 Oct 2022 09:27:56 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Zhu <alexlzhu@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+100 bytes kernel size regression] [i386-tinyconfig]
 [07b3ee621e] mm: THP low utilization shrinker
Message-ID: <Y1iNHC7B8cIj04Yd@f90b58f07f69>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4880884498c6f0cf3de0d1b7875151a21869a493.1666743422.git.alexlzhu@fb.com>


FYI, we noticed a +100 bytes kernel size regression due to commit:

commit: 07b3ee621ef564a06c744fefe220980ae1f91f64 (mm: THP low utilization shrinker)
url: https://github.com/intel-lab-lkp/linux/commits/alexlzhu-fb-com/THP-Shrinker/20221026-083106
base: https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftest.git next
patch link: https://lore.kernel.org/linux-mm/4880884498c6f0cf3de0d1b7875151a21869a493.1666743422.git.alexlzhu@fb.com
patch subject: [PATCH v5 5/5] mm: THP low utilization shrinker


Details as below (size data is obtained by `nm --size-sort vmlinux`):

df3f3903: mm: add selftests to split_huge_page() to verify unmap/zap of zero pages
07b3ee62: mm: THP low utilization shrinker

+------------------------+----------+----------+-------+
|         symbol         | df3f3903 | 07b3ee62 | delta |
+------------------------+----------+----------+-------+
| bzImage                | 491424   | 491616   | 192   |
| nm.T.list_lru_add_page | 0        | 57       | 57    |
| nm.T.list_lru_del_page | 0        | 55       | 55    |
| nm.T.list_lru_isolate  | 21       | 15       | -6    |
| nm.T.list_lru_del      | 42       | 36       | -6    |
+------------------------+----------+----------+-------+



Thanks


