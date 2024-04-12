Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7027149C56
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 16:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712937665; cv=none; b=AxuXGQRmw5+kyVmTHAJ/UxfL5FjR+ZKEBXIl/nO8/P5drbjYXxF5/QP1z5A73i4bZEkbsP4SudrLlNz5BgXTSjSDppgBcF+5U+4l5pxib90qSbifzpczwCmNy9D06ogXDPb1Bdz3kIlwQlFYXCuhmMAXeK4kGgSjKgLIFuq/K6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712937665; c=relaxed/simple;
	bh=Cz+LyNeDHpIR8bdfN3zrIpjIMG1vPHgQsEIwZUs7/Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBsR+3Nccs+vXQFNkEIr1ndTKRyly4dQLDRQGBikj2LPy3/F/EfTlxF2w4peYc/8TgI3UAh+ipso0GysmBf3KlyOu92dtcStR7LWKkdIDtS1dylTWRE1bEjBOGKh2UDp8/4NsaI0/lo1NVemb1ePUgYyMf6xqatmTjSW7nuTzkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kd9f13OX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kd9f13OX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712937662; x=1744473662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cz+LyNeDHpIR8bdfN3zrIpjIMG1vPHgQsEIwZUs7/Yk=;
  b=kd9f13OX7gs9wDFYYFbF2Itj4nPaB0IUL2nYqA/i0qyvw2oW86JCQ6eV
   /ZYpIzFfcPVY1i9qLzlWoFQge/1KGr6QVpv6U7/tqQjSPBKk0ilM7zHNl
   61i2RB1niPJOVnKy2ICG10Ulzzm9sQNI4ty4/BA/oohkAAotvPzWteSbY
   FpdTlDb20CSqRbwK+rifi5HTIazFulT4n7ISLfOEAOkQx4USnvynFr3t2
   Nva20/O8ZywzZe81dlcUScQGWbPfkTvYnbsaZv4Etj/xw1X7WdddFjGCW
   OrlRBksB9vI0mAmMsR2p1ARAZuTlYOpWQf+3NAF8NpoH0mydOo748lF78
   g==;
X-CSE-ConnectionGUID: HZutGaMxT421upb8rKjwzw==
X-CSE-MsgGUID: BmMajtzsRgibHlaNiFaBPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19110425"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="19110425"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 09:01:00 -0700
X-CSE-ConnectionGUID: UrYpE/KoQ7OCT9OXfXxyRw==
X-CSE-MsgGUID: P4mcm4K+QviSQz9fqbfq0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="21305409"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Apr 2024 09:00:56 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvJKf-0000Dk-36;
	Fri, 12 Apr 2024 16:00:53 +0000
Date: Sat, 13 Apr 2024 00:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/4] scsi: ufs: Make the polling code report which
 command has been completed
Message-ID: <202404122319.0ig2DKPb-lkp@intel.com>
References: <20240412000246.1167600-4-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412000246.1167600-4-bvanassche@acm.org>

Hi Bart,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next linus/master v6.9-rc3 next-20240412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/scsi-ufs-Declare-ufshcd_mcq_poll_cqe_lock-once/20240412-080540
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20240412000246.1167600-4-bvanassche%40acm.org
patch subject: [PATCH 3/4] scsi: ufs: Make the polling code report which command has been completed
config: i386-randconfig-061-20240412 (https://download.01.org/0day-ci/archive/20240412/202404122319.0ig2DKPb-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404122319.0ig2DKPb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404122319.0ig2DKPb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ufs/core/ufshcd.c:5587: warning: Function parameter or struct member 'compl_cmd' not described in '__ufshcd_transfer_req_compl'


vim +5587 drivers/ufs/core/ufshcd.c

c30d8d010b5efd drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5578  
c30d8d010b5efd drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5579  /**
c30d8d010b5efd drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5580   * __ufshcd_transfer_req_compl - handle SCSI and query command completion
c30d8d010b5efd drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5581   * @hba: per adapter instance
c30d8d010b5efd drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5582   * @completed_reqs: bitmask that indicates which requests to complete
c30d8d010b5efd drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5583   */
c30d8d010b5efd drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5584  static void __ufshcd_transfer_req_compl(struct ufs_hba *hba,
56399aa6ca74cf drivers/ufs/core/ufshcd.c Bart Van Assche    2024-04-11  5585  					unsigned long completed_reqs,
56399aa6ca74cf drivers/ufs/core/ufshcd.c Bart Van Assche    2024-04-11  5586  					struct scsi_cmnd **compl_cmd)
c30d8d010b5efd drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13 @5587  {
c30d8d010b5efd drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5588  	int tag;
c30d8d010b5efd drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5589  
c30d8d010b5efd drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  5590  	for_each_set_bit(tag, &completed_reqs, hba->nutrs)
56399aa6ca74cf drivers/ufs/core/ufshcd.c Bart Van Assche    2024-04-11  5591  		if (ufshcd_compl_one_cqe(hba, tag, NULL,
56399aa6ca74cf drivers/ufs/core/ufshcd.c Bart Van Assche    2024-04-11  5592  					 compl_cmd ? *compl_cmd : NULL))
56399aa6ca74cf drivers/ufs/core/ufshcd.c Bart Van Assche    2024-04-11  5593  			*compl_cmd = NULL;
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  5594  }
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  5595  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
