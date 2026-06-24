Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B8C3B42D1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782309285; cv=none; b=jYzdHZ+ecf7dXE23aU5Kci2XxGSAypg4/ikbcAgRJCaXMy8PPxg1EZrDO03jwy6/Xbm4yGd56w+/Yc/frHv/m9LI+i26XLvwy8Tuu5nzunfcr1Ha7NmQD5awXk5lCUhUnZLAbr1vJ+OwL07vu36caqR5RCdeNyXMA3sYK4l2vio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782309285; c=relaxed/simple;
	bh=9WPO8F+MfDL6GPhatE/1nwlxUrjLgRGJ9OdS53iuvkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwobM4IdQhf6KeuGYY/0AhdqJ70qkp/DNZrCudVeu00qEYthz10vwA+YtZLgvt+9CtfaPoYzu/vxKvMA/U//H50mWgFkj6HgTPN6daq1hx/3VC7d3g9mUdWcEq8YHi1rv0x2OPcqQlS8sqpg5TjjSKWNXZbU8zXFitsfGBi9DXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpvqwZH5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpvqwZH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782309283; x=1813845283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9WPO8F+MfDL6GPhatE/1nwlxUrjLgRGJ9OdS53iuvkk=;
  b=OpvqwZH5Av+dMI6cE2+pocL2M51jAKFIHdg5xDhxkP4edauhFlQc0kB1
   IDQxughkaAMggThd8wWavowpSNrHROVx07I+oTFv1yT5wMrWge6VJLETs
   +uEKbScDMOuo360YWWuRhtkUXODFPM89KI5z4w53oBE5VRPCbaUx7b6Fy
   Y/bzjKt6yGyqmghkqV8wp9QEX8aKW5yvAG8UsvSNHk+KqLw3dN4uKmOZG
   x8aXC0eM2xgj1lN+R7kFEYcmiqhPz+EaNVMXQ6Kv7OHAcPx2rWqLRKFX+
   JVxBd9nZxI0um2pWin/p/N14Ntn0BCf6lIpqdUF5ZScGjvQFp51w2wNLm
   A==;
X-CSE-ConnectionGUID: xtJY5/MUTRip61G9wjD0pw==
X-CSE-MsgGUID: qepXdhm+TsaSkTskVvA7MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100497599"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="100497599"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 06:54:43 -0700
X-CSE-ConnectionGUID: hW+jkOYbQOaeHqYROJEtXw==
X-CSE-MsgGUID: Dbri+AwDTMSuueYoOmjeeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="245522157"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Jun 2026 06:54:40 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcO3o-000000003Ob-35gD;
	Wed, 24 Jun 2026 13:54:36 +0000
Date: Wed, 24 Jun 2026 21:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: Xuewen Wang <wangxuewen@kylinos.cn>, akpm@linux-foundation.org,
	david@kernel.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Xuewen Wang <wangxuewen@kylinos.cn>
Subject: Re: [PATCH v1] mm: fix data-race in folio_batch_count()
Message-ID: <202606242115.DmNPrSkD-lkp@intel.com>
References: <20260624092606.1083449-1-wangxuewen@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624092606.1083449-1-wangxuewen@kylinos.cn>

Hi Xuewen,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Xuewen-Wang/mm-fix-data-race-in-folio_batch_count/20260624-172724
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260624092606.1083449-1-wangxuewen%40kylinos.cn
patch subject: [PATCH v1] mm: fix data-race in folio_batch_count()
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260624/202606242115.DmNPrSkD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606242115.DmNPrSkD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606242115.DmNPrSkD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gem/i915_gem_shmem.c:6:
   include/linux/folio_batch.h: In function 'folio_batch_count':
>> include/linux/folio_batch.h:56:16: error: implicit declaration of function 'READ_ONCE' [-Wimplicit-function-declaration]
      56 |         return READ_ONCE(fbatch->nr);
         |                ^~~~~~~~~


vim +/READ_ONCE +56 include/linux/folio_batch.h

    53	
    54	static inline unsigned int folio_batch_count(const struct folio_batch *fbatch)
    55	{
  > 56		return READ_ONCE(fbatch->nr);
    57	}
    58	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
