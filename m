Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B04F8BEC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Dec 2023 05:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NvR8NA93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703310784; x=1734846784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mR6DxwvAt72xJ96TjpuhNN30KdwobyHTaKeVNeYuZAQ=;
  b=NvR8NA938aCn7NRxJOxHvhci8l0jkk3q9X8HjdWt+r7xC9t3QVQrMU50
   pOsoCCT/lAgyGIw+6qkN8URSqtVkCe6niC3HXs2uVXJ0CG/MVWR+QD4sE
   RqtwyNp5G3vDh6hvN+7Hld+U1TTh2USJc5WdgzqPo0ReifJjKbOh9vFmz
   TlsrseUcrCVtBKoaSsjcM15n+6lwXF3B7/m3+LWlUZ7zapanYxIFkl96N
   QfTaRb+JfCvn5FwA71NivhqDzGSqQvaSW8uOcoYUPiPab2Cf6nrlIM4cb
   LZfBxikZz5+JWzsQoRHkgv1BrLaoRvShgttGArIM+zsB8oCx/E+v9VGbB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="9676429"
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; 
   d="scan'208";a="9676429"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 21:52:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="780802163"
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; 
   d="scan'208";a="780802163"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 22 Dec 2023 21:52:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGuwC-000ALd-20;
	Sat, 23 Dec 2023 05:52:43 +0000
Date: Sat, 23 Dec 2023 13:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Gobert <richardbgobert@gmail.com>, davem@davemloft.net,
	dsahern@kernel.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, shuah@kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 3/3] selftests/net: fix GRO coalesce test and
 add ext
Message-ID: <202312231344.sWSs5PIk-lkp@intel.com>
References: <641157c0-f224-4910-874d-7906a48d914b@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <641157c0-f224-4910-874d-7906a48d914b@gmail.com>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Gobert/net-gso-add-HBH-extension-header-offload-support/20231222-172059
base:   net-next/main
patch link:    https://lore.kernel.org/r/641157c0-f224-4910-874d-7906a48d914b%40gmail.com
patch subject: [PATCH net-next 3/3] selftests/net: fix GRO coalesce test and add ext
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312231344.sWSs5PIk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312231344.sWSs5PIk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   gro.c: In function 'add_ipv6_exthdr':
>> gro.c:600:13: warning: variable 'opt_len' set but not used [-Wunused-but-set-variable]
     600 |         int opt_len;
         |             ^~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
