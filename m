Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485DE39060C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 18:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411179; cv=none; b=kz7nmTWNqkfY2As0ubIT9YEqwZN5zMKI/swabKSbpuyVChnF3a9TeJVC5qe4uC0sfcEWEJbpkKikQ4Vy5lls/LWA+PvuPugprZY8M+ika+ZIcvrvMFJoZ3udqcF262To5fVX0m2rtZ62V1EvRSPI9ll1XaUE21criESLrHImbE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411179; c=relaxed/simple;
	bh=2V8BzMl4tSmCmg69xy2HT64hM79rty1VGSgy3LLONCA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AoApYHep4vjNyhVCKoQCA4/5FuFWNbp03fKT3JWKGuZ3ufuPg9tC8y8EeMV5W1Onwre+17gonPTUDobRWoaAdVdMd7/xdGl6PY8NfBEJs9jEdpe1zuqfBtE7CLk39UYnTXjHZDUaMj2utJCjX759rQpDzzL080xa2S+afoIU+Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KuUjqKI4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KuUjqKI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789411175; x=1820947175;
  h=date:from:to:cc:subject:message-id;
  bh=2V8BzMl4tSmCmg69xy2HT64hM79rty1VGSgy3LLONCA=;
  b=KuUjqKI4mcXNrpV5nqdMSseOrA8aw34GdIoeaTwt3wYcjH1RLxJk7HX3
   NBJrJHJcWrAVteK46goUBSKjtSbgLqHMVBk8/wN7JP5b8IXM6ahQ2tk6C
   /FZvYwp7doK4/31NRe+vlSX0d+10DkwQ9/fTosDpHaaxjXvckhB9DOMzn
   YkRMkLyYzq1GOzlnjjMD1YJkkh0+K/TfsxZ0/ji/SY5zw8JdaBqAFf/mM
   jhzegFHRZx2WrgBXly4Mlhi9Qy6h1ZhCQtSz3X/MucQ53CtvQmYD8Wl4K
   eGzBmBV5H5KqzewuLfEn9kbtqBzsamjvaGv57bNklHHJRGhq6hnwyCS8L
   A==;
X-CSE-ConnectionGUID: 60vGbFBHQkmDUyIuYVlFgw==
X-CSE-MsgGUID: L3lwiAX2QGurzdtoUm/myg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93635740"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93635740"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 11:39:33 -0700
X-CSE-ConnectionGUID: orRFYaiiRUGXRxfCYOljHg==
X-CSE-MsgGUID: mf5HFUN6Rj+/eSavLX4kBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273235078"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Sep 2026 11:39:31 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6BaT-000000003Nn-1jAq;
	Mon, 14 Sep 2026 18:39:29 +0000
Date: Tue, 15 Sep 2026 02:38:59 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 20/30] ERROR: modpost: fs/xfs/xfs.ko:
 symbol '__moddi3' undefined!
Message-ID: <202609150246.U8A9CUjt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christoph,

First bad commit (maybe != root cause):

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   13c4aa2fcb1f62fdf47e7abe90741e89f682761e
commit: 4acc7ae85924f4d389a953ea0992c9e3b8735f0e [20/30] xfs: core RT data checksum support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260915/202609150246.U8A9CUjt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150246.U8A9CUjt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609150246.U8A9CUjt-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: fs/xfs/xfs.ko: symbol '__divdi3' undefined!
ERROR: modpost: fs/xfs/xfs.ko: symbol '__udivdi3' undefined!
>> ERROR: modpost: fs/xfs/xfs.ko: symbol '__moddi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
