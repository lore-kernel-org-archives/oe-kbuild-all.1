Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC82E171C1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 09:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9a1RB01"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701078245; x=1732614245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oVcWvGb9/hbROwicHikLaDZIsx3KOZE486N2Wkn1bSc=;
  b=P9a1RB01x828whdRWB9u+t0De7bD6xXcEYpFxFuw5FlHdFz1KLkQ/O/6
   +Qk9r+IWfTpfMVA5k8DojHiTblbkGgVVK58tY0G+Dp6njY8y3Hiw0E7Qw
   weN9FvM4yduPENDgy0C+M0/WnNFKCs4jTd9cTt7vblnHzSmlb5W2iM8bM
   oQebjetnTU6KYD5RqtPMdbMWS4QHkaYw+7rSbWXRZaS4Tce80+f+jwjk9
   V1an3UKBn2MS6BMj7uhMLnZq/kgWqFvWb+7g2818rPDN+Z5NQtC2O+NMJ
   oQ73PD5MZ0oFBgYfsv3dhJDxnW6BxXm8OYvypY4p4kgoAzdDkzbOYP3Wc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="389815968"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="389815968"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 01:44:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="797198460"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="797198460"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Nov 2023 01:44:03 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7Y9p-00067U-0T;
	Mon, 27 Nov 2023 09:44:01 +0000
Date: Mon, 27 Nov 2023 17:43:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3379/3551] fs/bcachefs/buckets.c:316:21: warning:
 no previous prototype for 'bucket_m_to_alloc'
Message-ID: <202311271541.YjOfLYSX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   48bbaf8b793e0770798519f8ee1ea2908ff0943a
commit: 8192d6956cb6798c4cb28d35712373c9af7897bf [3379/3551] bcachefs: New bucket sector count helpers
config: i386-buildonly-randconfig-001-20231127 (https://download.01.org/0day-ci/archive/20231127/202311271541.YjOfLYSX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311271541.YjOfLYSX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311271541.YjOfLYSX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/buckets.c:17:
   fs/bcachefs/error.h: In function 'bch2_bkey_fsck_err':
   fs/bcachefs/error.h:168:9: warning: function 'bch2_bkey_fsck_err' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     168 |         prt_vprintf(err_msg, fmt, args);
         |         ^~~~~~~~~~~
   fs/bcachefs/buckets.c: At top level:
>> fs/bcachefs/buckets.c:316:21: warning: no previous prototype for 'bucket_m_to_alloc' [-Wmissing-prototypes]
     316 | struct bch_alloc_v4 bucket_m_to_alloc(struct bucket b)
         |                     ^~~~~~~~~~~~~~~~~


vim +/bucket_m_to_alloc +316 fs/bcachefs/buckets.c

   315	
 > 316	struct bch_alloc_v4 bucket_m_to_alloc(struct bucket b)
   317	{
   318		return (struct bch_alloc_v4) {
   319			.gen		= b.gen,
   320			.data_type	= b.data_type,
   321			.dirty_sectors	= b.dirty_sectors,
   322			.cached_sectors	= b.cached_sectors,
   323			.stripe		= b.stripe,
   324		};
   325	}
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
