Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F4A205AB9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 10:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614964; cv=none; b=CWKLUxPCPNMc11W2meYEQdB4FLEwfzoK7cf2pB1poWUFg/oObuLWhjLwK3wbUByqzdD/TafRlx/ZsQ/rxaSw+Gaexcdj0C4qf8fDvd8HwsJXmZXMug6QKCpJ/4sm0RAeEb+fi8ox+yRQ2kzukPnaaerzE9X+cHJuKQgAtAyWCtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614964; c=relaxed/simple;
	bh=U3z+v8ZvdKejNQeQND39yhVq6/gHRWuUiWl+DFcoipE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tCxXIGvhJX6FUH8caUf0I6jQJXkXVUksAQgZU9EJRgsTcpV25TYb5+ihsGqlqTAkq78wH3Q0R0fqDZXa8kDCkTJGmyZ3f3NBa07uocasN7iJa9yxp9+0fbIX3Tct79o6V33EnKKdA45zi0RS5IZ7MB7ygYxeu3xk9zUtOf86lmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAfT5AVR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAfT5AVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746614962; x=1778150962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U3z+v8ZvdKejNQeQND39yhVq6/gHRWuUiWl+DFcoipE=;
  b=NAfT5AVRy5puSzm3DzmQ5wrgTES/Eg21wT3qGKA6HJZHvjkk8iF5O0eQ
   iKQgCLD2bcC1/gyQGxuVbZsKz7NJBbrYEqTi5lHyPvIDn0gBGeaOYqKw+
   ZBVUX7rxsxI3zXJWUFQe7Yup1rII5MEPdeA7mzKRGWDVF5S51BPdZnU2w
   N8zpTed/gVYuMWvftmAOozS+QTj65K+l0Nlo8Ut4UAhiJ5am9lbFmxV+v
   RIomoq9pqehVAf+t9NhopuwcnODHsdRwr+7n3xlZNq9rd3o4GID20EySd
   A56gCFacIQT7+w+By8/JUl4PeZEJIMKOXsOdTStPPxaWkAC9xEn8i5VPN
   Q==;
X-CSE-ConnectionGUID: pi3qiEwLS6CQPSGTITLqbg==
X-CSE-MsgGUID: tOO/kEHrTyyejKGME1ohTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="65867035"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="65867035"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:49:22 -0700
X-CSE-ConnectionGUID: FH9zjW0nTFG5oRs7McNc4A==
X-CSE-MsgGUID: E5W6mXhkS5uQJS6il3NuPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135823131"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2025 03:49:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCcL0-0007dP-0j;
	Wed, 07 May 2025 10:49:18 +0000
Date: Wed, 7 May 2025 18:48:51 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:nvme-fpin.v3 14/20] ld: drivers/nvme/host/fabrics.c:1108:
 undefined reference to `nvme_dhchap_psk_len'
Message-ID: <202505071846.I76Xsaj9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git nvme-fpin.v3
head:   931611be0f664cca44e6df3a27f302d0a27a96b9
commit: 4686444a31c17e6dee095277ba4bfa255afd67ee [14/20] nvme-auth: restrict DH-HMAC-CHAP controller key length
config: i386-randconfig-013-20250502 (https://download.01.org/0day-ci/archive/20250507/202505071846.I76Xsaj9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071846.I76Xsaj9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071846.I76Xsaj9-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/xfs_zone_gc.o: in function `xfs_zoned_need_gc':
   fs/xfs/xfs_zone_gc.c:186: undefined reference to `__divmoddi4'
   ld: fs/xfs/xfs_zone_gc.c:186: undefined reference to `__divdi3'
   ld: drivers/nvme/host/fabrics.o: in function `nvmf_parse_options':
   drivers/nvme/host/fabrics.c:1100: undefined reference to `nvme_auth_extract_key'
>> ld: drivers/nvme/host/fabrics.c:1108: undefined reference to `nvme_dhchap_psk_len'
   ld: drivers/nvme/host/fabrics.c:1122: undefined reference to `nvme_auth_extract_key'
   ld: drivers/nvme/host/fabrics.c:1130: undefined reference to `nvme_dhchap_psk_len'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
