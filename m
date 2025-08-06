Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D644D634
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 02:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754448026; cv=none; b=pwd5rv2rKs+Gxzb+I8f8t5UMBQJ2hxEFmQwiafe2bkjsRz6gIgWvWi6FcH37MrNf3z/nnmS80CBa+/n4VgkOx5R6KMULxGMotu1RhjJKoX8kd6lq0AdpHk8eFW0nQguDaEU5XoXhPrQCi4QzrJewGJTGIoOiZf3GlJC+/WBKLm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754448026; c=relaxed/simple;
	bh=wGvT9nFf1OrLQ6k5rFyAoS1W7G7WZ94btR9ku9a1vl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bq4cFC4VsI/QXU7I3SVPVyWVrQMrnJ3flf7MRRmwgFJS5HgzOJAGnM+fj5m3RmncBGzpsXk0vO6L8obGA0JYROwsuo8HeSC+8HWaY6whn1ngOcyGy+JmcyY2fkwzA+TqgxkwDtliZhCXfH6hPGAMWnSnkOqNJmTlKpNQlNDopg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=flspjUtf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="flspjUtf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754448023; x=1785984023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wGvT9nFf1OrLQ6k5rFyAoS1W7G7WZ94btR9ku9a1vl0=;
  b=flspjUtfQWrqH8ayPL8VG3vEVh4yMwDvmqRU5+/rRzJG3qqo0T2ijqjc
   hUdqA+pbgslLCX/2+xOGkdVMO4T+4ws9v/4S89GFAWCJenymrap7JI6Wy
   PdeLcFtTIFhaxcq9EZ4anXb+a2rXOVMvu59eMyk430Fo+HwXvGW7bJl9a
   P3y3YysfaswLo0P5wFEAv0xfrPXCQ53jGLe1HFRx//2qObswHpaPF7ZOk
   L7o31dUs3AKjQEJGrBVsX33QdkCfcMPGWpHEYJwv0Kjjrk7EZxcJiyAG/
   yD7xsWjLYGH67vRZj1cnqB/pUqzswuybEnX4lXo6gO2AebIGqQ2qoG/di
   w==;
X-CSE-ConnectionGUID: ADpOWW4+Q/mJ9WMFfNl75A==
X-CSE-MsgGUID: XKU0ppZISyyFt0EAHVLaTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56840791"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56840791"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 19:40:23 -0700
X-CSE-ConnectionGUID: ouq70qYDT/2uUUkYXWfA+A==
X-CSE-MsgGUID: a1sekXhMSdGnGHeH+5nY8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164316271"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 05 Aug 2025 19:40:22 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujU4h-00027P-1B;
	Wed, 06 Aug 2025 02:40:19 +0000
Date: Wed, 6 Aug 2025 04:39:19 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1750/1750] net/ax25/ax25_dev.o:
 warning: objtool: missing symbol for section .exit.text
Message-ID: <202508060403.T2P52Sdi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Duoming,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   58693b1f5fa8f02b34ab9a02096472232731e864
commit: 5ba8a3eb026f02aa75f4a22099250bfd4db659cb [1750/1750] ax25: add refcount in ax25_dev to avoid UAF bugs
config: x86_64-buildonly-randconfig-2002-20250805 (https://download.01.org/0day-ci/archive/20250806/202508060403.T2P52Sdi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508060403.T2P52Sdi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508060403.T2P52Sdi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ax25/ax25_dev.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
