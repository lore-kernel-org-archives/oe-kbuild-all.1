Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFFE218845
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766237757; cv=none; b=RGVK7k3QTAgqnFKAfK13Ls/5IH1ltK2kjjbCkA82dN+s40SPmoI3VTtw4DzzGp2jmFZKwbZgfuk5dXYv6XoZvVYaRtZopIxfcPmZXQp3qPOxDnEvg5O/kWEb0Dp2H6Mq+vFr+EOwNC2P6i4zaafTAIZk5peg3iWVxSDGOH5j5Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766237757; c=relaxed/simple;
	bh=o1dimbXoWS2UZdRJSRg2U8LA9hCSfXSNCAOk2eQp01M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GSkdB/S+5zGa5/5iOAdOVIRRHfulbe8kagw0zgSTS+pGrr301VpJ1K57zj8DLnf3Qm06Ke+mxKAiOZH8gws0IAJIwm4BCBMmwXhzjpl9Gx7jUbdB5a7U6Cn0UhNmAWTXeBfLDPRqXMQWsludpLBBgs3Au2dL1EHI3Bpc1KGmCN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMU9CF7V; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMU9CF7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766237755; x=1797773755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o1dimbXoWS2UZdRJSRg2U8LA9hCSfXSNCAOk2eQp01M=;
  b=jMU9CF7VoZWwn2DReLUZEBVn/go30z71U3YPqaazRiqOmmtpis7jIG7C
   FQTkBLA7i+4O+pEG8e63hMmY8I0Dd94z04+iJY6U+61lza9JYhvKvgAJp
   0heS31/pdmODqeyn+9eeXsG54gG8qIjRzkMxCSgWmy0L32hvRUpy/kL1o
   aov8FhtJyyU3vtVuQi/iRkqXfdByMue4q+49r1aavHNjn92g3YL3zF2rM
   qMELMhpP6yN8hdUFpP8ljWyLmd1WQb+u0SOhDaoNQkQejsAIXOPZfO/FH
   VL2U11VvvkHVsiZRoTzBeycr/jp6c+3KYxkbBZyIWZOqI9UUiNey5Jzl+
   Q==;
X-CSE-ConnectionGUID: MqmxfV3YSbaJ53V/62ExXw==
X-CSE-MsgGUID: 0hlqRJYRRGqCa3YNNkFVlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67371177"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67371177"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 05:35:55 -0800
X-CSE-ConnectionGUID: OvY47pN6Q9W+MCh4Z5bdtQ==
X-CSE-MsgGUID: FsMKwfISTUqmg5lEDK/JGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="204039161"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Dec 2025 05:35:54 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWx7f-000000004Yy-3cXL;
	Sat, 20 Dec 2025 13:35:51 +0000
Date: Sat, 20 Dec 2025 21:35:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:blk-crypto-fallback 2/9] fs/crypto/bio.c:67:17: sparse:
 sparse: cast from restricted blk_status_t
Message-ID: <202512202112.N7iFBWUC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git blk-crypto-fallback
head:   abfddfd2b6806e4a346206b102c54b280b97623f
commit: b9e0ce00c9ea4857c3d41d1c4180c6e0d169d28a [2/9] fscrypt: keep multiple bios in flight in fscrypt_zeroout_range_inline_crypt
config: sparc-randconfig-r122-20251218 (https://download.01.org/0day-ci/archive/20251220/202512202112.N7iFBWUC-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202112.N7iFBWUC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202112.N7iFBWUC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/crypto/bio.c:67:17: sparse: sparse: cast from restricted blk_status_t
>> fs/crypto/bio.c:67:17: sparse: sparse: cast from restricted blk_status_t
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
