Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751478;
	b=xBvVelBkccU9ImK2j2R33tibmubnZDZKF21czvienOVYAbfVz95NKo9PgS/F6cRkZdx5
	 EMz2VEbs419ClnH63oL8CWf2zDgj2ZYFl4XmtUqP0Rbbb4zqmxC97WHDLIvnTYJJ71vFL
	 MTc6cnVLjSh2P80QclZw0iZTlD+cOgT/6XJiVD+5xVLcqIqpwCGOhHY65dPHy0DQp44Vq
	 9vQl6/ethl9A0VJ2/ZDjcN/qEKmzwqXg7Ua+jG3HxlqiGaXVgwJPNFV62uLtpRhCIdtNp
	 DMdw6NF46oi58wtj+KhA2as5I6sp2Rc0MEjS0mYKfqod9bj5P4DqFnZSP8SG5YndO6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751478;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=FXAXjRSUbOLjrS4vrWtde+SaB6uZ/+VB41woDrAbWOs=;
	b=fnW0S/piP+fWLUi9KeRtdGBe7uN+KY+d7vkhGlmNO37RRgQa/lxWFSGi5RJ53xTMw24w
	 MRG7NI2kPqtX07S/TzODXY8YOJ+g+wNlHFym7PmLljBMr3UogdMZZoJbiPBikaIIUGmvb
	 IYCkSDPZZe8QSRDKOr0PexaOM6IXCm+06rVh8ivCWrsTXwpt7l0/fuJd25AmTZa7rt8Re
	 vx8toSqdXs8WKOzYihR4bmM2Ggo8yROKulAxyLlMvTMeZ5hYAIi74Z7JAogZSuWQOPQMx
	 67iruNAncPW5zMAC56YlWNACXnTzleRDjPVt8FnFer8LrzYGgbqNsEwBN68pLfXJJqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZoD3KhJ0;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECA7606A32D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 00:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ECA7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZoD3KhJ0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793751477; x=1825287477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/MksnKs3/LA3Id6bFlj3XQy2BHXig5n194B3PRJNlvQ=;
  b=ZoD3KhJ0/xBQQ5Dz24vlJKJJqygFMzPkY/QiSHDxPziu3K+mrEIYNmWV
   Ly1h7X99gdSeRl6NPmIMwMDF9sMrtPtTXbwyNNPlZBeF5QPPv3x4P+r2a
   JX6Eldh/CzW1bRghjgkT3YD4GmGxbC2ejzZBWzW4BrvRpI3s99gsF5AYq
   zITzNAYVcIx1Uu76IPHd4k0AEEBnOaj8dgnx8N9hwelvgkTi4aVT/zTjk
   hUFrcRGPVjFk6k30QQFctce08J3WlZCXwDh68xn5T68IoHPbyjvmRPlBV
   DQUvWqDLdLqQ7D4WAVf+B9zVM2hw87WWWQ0A3TV7Rqpw+LFopRj8sEZwD
   A==;
X-CSE-ConnectionGUID: fQklGIQbRQqQZEP33VPYXQ==
X-CSE-MsgGUID: 8mtF2rJWQjaSanVf/6iKSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2376342"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2376342"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 16:17:55 -0800
X-CSE-ConnectionGUID: ExhY+f+vS6SE7GSEwgiZCw==
X-CSE-MsgGUID: iWzs5gGfSFGiwucAwA5ITw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="7116555"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2026 16:17:54 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOOhL-00000000jWR-0aqD;
	Wed, 04 Nov 2026 00:17:51 +0000
Date: Wed, 4 Nov 2026 08:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	jic23@kernel.org, andy@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] iio: hid-sensors: fix fractional part for unit exponents
 -7 and -8
Message-ID: <202611040803.1mUBmX0y-lkp@intel.com>
References: <20261102222309.439895-1-srinivas.pandruvada@linux.intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102222309.439895-1-srinivas.pandruvada@linux.intel.com>

Hi Srinivas,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linus/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Pandruvada/iio-hid-sensors-fix-fractional-part-for-unit-exponents-7-and-8/20261102-142308
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20261102222309.439895-1-srinivas.pandruvada%40linux.intel.com
patch subject: [PATCH] iio: hid-sensors: fix fractional part for unit exponents -7 and -8
config: parisc-randconfig-1000-20261104 (https://download.01.org/0day-ci/archive/20261104/202611040803.1mUBmX0y-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611040803.1mUBmX0y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611040803.1mUBmX0y-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/iio/common/hid-sensors/hid-sensor-iio-common.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
