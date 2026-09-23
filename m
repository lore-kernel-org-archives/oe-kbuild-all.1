Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670A14A204C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163855; cv=none; b=YRszqM1jIF7kzqUsrP9Ng48H7nu0hTlIfuSTKiBjXlsJMIHENjIMiSRmuHXm64S8F41/tdAG4lVU4Sqzq1ztBUvlxxQodJvedTIbb4mqZH14nkoWgSGaJCJfoHVoewzQIVuHsIG08a1nUViNjHQnKa8MKsjtfr7vns9IjZggL0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163855; c=relaxed/simple;
	bh=gsmcjCQPZkx+xYpIK41dT8hvpVuLXfh1psC9BNYBhhk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u8hRfPzus3JJGygQ/hFOjsJ3oRmWFLHCTUtZ17XCyyTwFfbpI0mCJDA4d4Qg7Ixy6IPCY5dB0aVWv6J66KVa/nhoI9lswrQGm3DoBpmMO5esXxEkwhftzuygNRd6jHQpWp15UKcqlqlXzcdd+NByekWUZA622ZxKtUhSM5U0NoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fc5dXSPX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fc5dXSPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790163846; x=1821699846;
  h=date:from:to:cc:subject:message-id;
  bh=gsmcjCQPZkx+xYpIK41dT8hvpVuLXfh1psC9BNYBhhk=;
  b=fc5dXSPXrOmV0nqIVR6M8KnBqc4q+kgIjPue2zew2zKXydpk4utkJqPh
   r6fyn/6iwvz9OZlQlDEE8oo8xRZRNhOCzSxL2DtzBJRtFAPjtSxXGlP4A
   fbEXTqJNXHwOJnjQYKRZUnAc13XgFzf8fPzAVlAPJdFDsTCRoAtDIv990
   /cFCia4GQyDC2pSEgfvWcaIMsTA9RwA9zg+9GN/k6zRdPy4X3+Jgu0qkx
   JCu230fysGFwF78BKn1krdCS+7jSyt1a6QlBbp6ktQEc6NRtIbV0FqJYH
   6yspD9qWrqZEHfCGel9BScga51xcUeKKvS5iXaAhRHSFarX2GaUHdU9zv
   A==;
X-CSE-ConnectionGUID: 6/uhmooxRxmVDzIU03+Q0g==
X-CSE-MsgGUID: GWHcdXACSxiFkjdInU1+MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90961946"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="90961946"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 04:44:01 -0700
X-CSE-ConnectionGUID: w5i4sK2ASCKyLjXv6vcXxg==
X-CSE-MsgGUID: nS4P3rqyTWi3PE8hppHzrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4660565"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 23 Sep 2026 04:44:00 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9LOH-00000000H0I-1AJD;
	Wed, 23 Sep 2026 11:43:57 +0000
Date: Wed, 23 Sep 2026 19:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Turner <mattst88@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Magnus Lindholm <linmag7@gmail.com>
Subject: [lindholm-alpha:for-next 25/25]
 arch/alpha/boot/compressed/../../../../lib/xz/xz_dec_stream.c:392:28: sparse:
 sparse: incorrect type in argument 1 (different base types)
Message-ID: <202609231955.2FkT2KAq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git for-next
head:   33465f6ab697abceafd9a340067a544d551c4412
commit: 33465f6ab697abceafd9a340067a544d551c4412 [25/25] alpha: support the remaining kernel compression formats
config: alpha-randconfig-r1305-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231955.2FkT2KAq-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231955.2FkT2KAq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231955.2FkT2KAq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/alpha/boot/compressed/misc.c: note: in included file (through arch/alpha/boot/compressed/../../../../lib/decompress_unxz.c):
>> arch/alpha/boot/compressed/../../../../lib/xz/xz_dec_stream.c:392:28: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   arch/alpha/boot/compressed/../../../../lib/xz/xz_dec_stream.c:392:28: sparse:     expected restricted __le32 const [usertype] *p
   arch/alpha/boot/compressed/../../../../lib/xz/xz_dec_stream.c:392:28: sparse:     got unsigned int const [usertype] *
   arch/alpha/boot/compressed/../../../../lib/xz/xz_dec_stream.c:426:48: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   arch/alpha/boot/compressed/../../../../lib/xz/xz_dec_stream.c:426:48: sparse:     expected restricted __le32 const [usertype] *p
   arch/alpha/boot/compressed/../../../../lib/xz/xz_dec_stream.c:426:48: sparse:     got unsigned int const [usertype] *
   arch/alpha/boot/compressed/../../../../lib/xz/xz_dec_stream.c:434:37: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   arch/alpha/boot/compressed/../../../../lib/xz/xz_dec_stream.c:434:37: sparse:     expected restricted __le32 const [usertype] *p
   arch/alpha/boot/compressed/../../../../lib/xz/xz_dec_stream.c:434:37: sparse:     got unsigned int const [usertype] *
   arch/alpha/boot/compressed/../../../../lib/xz/xz_dec_stream.c:458:28: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   arch/alpha/boot/compressed/../../../../lib/xz/xz_dec_stream.c:458:28: sparse:     expected restricted __le32 const [usertype] *p
   arch/alpha/boot/compressed/../../../../lib/xz/xz_dec_stream.c:458:28: sparse:     got unsigned int const [usertype] *

