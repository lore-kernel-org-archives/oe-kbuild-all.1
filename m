Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6869412E48
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 14:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718117801; cv=none; b=PU7X6U4vYQ5nWflPhrobUbb/h50SvwrjZi9tr9H3OSeNsDZTpODGRFg47g0wpAz4rBxJ2y2pNsdi5YqY3ioRXp5AWvpcw+/fVZKYZJbZ2uyarQB7YUfEutOFUKIoNU8095Ge+wm8ZuAcC+8rNPx6fZbVVjNyqiNlHjyBu86gwF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718117801; c=relaxed/simple;
	bh=ZFT6afnYUKqZtS6wbplz52TNW5p2BmecHlnTVIXDhdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j57pxsL1NG9hLP/dk+aLzMNrA16W4ruGx0aDWeqjEJCHiUK8ywo48/W8sQ21umcZn8g59mZG3QNwrSlhg323iCbMAq9TPaSn/I3eL5DridpyCfmDG3bq30LpAVFvgWIIRy0zxHbhnC0nRrtlVaFkGroKvB2vnkGeQNRVF6sJlvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=llbKP1xq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llbKP1xq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718117800; x=1749653800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZFT6afnYUKqZtS6wbplz52TNW5p2BmecHlnTVIXDhdM=;
  b=llbKP1xqRwf+vmAQd+m3Yky5pn+1nDOm+dT5LWI6auKL/P2hXqaW80qP
   HBaObfPnuhmx24lmZ00Kub979pvmo06dWPL/UVBZds6eTClTJ736Qz24s
   WzoBXfyrDu4NXwfEhNNohrN0r+2M5G/lZ5y/F5kiKv2jxGS8LWLWd1wDF
   EOx4yqogGT1rpv2lFhHR0ObgOyPgBpLdJhRlwiNtx/x1wDN69MPPjNMs3
   cVi2FDxsUXQ4B+17TkcWgE+PbxoE9jpOUiu0Ah1gZmzc8FEHls9ec4WfN
   nXxilP6WLAYDmIJhdgODgc+1A75shIuft4YRSS9fwVBPrzPk5pLNT7uu+
   g==;
X-CSE-ConnectionGUID: A6S+ma7fRRyTbrhBgOItvQ==
X-CSE-MsgGUID: NQ72vmiAQfCe2yFEudVfCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14991755"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="14991755"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 07:56:39 -0700
X-CSE-ConnectionGUID: QFTkNHpITreV8VfKp2PkzA==
X-CSE-MsgGUID: z66X2W90S1aYfJ/QJYTwXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="39445039"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jun 2024 07:56:37 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH2vL-0000Yv-17;
	Tue, 11 Jun 2024 14:56:35 +0000
Date: Tue, 11 Jun 2024 22:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 175/198] {standard input}:63: Error: symbol
 `__export_symbol___totalhigh_pages' is already defined
Message-ID: <202406112233.GT7V4e9f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   2e3df1a7bef9c2814b80049345f2a53706f82001
commit: dae48e2d159fa9b7d6956b72cf3ebff6cd5e0de4 [175/198] mm-highmem-reimplement-totalhigh_pages-by-walking-zones-fix
config: csky-defconfig (https://download.01.org/0day-ci/archive/20240611/202406112233.GT7V4e9f-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406112233.GT7V4e9f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406112233.GT7V4e9f-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:63: Error: symbol `__export_symbol___totalhigh_pages' is already defined

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
