Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EE8BA26
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jan 2024 08:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q64gc0B5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704701867; x=1736237867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1oIzm1buvOF6cBPHfOCVeCyExen7GyXIh/XhobX4vUU=;
  b=Q64gc0B5StSwpXGIusosw6lXQI+0xqXmFgyNsRarf0CRpevvdWqtJ604
   dNH3DxHqUHk5POU/BixdsSCNZ7ahGkhJ9kHh+TQMYC/8uaBI0ZnI6TNYw
   ynIc/rATuIARr0FaFXpBi/b+M6bugwiJCKRkAboqQXvaheHuX+EIoaJxX
   NKCWCaCBiozW3LELEeNYlXI5SVMToSnFls6Rr/i9CygOCsILp2TwpDwLl
   A6NiGBkNVKknc8gU0r2RhxztNqeWU9guwUc3fP+BNJCmzgjuq0pcJM485
   HXrpuZb0IKa+LS6uYRk/0lOBdKKmTgwU9P/S2aGLWGcnNcNGbqtnucvd+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="400580189"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="400580189"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 00:17:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="757554873"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="757554873"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 08 Jan 2024 00:17:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMkpK-0004XY-2g;
	Mon, 08 Jan 2024 08:17:42 +0000
Date: Mon, 8 Jan 2024 16:17:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12620/12908] fs/bcachefs/reflink.c:37:5-8:
 Unneeded variable: "ret". Return "  0" on line 44
Message-ID: <202401081634.pqnRsrqU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bffdfd2e7e63175ae261131a620f809d946cf9a7
commit: 074cbcdaeee433a02d6d0565b936bee0915cc5da [12620/12908] bcachefs: fsck_err()s don't need to manually check c->sb.version anymore
config: x86_64-randconfig-102-20240107 (https://download.01.org/0day-ci/archive/20240108/202401081634.pqnRsrqU-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401081634.pqnRsrqU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/reflink.c:37:5-8: Unneeded variable: "ret". Return "  0" on line 44

vim +37 fs/bcachefs/reflink.c

    31	
    32	int bch2_reflink_p_invalid(struct bch_fs *c, struct bkey_s_c k,
    33				   enum bkey_invalid_flags flags,
    34				   struct printbuf *err)
    35	{
    36		struct bkey_s_c_reflink_p p = bkey_s_c_to_reflink_p(k);
  > 37		int ret = 0;
    38	
    39		bkey_fsck_err_on(le64_to_cpu(p.v->idx) < le32_to_cpu(p.v->front_pad),
    40				 c, err, reflink_p_front_pad_bad,
    41				 "idx < front_pad (%llu < %u)",
    42				 le64_to_cpu(p.v->idx), le32_to_cpu(p.v->front_pad));
    43	fsck_err:
  > 44		return ret;
    45	}
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
