Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24FB1CA80
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 16:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gu8DUl2H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705420879; x=1736956879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YJwEx4CvkWbstsx7diRR8X72rlqiKROy2a99RssjhXc=;
  b=Gu8DUl2H9WR79Jd608u82mwux6CqOwgWAZdTKNRsiYP3prARZRu9RO52
   bB6hRXFB5zDX54th2WyJwkZMTZ7QdwOqbJfaKp6jXIS1dP6YSlHM8hMIl
   mtUWmEtUWw/qD6srp3raHcNnEmbiv0kgSVrrxrkVzf+cBxs6DNdYTTVK8
   u2pES0Wi42Pkxy31XK5mpfEqQ/G6Qb254sW840Zytrc9slPVsvZfI3BWh
   6ybB9CCYj1iSowqX6pnEpLN+fyuJld/g8qyoj3OgI4H5UO4z9r7/2DvMf
   UlwpUb0+DG2sx9Cx7vApIH3SyQysOWw9cuKIM6NrCjXzf1UsScHCLQmkN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466280084"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="466280084"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 08:01:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="787487593"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="787487593"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Jan 2024 08:01:16 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPlsI-0000t3-0c;
	Tue, 16 Jan 2024 16:01:14 +0000
Date: Wed, 17 Jan 2024 00:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 75/86] hugepage-vmemmap.c:141:26: error:
 'MAP_LENGTH' undeclared
Message-ID: <202401162313.K6z6Sf6q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   0665259690a91b4df83cc10b92118ee35512369c
commit: f5f6467271ba989cc602a8160e08eadd45611ea9 [75/86] selftests/mm: hugepage-vmemmap: conform test to TAP format output
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240116/202401162313.K6z6Sf6q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401162313.K6z6Sf6q-lkp@intel.com/

All errors (new ones prefixed by >>):

   hugepage-vmemmap.c: In function 'main':
>> hugepage-vmemmap.c:141:26: error: 'MAP_LENGTH' undeclared (first use in this function)
     141 |         if (munmap(addr, MAP_LENGTH))
         |                          ^~~~~~~~~~
   hugepage-vmemmap.c:141:26: note: each undeclared identifier is reported only once for each function it appears in

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
