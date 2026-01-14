Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95543322B84
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 07:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768374812; cv=none; b=thWnOlM7ndNqybk/1bwAxtkhgqicKnLK146AB5xcDCuUDD44oYs+oamiKyzfLOZEvpfNby0YhTBlcpquSs1qyWY2CHeheGHAfYHZvaAsmnSaDAe42W5lX01t064NxdYj+QDJ9kGnKf0EBLJX+rzJfjvbhFjJIHRKZFuZHsHNHpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768374812; c=relaxed/simple;
	bh=KJNGV3R27jRAl/0vCcHGLqZoZbHWBaTYcAf7v4ZanC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBCVyzFFLueyPypxJNS7rHOlHdvgPIePd6Rl5U/rw9jg+aZsto8+tkbdvhiyBlnwHjh/h6QfswIuX8BhkJP/o1xCU5cd+NrHeDhs9n/+J8z1e26f2Inwr6agh6Wy+cwBobM2MpahcYOPdDzgAVzJJgHbslbuvdfoJI5ObnWjP88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2tgDP/f; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2tgDP/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768374805; x=1799910805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KJNGV3R27jRAl/0vCcHGLqZoZbHWBaTYcAf7v4ZanC8=;
  b=X2tgDP/f1h0p63QtJHWOoImmFeCNETeB96q0alVpZWqhRTvk8Z5FeD5g
   PdN5V6pHtJ5r9MqBcVW9buGLB5tbJ0sPRag67iYnvi+6tSHd7Di3iM6wF
   eW9ryjOnBg6S2kpXRToCZgXe1F9yWpqHtC3b6gETFKEPKPwyyZHDs6glP
   DCDlgc2/nwyiKj+CA/RZ2+muGZf9oMGQRtQMbdSHXt1aGQKnP4cvsfeab
   yh+nZ5CC0f8GAdGnPnKKbrSXPYimGCmMeO08Sg/xMqpvhDbr6Ft94DaaG
   2K/VpnPBeU+8y1cvghwzqgx3VEO4SFOF+/OkN3p6MWtw+v0EqTz3zLsqK
   w==;
X-CSE-ConnectionGUID: N7xJxFgNQtC0tJECM3mIPw==
X-CSE-MsgGUID: M+4cYEBoTfaImX5NqKM1CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69403875"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69403875"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:13:21 -0800
X-CSE-ConnectionGUID: m0XCHpK7RQez+lrBWOVaxQ==
X-CSE-MsgGUID: MopJE3jmROGzzs/HTqsqMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="235851864"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jan 2026 23:13:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfv4A-00000000Fyc-01jl;
	Wed, 14 Jan 2026 07:13:18 +0000
Date: Wed, 14 Jan 2026 15:13:04 +0800
From: kernel test robot <lkp@intel.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] dmaengine: introduce dmaengine_bh_wq and bh
 helpers
Message-ID: <202601141406.igbKhauH-lkp@intel.com>
References: <20260108080332.2341725-2-allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108080332.2341725-2-allen.lkml@gmail.com>

Hi Allen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on vkoul-dmaengine/next]
[also build test ERROR on shawnguo/for-next sunxi/sunxi/for-next soc/for-next linus/master v6.19-rc5 next-20260113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Allen-Pais/dmaengine-introduce-dmaengine_bh_wq-and-bh-helpers/20260108-164201
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20260108080332.2341725-2-allen.lkml%40gmail.com
patch subject: [RFC PATCH 1/1] dmaengine: introduce dmaengine_bh_wq and bh helpers
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260114/202601141406.igbKhauH-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141406.igbKhauH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141406.igbKhauH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dma/hsu/hsu.c: In function 'hsu_dma_remove':
>> drivers/dma/hsu/hsu.c:503:42: error: 'struct virt_dma_chan' has no member named 'task'
     503 |                 tasklet_kill(&hsuc->vchan.task);
         |                                          ^


vim +503 drivers/dma/hsu/hsu.c

2b49e0c56741fca Andy Shevchenko 2015-02-23  492  
2b49e0c56741fca Andy Shevchenko 2015-02-23  493  int hsu_dma_remove(struct hsu_dma_chip *chip)
2b49e0c56741fca Andy Shevchenko 2015-02-23  494  {
2b49e0c56741fca Andy Shevchenko 2015-02-23  495  	struct hsu_dma *hsu = chip->hsu;
2b49e0c56741fca Andy Shevchenko 2015-02-23  496  	unsigned short i;
2b49e0c56741fca Andy Shevchenko 2015-02-23  497  
2b49e0c56741fca Andy Shevchenko 2015-02-23  498  	dma_async_device_unregister(&hsu->dma);
2b49e0c56741fca Andy Shevchenko 2015-02-23  499  
4c97ad993d76390 Heikki Krogerus 2015-10-13  500  	for (i = 0; i < hsu->nr_channels; i++) {
2b49e0c56741fca Andy Shevchenko 2015-02-23  501  		struct hsu_dma_chan *hsuc = &hsu->chan[i];
2b49e0c56741fca Andy Shevchenko 2015-02-23  502  
2b49e0c56741fca Andy Shevchenko 2015-02-23 @503  		tasklet_kill(&hsuc->vchan.task);
2b49e0c56741fca Andy Shevchenko 2015-02-23  504  	}
2b49e0c56741fca Andy Shevchenko 2015-02-23  505  
2b49e0c56741fca Andy Shevchenko 2015-02-23  506  	return 0;
2b49e0c56741fca Andy Shevchenko 2015-02-23  507  }
2b49e0c56741fca Andy Shevchenko 2015-02-23  508  EXPORT_SYMBOL_GPL(hsu_dma_remove);
2b49e0c56741fca Andy Shevchenko 2015-02-23  509  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
