Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFB82FE25
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpE0aX01"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840545; x=1732376545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=shJu8WwO0EYGfQrxTIaliYjDWf5nuOHEDE67s/591r0=;
  b=lpE0aX0145HnBUIUVMpRyrcFmjvueNOjOH/ybBv3OFNQyTOrV76y6gnY
   lLk4uMbFdAZ5EMXrn+7X6NlOZzEGMaGuXlyHMgVHbFVXAsjsZuXMss4nR
   mIbrLlvNPc8RFX15XWq1s9Vl24/ODBJQYHoq23s/3WffrvFteS5HFXnA1
   v8Verws2sjbVHhgNA5pWxLOs2ijN8oQUau8JeIBngMTB5hd1ktOGbXgIv
   bOC9Fy8yWMAIqulcgbZHiMAVOSlA+I4Noiyr5gY/SB9BdRhJhPAWIU3Yq
   a0Ab5qmbji5bsCthoK+SzSlfeOMtSi/2XU35Q1z4wFLRMuCESg4VnnGkm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="395257435"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="395257435"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="767510980"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="767510980"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Nov 2023 07:42:24 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YJy-0002yO-0F;
	Fri, 24 Nov 2023 15:42:22 +0000
Date: Fri, 24 Nov 2023 23:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v13 bpf-next 5/6] selftests/bpf: Add tests for filesystem
 kfuncs
Message-ID: <202311242013.8tAOSgat-lkp@intel.com>
References: <20231123233936.3079687-6-song@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123233936.3079687-6-song@kernel.org>

Hi Song,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/bpf-Add-kfunc-bpf_get_file_xattr/20231124-074239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231123233936.3079687-6-song%40kernel.org
patch subject: [PATCH v13 bpf-next 5/6] selftests/bpf: Add tests for filesystem kfuncs
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311242013.8tAOSgat-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311242013.8tAOSgat-lkp@intel.com/

All errors (new ones prefixed by >>):

>> progs/test_fsverity.c:16:22: error: invalid application of 'sizeof' to an incomplete type 'struct fsverity_digest'
      16 | char expected_digest[sizeof(struct fsverity_digest) + SHA256_DIGEST_SIZE];
         |                      ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   progs/test_fsverity.c:16:36: note: forward declaration of 'struct fsverity_digest'
      16 | char expected_digest[sizeof(struct fsverity_digest) + SHA256_DIGEST_SIZE];
         |                                    ^
   progs/test_fsverity.c:17:13: error: invalid application of 'sizeof' to an incomplete type 'struct fsverity_digest'
      17 | char digest[sizeof(struct fsverity_digest) + SHA256_DIGEST_SIZE];
         |             ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   progs/test_fsverity.c:16:36: note: forward declaration of 'struct fsverity_digest'
      16 | char expected_digest[sizeof(struct fsverity_digest) + SHA256_DIGEST_SIZE];
         |                                    ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
