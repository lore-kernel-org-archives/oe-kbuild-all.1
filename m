Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88000C2E0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 04:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755923483; cv=none; b=buVinjgv0y/L5Oi9Z6S790SdnjNyrDuNH/si0ya3R5MmSZ/0Kkiora4zi/6pOdR34EA12vhsmlho5AL6I5TJVlU8eMT6MEPa5dIlmGp3ntSNq1ZJoq2N2ioVLD7SuvbdqUJ+VjDukHbUt8Zzs51lVE97u+SdDZs3B5Vfir1kfbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755923483; c=relaxed/simple;
	bh=XuE7Yi8XcMmcC7phJAMIx9qfSl9i6R8IzOB2Uf53Yfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZDSyawNlkTg9MwLf0lzIK5lmaBptdUabRNSkSOcH2b9tz8md9qHuAJJzd3LmgbOchJZBIaqtcFSGb9htXibf0rxQCzjzoRTnlRoJ8HzAhKHy2iEAjqY2opAozZ5x43Ogsvx+2JkKoUUlREiLjrM1ZlCVVfMT2nYRpIctp/XIMKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1NE/8J4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1NE/8J4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755923482; x=1787459482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XuE7Yi8XcMmcC7phJAMIx9qfSl9i6R8IzOB2Uf53Yfk=;
  b=m1NE/8J47ZufCTF69xaywq8h+bah7OfJBi2pUHjwwXBRYubKHkmWSW9r
   AN4y6/pGK1e0zOKUY+RfP1qOTudDwZyaCz1BPXlngIvHX3B+r3msYdN6z
   JB1gj21kZli+JaVshDfp/X64p7UV5qMQVZhN99B2NntnjlJYVP2Dlqbsn
   lDnVMIaL92WuJvibc/0oSy6DquTzMmZaZeuc7ojz2OcengPOYjkZC6/J8
   Ns0i+pFf5a+qnKJnlPZ3yqYpGJq5bpSS0CR7ZObHzT3oHdbS9wPvznw2z
   o90n6Vh5WxE5s3sgd7zWtrHxk1xAvfbqsSzih+6QRDbu6cX2KY6IU3LTK
   Q==;
X-CSE-ConnectionGUID: kPWJl9d+S2SUGPUQk7j8TQ==
X-CSE-MsgGUID: H4JiP6O8TGS2ezALgjIgTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58148358"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58148358"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 21:31:21 -0700
X-CSE-ConnectionGUID: JmDhb/bxQziqEpRfcLnk7A==
X-CSE-MsgGUID: 19WxCmRkR528f+zdoTuWTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169259954"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Aug 2025 21:31:19 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upfuP-000M4z-1N;
	Sat, 23 Aug 2025 04:31:17 +0000
Date: Sat, 23 Aug 2025 12:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:alloc-token 1/1] Warning: mm/slub.c:5044 function parameter
 'token' not described in '__kvmalloc_node'
Message-ID: <202508231200.GfIeZGxF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git alloc-token
head:   9a3cdf4805f95fde6c6912608140fe432605bf8a
commit: 9a3cdf4805f95fde6c6912608140fe432605bf8a [1/1] slab: add support for type-based slab cache partitioning
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250823/202508231200.GfIeZGxF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508231200.GfIeZGxF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231200.GfIeZGxF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/slub.c:5044 function parameter 'token' not described in '__kvmalloc_node'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
