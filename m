Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345A41CF94
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712219499; cv=none; b=nuZWMbmlpgVYHt21m4T5ErYH6nsN8p4XPLnu/rNylc0kjKawOl2f4xr9YiEKw6p0Lm865SJ12LOwq88mwPOYtPQIpBhohodj0q3fL3wR6NFth9mOShdIH26YBPPAizT4+tp2JM8FJFJl/LMIAjjZfbus3sQfqyaWRiH28jCqqyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712219499; c=relaxed/simple;
	bh=1EidPwo1Nkoqha/JwkucMzpo1UzyA49FJgRNc0JcKGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ilkg3kPb7ipVKxqlploH8fMfDHHX4vqFsVEMcR95js6u51G7IHkMOLY7oK8A8bLE4Rr0qcvPucLZNR19HnPIA6QlunGRudnt11YbcCx2mO3HM2Z9POZ1nbGNDM2ObQhKqyXCg3zRRmRA9Qt5LIpHN1Yg947mkMTbSYY3skwYGiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTZzNO7L; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTZzNO7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712219497; x=1743755497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1EidPwo1Nkoqha/JwkucMzpo1UzyA49FJgRNc0JcKGs=;
  b=hTZzNO7L9yThDN7hpgDep4I9upTGKn1958wCMkAdboZX7ItzjHRS2kQt
   bz+Is+8YS83qOJ4Tv3t5j4g6zTZR+b2H0yR9NgUEQ09ukoQ6CeNSWpc7i
   d4dqakS7RKxagU5ELx7lymE9doFmh3g7+RO//RUuDH6BASOLSXB2iXDpD
   ZaSzSae/wgkPan9xbQFVNMxr1hH25L+u15er5pPiRJkY9UQ8RJnDiBBMg
   SHxgVfs3/ytTDAPFoV8PIuxFGefwU5cbzj6ppRrf9HqDsSsysRDhmqt8G
   OwUb/LepSdwaZMs02nxSPNFx1mV2y1Y9Ydya4MQHaug3a2NJbLOwT5pRz
   Q==;
X-CSE-ConnectionGUID: B5rIzHTER4uD1+QNqT193A==
X-CSE-MsgGUID: Cxg7e91nQv62Jk8uSoXi8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18842212"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="18842212"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 01:31:36 -0700
X-CSE-ConnectionGUID: q9lICgbrRf6rSKW5WOlC9g==
X-CSE-MsgGUID: KZxiUlNeSICzK0fzBHsLXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23398198"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Apr 2024 01:31:35 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsIVR-0000me-0F;
	Thu, 04 Apr 2024 08:31:33 +0000
Date: Thu, 4 Apr 2024 16:30:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 16/20] fs/libfs.c:1282:49: error: 'file'
 undeclared
Message-ID: <202404041630.4COSU4L9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   434bfd4fff7ae30ffe26a2e330ed50ff5bb34ee4
commit: 3094d40caca196d182c0f820b0d52e0fe7a5bf2f [16/20] security: convert to read/write iterators
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20240404/202404041630.4COSU4L9-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041630.4COSU4L9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041630.4COSU4L9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/libfs.c: In function 'simple_transaction_read_iter':
>> fs/libfs.c:1282:49: error: 'file' undeclared (first use in this function)
    1282 |         struct simple_transaction_argresp *ar = file->private_data;
         |                                                 ^~~~
   fs/libfs.c:1282:49: note: each undeclared identifier is reported only once for each function it appears in
>> fs/libfs.c:1286:53: error: 'struct kiocb' has no member named 'ki_pis'; did you mean 'ki_pos'?
    1286 |         return simple_copy_to_iter(ar->data, &iocb->ki_pis, ar->size, to);
         |                                                     ^~~~~~
         |                                                     ki_pos
>> fs/libfs.c:1287:1: warning: control reaches end of non-void function [-Wreturn-type]
    1287 | }
         | ^


vim +/file +1282 fs/libfs.c

  1279	
  1280	ssize_t simple_transaction_read_iter(struct kiocb *iocb, struct iov_iter *to)
  1281	{
> 1282		struct simple_transaction_argresp *ar = file->private_data;
  1283	
  1284		if (!ar)
  1285			return 0;
> 1286		return simple_copy_to_iter(ar->data, &iocb->ki_pis, ar->size, to);
> 1287	}
  1288	EXPORT_SYMBOL(simple_transaction_read_iter);
  1289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
