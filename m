Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EE634B68C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 18:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769796386; cv=none; b=bToXWkzxyUAPhgm4AZLSZdI8wRYLB8s4+oZ/vPiUfElulgA86xkA7jAmvVEkzFXTVgDSKL48xOO2bBFbrasunC6BBiZDmOuF4T4CgDq5dzYWPbiexCQ526MTslPtV9RGJw2LJ4Yl7PYgbyrpC/5spRJCSx5nom8s/aucWoFfFuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769796386; c=relaxed/simple;
	bh=H+jXrA2PZaQGXjDif9XjupmH4HzdWoXQftcIe10KXVY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JTRLm0kP9NIH/J/bDp8TWgv0h/WhfDqyt/MIs3MPlKuFAAyqwO2Bh9cWJc/CJq3B8T5mqzj7GZaJULctlkrOYHiRamQoONPmVh87msrS1rT4wnCPE/BVgyg+UouhY4weCCjTr24CfE2Uk81CcwL4gAbHk+48fHWpLpUZRIm3pi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bc7VoDgY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bc7VoDgY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769796385; x=1801332385;
  h=date:from:to:cc:subject:message-id;
  bh=H+jXrA2PZaQGXjDif9XjupmH4HzdWoXQftcIe10KXVY=;
  b=Bc7VoDgYshJp9hZWPnH3KntzAsKXNbGw7+mydUnKEgfiYp9LZYDKV4+N
   YlXITksehgu7bpm3bvTAOro8ezTrFo8FZ3OwezlVKORs7y1g5UCFcrx2B
   eIEEAChLyLTflJWjQKpfdVjSQWvrJa6NRNxuuseHcag6sPrT0gVphgvpm
   Da4xQ0TwsxSGgWb1IWoHgSS1HOZpsawl8rxe6o9cN1fubF6j9Ceir2HmM
   Q3XihC7BMKivCyafIbWD5DPU18QJddNUqcTcjOA6zzwfoZT1EVcY0/c5S
   ZznkYOHTCID96Q5cl5Wrdm5ISxUb8bKHhD4Z/42/aK+ZtUB00VTgJZy+t
   Q==;
X-CSE-ConnectionGUID: n1BHIP6BSumtoldwKoxRww==
X-CSE-MsgGUID: TN9BvyZmT+usxA1bIDEulQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="81683294"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="81683294"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 10:06:25 -0800
X-CSE-ConnectionGUID: sWrSZpQtSuSQTSXxTvNH1w==
X-CSE-MsgGUID: 9zALVFapQ/q+zYwapHJg9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="208822959"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Jan 2026 10:06:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlssv-00000000dDM-1LXW;
	Fri, 30 Jan 2026 18:06:21 +0000
Date: Sat, 31 Jan 2026 02:05:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-waitwake 29/30] io_uring/waitwake.c:57:5-24:
 WARNING: atomic_dec_and_test variation before object free at line 59.
Message-ID: <202601310150.pq1U1czN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-waitwake
head:   6ea2a87be10e7164dd38b7a5c833f328417ddfd5
commit: 3a21c14af592499a36e6b278f16f5b3a3f1c13bb [29/30] io_uring/waitwake: add support for waiting and waiting
config: sh-randconfig-r062-20260130 (https://download.01.org/0day-ci/archive/20260131/202601310150.pq1U1czN-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310150.pq1U1czN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/waitwake.c:57:5-24: WARNING: atomic_dec_and_test variation before object free at line 59.

vim +57 io_uring/waitwake.c

    54	
    55	static void io_wait_head_put(struct io_wait_head *head)
    56	{
  > 57		if (atomic_dec_and_test(&head->refs)) {
    58			xa_erase(&waitwake_ids, head->id);
  > 59			call_rcu(&head->rcu_head, io_wait_head_free);
    60		}
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
