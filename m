Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD312A1D7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 07:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735631233; cv=none; b=tfspfZcWMHvMa5xJXcVqL7vg+/JHKLXEetq4pj1bgBN+pL16Bfq02LuEWYjngKMUUjNQu+MGkxtJvu9Tg74kstXj2gaQ6ZEbvqGXrFUhyiDvok254O2q4XpasoWKgw4YzkOGG2VkNKCFtCo9lag9hqCgOnXGEgxfwfHUB/mTmKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735631233; c=relaxed/simple;
	bh=+t8xr5qjFSbBo56HYZIOBn5qlpHOuI0Q4jHTtQgozDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jSBxvNkQpBBJsWIqH6aglsAexXb1Fny7vmISiPxemIZH9nBX230uiORBfBDMKP9/UbQzwBEWpieN8QYZGzRlIS1+w3MJWakvWCZiCKzLNm1G3PEMshT3sr8Nm7RTAMxBzTCzhWcamQsaugGMvenzR6dl1Dp0ewxVd3w28kQ3ncc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jv6YTVMJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jv6YTVMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735631232; x=1767167232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+t8xr5qjFSbBo56HYZIOBn5qlpHOuI0Q4jHTtQgozDU=;
  b=Jv6YTVMJpHjyurc1N3paD+pcuFczXsvhIuSc9B0LfSrIkq5szwls2v9v
   GltruyX4sW7fYmg2Uf5qZElZdYDO+Y9sxJwz6Ww0JMtNF4ZHTSY67G9q7
   /a+Csy9u/yey7Qz9gO+8Tyf5vVMdQkFj+Qu5rueoJnRv6EXl4Ejq4+VK2
   1/PWFQO4GzjWqnb4DHFFVzbacxdxvV+A8c6lveIkQBEucIGR9CtK4n8i/
   J6PySwb2slAsIbghEDN7wSU1nJLLyUZzJH4WqeC01fz2FlHSGbPpLoPAX
   xHVV1W5shWkp9c+Hs1E7euMhzlC5lRakCsPOKei6E4NxicyAn8gTw2Rx5
   g==;
X-CSE-ConnectionGUID: KXDSszVWQvOM+VzKnHxNlQ==
X-CSE-MsgGUID: IhyTZehTSDCxfPsdCxfzjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35813940"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="35813940"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 23:47:11 -0800
X-CSE-ConnectionGUID: xvjevwoUSUi8rA9RP0Nvxw==
X-CSE-MsgGUID: i+aaMFdLTzGLeHr5JDBebQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="106058003"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Dec 2024 23:47:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSWy3-0006vv-2v;
	Tue, 31 Dec 2024 07:47:07 +0000
Date: Tue, 31 Dec 2024 15:47:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2610/2610] mm/vmscan.c:4737
 get_swapcache_reclaim_num() warn: unsigned 'swapcache_watermark[0]' is never
 less than zero.
Message-ID: <202412311538.MIuGFM8n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   2a9b96eb97cfd6f68e431cb614cb0b75b127d783
commit: abfd8691d951fb037506e1ee52ed39abee8430fa [2610/2610] etmem: add swapcache reclaim to etmem
config: x86_64-randconfig-161-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311538.MIuGFM8n-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311538.MIuGFM8n-lkp@intel.com/

smatch warnings:
mm/vmscan.c:4737 get_swapcache_reclaim_num() warn: unsigned 'swapcache_watermark[0]' is never less than zero.

vim +4737 mm/vmscan.c

  4733	
  4734	static unsigned long get_swapcache_reclaim_num(unsigned long *swapcache_watermark)
  4735	{
  4736		return total_swapcache_pages() >
> 4737			swapcache_watermark[ETMEM_SWAPCACHE_WMARK_LOW] ?
  4738			(total_swapcache_pages() - swapcache_watermark[ETMEM_SWAPCACHE_WMARK_LOW]) : 0;
  4739	}
  4740	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
