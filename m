Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D066184
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 16:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778345151; cv=none; b=JsFzY+OMHZzlMzytQIpVDrjaTaLbIBa1n4B6K2NGknRMBZGjyZg9Rv3jxVYv3jJDxnTetlEfqQJXCVspyqhnhbFdeYcQD82u/QKy+36zCgUOexOBZGscHvgdgtSI3kv4Gu89Tdgslw9xn19mINwvFWnRni7GDs2tzHnaycuwb+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778345151; c=relaxed/simple;
	bh=jA7cWYNf2SCCLZx4ojECZI6tnpK6hyq9HPiq8Xtj56o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EWcRn7oeU8BRolGIdrNkQXie1nNOz5cL+3CFxeWs2SvBnORcePM8YVYHI3lKSBZlsnbrQSkYhTi2/bQ83GdhlYxsiFF9rCqnngBP1Y9YO95v1Yfc+oMYWLJbLdhJl1nUAEzz3a0AQbrrGurF+1ZaUL1lEtX31JolkJZn3r1KWss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alV7yO1x; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alV7yO1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778345150; x=1809881150;
  h=date:from:to:cc:subject:message-id;
  bh=jA7cWYNf2SCCLZx4ojECZI6tnpK6hyq9HPiq8Xtj56o=;
  b=alV7yO1x46KceSXjyCCimf7mUIqRR2G/ZBLyaVBJx7kKc/FiDYaIeyHR
   ImAbS9evVeqSHQF5zvdPtOIGxW14hgT24Q1KdeZ4DzOU+9tMTjRUXxCN2
   i0TztutQS3fNFTZl7033fVUcAfw+iaujcYzWgMAjAHbMR7Y53O6ti7/ro
   /c/Onkic75fSDF/H0yg05NvX1T/VcBMs1JWC39Nt5ExhuKMXg6kTmSeOQ
   pvGEPMnMVV5L/jYn7g1h7CDp6MT16w5Z8pU0O0Kz/DdD6kEs1fShO+Q5I
   uNyBXtVLyuQalKZCwzy0eFLwyRITXG+4VksuriHM7nEKkSfOQWEEkOrWg
   A==;
X-CSE-ConnectionGUID: tbOa6fD9Rh+Q5DaQp9rs+g==
X-CSE-MsgGUID: uaPfFoHkQUS+AuozF84diQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="89605321"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="89605321"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 09:45:49 -0700
X-CSE-ConnectionGUID: CMlNr0X7RcOkQnS3Pfc7+Q==
X-CSE-MsgGUID: SVlLYIJQT0qK0hW8br2yvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="234384057"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2026 09:45:47 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLkoC-000000001DZ-46Xf;
	Sat, 09 May 2026 16:45:44 +0000
Date: Sun, 10 May 2026 00:45:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 111/111]
 fs/bcachefs/btree/bkey.c:1190:1: warning: the frame size of 1696 bytes is
 larger than 1280 bytes
Message-ID: <202605100052.e1vPGM4p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   e3bb80fd3e3e617eb3c60ad713c67f37fb11934e
commit: 2b31f000d5341c8b5c5779bf0109a370d36ad585 [111/111] bcachefs: precomputed unpack constants for __bch2_bkey_unpack_key
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260510/202605100052.e1vPGM4p-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100052.e1vPGM4p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100052.e1vPGM4p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/btree/bkey.c: In function 'bch2_bkey_cmp_packed':
>> fs/bcachefs/btree/bkey.c:1190:1: warning: the frame size of 1696 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1190 | }
         | ^


vim +1190 fs/bcachefs/btree/bkey.c

1c6fdbd8f2465d fs/bcachefs/bkey.c Kent Overstreet 2017-03-16  1183  
1c6fdbd8f2465d fs/bcachefs/bkey.c Kent Overstreet 2017-03-16  1184  __pure __flatten
811d2bcd85a826 fs/bcachefs/bkey.c Kent Overstreet 2020-11-07  1185  int bch2_bkey_cmp_packed(const struct btree *b,
811d2bcd85a826 fs/bcachefs/bkey.c Kent Overstreet 2020-11-07  1186  			 const struct bkey_packed *l,
811d2bcd85a826 fs/bcachefs/bkey.c Kent Overstreet 2020-11-07  1187  			 const struct bkey_packed *r)
1c6fdbd8f2465d fs/bcachefs/bkey.c Kent Overstreet 2017-03-16  1188  {
e5baf3dad91a65 fs/bcachefs/bkey.c Kent Overstreet 2022-10-21  1189  	return bch2_bkey_cmp_packed_inlined(b, l, r);
1c6fdbd8f2465d fs/bcachefs/bkey.c Kent Overstreet 2017-03-16 @1190  }
1c6fdbd8f2465d fs/bcachefs/bkey.c Kent Overstreet 2017-03-16  1191  

:::::: The code at line 1190 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
