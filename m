Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717AA1CDFDA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 04:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725338261; cv=none; b=DJxE0ycyiks1QqAldG+QgOIkzQotgD4ADen3ptmIPWuTlixTO4yv9MOg9mBX/hCwA56w/Rcx8q7vp88f1TL+a36+eN7XaNQdW8SkeiSGsXwvO67CP1hlSmK8pwZkyltBvQ+u4NpFLhik2L+2ThsLD9aeObyRnOmAASP4UGyyMMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725338261; c=relaxed/simple;
	bh=D+OlOG/cVW0BRDYWBSvrGrG/x41lzJv5K58xWens/TE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MfrtcGhAnh/p+QlI3Wj70Kyd+HaDNP8OSLeycGJSMaNuX7comLcQfIuQdZalYdZdfE5IpI2bdzt7QTxW+OPAsCpf1DBUqxEURBOGPqnvLNwCw7ZF1KWu4AC0qgy1EaAK64BAGQiaelm0Y4Wy98JtMPzic4EU0qTL+6XGGRSlONQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWdnmWlf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWdnmWlf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725338259; x=1756874259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D+OlOG/cVW0BRDYWBSvrGrG/x41lzJv5K58xWens/TE=;
  b=IWdnmWlfJErP87KkotH+IZ2Kl2gAg/fEQr378Ho/eg7rgcNrSuBqW8Kl
   Eeh6uLPbksFn5H1K94ec0TxqVSNDIKJjg7TPAINTZM1OEwpWD6rwJN44S
   r6VxAamntdbXi0DKenE+QL2MohBJHb/Mr93mBb43zc/xPE0DAHP7mc8sb
   qUfzOiTo7zfzXTtVrQrM9HlfP6i4hsqQBecEdJtdbv4RK9aMAATJBxJqC
   cHYji9iMcuIOBOn9T1wjEt/FR+1tDiH5NDXjDzvKTfle7dVvTFcCC2pDx
   TWad9czQoGGFMEYVgn8VRy0OlqpdFHnhCLc35jPozRm6mwTOx6vOUsitF
   Q==;
X-CSE-ConnectionGUID: 1L4M9VtDRamsFiQxLVt6FA==
X-CSE-MsgGUID: OM+UHmnPQy2ktuZ8SmBRhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="26826819"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="26826819"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 21:37:39 -0700
X-CSE-ConnectionGUID: AAY8KmKnQSe/Hq5k8TFakQ==
X-CSE-MsgGUID: yhLlIvpJSdaLKZ+tNBSWBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="102219485"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Sep 2024 21:37:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slLIM-0006Dg-33;
	Tue, 03 Sep 2024 04:37:34 +0000
Date: Tue, 3 Sep 2024 12:36:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 27064/30000]
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4324:6: warning: variable
 'err' is used uninitialized whenever 'if' condition is false
Message-ID: <202409031257.Y7C0PYH5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b7bed6628b750ffd687d1da0a170dece4b0c08bd
commit: a398c3637a33330c134f067e06df959550d44f7b [27064/30000] drivers: initial support for rnpgbe drivers from Mucse Technology
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240903/202409031257.Y7C0PYH5-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031257.Y7C0PYH5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031257.Y7C0PYH5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2353:6: warning: variable 'cleaned_total' set but not used [-Wunused-but-set-variable]
    2353 |         int cleaned_total = 0;
         |             ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2899:6: warning: variable 'rxctrl' set but not used [-Wunused-but-set-variable]
    2899 |         u32 rxctrl = 0, dma_axi_ctl;
         |             ^
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4324:6: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    4324 |         if (netif_running(netdev))
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4329:6: note: uninitialized use occurs here
    4329 |         if (err)
         |             ^~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4324:2: note: remove the 'if' if its condition is always true
    4324 |         if (netif_running(netdev))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
    4325 |                 err = rnpgbe_open(netdev);
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4318:9: note: initialize the variable 'err' to silence this warning
    4318 |         u32 err;
         |                ^
         |                 = 0
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:6160:29: warning: unused function 'rnpgbe_tso_features' [-Wunused-function]
    6160 | static inline unsigned long rnpgbe_tso_features(struct rnpgbe_hw *hw)
         |                             ^~~~~~~~~~~~~~~~~~~
   4 warnings generated.


vim +4324 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c

  4309	
  4310	/**
  4311	 * rnpgbe_thaw - un-quiesce the device
  4312	 * @dev: The port's netdev
  4313	 */
  4314	static int rnpgbe_thaw(struct device *dev)
  4315	{
  4316		struct rnpgbe_adapter *adapter = pci_get_drvdata(to_pci_dev(dev));
  4317		struct net_device *netdev = adapter->netdev;
  4318		u32 err;
  4319	
  4320		rnpgbe_set_interrupt_capability(adapter);
  4321		register_mbx_irq(adapter);
  4322	
  4323		rtnl_lock();
> 4324		if (netif_running(netdev))
  4325			err = rnpgbe_open(netdev);
  4326	
  4327		rtnl_unlock();
  4328	
  4329		if (err)
  4330			return err;
  4331		netif_device_attach(netdev);
  4332	
  4333		return 0;
  4334	}
  4335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