vim +392 arch/alpha/boot/compressed/../../../../lib/xz/xz_dec_stream.c

24fa0402a9b6a53 Lasse Collin 2011-01-12  384  
24fa0402a9b6a53 Lasse Collin 2011-01-12  385  /* Decode the Stream Header field (the first 12 bytes of the .xz Stream). */
24fa0402a9b6a53 Lasse Collin 2011-01-12  386  static enum xz_ret dec_stream_header(struct xz_dec *s)
24fa0402a9b6a53 Lasse Collin 2011-01-12  387  {
24fa0402a9b6a53 Lasse Collin 2011-01-12  388  	if (!memeq(s->temp.buf, HEADER_MAGIC, HEADER_MAGIC_SIZE))
24fa0402a9b6a53 Lasse Collin 2011-01-12  389  		return XZ_FORMAT_ERROR;
24fa0402a9b6a53 Lasse Collin 2011-01-12  390  
24fa0402a9b6a53 Lasse Collin 2011-01-12  391  	if (xz_crc32(s->temp.buf + HEADER_MAGIC_SIZE, 2, 0)
24fa0402a9b6a53 Lasse Collin 2011-01-12 @392  			!= get_le32(s->temp.buf + HEADER_MAGIC_SIZE + 2))
24fa0402a9b6a53 Lasse Collin 2011-01-12  393  		return XZ_DATA_ERROR;
24fa0402a9b6a53 Lasse Collin 2011-01-12  394  
24fa0402a9b6a53 Lasse Collin 2011-01-12  395  	if (s->temp.buf[HEADER_MAGIC_SIZE] != 0)
24fa0402a9b6a53 Lasse Collin 2011-01-12  396  		return XZ_OPTIONS_ERROR;
24fa0402a9b6a53 Lasse Collin 2011-01-12  397  
24fa0402a9b6a53 Lasse Collin 2011-01-12  398  	/*
24fa0402a9b6a53 Lasse Collin 2011-01-12  399  	 * Of integrity checks, we support only none (Check ID = 0) and
24fa0402a9b6a53 Lasse Collin 2011-01-12  400  	 * CRC32 (Check ID = 1). However, if XZ_DEC_ANY_CHECK is defined,
24fa0402a9b6a53 Lasse Collin 2011-01-12  401  	 * we will accept other check types too, but then the check won't
24fa0402a9b6a53 Lasse Collin 2011-01-12  402  	 * be verified and a warning (XZ_UNSUPPORTED_CHECK) will be given.
24fa0402a9b6a53 Lasse Collin 2011-01-12  403  	 */
4f8d7abaa413c34 Lasse Collin 2021-10-11  404  	if (s->temp.buf[HEADER_MAGIC_SIZE + 1] > XZ_CHECK_MAX)
4f8d7abaa413c34 Lasse Collin 2021-10-11  405  		return XZ_OPTIONS_ERROR;
4f8d7abaa413c34 Lasse Collin 2021-10-11  406  
24fa0402a9b6a53 Lasse Collin 2011-01-12  407  	s->check_type = s->temp.buf[HEADER_MAGIC_SIZE + 1];
24fa0402a9b6a53 Lasse Collin 2011-01-12  408  

:::::: The code at line 392 was first introduced by commit
:::::: 24fa0402a9b6a537e87e38341e78b7da86486846 decompressors: add XZ decompressor module

:::::: TO: Lasse Collin <lasse.collin@tukaani.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
