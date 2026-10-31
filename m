Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793432279;
	b=tVrIWidvCw9XwCRwm2Md/a6jgBPXsmB+4biRTmOoZClmJR4cZys6npYRye12KhiHxco9
	 bxq7r7U/Rhsy69cG2My96QLSuUX+ZXWgXFeUGz/SKkwCWqketKv0wB43ao1YytWLn/ZRp
	 HFVJfOVcSjVvK++2kVrzfJ92M6s/oNZic/uUMD8Dk5D0vDruiCvW4jegk8lbS5WZk8bNa
	 3Vm/zCx3Fw/BlaVjZZNYGK2UQz4uKLeBK4PfFTcyNEQSQjFFjEfKwHa8n8ej8DD/Ma/ej
	 T71qkbbQKBAgaEMvpqC0iFts42VpwRv8t2W5TLume3X8UvkuSQpWIMaXQTnQNeyEknw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793432279;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=2/K1n3bQYxMsxXuoGrZ8rSuoFhPCJVLQ+FIMHckHtqA=;
	b=DIFEbGT3jxtPanXiuhNHlOdcu+XYysF0KXsUthP9CLfuRxQ1KbnSGC7WIDQEWEYWHFnS
	 HfGZZC9kaQOJHJK2z7s61Qlugmd9GmB+h5EYUPGu7jY++yp3JeT5r0U1tdTi+So61BSXl
	 OL2TNpzpjUQEqAgKg6AqVrx9s4Ck8Z78xCD4CY5JOec1xRKKX8eTvjHxqKjV5jm1kmhV3
	 GYh2zA/Z6zzpZmNuIZArusiVrJgNIhHHUX8b8t862aCKgMZovuomJmev77yhpym1QZDkl
	 7P21fhBQw+ELEijvGyaNRUryWpcrQ2LFjFWfB6WrnBHcpXTSUPplBhIzs5gjD0teoUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jrSIFxTo;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D205F606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 07:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D205F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jrSIFxTo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793432278; x=1824968278;
  h=date:from:to:cc:subject:message-id;
  bh=/k5JZc2yCRV/hHMaDUnk9g6pEP7lm69/V/1OaMe7vHM=;
  b=jrSIFxToBec4ybUJMHoMKmNK6zDw/y3GqxkaQj/Ge2LBB//FdCaPjwHB
   XeAVf+tx0DmQ95rttE9qT9GJa0/yz5CeCtaHy7mbuHhJ7vNkSSdjwUZg5
   /RECgNEBlxo5qC8mq2TfqOMz+t6EKqlWyPpUbHIU70MF2hiZgEFaBRD+P
   XHGkDdnLQ1kzaxjY3ItB5SlOVV90frRba2GQFzgTurjPZSIvSoQmxwkSg
   AukM+f9WLmwWRNF9VjwPfTqAhsvrPgq57KBFv7+/8pRYAjlZwTUaoXasg
   /PVpsusb7ECe/1FN6EUdiPxKgJX6xGhVlLPcwitUzWey8RnesN3pxnVsX
   g==;
X-CSE-ConnectionGUID: w5Sk6HcCSYura+tbB3oi1A==
X-CSE-MsgGUID: o2EnfHNjT9m12Wc37N4MFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2089682"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2089682"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 00:37:57 -0700
X-CSE-ConnectionGUID: VLq5Uiu9RE2kqkoLhFdHRw==
X-CSE-MsgGUID: kgqKVt8bRn++hMEa/P1FNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="6038699"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 31 Oct 2026 00:37:57 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN3f0-000000005ut-0GYm;
	Sat, 31 Oct 2026 07:37:54 +0000
Date: Sat, 31 Oct 2026 08:37:14 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-p3s 11/11]
 fs/crypto/bio.c:67:17: sparse: sparse: cast to restricted blk_status_t
Message-ID: <202610310804.uqBaixA6-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-p3s
head:   c463a42cc7dafcb80758c1540a47e0f390373b6b
commit: adcf6597b9c87ccb9fbcab9607e89e64f2b6a468 [11/11] UPSTREAM: fscrypt: keep multiple bios in flight in fscrypt_zeroout_range_inline_crypt
config: arm64-randconfig-r2304-20261031 (https://download.01.org/0day-ci/archive/20261031/202610310804.uqBaixA6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310804.uqBaixA6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310804.uqBaixA6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/crypto/bio.c:67:17: sparse: sparse: cast from restricted blk_status_t
>> fs/crypto/bio.c:67:17: sparse: sparse: cast to restricted blk_status_t

vim +67 fs/crypto/bio.c

    61	
    62	static void fscrypt_zeroout_range_end_io(struct bio *bio)
    63	{
    64		struct fscrypt_zero_done *done = bio->bi_private;
    65	
    66		if (bio->bi_status)
  > 67			cmpxchg(&done->status, 0, bio->bi_status);
    68		fscrypt_zeroout_range_done(done);
    69		bio_put(bio);
    70	}
    71	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
