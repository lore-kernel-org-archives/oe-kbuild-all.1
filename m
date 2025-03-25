Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF70269CE5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 22:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742941292; cv=none; b=d0p7Iaqs5bIFGPjjjn2pGVvq1Zg/S98pgEVUX1n8MAuL//+Z6q5xpZfsRBVRj973N9YUuVh1VGYGJbdW8aRaxp5xqzbQBISLZEMVQIBwcvxenjsz5THMxICwIrRzRU1VASdyP/3w2esoLvvRHiCNWX7+DWM9ngWUY9pWcxdIDzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742941292; c=relaxed/simple;
	bh=NF0yLnuK5DhuWLcY/G4XJ6jUQ0E5zn3U467aanU8C7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ELkhkhfSmyB2CUiikn0TpLj1p+PUxJYxcmPUDLoiB7Ojk05MNm87MJzXgsk/CBXhJgP5YUP54889QFQ+v8vbN4nEijGOP1T0v97LWwZAu21AJmtA9SqtmDiik3edfeWU2PFKLNkyslFNfGublUYOR8EbMGz/CabNfuOu757ziTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIDl9NwN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIDl9NwN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742941291; x=1774477291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NF0yLnuK5DhuWLcY/G4XJ6jUQ0E5zn3U467aanU8C7w=;
  b=BIDl9NwNUy8meYmktbilBrE/ovR7mIA4+D8uMavuzPFQr1PSvksOePBd
   BJI86haQAIh8GPpfe378BicRLm1w1Ut45dNbsmR6xqRYQ03fz25NBA1iP
   ZAKIXJORvCZFnfpMy7+vLmnju07KejBPWcUVm6nutNNP3zlE9YD2En9vO
   Zbu3jtJBMttxYtFBRltTARIo0blh50oj0EgxfN3ymDcflJYXPkVO5kssX
   oRb+zF1wo71eT7CiC5lvLbPhhZYb1/ZJk40XYzgApTZ84BucGYzx/M0wS
   vUGUpfS52+7trMvFVzgndT5HyvvDPOOStfIrzFB+DohtkPu2yFz1ycrk0
   g==;
X-CSE-ConnectionGUID: qXEaNVI+RBif4Fq7Xk9ETQ==
X-CSE-MsgGUID: En2G07MvSBuEH1h84BQY8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44312285"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="44312285"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 15:21:30 -0700
X-CSE-ConnectionGUID: aA/KWmCqS0CQk+mYiqr1Jg==
X-CSE-MsgGUID: afTgcQ/iTueTMBkDgLRemg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="155524828"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Mar 2025 15:21:29 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txCeF-0005Ed-0F;
	Tue, 25 Mar 2025 22:21:27 +0000
Date: Wed, 26 Mar 2025 06:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-06 0/5] block/bio.c:1115:30:
 warning: variable 'page' set but not used
Message-ID: <202503260609.RBpxcDOW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthew,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-06
head:   f2c25a3fab99d49c777fbf9af2d696fcdc877d76
commit: 9025ee1079291fac79c7fcc20086e9f0015f86f4 [0/5] block: Remove special-casing of compound pages
config: i386-buildonly-randconfig-001-20250325 (https://download.01.org/0day-ci/archive/20250326/202503260609.RBpxcDOW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503260609.RBpxcDOW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503260609.RBpxcDOW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/bio.c: In function '__bio_release_pages':
>> block/bio.c:1115:30: warning: variable 'page' set but not used [-Wunused-but-set-variable]
    1115 |                 struct page *page;
         |                              ^~~~


vim +/page +1115 block/bio.c

  1109	
  1110	void __bio_release_pages(struct bio *bio, bool mark_dirty)
  1111	{
  1112		struct folio_iter fi;
  1113	
  1114		bio_for_each_folio_all(fi, bio) {
> 1115			struct page *page;
  1116			size_t done = 0;
  1117	
  1118			if (mark_dirty) {
  1119				folio_lock(fi.folio);
  1120				folio_mark_dirty(fi.folio);
  1121				folio_unlock(fi.folio);
  1122			}
  1123			page = folio_page(fi.folio, fi.offset / PAGE_SIZE);
  1124			do {
  1125				folio_put(fi.folio);
  1126				done += PAGE_SIZE;
  1127			} while (done < fi.length);
  1128		}
  1129	}
  1130	EXPORT_SYMBOL_GPL(__bio_release_pages);
  1131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
