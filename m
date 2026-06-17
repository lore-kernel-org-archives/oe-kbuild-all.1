Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3656238C421
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 19:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781725844; cv=none; b=A98AJ7+UVYScBmvlVKESC/bc/P8bsBPBw9CV/LOkaUYsWPZ+ssLDS/iZ3hNBhUWmjdiBFsMpCo6Vvm8xPORZi21GD55DzovlD5LEQEfGU2o9qR7mcRQzrXBgBSBp0AENv7kV8w/ocQTusqfq4I+6jTVo5HsfrJABN9qmtxvgH5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781725844; c=relaxed/simple;
	bh=RqS3ii1l2Qr392Gf8+ubErPoi05DmHRvAg0ICM8Oo4U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NVm/GLRolkZ7tewccbezejbqz7dnVqLO9M8b5owyYg7FfBmnehpcR7qNK1CUkEEl5qeLsHAURHzrVQUUUkfdZPBfyen49G8hDeR8cFfsxKEyVXrE7s86B64cqhxOjkIDR3G1Zt7r1WWsvTSlJwZ1asb3+MIFO0DBbK7V+b1ANYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcUlbvQ7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcUlbvQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781725839; x=1813261839;
  h=date:from:to:cc:subject:message-id;
  bh=RqS3ii1l2Qr392Gf8+ubErPoi05DmHRvAg0ICM8Oo4U=;
  b=fcUlbvQ7e80ZI1zMKZgXmlr8y+CM4YoptDUktAuKEtd+KZmgJwLCHwtD
   oA74646FYK4tHRiJv2K1A/5mvbNcnJy/XPWo64anCGrgxstbZCyvfqz/A
   uxSrCma29O7feM2JCBknSNbpeBi1Gj7UgKmLqN8CqngvNna4qTCTxau87
   199QOvXxBk5FQ5vSVhIfOBfOYbWZ3CPZfOEp8OPyzRpTbGR71/6Kd/LYC
   +4SZU5UnMBzU0SBmxjob/HBUNbV1btxfKoXajnV7D5wr7j5SCy7hnCN4s
   xxgG/XIswgS8wzo8mPIdp9I/N+ndVcGEjCoxj5VbpTl/NTNutjIiXEPj/
   A==;
X-CSE-ConnectionGUID: JGvHY7qeQ4ycFkpwef2y0A==
X-CSE-MsgGUID: /7H2zcasQ2y/p54pJpUMiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="92883826"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="92883826"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 12:50:11 -0700
X-CSE-ConnectionGUID: XtSjG4jASi2Esbe8f+iMlw==
X-CSE-MsgGUID: Rs5qtKOOSaa42jeFY/sbpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="253130009"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Jun 2026 12:50:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZwH0-00000000UwC-0EIV;
	Wed, 17 Jun 2026 19:50:06 +0000
