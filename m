Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B135B293C5F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825401; cv=none; b=XkqmrSslAbgEcOKKj1FWVt6yN85PXx53o3EEUO4d1FRcHtJDNOInsiFH9nqUZmNyr9IqSaFpzU6GyT6mj/+IWfpMD4GenxfzAhN73/Di+Z/8J5GWeRrRJEvSGUSTdfxPmuqd75C54Q8nw+1ntlFfYx5jIKIhzLDVcBBGGZgfYio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825401; c=relaxed/simple;
	bh=TcNobDaXlOWRhLJzH0dvyc5ND5wdjFMwDHce2V/tm6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oh2FE9F24l6j3Pj3Ix8wweTS+Nd2QO+EXULIF6bOMy/7TdxJfjKFQiJxcwMpb2HlUFFNqzuvTDtptxGn3S46FGz0DwpX3R7DqEptUKI9mtA+BfFRPpA3tMMyWQpLGqfweQCp5i+dAiqAnf62bgST/4zh+/1W7YVFrcK1hSU9wSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXyQ9wMQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXyQ9wMQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752825400; x=1784361400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TcNobDaXlOWRhLJzH0dvyc5ND5wdjFMwDHce2V/tm6U=;
  b=bXyQ9wMQkT+x3GZlhhp5+LHrY79Pz4yWeqCMp/W3iG1PZKzrWA6YgDQk
   MLsgz1L/1OsduVwuw167aKzZhqdBoWJyKRc6tykgoZUL4VCQsikGRhXZ8
   gcK1YeOCJah98ys11ax6TdS2L5UoFfcFyjqgLRfJ8R7YO5qY86JIUuCFU
   lfrVQ9FB+2QZzdXgjISXNBejjwJG0ig4jVhb+7bIs3SYn6HBCoznpTbro
   L2l6HLo2jXT6/JTq0dAuvEpvDfVBUWCz+5T7w1/nRYWM9dmwB0FO5o2A2
   FZZnPD/Hy0fA1isVk1dWImkGrIh3Dj4Im09rduiJZUYkMZIWky+eUPYEY
   Q==;
X-CSE-ConnectionGUID: Gr5ewkKYS2e9aK0S/JZA3w==
X-CSE-MsgGUID: qu8R/5GnTGeF+IA7sUUiPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55267832"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="55267832"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 00:56:36 -0700
X-CSE-ConnectionGUID: y9S2PkLfR7+yERJN0rMz2Q==
X-CSE-MsgGUID: Th5sjQF8Rg2nKZDfNcINGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="181707076"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jul 2025 00:56:35 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucfxI-000EPX-3A;
	Fri, 18 Jul 2025 07:56:32 +0000
Date: Fri, 18 Jul 2025 15:55:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2527/2527]
 drivers/media/v4l2-core/v4l2-subdev.c:2253:10: error: call to undeclared
 function 'v4l2_subdev_get_locked_active_state'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202507181525.PYgxRhvq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cbc572af8c3daa87a87df19c570fb3fd3ed99022
commit: c1be6d998806425f28600e867a8e9a2dd9bac741 [2527/2527] media: subdev: Add v4l2_subdev_is_streaming()
config: x86_64-buildonly-randconfig-004-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181525.PYgxRhvq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181525.PYgxRhvq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181525.PYgxRhvq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-subdev.c:2253:10: error: call to undeclared function 'v4l2_subdev_get_locked_active_state'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2253 |         state = v4l2_subdev_get_locked_active_state(sd);
         |                 ^
>> drivers/media/v4l2-core/v4l2-subdev.c:2253:8: error: incompatible integer to pointer conversion assigning to 'struct v4l2_subdev_state *' from 'int' [-Wint-conversion]
    2253 |         state = v4l2_subdev_get_locked_active_state(sd);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/v4l2_subdev_get_locked_active_state +2253 drivers/media/v4l2-core/v4l2-subdev.c

  2242	
  2243	bool v4l2_subdev_is_streaming(struct v4l2_subdev *sd)
  2244	{
  2245		struct v4l2_subdev_state *state;
  2246	
  2247		if (!v4l2_subdev_has_op(sd, pad, enable_streams))
  2248			return sd->s_stream_enabled;
  2249	
  2250		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
  2251			return !!sd->enabled_pads;
  2252	
> 2253		state = v4l2_subdev_get_locked_active_state(sd);
  2254	
  2255		for (unsigned int i = 0; i < state->stream_configs.num_configs; ++i) {
  2256			const struct v4l2_subdev_stream_config *cfg;
  2257	
  2258			cfg = &state->stream_configs.configs[i];
  2259	
  2260			if (cfg->enabled)
  2261				return true;
  2262		}
  2263	
  2264		return false;
  2265	}
  2266	EXPORT_SYMBOL_GPL(v4l2_subdev_is_streaming);
  2267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
