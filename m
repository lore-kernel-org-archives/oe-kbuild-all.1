Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF6A3E2AD4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 11:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090562; cv=none; b=uZal4qVbq+3kRokyZGnooLIqe+okGNSmtjlVvMEqEYvikZopu3tOH8ZldlYv4Ft9xU8UBCw2NiTgucwY9TcgF2UmxS8sDH6Z3IhNvdP1A/Ce9oIpJiHbbcVarIsKIMLg6yby0kE2pgpltnrUGomdSREeNS6jHvI6vXzP+BOLC80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090562; c=relaxed/simple;
	bh=iMB5g58Iy7h19gNQVgoYcfyGxc2I6hTzyB0wPJ3k3S4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JE+xDIQ0lNnUlbZKSdE3N3QWeb1HvUpv/hycKISjm1wfWHF5tLkj7m0hxdZhP7eVu/oR+46UPRDcnuPdIViDC+2NzD81c5k4WCgJUxa0hJ+tTgcgvjNWUSsWqBY4mx+DT8tjPMKVGPeShr9smQwnyLU+tXzDLVF/jluYqOQbWqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WcBNgldC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WcBNgldC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781090560; x=1812626560;
  h=date:from:to:cc:subject:message-id;
  bh=iMB5g58Iy7h19gNQVgoYcfyGxc2I6hTzyB0wPJ3k3S4=;
  b=WcBNgldCY3ZrzPuHGct2fl43zl3qFA+LvjSU+AJbqR8BDw3T/+0IR0mP
   Bjib9U3sUj1Rvn2VpwJ2bob3KOZg8Oz6T70sWWvTl8vf9SQMbTnPjDeXW
   Tl0edbHCRazBL/yZyg/rkJWotQyhnuFIzIh1KaSg9CKVSIco//Tx7QWsA
   7y8RHpbMB6p4NJXmx2YoSdX4pe209ESsmoDbIDIQR8VVflWjoxoR7O5DV
   Dpp3pcyufTXnhtXfCQ2a8t7p0tRN83CiRbu2nB1FOAICnHVNcYBiLYPqi
   YfTwHYLb0WXlgM2s1N8B6FfFLVaFwMXQTQSre1jdEP++MLtKAO4XVR6kF
   A==;
X-CSE-ConnectionGUID: Wt4zhYCVSWS6kRGinVXcQQ==
X-CSE-MsgGUID: wAUauvD3So6JazaZtZmefw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85507222"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="85507222"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:22:40 -0700
X-CSE-ConnectionGUID: fOU/AfHXSFWhk7HbBw2FIA==
X-CSE-MsgGUID: DLWJQkTmSNqDrQrw6cVcmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="251064408"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jun 2026 04:22:39 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXH12-00000000LLK-3ByQ;
	Wed, 10 Jun 2026 11:22:36 +0000
Date: Wed, 10 Jun 2026 19:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:block-error-injection 3/4]
 block/blk-core.c:141:33: sparse: sparse: cast to restricted blk_opf_t
Message-ID: <202606101953.PdmBi8go-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git block-error-injection
head:   5976bb2f6894c34ac87cd38acf150423724c4628
commit: 7979d56135777d83ac77af6854484aa7a4c8c871 [3/4] block: add a str_to_blk_op helper
config: microblaze-randconfig-r113-20260610 (https://download.01.org/0day-ci/archive/20260610/202606101953.PdmBi8go-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606101953.PdmBi8go-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101953.PdmBi8go-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-core.c:141:33: sparse: sparse: cast to restricted blk_opf_t

vim +141 block/blk-core.c

   134	
   135	enum req_op str_to_blk_op(const char *op)
   136	{
   137		int i;
   138	
   139		for (i = 0; i < ARRAY_SIZE(blk_op_name); i++)
   140			if (blk_op_name[i] && !strcmp(blk_op_name[i], op))
 > 141				return (enum req_op)i;
   142		return REQ_OP_LAST;
   143	}
   144	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
