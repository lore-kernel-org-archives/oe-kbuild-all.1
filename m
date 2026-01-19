Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8904329AB11
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 19:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850774; cv=none; b=dv75pNzdXLTmppbx1Hk0kRJF/IOVg6h1J72+j4fnxAt95Zu8Elk2Z99JAc43qO0Hc9vEOvXmMBozYLvOoC7jR1JT0BCEVIdOCqZTMhZ3lJKAIUH8cgoFupfHW+QCS8LB/A/YetG44US1sfdT/gUZ/ZYY/zQaNZe39z/9FNmxwoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850774; c=relaxed/simple;
	bh=R8TY99MJjH+k2kW2tF1ue0VZYhVkhAqnVzyZXWVOGWk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e98bO7mBlhhTHoQ+ppN+KNkBOcouUWj2w+JOS7gECx8IYqFhB61CPVG2WPOUrhxGcndr9AzZRKK6oe+te8/5UPijD5o+NDl4cx/Jho22K8U5m/LkT4GoQwzm9V14Eej0ZooYyjT15yMv5T4G5Yt88zEsXOeczGMm+FATVrU4rfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bq4WDtyj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bq4WDtyj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768850773; x=1800386773;
  h=date:from:to:cc:subject:message-id;
  bh=R8TY99MJjH+k2kW2tF1ue0VZYhVkhAqnVzyZXWVOGWk=;
  b=Bq4WDtyj/l19kMJF0EHU0+A0oCkNugbqs7e1lRKFzEd2yNHjY63O/0Tj
   GiQhcRUHQS1+wVRdeEIvECc4S+IQq1iWyzrXcn7DWGgSXi17EU1N/Buo1
   6ttgicnDzz0G0/JbYTXqhEwmRcO7g2Ji8PGwD+YTvet3IttvnIuYHCQic
   qA1pVUaBKIJBfPhImqEF7oMkuGuY0C6uyYR22W7NOMXmN1E8TbRIomraC
   PsFt45m/K4lHlRf5IhuvcE5tA4mN/UcWPoocVUTBlMdA7/uk45kpKLf6L
   ddqW/Zx4BzF3/q99GUxeZvWgqoz3b7LESVNgJ0VXbSQh2F6rXAMf/3EKw
   g==;
X-CSE-ConnectionGUID: +F3WuCVZTN2eyvxVi7ozUQ==
X-CSE-MsgGUID: yQo/lYKIQyCextKVHZdI8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="80696675"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="80696675"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 11:26:12 -0800
X-CSE-ConnectionGUID: aVu45N+RSIqqCXqhBhUggQ==
X-CSE-MsgGUID: qbF8Tx6kQCOUa7eQGaiq6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="205564342"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Jan 2026 11:26:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhut6-00000000OE5-1gh9;
	Mon, 19 Jan 2026 19:26:08 +0000
Date: Tue, 20 Jan 2026 03:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
 Eric Biggers <ebiggers@kernel.org>
Subject: [axboe:for-7.0/block 16/50] fs/crypto/bio.c:67:17: sparse:
 sparse: cast from restricted blk_status_t
Message-ID: <202601200325.6bEF7ZEp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.0/block
head:   df73d3c618b4d6cca85304291d2bdaa35c87fb26
commit: bc26e2efa2c5bb9289fa894834446840dea0bc31 [16/50] fscrypt: keep multiple bios in flight in fscrypt_zeroout_range_inline_crypt
config: nios2-randconfig-r113-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200325.6bEF7ZEp-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200325.6bEF7ZEp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200325.6bEF7ZEp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
