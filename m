Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549AF14535B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 19:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708717856; cv=none; b=ouitTbjY2GElziUlh3okFmcRu7hBzJNATiYyeiLiWsBSAHn4HOL39kUQY31R3y4ZfKHvE+lVkieiELZB8R+b5fHWrJ3aNrVg7bi436WH9D3vHycmIk5Kkuq1EGYXeo0Nh0olnLNO/lqj8N2vQViy/XeLfqr2ShFZ8fD1IvzP6Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708717856; c=relaxed/simple;
	bh=cIZIEf0YSs2kcZlIle3z3zT8o8MV7cJXFShcyT/qqFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ulr/qXixIyxTwsfRCM61GrPZbJ/9m+6eidJX3zoAhhmmpjNJknR2pOVPNNmDGGc2BlrlU49drqErgCThc1L8EB9+p6EQdcbLXaaenzZ6s/v7dT18h1mMMwclM60b377XY4GXeNX5UAhdroA0+NxrYMaRXXJ0yaRGVqgEJ9oJlRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpmqZGW3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpmqZGW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708717854; x=1740253854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cIZIEf0YSs2kcZlIle3z3zT8o8MV7cJXFShcyT/qqFs=;
  b=FpmqZGW3RNFX+Hf3YZXE3UuDRiiKqtAm8X530EE0e/Dv6F4Di+C+tdxE
   xYMbo3b4kLzDt+A7T2vIon2ZLxxzl9eEMEDFRTC9s9GLkkKRiXX4kVafo
   L1wQRsKcup5DU7Hms+BYZgKv+NPI5qpzSvE7eeMCN1aUWFR/rUwkHEXun
   EaZnmX3rvmo9plsFUuec2RWw5THI5UxOoCDfBK/mzRpqxNjW8UZaFNKQy
   CbeAb2GgnqrAUwMsBpTeFJdELAPmkWXRaRoT6biPjHmt19hDxBZFLcufG
   5kHD+iHKLoaZSSZIDxT0XvK5WqhCG3B5lIpkpWEOPo7VJa3qLA+hS+xI9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2936516"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="2936516"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 11:50:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6158772"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Feb 2024 11:50:52 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdbZ7-0007qW-2R;
	Fri, 23 Feb 2024 19:50:44 +0000
Date: Sat, 24 Feb 2024 03:49:44 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-latest 12/15] sparc64-linux-ld: net.c:undefined
 reference to `io_zc_rx_recv'
Message-ID: <202402240319.vatf7xIY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-latest
head:   422e699712a532c85e16c4e6afda9d4d4164bdf3
commit: f511e9239c22c8e0ef7cb773efb144aff2afeadc [12/15] io_uring: add io_recvzc request
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20240224/202402240319.vatf7xIY-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240319.vatf7xIY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240319.vatf7xIY-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: io_uring/net.o: in function `io_recvzc':
   net.c:(.text+0x21c8): undefined reference to `io_zc_rx_recv'
>> sparc64-linux-ld: net.c:(.text+0x231c): undefined reference to `io_zc_rx_recv'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
