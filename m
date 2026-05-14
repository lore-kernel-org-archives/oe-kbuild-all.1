Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A751531C8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 00:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778720218; cv=none; b=O3QDfufb84n23Id0q0Pbjk2xyywFeGW3tCEZKnnC3zk+soMIX7/4e4F1DSECLtPIkZ10yM4dQq47qfGKDr2Sly2JMVANZQfl8GTXtLPfooDjxm9UmbRdLr9D5qGwPLbyKwy9zfkQHwp4+Wd2tbE4PaJTulMO4yVHucWfczMdPEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778720218; c=relaxed/simple;
	bh=vyu57ovXPjleRJ4YGZDfKQBeE3LjznYEnTFJmwS3NkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=is//tjY6pQLL09kn6r2su4m9fXB+FAkfDHWyqse0PFBcIfYc2++4/ypD6Rnio+w5fzFaGo1lmyNuejuzIHVv13D1uzgMUGUUz7Vx6+6lhsN37+6qreSFQh7RPZWOC3xp0zytVgD2Rf2fdAkhG0eD/JRNQ0WyE1NSp/jWWk/+g58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8PlR3nC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8PlR3nC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778720216; x=1810256216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vyu57ovXPjleRJ4YGZDfKQBeE3LjznYEnTFJmwS3NkA=;
  b=T8PlR3nCvo5qldI3QA+qYMMEYSy6Wi0W+AdZp6aPhXH3V3yVt4Her7wT
   aOuvTbOxt2mMAxXHJqJrbQxBiaBcaYvmUt/cOQFgL0p6K7E9+tHo+vnOs
   G+4p+42u7nb7IJPAZnpbFL5V3VxNUdUtJ+g5PTZOabFzWKUECDrI8lhrj
   6pMUACDJj9XsjzZmkCSApI0hBNoKoVYUtYGWDqU+mYB83WJGRbn0LQptq
   Xt6EvnmPu+Q6ccExn5muXv1xddzhqtHxymibFyLqOfNs33hWx5zbXLA4E
   KsVaqSZgfwHQb43iidbMJcWc/MbNxQ0f7BSgm5XJ6Mo5JTXQW17PE1y7b
   A==;
X-CSE-ConnectionGUID: 9Mm40GPYRa6Z/68UOWg97w==
X-CSE-MsgGUID: 6KDMQyq9Qw6I+XCYICfCEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83507941"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="83507941"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 17:56:56 -0700
X-CSE-ConnectionGUID: IB6DiO87RHO8nISzs2kFBg==
X-CSE-MsgGUID: Y7bWg4vrTXaryqD/8ip2/Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 May 2026 17:56:52 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNKNd-000000005S3-0imQ;
	Thu, 14 May 2026 00:56:49 +0000
Date: Thu, 14 May 2026 08:55:57 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Akash Goel <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/gem: Make the GEM LRU lock part of drm_device
Message-ID: <202605140848.SHAmSWp0-lkp@intel.com>
References: <20260512-panthor-shrinker-fixes-v3-1-3bf066259471@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-panthor-shrinker-fixes-v3-1-3bf066259471@collabora.com>

Hi Boris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b2ed01e7ad3de80333e9b962a44024b094bc0b2b]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Brezillon/drm-gem-Make-the-GEM-LRU-lock-part-of-drm_device/20260514-051749
base:   b2ed01e7ad3de80333e9b962a44024b094bc0b2b
patch link:    https://lore.kernel.org/r/20260512-panthor-shrinker-fixes-v3-1-3bf066259471%40collabora.com
patch subject: [PATCH v3] drm/gem: Make the GEM LRU lock part of drm_device
config: csky-randconfig-r071-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140848.SHAmSWp0-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140848.SHAmSWp0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140848.SHAmSWp0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_gem.c:1643 function parameter 'dev' not described in 'drm_gem_lru_scan'
>> Warning: drivers/gpu/drm/drm_gem.c:1643 function parameter 'dev' not described in 'drm_gem_lru_scan'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
