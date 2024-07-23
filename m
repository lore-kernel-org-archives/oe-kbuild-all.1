Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314A8152537
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 15:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721747381; cv=none; b=OTUZ1crG6orpHni3slyRfVp9+GF3NRWoNQwttBZ3ImbZwLQ3gVXHChXWRoht577ZfI7IgzIAO4V3eG4AS5H5VYSGXTnOReB16gmnNiT2R83iQufXZLFGlDBbFknDbvGfkQl7gcSgKLBtTfQBrJcMvrZpWbnmtGZYvHI8k/ij1cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721747381; c=relaxed/simple;
	bh=LDjrveJd6gnpH/Rf/DP0ROgT3Q1soBrVHEbau9vNEk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lgfzhas6RUB5Z4sBb0SQLfeRFnV10MwXbpH2jzDEwlLjeQLABUKeiijzKINMh25Ai8h3nMWEzNNVD/kPOI1ww4jPLMd0jjY4hvxViEeACK2RfGMEEmw5wLx6Rbd1wMv94V623pSaaJVYjXwOLo5zp/LDpfoIJ6CSXcE2rnN7qmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvhe75IS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvhe75IS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721747380; x=1753283380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LDjrveJd6gnpH/Rf/DP0ROgT3Q1soBrVHEbau9vNEk4=;
  b=mvhe75ISPauqwQ/oauTTXkMK2FgFwH5ehVYzEE2gSJ7CUiqC4uOqx6v9
   NR6jy05byJPBvrNImNrL1Fh2VbUAOk1DaojuFNJMkJxORwireS2y9FS2p
   3MyI9uQmWP+C0gwhol4Qwl5nLufIvsmnMNNEz0aPr3bf7AqPCHcmXTYgf
   1YlP7Ylx/D0lLMfUls6gbrlgASr/aOkka/gV2fE4db8z8suqty5AR53cf
   mgBIkojWOg6Dg2u4EaaseuzihGL68nkUhzOzuwRlk2oUk9+xicSogKL9U
   cGCuHEzjsSDqKj+aEOj68qm/7CyPs3APokVVOkyCmjLuMYwaXnTASn5wU
   w==;
X-CSE-ConnectionGUID: 7u/PPEu+TAeFE/BvWQL8JA==
X-CSE-MsgGUID: Trz1Hh9sRN21zjeIhn8pPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="23247772"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="23247772"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 08:09:39 -0700
X-CSE-ConnectionGUID: KtZY/k96Ry6bQOe3PVxhBA==
X-CSE-MsgGUID: v21uxEe+Q1isup/B9i/2Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="51980106"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Jul 2024 08:09:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWH8y-000m36-0F;
	Tue, 23 Jul 2024 15:09:36 +0000
Date: Tue, 23 Jul 2024 23:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Sagi Grimberg <sagi@grimberg.me>
Subject: [hare-nvme:secure-concat.v8 3/18] ld:
 drivers/nvme/host/fabrics.c:668:undefined reference to `nvme_tls_key_lookup'
Message-ID: <202407232315.v5jiMi9n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git secure-concat.v8
head:   7208e97adaac1f55470f41207881719fb19358e6
commit: acedba02a765716dcbd5a410d7822cefb62e674f [3/18] nvme-tcp: check for invalidated or revoked key
config: i386-randconfig-052-20240723 (https://download.01.org/0day-ci/archive/20240723/202407232315.v5jiMi9n-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407232315.v5jiMi9n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407232315.v5jiMi9n-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/nvme/host/fabrics.o: in function `nvmf_parse_key':
   drivers/nvme/host/fabrics.c:668:(.text+0x157c): undefined reference to `nvme_tls_key_lookup'
>> ld: drivers/nvme/host/fabrics.c:668:(.text+0x1a08): undefined reference to `nvme_tls_key_lookup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
