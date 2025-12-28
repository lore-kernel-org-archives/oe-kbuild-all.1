Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5F6241663
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Dec 2025 14:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766933893; cv=none; b=C9NDF/rMWc1E+TJYRmtV8kqRD+IOh64JVSJ3jjBzG3cs63pBq2eOzsvc67BaOQFuarpe2XNc8pzEAzv5msiefIUecRpCDArzK+LDOvkY+DLCdpzaoK7LZdSDKEfmyDuzbi7jwBBZqHS3ChzHyCGxfgBLCdrtZNS28vpIW/Bk6+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766933893; c=relaxed/simple;
	bh=gZbzHWwI22WiwX5dkFQlFY+nrAOzv/iBeuExMA06dXc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F08xYfdnPpAmZ4FxtTnAfw/UW/NRedKJjMxoNIYFrDKiaRJZfVjfVGyTLKe41pTHddVnjn1PWMFyg0hG8dvQx4/dB/PJLkNVfZG5yh4Nfz7pRoE4aRuyOnFOFFDak3eWwOEImNcHKf40wLdnVvoRXuy7DT8w93vVU5dv5md9zTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cp22KNPp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cp22KNPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766933892; x=1798469892;
  h=date:from:to:cc:subject:message-id;
  bh=gZbzHWwI22WiwX5dkFQlFY+nrAOzv/iBeuExMA06dXc=;
  b=Cp22KNPpf1zQ91lhUWV1sc7Tawst/lc8ccMTTCbQMrxZYcVPxuSym7t1
   TrqESvsrGWNjunn2vSLzucj+64uFDcFleJcuhMyZjeguyRWcVEaAY2kRh
   hv9pDAoAVK4moxXmU4ppcFcEY47Cm2/civTtJl81uoQhJHIrtaSzR3TvD
   e2ukxVpQ4a7i54H82Zl0tSuuh1QtIGMSeD2G73JgIg0ezHzkZNPXJtOLu
   cr1SVLbkjiVWW6bvzF1mBbFjn8cKw4EnhLi0FnlUtejSog7FGAJmbDsB2
   kBYh4ztJHEnXMFMlzx/qngOxN80tQ6RGO2k6LN4niZhn04KceVFPVVUOn
   A==;
X-CSE-ConnectionGUID: xQpstp+OSNCupKvT1Q1FNw==
X-CSE-MsgGUID: gMXhuLgsRRGbxoBveAEdpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68467455"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="68467455"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 06:58:11 -0800
X-CSE-ConnectionGUID: fTswr8MlSzuz746G4tfAYA==
X-CSE-MsgGUID: +4wJVGmpSAeDAcv0UdCACA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="231807228"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 Dec 2025 06:58:10 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZsDg-000000006Wj-0CNA;
	Sun, 28 Dec 2025 14:58:08 +0000
Date: Sun, 28 Dec 2025 22:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-next:security-next 18/39]
 drivers/infiniband/core/roce_gid_mgmt.c:455 del_netdev_ips0() warn:
 inconsistent indenting
Message-ID: <202512282355.U8gS7pIR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-next.git security-next
head:   b47c2e193a2478a1fede28030113459f63a85fde
commit: 7799b888f826f6e7932ca90db8ebe838f8cac3be [18/39] RDMA/core: add device registration debugging
config: i386-randconfig-r073-20251228 (https://download.01.org/0day-ci/archive/20251228/202512282355.U8gS7pIR-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512282355.U8gS7pIR-lkp@intel.com/

smatch warnings:
drivers/infiniband/core/roce_gid_mgmt.c:455 del_netdev_ips0() warn: inconsistent indenting

vim +455 drivers/infiniband/core/roce_gid_mgmt.c

   441	
   442	static void del_netdev_ips0(struct ib_device *ib_dev, u32 port,
   443				    struct net_device *rdma_ndev, void *cookie)
   444	{
   445		struct net_device *ndev = cookie;
   446	
   447		if (IS_ENABLED(CONFIG_NET_DEV_REFCNT_TRACKER))
   448			pr_info("netdevice_event(NETDEV_UNREGISTER) ib_dev=%p (%d)(%s) rdma_ndev=%p (%d)(%s) cookie=%p (%d)(%s) start\n",
   449				ib_dev, ib_dev ? refcount_read(&ib_dev->refcount) : 0,
   450				ib_dev ? ib_dev->name : "",
   451				rdma_ndev, rdma_ndev ? netdev_refcnt_read(rdma_ndev) : 0,
   452				rdma_ndev ? rdma_ndev->name : "",
   453				ndev, ndev ? netdev_refcnt_read(ndev) : 0, ndev ? ndev->name : "");
   454		ib_cache_gid_del_all_netdev_gids(ib_dev, port, ndev);
 > 455			pr_info("netdevice_event(NETDEV_UNREGISTER) ib_dev=%p (%d)(%s) rdma_ndev=%p (%d)(%s) cookie=%p (%d)(%s) end\n",
   456				ib_dev, ib_dev ? refcount_read(&ib_dev->refcount) : 0,
   457				ib_dev ? ib_dev->name : "",
   458				rdma_ndev, rdma_ndev ? netdev_refcnt_read(rdma_ndev) : 0,
   459				rdma_ndev ? rdma_ndev->name : "",
   460				ndev, ndev ? netdev_refcnt_read(ndev) : 0, ndev ? ndev->name : "");
   461	}
   462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
