Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2B91990C7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 00:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766449291; cv=none; b=NVGNgyQW1w1WRiaX/WpscXf9uzeSTyFOh8mEj0U8Q1lxQ6EDhpA6d5uFQpdTxO1sBQoPHhDgdGVlYJGo980wZ0YQl+yBflUPYln7cr3Wp5n7ZsBo46QqFlovHbEq7PzM4zxyptJNjy2SH4nghNQSug6JapzQp/19hX0NdA54CvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766449291; c=relaxed/simple;
	bh=Z7tYIiWOrQpe4HwViy0qGAsbxltSoshHpG6bgv3dVSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XuNHRMFdWeigpcoVe9XO6501zp8kUwCJcZ24Suyy4BzHPrUPxsBbf52/J/OLIx+usji4z6CIkUS2UBiTfhBP5LKjKZBLmaUSCo7SCuKIBXzfQemfOcERi8gkyfKY0BU02b/n2F++Q0aWOssrw21rV/otnqkiDjEDao+iV3uPuSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbQfbFB4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbQfbFB4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766449289; x=1797985289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z7tYIiWOrQpe4HwViy0qGAsbxltSoshHpG6bgv3dVSA=;
  b=lbQfbFB4ZHy1La3T26Pv0dKNB18rlbD+C3lzN+kmMJHFS9JU5w4F8lO9
   T/25e11LRPKniuKAGY1iVhCf/D0pAbzDkokfG+yxr89WpRw1FdYqyoC1x
   DXInKfMR+cOYZroMkOZ2I/eNv5AikSPjjCdqw49FfouAWJpasItSjb4Hd
   mPNulAeZqfI4OPZEzvboG5DuKn5v09wz3wI4FvuSw1N+LD5x/R4jfPLnJ
   dsmbVoPpJ+7lP6w23EtyhTqj6u8egItpyIjacOoJxkwAd9kaEkOs3XHEs
   1Z4ONQ160REl8EFml5RPPlPQMzNeecv8UZeAcXg8T1ULNkxfeWJJSt9cq
   A==;
X-CSE-ConnectionGUID: Os/DCF8GQqC2iUYchTKLZA==
X-CSE-MsgGUID: bOnUkjbLQ92f2W4z+s80SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68240441"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68240441"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 16:21:29 -0800
X-CSE-ConnectionGUID: ivOTUad2QEKEvjeJoD/7Ew==
X-CSE-MsgGUID: qVXmiNqiQO63NPRbD0fFLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="203774765"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 22 Dec 2025 16:21:28 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXq9V-000000005fk-38Pe;
	Tue, 23 Dec 2025 00:21:25 +0000
Date: Tue, 23 Dec 2025 01:20:27 +0100
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [frederic-dynticks:kthread/core-v5 32/32] htmldocs:
 Documentation/cpu_isolation/housekeeping.rst: WARNING: document isn't
 included in any toctree [toc.not_included]
Message-ID: <202512230100.aEd6A437-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/core-v5
head:   fcdc00137b51b2bfb81523f82122c1c8269c4c65
commit: fcdc00137b51b2bfb81523f82122c1c8269c4c65 [32/32] doc: Add housekeeping documentation
reproduce: (https://download.01.org/0day-ci/archive/20251223/202512230100.aEd6A437-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230100.aEd6A437-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/cpu_isolation/housekeeping.rst: WARNING: document isn't included in any toctree [toc.not_included]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
