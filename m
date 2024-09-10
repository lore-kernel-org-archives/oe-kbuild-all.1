Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC69D17DFF1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 07:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725953883; cv=none; b=VlvrxTxNrjxijZP1Ddna67dJxlE+RVUivdsTFjvqeieswZ6HJQynqOI7S6KOCMwP+SKD/wSqrAMx4GdNA8Nv+4KXPP8NYIyutavQmozSLYOUz70G+YgVZNBMCJx/VfLjid4LjAUQeHidJIuyQ2EaXDa3fMUbBLGHAYtWKL8Aewk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725953883; c=relaxed/simple;
	bh=DH3fFLyIFy7OsEWAiczpnTO6jPf7i2CfKfqOt502Cqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Seg7JSPYB3vEXdMt62IL9AHytk4HDh5xAXt+s+VRpu6ou35ZPpZ0PYO5ZbFp6+6gt0HFakfR59oZHmoKIKIspC5WUf6LSf7YMdx+1/ggdw+eLVSxc5WuR9FM0hV/omaZoW+A2h4orf/rI4NNzC0QQD10yYw0SpD8iq2pUuP2ohU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FR8iYaoM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FR8iYaoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725953882; x=1757489882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DH3fFLyIFy7OsEWAiczpnTO6jPf7i2CfKfqOt502Cqc=;
  b=FR8iYaoMihvwufQysyGG9IMbAnwlbn5GB28KxecMrvVc2fKzd6O4BHLC
   rS2vP/MclH4BliJRR97WAhwEPUgOyjOdfmQgTN5cYVSd7Hec+Aeu0Q5Gh
   OWUa8wi2QLwyE+mTPm1TpJXyXFbZRCBew6vWSp+gAkF7+3EDAu3pptylD
   qKA8kX3CTTA7zjpud5IMYVGIZrKLHAByDXlkTcRMb1OojKM725YOU3e+b
   QN+Drapf3ktou6kiExliE+qowz5hCHmr1U37NPZEwL96DZbkHR8of6d/D
   Fz8ngR67M5UOtbwFWyGTgbYJ48a+XUJzJlXL84zjoF2Lyh/gVSs4dri9w
   w==;
X-CSE-ConnectionGUID: 4nre3JHZQhWMALnYci6g7A==
X-CSE-MsgGUID: 8jEvqhCWQBOWo3XHtaDyyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24184240"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="24184240"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 00:37:56 -0700
X-CSE-ConnectionGUID: 7u/BaIBhTPSROYpNV9Mv3w==
X-CSE-MsgGUID: 83cZP7azTZKvVlVarXpt3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="97758706"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Sep 2024 00:37:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snvRg-0000Ei-25;
	Tue, 10 Sep 2024 07:37:52 +0000
Date: Tue, 10 Sep 2024 15:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	Christoph Hellwig <hch@lst.de>
Subject: [linux-next:master 5013/10516] arc-elf-ld: fabrics.c:undefined
 reference to `nvme_tls_key_lookup'
Message-ID: <202409101534.Io9V2zBj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   100cc857359b5d731407d1038f7e76cd0e871d94
commit: 5bc46b49c828a6dfaab80b71ecb63fe76a1096d2 [5013/10516] nvme-tcp: check for invalidated or revoked key
config: arc-randconfig-002-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101534.Io9V2zBj-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409101534.Io9V2zBj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101534.Io9V2zBj-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: drivers/nvme/host/fabrics.o: in function `nvmf_parse_options':
   fabrics.c:(.text+0x1188): undefined reference to `nvme_tls_key_lookup'
>> arc-elf-ld: fabrics.c:(.text+0x1188): undefined reference to `nvme_tls_key_lookup'
   arc-elf-ld: fabrics.c:(.text+0x11e0): undefined reference to `nvme_tls_key_lookup'
   arc-elf-ld: fabrics.c:(.text+0x11e0): undefined reference to `nvme_tls_key_lookup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
