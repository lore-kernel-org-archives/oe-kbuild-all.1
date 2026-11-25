Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599334;
	b=fQV7/lgSuD0e+YomiWyy2e7Wq/vLT8UJ9dZJTmsqJPpwmvzvRdcF+yBYr58YZE9jqeek
	 Kbf3z4gfefDblfbCf9K+dshRWAvCEWOme6iqjWwOAmdgJA92pB+4fdhWN3cfkVytedryu
	 dXhIXs6sDf3Vs0a0lKeTAYqGvdOEUhz3qNq5oGKdJmd2Jub85ubTOyqefigkBAtYaKcGO
	 AGK5Y94l4qL2GeXkUqQQcAdQImoZcUh51MOx1mF6wgVClDxATvFWlBYutj93GEMPejy4N
	 kl6jQfYAt8GlAcipXO2w9J24jxd7+gKvb3r7ZxpvHeceO4P7lltIFH7glahJ4SWVwrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599334;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=lWlGP+Ou3VbMvXRiWf2VUrbZoItxcuCKRD9aSDkrNIo=;
	b=05Y7FDTvCZWrIessP6dVqq8XJW2ePLZ7DM6Ld4IgXYyEdm7SZPPIA7b+YY1sfWZpZ36y
	 Ifu1cDtyBzNasgu67rAyOovkXyUUJZ83/25OzC3PSygwL/rmlNjuXrxQDZfYZ0sEZVgQs
	 tY+YdJxEsPS6cwbWtIvzSPCKDlaI2ZkwBqXmdRxwR7Qm31dmaQqx7n3JHIxhEVMd8FVzb
	 2SpANIiXwSQXhb4Ho1xr8oo2ushUsxy4wTi0rsSf10VAgOwN/MqwKSwqtBldMuRGeU8QR
	 6e8Xvz6zjdF2leIo+aiOML1/0K7lGhHHQE3wIieWXe30sGBXK85HlaE5+oHOcTwbB3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VwsvQWjN;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E9C606A6B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 09:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43E9C606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VwsvQWjN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795599334; x=1827135334;
  h=date:from:to:cc:subject:message-id;
  bh=00uX1NQG46bUWx6NkRFg/fsjUJ6HFdTMVvTYmoFvSuA=;
  b=VwsvQWjNY7WNNMfQ8IkdXMe1py1AfAdUBUOI53t6c87Lx0QVrgABB1AV
   SEDvMy36GwgF3vA/xiqjFN/zp9dW/HgQjjjTxlhcjWD2UuGPss495cCEI
   civ2Lbn0JkQVuc5yuvK3zC8bP9U+7cVrj6K2WrotJqFxUd2D/kHKbi/ZQ
   7L+5l0MF9urtJ9gdEMLSPzOioDTFmRaehRy0/Jwijmj/roYyDALFTceZY
   ujKP9RWGUgOX5R9mcTlrUNtDrKiCz54mmtqjdi9tAxd+kxVw7Xw5mv/vr
   r+RGpzWYNsdMr1KnVy9hv6/y3jzNxHvN9ZOk2XFXX/GDm0LjXrHLXzEOL
   A==;
X-CSE-ConnectionGUID: uvLfkapLQ0uKxKx/IiztjA==
X-CSE-MsgGUID: aeBzGnZZRVqtanKOvDGAJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4531281"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4531281"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 01:35:33 -0800
X-CSE-ConnectionGUID: kVIqQh8DQMOkWK7WBYaiTA==
X-CSE-MsgGUID: 33zrC3G/RhaZAVdAtpNkpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11686482"
Received: from igk-lkp-server01.igk.intel.com (HELO 99c479ab0aeb) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 25 Nov 2026 01:35:30 -0800
Received: from kbuild by 99c479ab0aeb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xW9PS-0000000006N-1lpK;
	Wed, 25 Nov 2026 09:35:26 +0000
Date: Wed, 25 Nov 2026 10:34:55 +0100
From: kernel test robot <lkp@intel.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 mm-commits@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Subject: [akpm-mm:mm-unstable 33/408] mm/mmap_lock.c:572:14-33:
 WARNING: atomic_dec_and_test variation before object free at line 574.
Message-ID: <20261125102827.xQ94ZCi1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   c8117bff684306f5c1f959d055cc2b24dd67b1eb
commit: 549e0b6c9835de4cc4e8e4a56459ef09febfc2f7 [33/408] mm/vma: drop mm asynchronously in vma_start_read()
config: sh-randconfig-r2100-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125102827.xQ94ZCi1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125102827.xQ94ZCi1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/mmap_lock.c:572:14-33: WARNING: atomic_dec_and_test variation before object free at line 574.

vim +572 mm/mmap_lock.c

   569	
   570	void mmdrop_async(struct mm_struct *mm)
   571	{
 > 572		if (unlikely(atomic_dec_and_test(&mm->mm_count))) {
   573			INIT_WORK(&mm->async_put_work, mmdrop_async_fn);
 > 574			schedule_work(&mm->async_put_work);
   575		}
   576	}
   577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
