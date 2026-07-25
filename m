Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA8E16A395
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jul 2026 00:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784938304; cv=none; b=E5ntqMp6zDqAWYb7CXCp4WxvGPB0ajsoZGDLJCfeXt5YQXUzgnIuy/Vk+v+egkmyV1/uv1oxBC1QYbgp2lsScyNRVIornQ8iPIWWMdbqpogI9OX1pc3eCwzKrgXcRUqQw6YvTZNqfzznvQRfDTHNGSTftx5QAqdFUdpl0p0xZjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784938304; c=relaxed/simple;
	bh=L0qPlQ3/RK8xDUwnyjPc5xz4B+ppfAQhEBHXd/WRTEk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MkxsQl50viMP1M1CagjPH8fZMSBZe3p/T5nMMMh2v4qanW2d2fEL38yLMhTcQdUwU8OkgEueb9nG9+1RRP0tRFRIPidymyXK3r1lsRQ+7dssPTpz0vf0eGLuEBcUsLMo280/Uu/Jf99ND+qMKppNB4DrYmUpvkYQsbm3O0DjEEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RvkxQXqO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RvkxQXqO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784938302; x=1816474302;
  h=date:from:to:cc:subject:message-id;
  bh=L0qPlQ3/RK8xDUwnyjPc5xz4B+ppfAQhEBHXd/WRTEk=;
  b=RvkxQXqOyc+lWq487U+4SYMenOeheUHPXHkSKqU/63xCgw5XOopY7qaQ
   S98Xsr17U0KnsMpeD/n9SYgTvnWtOyDgfcGOTO6p3+7gV28+2PhBZZ+E8
   wDTBsqGogFJYwhYKI0nWAlGS194i8tdA2pVtqmnPu0XgVMIDcXWR0Vqpt
   e7MfydckpW9rHEKLWkzT0/XME2YkRIn885VGtOQl4J0c+Po0A7MPm2EhH
   O02C141noMJinTZNtr7IEg6s+GojxbOOaEPHNfykzDL5GXGpC7vmbWrwG
   6FHRSmWKZYdsn4S2AbwOtJPDrqi9iH5fy+jUSINttjjKDNsM0cj+dR9kQ
   Q==;
X-CSE-ConnectionGUID: NGSGos09SRqB7Y1bLRKV+w==
X-CSE-MsgGUID: lmFfXWhNR1OK6s8wU9gVDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="89432293"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="89432293"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 17:11:41 -0700
X-CSE-ConnectionGUID: rb3qAHUDQreYDLQS/UI3Sg==
X-CSE-MsgGUID: 11TiStcdT7ahdEce5HevRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="263844269"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jul 2026 17:11:40 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnPzO-0000000014M-1B8w;
	Sat, 25 Jul 2026 00:11:38 +0000
Date: Sat, 25 Jul 2026 02:10:54 +0200
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 53/59] ERROR: modpost:
 "fs_bio_integrity_verify" [fs/xfs/xfs.ko] undefined!
Message-ID: <202607250253.uO3H5zNX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   10c7aa6f2c85085eec34737be592d6ae69583782
commit: dc5c730a1638c980c34768ffb41f195071d7e662 [53/59] xfs: add support for writing with data checksums
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260725/202607250253.uO3H5zNX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260725/202607250253.uO3H5zNX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607250253.uO3H5zNX-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "fs_bio_integrity_verify" [fs/xfs/xfs.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
