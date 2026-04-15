Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A5F318ED6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 11:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776252723; cv=none; b=IGTnSEqALt6wS71ojP6utCOhD0t5vIuQyQWqhZRjZTBKs3f5opq8s14W/sedAfsAHeLY7KKiXvIilfXJxnNV166rJC/WVttXye03nOtSuJtxL+jsRQXkeG7sQvwCcudIXNRglkRapQZnZSzPyFjPo5hqvkwS2XGo/T0Paue8NOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776252723; c=relaxed/simple;
	bh=b8Aw/7fg+0u6Dp1TPRNyvG4hmUQiFunmewx4V1vTlrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOl/0e+jlt5L5Sv6SZVwDOSZ+BiF3XFDAIz4aP0n5v6fzdn9Ke5f68AJ+kAcQ+kwue7lyb+gQloabswO8Qn44De8q4ZhBEmSqfa92epJ6HfPZJ0VIbSNIlUdEtbm3SxjnXWxgEigp38h9pxbMIO0QFnMQ9wO9GuwbQzOCbx44VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rp9Jk7Bm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rp9Jk7Bm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776252722; x=1807788722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b8Aw/7fg+0u6Dp1TPRNyvG4hmUQiFunmewx4V1vTlrM=;
  b=Rp9Jk7Bm9MUhWZSNmpUkCAWVor8w8a7gzuPajpsD4Wh7ngxdzDaH4dKK
   1HfKb7hKTkDWyYkEfGwianM185GL08Vyb0P/i4+BoCL1HW15ACKUeTzAw
   tt77mzqmRsUr/3mLYuFmwsMQpZFK5oFLnQrzC9rCYtb0zY1s+J4zh+paX
   fiiVEV874VrqumpkT0M53LnmWEqgMe0lQoBJ+2sHuTeqlX3snmwmPkKnu
   xgUknikDCutzCS5QLVm01nr8OMfNgeBF7WuwIdkKmo9S7/5XuP5/ecQxO
   Xg/wH79OMKq9cI6l4WHyvbpyjyDIY+a8zvwOa6UJy1K/0yHV0Oq0JYK+k
   g==;
X-CSE-ConnectionGUID: dj1e9i9USXWaBCzQkXM9vA==
X-CSE-MsgGUID: L01wyfIPQjyAS/F4uymH7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="99867488"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="99867488"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 04:32:00 -0700
X-CSE-ConnectionGUID: fAb+rIAnSHKVuXFK92Yccw==
X-CSE-MsgGUID: hs+metJkTLWqtrWCrpD9lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="227214118"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Apr 2026 04:31:59 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCyTM-000000000RV-3t9W;
	Wed, 15 Apr 2026 11:31:56 +0000
Date: Wed, 15 Apr 2026 19:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <202604151948.oJFK3dlv-lkp@intel.com>
References: <adjrVagmLJaozz5o@sirena.co.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adjrVagmLJaozz5o@sirena.co.uk>

Hi Mark,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on isilence/zcrx/for-next]
[cannot apply to linus/master v7.0 next-20260414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Brown/linux-next-build-failure-after-merge-of-the-block-tree/20260415-013341
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/adjrVagmLJaozz5o%40sirena.co.uk
patch subject: linux-next: build failure after merge of the block tree
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260415/202604151948.oJFK3dlv-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604151948.oJFK3dlv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604151948.oJFK3dlv-lkp@intel.com/

All errors (new ones prefixed by >>):

   io_uring/zcrx.c: In function 'zcrx_register_netdev':
>> io_uring/zcrx.c:812:15: error: implicit declaration of function 'netif_mp_open_rxq'; did you mean 'net_mp_open_rxq'? [-Wimplicit-function-declaration]
     812 |         ret = netif_mp_open_rxq(ifq->netdev, if_rxq, &mp_param, NULL);
         |               ^~~~~~~~~~~~~~~~~
         |               net_mp_open_rxq


vim +812 io_uring/zcrx.c

   781	
   782	static int zcrx_register_netdev(struct io_zcrx_ifq *ifq,
   783					struct io_uring_zcrx_ifq_reg *reg,
   784					struct io_uring_zcrx_area_reg *area)
   785	{
   786		struct pp_memory_provider_params mp_param = {};
   787		unsigned if_rxq = reg->if_rxq;
   788		int ret;
   789	
   790		ifq->netdev = netdev_get_by_index_lock(current->nsproxy->net_ns,
   791							reg->if_idx);
   792		if (!ifq->netdev)
   793			return -ENODEV;
   794	
   795		netdev_hold(ifq->netdev, &ifq->netdev_tracker, GFP_KERNEL);
   796	
   797		ifq->dev = netdev_queue_get_dma_dev(ifq->netdev, if_rxq);
   798		if (!ifq->dev) {
   799			ret = -EOPNOTSUPP;
   800			goto netdev_put_unlock;
   801		}
   802		get_device(ifq->dev);
   803	
   804		ret = io_zcrx_create_area(ifq, area, reg);
   805		if (ret)
   806			goto netdev_put_unlock;
   807	
   808		if (reg->rx_buf_len)
   809			mp_param.rx_page_size = 1U << ifq->niov_shift;
   810		mp_param.mp_ops = &io_uring_pp_zc_ops;
   811		mp_param.mp_priv = ifq;
 > 812		ret = netif_mp_open_rxq(ifq->netdev, if_rxq, &mp_param, NULL);
   813		if (ret)
   814			goto netdev_put_unlock;
   815	
   816		ifq->if_rxq = if_rxq;
   817		ret = 0;
   818	netdev_put_unlock:
   819		netdev_unlock(ifq->netdev);
   820		return ret;
   821	}
   822	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
