Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877922690D9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 05:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755062955; cv=none; b=Qm1wDcteksY6HXpENPmcXwwJlLWvWXY41e2Fq2Zxb7CXh5qJCXEDbaejKasQXdrtPisHWokWCBtW6NN8z00SE6NvhP1geq1UsArRKB/ziQmnOwwkDHN095Fi9fGkJEj1nb/3TrDgZhgGklBw1mRY6PMtyNFmQnjhmIcm6R0Odco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755062955; c=relaxed/simple;
	bh=fzWYBMK/OhEzUR0OeVrMk7K4XEW2COPHiastw+y3Eto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJmgakXvwa0x9We6DRnvm4jihjlU8FR3IkLwa1KfNb9/r7wAOKq/BKVmzKowlFNdw7uSnyV972Gy//8Q71Zwkn2c/XZWU9QAvb9ZCfLdOn63z8gHgbcaS/i6WwjQcuRFMDySa5GPfx2eAhpzeOPbdwuEYRBTBjP6q2NJJabKYbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O65NI7r4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O65NI7r4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755062954; x=1786598954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fzWYBMK/OhEzUR0OeVrMk7K4XEW2COPHiastw+y3Eto=;
  b=O65NI7r4rUNahgejlmdA5ctReltiIas8C7GuoJaBT7epBjNRMAewkE/Z
   EQuQEloGlpr5EMINCvzojPl3+xduq3zgJJIsBwhONsItluuFLsBkmC7AG
   GE1ZjSeIoXaUBd6Efwc9wOxrM0p1/E2P3qzDag+lp2OgrWdy2CbpjywVo
   P7F6/J0Gb6uCXL+2MrX6GctHhr/QXLSLhsLukr8td+/SYHwqxALaZnwYE
   wivuPGkKNJcZlyG9J51NWm92DnY+2kDI5lEtJyIZF1REmVIJDDJu7tqAq
   CYRVzjmFZICRhKq+52mD7/pztr5wZqAtbQKr/O94XOZVt8DF+G48tbzFt
   Q==;
X-CSE-ConnectionGUID: wVFKNd2FSaaVcgpxBfNIMg==
X-CSE-MsgGUID: 9dxfZv9pQnmrdiB9Vd942A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57426694"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57426694"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 22:29:13 -0700
X-CSE-ConnectionGUID: KS3zIHNBRk2WVamOpA5XGQ==
X-CSE-MsgGUID: dHj8Oq1oR4yMD7KBhfAQ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="171630531"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 12 Aug 2025 22:29:12 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um42f-0009Yq-1h;
	Wed, 13 Aug 2025 05:29:00 +0000
Date: Wed, 13 Aug 2025 13:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv6 6/8] blk-mq-dma: add support for mapping integrity
 metadata
Message-ID: <202508131303.nL4SARD7-lkp@intel.com>
References: <20250812135210.4172178-7-kbusch@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812135210.4172178-7-kbusch@meta.com>

Hi Keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.17-rc1 next-20250812]
[cannot apply to linux-nvme/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/blk-mq-dma-create-blk_map_iter-type/20250812-222130
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20250812135210.4172178-7-kbusch%40meta.com
patch subject: [PATCHv6 6/8] blk-mq-dma: add support for mapping integrity metadata
config: csky-randconfig-001-20250813 (https://download.01.org/0day-ci/archive/20250813/202508131303.nL4SARD7-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131303.nL4SARD7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508131303.nL4SARD7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-mq-dma.c:10:13: warning: '__blk_map_iter_next' defined but not used [-Wunused-function]
      10 | static bool __blk_map_iter_next(struct blk_map_iter *iter)
         |             ^~~~~~~~~~~~~~~~~~~


vim +/__blk_map_iter_next +10 block/blk-mq-dma.c

     9	
  > 10	static bool __blk_map_iter_next(struct blk_map_iter *iter)
    11	{
    12		if (iter->iter.bi_size)
    13			return true;
    14		if (!iter->bio || !iter->bio->bi_next)
    15			return false;
    16	
    17		iter->bio = iter->bio->bi_next;
    18		if (iter->is_integrity) {
    19			iter->iter = bio_integrity(iter->bio)->bip_iter;
    20			iter->bvecs = bio_integrity(iter->bio)->bip_vec;
    21		} else {
    22			iter->iter = iter->bio->bi_iter;
    23			iter->bvecs = iter->bio->bi_io_vec;
    24		}
    25		return true;
    26	}
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
