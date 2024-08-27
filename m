Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B1B17BEAE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 07:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724744706; cv=none; b=h9Tt1c6t2bDuEDJjtkTobQd/PThgMjelAGrFIPzZG5plkfeFcg5lwlYhMXTcGpFezMuzId7rCBpaaVVaKxuVRxcg0Uuel1w1whFI2vIo37eHGi3i67CPmx5h0GszboCy4FVRu1HthVTZTIHnleKKZEMDXCHD4F3s3h7juGz7HdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724744706; c=relaxed/simple;
	bh=Wct/E/H5CLiZ4gsUSsDbfvVuHxmoMFhS6uDJQuVWFRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RjWh1R0rGCb71UL+PQb4M1xdwoCkbC4r14re6cBbFYGoYsxb+L3SfDNaPfdQn4OUFLrgVExdgY+YBVtVPC9QGRWznzMHA7LzMN7o80FNWpnnJMLbRq8oyYYzE9142FzW/yPwA3EQIf7wLnTPDMs6AumOPoqwIfMgptx1bzpvKV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZRI+slwJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZRI+slwJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724744704; x=1756280704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wct/E/H5CLiZ4gsUSsDbfvVuHxmoMFhS6uDJQuVWFRo=;
  b=ZRI+slwJCvrfUJzlWH94lbvMTu/VcvlRyoJ8q4sOQrU9KcbRSYptjMk9
   0Yyb96w2OtFoNZqa4aj3cCdLZ8waQg1IJNjhvomRbdwXpNUt11L4542JH
   yILUDZIuIkvTgVGCQFSfcVWwYl2lhFl7ck9go0sO/KFbWcTD8WqS1SxmP
   V/IRbBr6SuZP7PI7UIu6APs2cfqM+YLBQDFtoDr4WaMLDuMHS2WLQkFVM
   tawyhNzxKn4h11GvPt1EenRXRSWVCV1AxTrOw7lZfnwUib/DktdzcOBW5
   Fpx79vFcq8re+6CnNVQxHXQJJcMxXA+NscnD+h+OiJu9oyQXnTBropzpt
   Q==;
X-CSE-ConnectionGUID: FPa3pPBETXe4ONu918Swug==
X-CSE-MsgGUID: Zc8WkiXIRvGGeba1BJPRxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="34578762"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="34578762"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 00:45:04 -0700
X-CSE-ConnectionGUID: ACq/ZeMVRWe2IB9cx5w0Iw==
X-CSE-MsgGUID: l6M1dUFlQn+GkmdS9H3DdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="62835532"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Aug 2024 00:45:03 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siqsv-000IGW-1D;
	Tue, 27 Aug 2024 07:45:01 +0000
Date: Tue, 27 Aug 2024 15:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 1980/7904]
 drivers/md/dm-user.c:525:6: sparse: sparse: symbol 'message_kill' was not
 declared. Should it be static?
Message-ID: <202408271508.RPjonwhj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   965c5bcac1fe560c973001599bd2364659dc788c
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 [1980/7904] ANDROID: dm: dm-user: New target that proxies BIOs to userspace
config: x86_64-randconfig-122-20240827 (https://download.01.org/0day-ci/archive/20240827/202408271508.RPjonwhj-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408271508.RPjonwhj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408271508.RPjonwhj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/dm-user.c:525:6: sparse: sparse: symbol 'message_kill' was not declared. Should it be static?
   drivers/md/dm-user.c:539:5: sparse: sparse: symbol 'target_poll' was not declared. Should it be static?
   drivers/md/dm-user.c:544:6: sparse: sparse: symbol 'target_release' was not declared. Should it be static?
   drivers/md/dm-user.c:565:6: sparse: sparse: symbol 'target_put' was not declared. Should it be static?

vim +/message_kill +525 drivers/md/dm-user.c

   524	
 > 525	void message_kill(struct message *m, mempool_t *pool)
   526	{
   527		m->bio->bi_status = BLK_STS_IOERR;
   528		bio_endio(m->bio);
   529		bio_put(m->bio);
   530		mempool_free(m, pool);
   531	}
   532	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
