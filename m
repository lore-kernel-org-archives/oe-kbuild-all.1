Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C996C11702
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 16:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HReDjm3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702225058; x=1733761058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/FtcUiKfiYzFZcCbZWOcbgsTNdhvh6AeOD/EPwSvqSU=;
  b=HReDjm3UVmhwea+I3maGRkMA1SZBdmjdJJHLAr3DncxzvXE9KhDSK3PA
   wytElMCElS+dmm1jNGZoqFknY1i0k+6bGVpXbo1nu5WqrzI3cDfd0lwpJ
   3RjMDzecny66Pk/fAlOnDtGIx8f92t+6I9XxVt4pEn5ItPAEVSD1w/ccb
   SJca6qUL5W+QCknYGbnANhDKE/elTH5RI07oQvrCnV6fWtclbEThfHIpG
   dpclFx2KEZLZDkCrNLIW9AVn5jzRSZ/uZ0TV+/o4O6mcwnXgNwYxckzQZ
   F/e8BADzMrf7dTpMqcU9lNxlUsQQEeiqOf3uyxVb/cVqntszWivk3euzX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="7920686"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="7920686"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 08:17:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="890800349"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="890800349"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2023 08:17:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCMUn-000H1L-2z;
	Sun, 10 Dec 2023 16:17:33 +0000
Date: Mon, 11 Dec 2023 00:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-pp-provider 16/31]
 include/net/page_pool/helpers.h:152: undefined reference to
 `page_pool_put_defragged_page'
Message-ID: <202312110002.bM4JG2S0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-pp-provider
head:   4b8de8977565096e38b6da993c68da6f2ef9b89c
commit: 14bd56605183dc80b540999e8058c79ac92ae2d8 [16/31] net: page pool: rework ppiov life cycle
config: i386-randconfig-006-20231210 (https://download.01.org/0day-ci/archive/20231211/202312110002.bM4JG2S0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312110002.bM4JG2S0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312110002.bM4JG2S0-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/core/sock.o: in function `page_pool_iov_put_many':
>> include/net/page_pool/helpers.h:152: undefined reference to `page_pool_put_defragged_page'
   ld: net/ipv4/tcp_ipv4.o: in function `page_pool_iov_put_many':
>> include/net/page_pool/helpers.h:152: undefined reference to `page_pool_put_defragged_page'


vim +152 include/net/page_pool/helpers.h

   145	
   146	static inline void page_pool_iov_put_many(struct page_pool_iov *ppiov,
   147						  unsigned int count)
   148	{
   149		if (count > 1)
   150			WARN_ON_ONCE(page_pool_iov_sub_and_test(ppiov, count - 1));
   151	
 > 152		page_pool_put_defragged_page(ppiov->pp, page_pool_mangle_ppiov(ppiov),
   153					     -1, false);
   154	}
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
