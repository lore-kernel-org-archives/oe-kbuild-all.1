Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CE117C3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Oct 2023 05:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGUqBxaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698556731; x=1730092731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m2x20pJpmuh0VKkA+RnVpRjqwJDhrirWFPMXQpzZwzs=;
  b=PGUqBxawjWylPZUmn891m+nvKXzI2oNhJCwDYui1QPqu6VVEYAo5IdMx
   85ulBcSA8AotzTW+ZXHbVfjA/JlC6zUzNFanWVgkJL9K3xxhTVBPqWS6h
   T9/9io2IdhvYnLiJH1PPrbN/jWUuTjUE/wHbdnbP9juKLV2NKhy2T4LEx
   y/o65/u5qm4BXZFdvsNSX6RSZYWM2EkI4xnuSpRtUriIeH1O+iiUUawa2
   yc/4LCfoxffxeElWusQNMxecg2dD5EBh8LjK4d3C4HJq9A9zJFRT3uE2i
   Aq3KLQhUk9tPcQJFw8nVzRA9EC9EWKDg4KXYjQs3q5kctj1AkZpjXmXS/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="390794529"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="390794529"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 22:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="789167727"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="789167727"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 28 Oct 2023 22:18:49 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwyCF-000CLT-0H;
	Sun, 29 Oct 2023 05:18:47 +0000
Date: Sun, 29 Oct 2023 13:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4-lts 17409/29903] htmldocs:
 Documentation/admin-guide/pstore-blk.rst:152: WARNING: Error in "kernel-doc"
 directive:
Message-ID: <202310291323.VYoIJSWz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi WeiXiong,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4-lts
head:   fcdc8d9a71cdda01c736bb52ad5d494e5b0937a3
commit: c0003a71672a751ec23d85451cbe43ff64609ab1 [17409/29903] UPSTREAM: Documentation: Add details for pstore/blk
reproduce: (https://download.01.org/0day-ci/archive/20231029/202310291323.VYoIJSWz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310291323.VYoIJSWz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/pstore-blk.rst:152: WARNING: Error in "kernel-doc" directive:
>> Documentation/admin-guide/pstore-blk.rst: WARNING: document isn't included in any toctree

vim +152 Documentation/admin-guide/pstore-blk.rst

   151	
 > 152	.. kernel-doc:: fs/pstore/blk.c
   153	   :identifiers: register_pstore_blk
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
