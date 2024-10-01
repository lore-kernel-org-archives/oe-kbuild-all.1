Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04831C8FC1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 16:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727801854; cv=none; b=bfnSaspwLSmwepM+e9IoNjwULXGgTpIJIsgAVXUFIvwdgnCIcKEHpQ7YCV8pMKIrhEKhZFpjb+x4GuaQ5r9huVtYQrQAaIFG2oLq3JyKzRHM4MSyLpEK+holWhoHxCObNBt97qNV3p+UvP/tjAukuOgySYa5vfkRUpw5XccZiks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727801854; c=relaxed/simple;
	bh=JLg44VE8y0joMB0aJj6nTRHbTTt47JKTMMUFbggr9C4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FS5M6LJsaEEOvREEi1kY7maC3l7nNbLr9BC1rVMuCDZ9wPXK22C2mMq/n8BvM3m8lmsc978jRAa0K5HgDK5ax6crtHbnTC3zdOsgXHDwlOEjK3vsjE8LsdKNuQVm6jbvGt4LP33tMaodl6SBp+fhfnGVdyffYQ1itqkanEk0vkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XB/eJnPG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XB/eJnPG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727801853; x=1759337853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JLg44VE8y0joMB0aJj6nTRHbTTt47JKTMMUFbggr9C4=;
  b=XB/eJnPG3uz+S+K571j3mExoA9XfTTtzMPpb5GkaMxIK2a/VCTFls8nc
   bONW2D9gVdkwHibmFjtsLby5LKWBYkhZlfJuXOyxbsRQcZhtBe1FKI5zy
   w9bL0bKNU9ObZsl+LI8v4MS8gxUBuypcD7a6dPuNmWE8rZQRa8JWJ7SBc
   WgwAKu/v+IWUX0c1sz02Myt1K3mOnUyf2S+ZEA8o0y8rsb4h9PhCha9Ce
   VyZILk+L/WsotE3Fx6ONmPkIKU9LKVEyL2hGWJ1Nxp5zox9bLTSfrG7FG
   mvbuHaUs47qP6n1c01/+PwPqbEoInJd/HYriyE3LQhvv47FF300+0+i/U
   Q==;
X-CSE-ConnectionGUID: aerbZXghQ7aAi2EAU2tPsg==
X-CSE-MsgGUID: h8bVWtJWS3G6beDstX8+rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26902253"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="26902253"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 09:57:32 -0700
X-CSE-ConnectionGUID: crLB3fvfQ66NCZLBobRbHw==
X-CSE-MsgGUID: 7MzDEg01Qja6hzM1uc7Crw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="111196245"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Oct 2024 09:57:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svgBk-000Qyn-10;
	Tue, 01 Oct 2024 16:57:28 +0000
Date: Wed, 2 Oct 2024 00:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JangShui Yang <yangjiangshui@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26379/30000]
 drivers/ub/urma/ubcore/ubcore_vtp.c:261:6: warning: no previous prototype
 for 'ubcore_hash_table_rmv_vtpn'
Message-ID: <202410020053.5eT51YoK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   084a6771cfb3ef307b750af8b7c35a07a725fc4c
commit: 013280dfab06d20e73de842e8d2fc2a200055455 [26379/30000] urma: upload kernel patch for 20240224_rain
config: arm64-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20241002/202410020053.5eT51YoK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020053.5eT51YoK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020053.5eT51YoK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_vtp.c:261:6: warning: no previous prototype for 'ubcore_hash_table_rmv_vtpn' [-Wmissing-prototypes]
     261 | void ubcore_hash_table_rmv_vtpn(struct ubcore_device *dev, struct ubcore_vtpn *vtpn)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ubcore_hash_table_rmv_vtpn +261 drivers/ub/urma/ubcore/ubcore_vtp.c

   260	
 > 261	void ubcore_hash_table_rmv_vtpn(struct ubcore_device *dev, struct ubcore_vtpn *vtpn)
   262	{
   263		struct ubcore_hash_table *ht;
   264	
   265		ht = ubcore_get_vtpn_ht(dev, vtpn->trans_mode);
   266		if (ht == NULL)
   267			return;
   268		ubcore_hash_table_remove(ht, &vtpn->hnode);
   269	}
   270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
