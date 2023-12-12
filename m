Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA8165A9E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 21:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWFDE8Xr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702416431; x=1733952431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Glv9k4sgoCx/kFFVABVJtskGf9A4kbcnVpT8FsDFbT8=;
  b=UWFDE8Xr6+AsT3oczHc1W4i8tDYT1iihKhlDzkQW4DZ3u7stivVtf939
   1dYlnZ65Flu7IvY1OrMFMOVFJq+PcTuyrcrX1Fb5L0an4NO1pT86nU9cx
   3In6El6h3jZNdqimzXm+l6qL6mXsAPgzzlhDeAQehkdDAzodT8Mg7wQhY
   CCq3y8BBvWqumvdk/JuVhl4Drktftbrzhr5Rm9UnP2HoAPOP3j3BbMxjq
   /A30ysjo/8plPSnMdiKNzm21y87gcn9R4p+wuitGii7PdFJaOcImK9TUg
   b19Qj0/htjcP2dYsV0sDeZ8Rvecuj8oIONSmHnnbIBmK9oUB9m0SBwl45
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1946709"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="1946709"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 13:27:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="839586745"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="839586745"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 12 Dec 2023 13:27:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDAHP-000JkZ-2K;
	Tue, 12 Dec 2023 21:27:03 +0000
Date: Wed, 13 Dec 2023 05:26:07 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: Re: [PATCH] block/blk-ioprio: Skip zoned writes that are not
 append operations
Message-ID: <202312130548.cusrlw1s-lkp@intel.com>
References: <d660cc31-a5be-47f2-9fdf-ba4bf5106226@acm.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d660cc31-a5be-47f2-9fdf-ba4bf5106226@acm.org>

Hi Bart,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v6.7-rc5 next-20231212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/Re-PATCH-block-blk-ioprio-Skip-zoned-writes-that-are-not-append-operations/20231212-081223
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/d660cc31-a5be-47f2-9fdf-ba4bf5106226%40acm.org
patch subject: Re: [PATCH] block/blk-ioprio: Skip zoned writes that are not append operations
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20231213/202312130548.cusrlw1s-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312130548.cusrlw1s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130548.cusrlw1s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/t10-pi.h:6,
                    from include/scsi/scsi_cmnd.h:7,
                    from drivers/scsi/scsi.c:61:
   include/linux/blk-mq.h: In function 'blk_bio_is_seq_zoned_write':
>> include/linux/blk-mq.h:1161:37: error: 'struct bio' has no member named 'bi_disk'
    1161 |                 disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
         |                                     ^~
>> include/linux/blk-mq.h:1161:51: error: 'bio' is a pointer; did you mean to use '->'?
    1161 |                 disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
         |                                                   ^
         |                                                   ->


vim +1161 include/linux/blk-mq.h

  1151	
  1152	/**
  1153	 * blk_bio_is_seq_zoned_write() - Check if @bio requires write serialization.
  1154	 * @bio: Bio to examine.
  1155	 *
  1156	 * Note: REQ_OP_ZONE_APPEND bios do not require serialization.
  1157	 */
  1158	static inline bool blk_bio_is_seq_zoned_write(struct bio *bio)
  1159	{
  1160		return op_needs_zoned_write_locking(bio_op(bio)) &&
> 1161			disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
  1162	}
  1163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