Date: Thu, 18 Jun 2026 03:49:24 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>
Subject: drivers/nvdimm/region_devs.c:1147: Warning: missing closing
 `"'
Message-ID: <202606180318.r8O5XKoV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0839c8963b7b28d25350bd5ea69bacde794124ab
commit: 593f1aac976d9bb4681746bfc4b90e1b73821411 s390/percpu: Use new percpu code section for arch_this_cpu_add_return()
date:   2 weeks ago
config: s390-randconfig-r072-20260617 (https://download.01.org/0day-ci/archive/20260618/202606180318.r8O5XKoV-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606180318.r8O5XKoV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 593f1aac976d ("s390/percpu: Use new percpu code section for arch_this_cpu_add_return()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180318.r8O5XKoV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvdimm/region_devs.c: Assembler messages:
>> drivers/nvdimm/region_devs.c:1147: Warning: missing closing `"'
>> drivers/nvdimm/region_devs.c:1147: Warning: missing closing `"'
>> drivers/nvdimm/region_devs.c:1147: Warning: missing closing `"'
>> drivers/nvdimm/region_devs.c:1147: Warning: missing closing `"'
>> drivers/nvdimm/region_devs.c:1147: Warning: missing closing `"'
>> drivers/nvdimm/region_devs.c:1147: Warning: missing closing `"'
>> drivers/nvdimm/region_devs.c:1147: Warning: missing closing `"'
>> drivers/nvdimm/region_devs.c:1147: Warning: missing closing `"'
>> drivers/nvdimm/region_devs.c:1147: Warning: missing closing `"'
>> drivers/nvdimm/region_devs.c:1147: Warning: missing closing `"'
>> drivers/nvdimm/region_devs.c:1147: Warning: missing closing `"'
>> drivers/nvdimm/region_devs.c:1147: Warning: missing closing `"'
>> drivers/nvdimm/region_devs.c:1147: Warning: missing closing `"'
>> drivers/nvdimm/region_devs.c:1147: Warning: missing closing `"'
>> drivers/nvdimm/region_devs.c:1147: Warning: missing closing `"'
>> drivers/nvdimm/region_devs.c:1147: Warning: missing closing `"'
>> drivers/nvdimm/region_devs.c:1147: Warning: missing closing `"'
   drivers/nvdimm/region_devs.c:1152: Warning: missing closing `"'
   drivers/nvdimm/region_devs.c:1152: Warning: missing closing `"'
   drivers/nvdimm/region_devs.c:1152: Warning: missing closing `"'
   drivers/nvdimm/region_devs.c:1152: Warning: missing closing `"'
   drivers/nvdimm/region_devs.c:1152: Warning: missing closing `"'
   drivers/nvdimm/region_devs.c:1152: Warning: missing closing `"'
   drivers/nvdimm/region_devs.c:1152: Warning: missing closing `"'
   drivers/nvdimm/region_devs.c:1152: Warning: missing closing `"'
   drivers/nvdimm/region_devs.c:1152: Warning: missing closing `"'
   drivers/nvdimm/region_devs.c:1152: Warning: missing closing `"'
   drivers/nvdimm/region_devs.c:1152: Warning: missing closing `"'
   drivers/nvdimm/region_devs.c:1152: Warning: missing closing `"'
   drivers/nvdimm/region_devs.c:1152: Warning: missing closing `"'
   drivers/nvdimm/region_devs.c:1152: Warning: missing closing `"'
   drivers/nvdimm/region_devs.c:1152: Warning: missing closing `"'
   drivers/nvdimm/region_devs.c:1152: Warning: missing closing `"'
   drivers/nvdimm/region_devs.c:1152: Warning: missing closing `"'
--
   drivers/md/dm-vdo/funnel-workqueue.c: Assembler messages:
>> drivers/md/dm-vdo/funnel-workqueue.c:590: Warning: missing closing `"'
>> drivers/md/dm-vdo/funnel-workqueue.c:590: Warning: missing closing `"'
>> drivers/md/dm-vdo/funnel-workqueue.c:590: Warning: missing closing `"'
>> drivers/md/dm-vdo/funnel-workqueue.c:590: Warning: missing closing `"'
>> drivers/md/dm-vdo/funnel-workqueue.c:590: Warning: missing closing `"'
>> drivers/md/dm-vdo/funnel-workqueue.c:590: Warning: missing closing `"'
>> drivers/md/dm-vdo/funnel-workqueue.c:590: Warning: missing closing `"'
>> drivers/md/dm-vdo/funnel-workqueue.c:590: Warning: missing closing `"'
>> drivers/md/dm-vdo/funnel-workqueue.c:590: Warning: missing closing `"'
>> drivers/md/dm-vdo/funnel-workqueue.c:590: Warning: missing closing `"'
>> drivers/md/dm-vdo/funnel-workqueue.c:590: Warning: missing closing `"'
>> drivers/md/dm-vdo/funnel-workqueue.c:590: Warning: missing closing `"'
>> drivers/md/dm-vdo/funnel-workqueue.c:590: Warning: missing closing `"'
>> drivers/md/dm-vdo/funnel-workqueue.c:590: Warning: missing closing `"'
>> drivers/md/dm-vdo/funnel-workqueue.c:590: Warning: missing closing `"'
>> drivers/md/dm-vdo/funnel-workqueue.c:590: Warning: missing closing `"'
>> drivers/md/dm-vdo/funnel-workqueue.c:590: Warning: missing closing `"'
   drivers/md/dm-vdo/funnel-workqueue.c:595: Warning: missing closing `"'
   drivers/md/dm-vdo/funnel-workqueue.c:595: Warning: missing closing `"'
   drivers/md/dm-vdo/funnel-workqueue.c:595: Warning: missing closing `"'
   drivers/md/dm-vdo/funnel-workqueue.c:595: Warning: missing closing `"'
   drivers/md/dm-vdo/funnel-workqueue.c:595: Warning: missing closing `"'
   drivers/md/dm-vdo/funnel-workqueue.c:595: Warning: missing closing `"'
   drivers/md/dm-vdo/funnel-workqueue.c:595: Warning: missing closing `"'
   drivers/md/dm-vdo/funnel-workqueue.c:595: Warning: missing closing `"'
   drivers/md/dm-vdo/funnel-workqueue.c:595: Warning: missing closing `"'
   drivers/md/dm-vdo/funnel-workqueue.c:595: Warning: missing closing `"'
   drivers/md/dm-vdo/funnel-workqueue.c:595: Warning: missing closing `"'
   drivers/md/dm-vdo/funnel-workqueue.c:595: Warning: missing closing `"'
   drivers/md/dm-vdo/funnel-workqueue.c:595: Warning: missing closing `"'
   drivers/md/dm-vdo/funnel-workqueue.c:595: Warning: missing closing `"'
   drivers/md/dm-vdo/funnel-workqueue.c:595: Warning: missing closing `"'
   drivers/md/dm-vdo/funnel-workqueue.c:595: Warning: missing closing `"'
   drivers/md/dm-vdo/funnel-workqueue.c:595: Warning: missing closing `"'


vim +1147 drivers/nvdimm/region_devs.c

04ad63f086d1a9 Dan Williams     2022-01-11  1110  
c5d4355d10d414 Pankaj Gupta     2019-07-05  1111  int nvdimm_flush(struct nd_region *nd_region, struct bio *bio)
c5d4355d10d414 Pankaj Gupta     2019-07-05  1112  {
c5d4355d10d414 Pankaj Gupta     2019-07-05  1113  	int rc = 0;
c5d4355d10d414 Pankaj Gupta     2019-07-05  1114  
c5d4355d10d414 Pankaj Gupta     2019-07-05  1115  	if (!nd_region->flush)
c5d4355d10d414 Pankaj Gupta     2019-07-05  1116  		rc = generic_nvdimm_flush(nd_region);
c5d4355d10d414 Pankaj Gupta     2019-07-05  1117  	else {
c5d4355d10d414 Pankaj Gupta     2019-07-05  1118  		if (nd_region->flush(nd_region, bio))
c5d4355d10d414 Pankaj Gupta     2019-07-05  1119  			rc = -EIO;
c5d4355d10d414 Pankaj Gupta     2019-07-05  1120  	}
c5d4355d10d414 Pankaj Gupta     2019-07-05  1121  
c5d4355d10d414 Pankaj Gupta     2019-07-05  1122  	return rc;
c5d4355d10d414 Pankaj Gupta     2019-07-05  1123  }
f284a4f23752d0 Dan Williams     2016-07-07  1124  /**
a84b280f195df8 Jiapeng Chong    2022-09-19  1125   * generic_nvdimm_flush() - flush any posted write queues between the cpu and pmem media
3b6c6c039707f6 Dan Williams     2022-03-09  1126   * @nd_region: interleaved pmem region
f284a4f23752d0 Dan Williams     2016-07-07  1127   */
c5d4355d10d414 Pankaj Gupta     2019-07-05  1128  int generic_nvdimm_flush(struct nd_region *nd_region)
f284a4f23752d0 Dan Williams     2016-07-07  1129  {
f284a4f23752d0 Dan Williams     2016-07-07  1130  	struct nd_region_data *ndrd = dev_get_drvdata(&nd_region->dev);
0c27af60d1bbd3 Dan Williams     2016-05-27  1131  	int i, idx;
0c27af60d1bbd3 Dan Williams     2016-05-27  1132  
0c27af60d1bbd3 Dan Williams     2016-05-27  1133  	/*
0c27af60d1bbd3 Dan Williams     2016-05-27  1134  	 * Try to encourage some diversity in flush hint addresses
0c27af60d1bbd3 Dan Williams     2016-05-27  1135  	 * across cpus assuming a limited number of flush hints.
0c27af60d1bbd3 Dan Williams     2016-05-27  1136  	 */
0c27af60d1bbd3 Dan Williams     2016-05-27  1137  	idx = this_cpu_read(flush_idx);
0c27af60d1bbd3 Dan Williams     2016-05-27  1138  	idx = this_cpu_add_return(flush_idx, hash_32(current->pid + idx, 8));
f284a4f23752d0 Dan Williams     2016-07-07  1139  
f284a4f23752d0 Dan Williams     2016-07-07  1140  	/*
3e79f082ebfc13 Aneesh Kumar K.V 2020-07-01  1141  	 * The pmem_wmb() is needed to 'sfence' all
3e79f082ebfc13 Aneesh Kumar K.V 2020-07-01  1142  	 * previous writes such that they are architecturally visible for
3e79f082ebfc13 Aneesh Kumar K.V 2020-07-01  1143  	 * the platform buffer flush. Note that we've already arranged for pmem
0aed55af88345b Dan Williams     2017-05-29  1144  	 * writes to avoid the cache via memcpy_flushcache().  The final
0aed55af88345b Dan Williams     2017-05-29  1145  	 * wmb() ensures ordering for the NVDIMM flush write.
f284a4f23752d0 Dan Williams     2016-07-07  1146  	 */
3e79f082ebfc13 Aneesh Kumar K.V 2020-07-01 @1147  	pmem_wmb();
f284a4f23752d0 Dan Williams     2016-07-07  1148  	for (i = 0; i < nd_region->ndr_mappings; i++)
595c73071e6641 Dan Williams     2016-09-23  1149  		if (ndrd_get_flush_wpq(ndrd, i, 0))
595c73071e6641 Dan Williams     2016-09-23  1150  			writeq(1, ndrd_get_flush_wpq(ndrd, i, idx));
f284a4f23752d0 Dan Williams     2016-07-07  1151  	wmb();
c5d4355d10d414 Pankaj Gupta     2019-07-05  1152  
c5d4355d10d414 Pankaj Gupta     2019-07-05  1153  	return 0;
f284a4f23752d0 Dan Williams     2016-07-07  1154  }
f284a4f23752d0 Dan Williams     2016-07-07  1155  EXPORT_SYMBOL_GPL(nvdimm_flush);
f284a4f23752d0 Dan Williams     2016-07-07  1156  

:::::: The code at line 1147 was first introduced by commit
:::::: 3e79f082ebfc130360bcee23e4dd74729dcafdf4 libnvdimm/nvdimm/flush: Allow architecture to override the flush barrier

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
