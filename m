Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198CD1991AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728642794; cv=none; b=jRHmXw9B685G74/IhcSwBUi6ilS2x+U12TL4iw3ykADm1BInYMyLkmPQ5AQ7+xFkyIFsTlPM7C4mPBJ99kZdm8y0jlhZLoeDSS+z6lJNN00wlaTu/5NsBNecofePXIcOUXN4VuwdUFnMeB/kQZ6iyOkjOUGlKX2GdJD3jqpRanU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728642794; c=relaxed/simple;
	bh=U+HL9PRruHTQY1bUjkX6pR4Sq95/+HjwZykGBtPGDiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tmwCTK1ipfU1e5lrqpP6zEHCi8WmvSnpcJEPEDGqZY6fwqdjhmB7J2k8pBmSYLgkJALQ6DI43dRPWoZSlWvMYnttUyCUXb6+iuvXQ5045DB3NRQrJlm1fB+6MEi2BJgiNzbspzETplEY5mX7eD4uynzLKqhBEinQFd3ABwF05ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALYKyTpE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALYKyTpE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728642792; x=1760178792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U+HL9PRruHTQY1bUjkX6pR4Sq95/+HjwZykGBtPGDiM=;
  b=ALYKyTpEHFPagBiJmaYLbc+XEsf3rPY/n60+UkSdL1zZh5kH0IkFCzBC
   VpvBGq3ohnY9JBOdQPAFnr8P6KK/XxkEgHz1+FP7L6MiaatEIs8Fjywde
   VhuShmOBSwx8RLvEOqcRKPY/K8+xCgydssN5B3uNfFQB+syzAz9DmVjmO
   UD04ejxwS2qAjkmSP6hqV3bAIXt7LiL6rq99tmc2kkAKcKeBTTE/38gZT
   C0AHyidsvv0oic0d7UzTWDKKRubjn95lLGdpYJ+XbO2OpDjTxedvNOiKX
   Jv5SIuqSKSOX/GUzGTBPpOjqjyUampGwZF2gvwXcObZAxr/+Qo84y1uPe
   A==;
X-CSE-ConnectionGUID: IDA3mW+FTrSrKoIu7yDIhw==
X-CSE-MsgGUID: YOuBHfUISrOis8XsOdK/UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28178872"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="28178872"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 03:33:11 -0700
X-CSE-ConnectionGUID: 0I3+Uw+SQ/K0WqgaOwsqXA==
X-CSE-MsgGUID: xpm7KpyYSzi9rehgXiyG3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="107601127"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Oct 2024 03:33:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szCxI-000CAb-1x;
	Fri, 11 Oct 2024 10:33:08 +0000
Date: Fri, 11 Oct 2024 18:32:14 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:block-dma 9/9] ERROR: modpost: "blk_rq_dma_map_iter_next"
 [drivers/nvme/host/nvme.ko] undefined!
Message-ID: <202410111848.NTNI8DsJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git block-dma
head:   d76f41fc7d0f68b85c90d0beb90a09f54b6aa219
commit: d76f41fc7d0f68b85c90d0beb90a09f54b6aa219 [9/9] nvme-pci: convert to blk_rq_dma_map
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20241011/202410111848.NTNI8DsJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111848.NTNI8DsJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111848.NTNI8DsJ-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

drivers/nvme/host/pci.c: In function 'nvme_free_prps':
>> drivers/nvme/host/pci.c:552:22: warning: variable 'nprps' set but not used [-Wunused-but-set-variable]
552 |         int prp_len, nprps, i, desc;
|                      ^~~~~
--
>> ERROR: modpost: "blk_rq_dma_map_iter_next" [drivers/nvme/host/nvme.ko] undefined!
>> ERROR: modpost: "blk_rq_dma_map_iter_start" [drivers/nvme/host/nvme.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
