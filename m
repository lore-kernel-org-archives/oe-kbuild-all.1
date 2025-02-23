Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C5778F41
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740328208; cv=none; b=sfcFSzv2lG7z5hEHiySr/TxIOmEfCdYb6UX6OTg1ULF7W8AQGc8QZVXo/pxNoF9EezPlBvU8tblcEbXJySpp8Y7j2G4lho4VLe/ueS0Gj8CTanaTwPHSgJFl1H7wLqFf9NOT/GiI1OkPPgxehguSpALzOsH9AnLzdq8WaAGasio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740328208; c=relaxed/simple;
	bh=ag+qCYYAufPFgZJytz/svzN1g27O27QvGyf2Xc2uuOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JGOr/EkUsJWRXgjG4Us9p/E3ksWPNGhCezGRzcLjsnVDbzOKnDilZRTgPwLsFBtxVul0WyafGxGZvzbSfQsI4KS3cduGENznuMxeT4XzUuWMF0yEY+64Zwrg38qbUjWaIFY05YqurxpktaQPBzgaHv7WJ4pEUrjOpD4CKdMWMIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hnV/Irou; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnV/Irou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740328206; x=1771864206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ag+qCYYAufPFgZJytz/svzN1g27O27QvGyf2Xc2uuOY=;
  b=hnV/Irou9LlowkQpRmY0mXpt42Wwapn/5IjdLcFIKdE/7nri8wZr+08O
   1hEhkTTcDOMooDJc2T9a6iYOwqRQuzmv/ujkQdP2BQX3e2hgEpM3MPDpN
   GBxXcfMAo5i5U/4HniEjd0XcwvGaMcSSwJ2YlKMsWJD60ve5pd9kCLXfI
   kZ3sURXSE5i3oiI2ba6xttGtKp9/J2TfC1U4BRa8uXGbUwTIlCOVVkJGk
   ERbrN0EDIBfotiBtGf5B7ynP9b6xnesTddWeqIZ4HUsr+MSptk9F9jMVJ
   o3oKRl0hwyI8GkqDx6lM9xQ69siH3ow+q+4Qfyu9mhVvOrlJEUd50oA/z
   w==;
X-CSE-ConnectionGUID: yuLr7XfITuCwmriKOthVsQ==
X-CSE-MsgGUID: zhzH9vb0SM6JqlMQRgr6Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="58635945"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="58635945"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 08:30:06 -0800
X-CSE-ConnectionGUID: te7hEAxuSbO2uL5ZNvID6A==
X-CSE-MsgGUID: mpiHCD1aTFCPwjTEsIJjUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116496833"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Feb 2025 08:30:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmEri-0007S7-2A;
	Sun, 23 Feb 2025 16:30:02 +0000
Date: Mon, 24 Feb 2025 00:29:16 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_bulk_alloc_opt_v2 1/1]
 fs/btrfs/extent_io.c:631:44: error: 'pages' undeclared; did you mean 'page'?
Message-ID: <202502240027.TQnmq91I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_bulk_alloc_opt_v2
head:   10c5db9fc7b189b222074598ce5bc9c1d8cd0ea8
commit: 10c5db9fc7b189b222074598ce5bc9c1d8cd0ea8 [1/1] mm: alloc_pages_bulk: remove assumption of populating only NULL elements
config: x86_64-buildonly-randconfig-004-20250223 (https://download.01.org/0day-ci/archive/20250224/202502240027.TQnmq91I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502240027.TQnmq91I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502240027.TQnmq91I-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/btrfs/extent_io.c: In function 'btrfs_alloc_page_array':
>> fs/btrfs/extent_io.c:631:44: error: 'pages' undeclared (first use in this function); did you mean 'page'?
     631 |         for (allocated = 0, ret = 0; ret < pages; ret++) {
         |                                            ^~~~~
         |                                            page
   fs/btrfs/extent_io.c:631:44: note: each undeclared identifier is reported only once for each function it appears in
>> fs/btrfs/extent_io.c:633:25: error: 'rqstp' undeclared (first use in this function)
     633 |                         rqstp->rq_pages[allocated] = rqstp->rq_pages[ret];
         |                         ^~~~~


vim +631 fs/btrfs/extent_io.c

   609	
   610	/*
   611	 * Populate every free slot in a provided array with pages, using GFP_NOFS.
   612	 *
   613	 * @nr_pages:   number of pages to allocate
   614	 * @page_array: the array to fill with pages; any existing non-null entries in
   615	 *		the array will be skipped
   616	 * @nofail:	whether using __GFP_NOFAIL flag
   617	 *
   618	 * Return: 0        if all pages were able to be allocated;
   619	 *         -ENOMEM  otherwise, the partially allocated pages would be freed and
   620	 *                  the array slots zeroed
   621	 */
   622	int btrfs_alloc_page_array(unsigned int nr_pages, struct page **page_array,
   623				   bool nofail)
   624	{
   625		const gfp_t gfp = nofail ? (GFP_NOFS | __GFP_NOFAIL) : GFP_NOFS;
   626		unsigned int allocated, ret;
   627	
   628		/* Defragment page_array so pages can be bulk allocated into remaining
   629		 * NULL elements sequentially.
   630		 */
 > 631		for (allocated = 0, ret = 0; ret < pages; ret++) {
   632			if (page_array[ret]) {
 > 633				rqstp->rq_pages[allocated] = rqstp->rq_pages[ret];
   634				if (ret != allocated)
   635					rqstp->rq_pages[ret] = NULL;
   636	
   637				allocated++;
   638			}
   639		}
   640	
   641		while (allocated < nr_pages) {
   642			ret = alloc_pages_bulk(gfp, nr_pages - allocated,
   643					       page_array + allocated);
   644			allocated += ret;
   645			if (unlikely(!ret)) {
   646				/* No progress, fail and do cleanup. */
   647				for (int i = 0; i < allocated; i++) {
   648					__free_page(page_array[i]);
   649					page_array[i] = NULL;
   650				}
   651				return -ENOMEM;
   652			}
   653		}
   654		return 0;
   655	}
   656	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
