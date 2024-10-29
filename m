Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D828E322E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 04:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730174504; cv=none; b=uAK4d/t+e7eZXD/Rx6P507EM9B7U5Rdy+LbFq7TpZO813Z0TgGT3RYuKSSdh4ELENh9cB34mtjSQxdwwN4NvImnu+AZcIHQ+aCAvCXL/1ss7lJU1fhQv7NNvDhwhfPokitYkxWKnsX8uLSI0EfvdHFWfTgPeojJ7glqYQSgj0y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730174504; c=relaxed/simple;
	bh=hEqrsZ4En4Ufr+8ZMUj5GXGG55ECgvnGQh62eg8lvR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iSdwZVuA43wDNKae9AgVgRKmUy05kiKHKNs/PmNrAVl/ua86mc9NGfTuWzVr/BoXirlDR/soEsOZDoJQ3HQdBjMzcRhLoLwLW1srvtuMAsp4HMAd9x2I/XJeB2TWa+WE6hJoNkItT/uGe8/zfTjCX11+/43GXf0P/kjfmskOOhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EINSF6Tc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EINSF6Tc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730174501; x=1761710501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hEqrsZ4En4Ufr+8ZMUj5GXGG55ECgvnGQh62eg8lvR8=;
  b=EINSF6TcoesLctskjFPsPzMk414CHAcc+K1dfrVfD5xntN3+Y2Q8Ahy+
   rbsypeBHXdE28a+tNIqg0vFKwQV7J9rFAzvHMrxro7e3zIlM+BMPAbfNK
   gAbUaoCMAtFG1ZW79jwttNcSTmngAvbPtfQsVjSMGYtnNRql8BT5Y6QMN
   KghQ2HmX6fMIvcejKga/U8IDlUFj2pc9NHVoaO0UEd0yP5qBlbdYpaUgk
   Wyx/I5rwQpiULibLhAWtPw8rsuKvLtyG6NJ1R+J3Me8sWRlHXKMZMTnkA
   ha0jLohXIXO8jzkB3mQ0S6kmLb2+gRexRWIaWS9zdPHiBwbXynxgXtUaT
   w==;
X-CSE-ConnectionGUID: om9WYea9TWaci7nR4UVwJQ==
X-CSE-MsgGUID: x3xWI8gxQHihHFYNkGOxwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="41159090"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="41159090"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 21:01:41 -0700
X-CSE-ConnectionGUID: G7BsupGIQ26Skk4Za0cofw==
X-CSE-MsgGUID: bN9WXntiTNSpNISEfBw6FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="81448756"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Oct 2024 21:01:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5dQI-000dDq-0h;
	Tue, 29 Oct 2024 04:01:38 +0000
Date: Tue, 29 Oct 2024 12:00:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 18629/30000]
 drivers/ub/urma/ubcore/ubcore_main.c:61:5: warning: no previous prototype
 for 'ubcore_open'
Message-ID: <202410291112.nLGMJoif-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yizhen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5dabb43a473af8dee4493436b2946432f83d2620
commit: 95c713224477ac3433652331dd715e9bbcbc793a [18629/30000] ub: init ubcore module
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291112.nLGMJoif-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291112.nLGMJoif-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291112.nLGMJoif-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_main.c:61:5: warning: no previous prototype for 'ubcore_open' [-Wmissing-prototypes]
      61 | int ubcore_open(struct inode *i_node, struct file *filp)
         |     ^~~~~~~~~~~


vim +/ubcore_open +61 drivers/ub/urma/ubcore/ubcore_main.c

    60	
  > 61	int ubcore_open(struct inode *i_node, struct file *filp)
    62	{
    63		return 0;
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
