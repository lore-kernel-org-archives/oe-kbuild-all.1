Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C5543150
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726576814; cv=none; b=MgK3//JNW674R3rckkf5j92j0Nt0wI3tjKICtaKZ+zEyNbU8tKY3N+b16gJ/Qq8nwDCKLr7AnAxYbBN6BleF3Ex3J34DwJBASwzl0S422UDj0xon19L3fujoVaAjsOPqdP5KnTmAwYupjGurkUbudDoFRu/EbhZXh0pKApT2DDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726576814; c=relaxed/simple;
	bh=gucb7PKk5Tt5cA/CkCw7W+1E3MMhpwV0Ix7Wct/+wW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qAxUe9fT7i/4ZEHo0Uwt5/YI9/Qu68CUguZkoDsesgNx8fOejU3V+wRe3ESh/WcCX3AwYrvwCB4enou30cBzctryPT7uUKzeCVDNWEiWq9eBDWGjbHtwfPffbZrCGrH9TTeMS9HACYhXxCiuGUc9p4/fWCrMk4oX23YWmXFrPiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIRj80iD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIRj80iD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726576812; x=1758112812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gucb7PKk5Tt5cA/CkCw7W+1E3MMhpwV0Ix7Wct/+wW8=;
  b=WIRj80iDqYglHOIOIY0+rIIO6MVnqSQygD9cJWKhbg8wg1Sv9QGnGw6T
   KyypozLVUqvSVoiRRXo6TXcc6gCKTc/P3U8r+dtkbJV+/eileJxL5uKe5
   m9t/cdW61kPzuCgujns2F+FSCMtaNAtpAd5kKVAWwAq4MzS+TymI4fCpJ
   4OFelBRkIdLLoggyMPkPIHllRknUDBXeR6+B4eEZjucnArut13+a1Pyp/
   iVycSEIs/qF1nGOy/+auT+i1oPnmL8A6MyA3VvYzDSkSz+WSxsCqrdjzY
   ahxIDTTV+x+YglW8lVQjSqYMCG9mXXg6RRbXi4U2rnZm9BBKe0bjK7pYi
   w==;
X-CSE-ConnectionGUID: As4bCDh0RZuNIjHJ9Kk6tQ==
X-CSE-MsgGUID: wgPzSFqHT0CtZIbLHLm6Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="42904236"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="42904236"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 05:40:11 -0700
X-CSE-ConnectionGUID: DfNmV7ddQ0KKZFEzmPY6wA==
X-CSE-MsgGUID: 9jykBM1xRyeR4DqwQILROA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="73994831"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Sep 2024 05:40:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqXV2-000B8K-0b;
	Tue, 17 Sep 2024 12:40:08 +0000
Date: Tue, 17 Sep 2024 20:39:15 +0800
From: kernel test robot <lkp@intel.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: [linux-next:master 12061/12283] khugepaged.c:undefined reference to
 `shmem_hpage_pmd_enabled'
Message-ID: <202409172015.VxwVnzp5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f3e012d4cfd1d9bf837870c961f462ca9f23ebe
commit: 8b07e88e36961c4785dd13dbdbb5d7977b458940 [12061/12283] mm: shmem: fix khugepaged activation policy for shmem
config: s390-buildonly-randconfig-r006-20230529 (https://download.01.org/0day-ci/archive/20240917/202409172015.VxwVnzp5-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409172015.VxwVnzp5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409172015.VxwVnzp5-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: mm/khugepaged.o: in function `hugepage_pmd_enabled':
>> khugepaged.c:(.text+0x157e): undefined reference to `shmem_hpage_pmd_enabled'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
