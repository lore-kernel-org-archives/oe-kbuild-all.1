Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C658C524DE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705671127; cv=none; b=PWU8XTvv5Z47S9PgYBXzEL5sx21kSXqLeD/Ss3jQcgbMZbOHlTrg+him6YqV/rVUJG+c3ihOjswLcdWOMEpOxXXOC5zW5vy3g3Gx8a/28UcvPTyUREODvS+icXTHnKkodiH/MQM9kuIn1XgHFDHWNF2YhuEAueXeFfSwE3qtkC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705671127; c=relaxed/simple;
	bh=qn1UEj4b4CJ3B1rB43GSf3OHYzLVZsZcT18U3Kng7t8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CySuBY4qAoLm7lLoxfn9y/LQ6h93C3aQH+A1kDl29laY+ItDdCVl2ydyvK7faGhuJcabGK2eyMQefKUE2gQWvSUeQ3DKvAu0P076E9XEF1iMj8QH12gs7RDptD/GKNdXj/qXrBtChQvzMAQOStWF/EEkgaCIEcWpTdaFBh3XMEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRKdDBY6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRKdDBY6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705671125; x=1737207125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qn1UEj4b4CJ3B1rB43GSf3OHYzLVZsZcT18U3Kng7t8=;
  b=MRKdDBY6lNaEOKAJoYx7c3U8HxMtMi4naCzjtuZUk1r8pBmbmjKXdmhu
   vBJpQ0dAi+ZAxDv2yMl2Ew7fW8l31nFR/3qiVJucMJ1xKmXCD9ja/zOhh
   J7tgOWl5nHGn9vbE+Jd2YJyjGWA+L5hx1lmZBXxctFXSj74ayD/NNdsyG
   h/nZmMsL3yxFEE0AHbGIqQlksNLd3+K2BOuGTX/edmczEvX1Xehq/sXWF
   8Fa5R8WkZDZ6gdLBFXRMnMd39HHbUjGO5q6ZYfVEinuOsbISPgc9iAXab
   jl42vb2N7U+C/DCuJ/IYEqqcalGyMtrheQaiYoUGKKbI60QZBoN0uUOjv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="14101335"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="14101335"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 05:32:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="33395987"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jan 2024 05:32:03 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQoyW-000460-03;
	Fri, 19 Jan 2024 13:32:00 +0000
Date: Fri, 19 Jan 2024 21:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/bcachefs/bkey_methods.c:46:5-8: Unneeded variable: "ret". Return
 "  0" on line 53
Message-ID: <202401192156.IvrA7iSY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d1694dc91ce7b80bc96d6d8eaf1a1eca668d847
commit: b65db750e2bb9252321fd54c284edd73c1595a09 bcachefs: Enumerate fsck errors
date:   3 months ago
config: hexagon-randconfig-r061-20240117 (https://download.01.org/0day-ci/archive/20240119/202401192156.IvrA7iSY-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401192156.IvrA7iSY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/bkey_methods.c:46:5-8: Unneeded variable: "ret". Return "  0" on line 53
   fs/bcachefs/bkey_methods.c:219:5-8: Unneeded variable: "ret". Return "  0" on line 229

vim +46 fs/bcachefs/bkey_methods.c

    42	
    43	static int empty_val_key_invalid(struct bch_fs *c, struct bkey_s_c k,
    44					 enum bkey_invalid_flags flags, struct printbuf *err)
    45	{
  > 46		int ret = 0;
    47	
    48		bkey_fsck_err_on(bkey_val_bytes(k.k), c, err,
    49				 bkey_val_size_nonzero,
    50				 "incorrect value size (%zu != 0)",
    51				 bkey_val_bytes(k.k));
    52	fsck_err:
  > 53		return ret;
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
