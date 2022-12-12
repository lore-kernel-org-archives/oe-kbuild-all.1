Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D101C27
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Dec 2022 04:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670818126; x=1702354126;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ysr9QUMx9uxpXDtahaeCw3V+9EhWi2Hr8Kzf9sha/Xs=;
  b=RVubMd+IKU8gQ+pkVpEcG9bjc/yzyVfkR2FRYWoPTSdvi/okve9HzXhe
   BSLNHxldeJmZCcGSVTRv1QEYpy+brXINJsfvct5JOmszqPpCHwtqHJxGx
   cRt5bTUkLBO5NVlOwg3wwaxZXi8e3ImzOCwoR/x0BV/NK3pAhUum9EkK3
   rJ+nJ29BYE7PLTsgu3CGeXmmueF2pIsF4rZFDAzOng9D3/w5Qa4m3lcVB
   jN+26ETUQMRifWMRLuRNaUg51ya0g7bjIPrXXer/wDkPeCx88kBIP3go9
   Oha5O6G42dMGuxcW9r8dTeCSGxqHFGz6SMAQ+jch2wgiT3dvzTeC61svB
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="319619806"
X-IronPort-AV: E=Sophos;i="5.96,237,1665471600"; 
   d="scan'208";a="319619806"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2022 20:08:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="711528777"
X-IronPort-AV: E=Sophos;i="5.96,237,1665471600"; 
   d="scan'208";a="711528777"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Dec 2022 20:08:44 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p4a7P-0003QB-38;
	Mon, 12 Dec 2022 04:08:43 +0000
Date: Mon, 12 Dec 2022 12:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Alexander Steffens (heftig) <heftig@archlinux.org>,
 Sultan Alsawaf <sultan@kerneltoast.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+110 bytes kernel size regression] [i386-tinyconfig]
 [f22bc56be8] ZEN: mm: Don't hog the CPU and zone lock in rmqueue_bulk()
Message-ID: <6396a915.MT7Q+nN2MPlnz4Tz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +110 bytes kernel size regression due to commit:

commit: f22bc56be85e69c71c8e36041193856bb8b01525 (ZEN: mm: Don't hog the CPU and zone lock in rmqueue_bulk())
https://github.com/zen-kernel/zen-kernel 6.1/zen-sauce


Details as below (size data is obtained by `nm --size-sort vmlinux`):

2aafb56f: ZEN: mm: Lower the non-hugetlbpage pageblock size to reduce scheduling delays
f22bc56b: ZEN: mm: Don't hog the CPU and zone lock in rmqueue_bulk()

+-------------------+----------+----------+-------+
|      symbol       | 2aafb56f | f22bc56b | delta |
+-------------------+----------+----------+-------+
| nm.t.rmqueue_bulk | 373      | 483      | 110   |
| bzImage           | 491616   | 491712   | 96    |
+-------------------+----------+----------+-------+



Thanks

