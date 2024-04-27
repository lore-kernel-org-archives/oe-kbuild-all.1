Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A634D5AC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 13:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714225540; cv=none; b=iSErAEMOmg1WpEdVX+XjKZSK1Qy5sH3MgGPBjhoQlvDSE1BTrR5QNuZ3VxINwioqkZY2HNpdqPApp+jCkG8gkSnskwUS2siZ/ODTceXQlZSvoT6QGr/LoTiJ3mXSww4QwnlNlfXxJEpH7VL/Yi6midPtSxBtT9A0vaCyvGcJYeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714225540; c=relaxed/simple;
	bh=Y5OXf4xW6VFpbKw9Z1EFvvig8FOdM1hzOlS7nlfW2/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=loVzNmfzNDQuTw4pnpMv3s0rnYmCVHPFyJRWAbXjMF1SjYBIV+PemQ46l5IV6qM3kIZxd8OLiwHc0fKnjhawvyhHewfcnaqfpLvcmYBKhWV3sxe6ilNOobgFx1DgxRMGba9jPCv0moT0O49sq5JzErb7MxMn+IqU6seQ8GkDlDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCGfmIR2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCGfmIR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714225538; x=1745761538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y5OXf4xW6VFpbKw9Z1EFvvig8FOdM1hzOlS7nlfW2/w=;
  b=CCGfmIR2F06DRQlzJ8xk2EHrCynBWjeysFkJ0Dt03D8cv4X8iaZEv203
   /iGeQaPe1hhctT/fwnSaf8HxCuC1kLJnIwMp2tM/tSAyJLE6q1vXxHNi2
   oX6nkguBfmXxgwUrJ/h4rq543p1AnOA2TAQsDSg8JVnaSlSigoCxhguTj
   zdtoSR/X8umWVnBpmrBWl+LpLTWi7vWojG+Rtz5hmEHXyhIAdSnCpZlx5
   ny5dTv6Fh5g92nlml6JiB9ZHUwENIzfpJzASymocbnMpKCqlI27DWOde7
   rccz1+Mj9Wty5PDWeRoZJRtAQh74w+TKpux2rK+Szh+5vNUMgthrO9fJi
   Q==;
X-CSE-ConnectionGUID: X2LRkK1zTyOXRh8wdPdLVw==
X-CSE-MsgGUID: bCY8k769Qky1VdgNE0hi1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10112148"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="10112148"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 06:45:37 -0700
X-CSE-ConnectionGUID: CoSm9jyhQZywWL8PJtYbfw==
X-CSE-MsgGUID: ZKMxMle+TXmSmb7iMYIgRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="30136021"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Apr 2024 06:45:36 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0iMw-00053K-09;
	Sat, 27 Apr 2024 13:45:34 +0000
Date: Sat, 27 Apr 2024 21:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:thunderbolt_associate_v1 3/4] drivers/thunderbolt/pci.c:108:44:
 error: call to undeclared function 'tb_is_pci_adapter'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202404272144.7J66c21W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux thunderbolt_associate_v1
head:   d02e8bddd00b2f29505e20a45417c494103dfc1d
commit: 4c5808109d8418b445ae3b90b409dba5d2a0f17d [3/4] thunderbolt: Associate PCI devices with PCIe Adapters
config: powerpc-randconfig-003-20240427 (https://download.01.org/0day-ci/archive/20240427/202404272144.7J66c21W-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404272144.7J66c21W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404272144.7J66c21W-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/thunderbolt/pci.c:16:
   drivers/thunderbolt/tb.h:48:35: error: use of undeclared identifier 'MAX_GROUPS'
           struct tb_bandwidth_group groups[MAX_GROUPS];
                                            ^
   drivers/thunderbolt/tb.h:48:28: error: field has incomplete type 'struct tb_bandwidth_group'
           struct tb_bandwidth_group groups[MAX_GROUPS];
                                     ^
   drivers/thunderbolt/tb.h:48:9: note: forward declaration of 'struct tb_bandwidth_group'
           struct tb_bandwidth_group groups[MAX_GROUPS];
                  ^
>> drivers/thunderbolt/pci.c:108:44: error: call to undeclared function 'tb_is_pci_adapter'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                action != BUS_NOTIFY_DEL_DEVICE) || !tb_is_pci_adapter(pdev))
                                                     ^
   3 errors generated.


vim +/tb_is_pci_adapter +108 drivers/thunderbolt/pci.c

    87	
    88	/**
    89	 * tb_pci_notifier_call() - Thunderbolt PCI bus notifier
    90	 * @nb: Notifier block embedded in struct tb_cm
    91	 * @action: Notifier action
    92	 * @data: PCI device
    93	 *
    94	 * On addition of PCI device @data, associate it with a PCIe adapter in the
    95	 * Thunderbolt domain by storing a pointer to the PCI device in struct tb_port.
    96	 * On deletion, reset the pointer to %NULL.
    97	 */
    98	int tb_pci_notifier_call(struct notifier_block *nb, unsigned long action,
    99				 void *data)
   100	{
   101		struct tb_cm *tcm = container_of(nb, struct tb_cm, pci_notifier);
   102		struct tb *tb = tb_from_priv(tcm);
   103		struct device *dev = data;
   104		struct pci_dev *pdev = to_pci_dev(dev);
   105		struct tb_port *port;
   106	
   107		if ((action != BUS_NOTIFY_ADD_DEVICE &&
 > 108		     action != BUS_NOTIFY_DEL_DEVICE) || !tb_is_pci_adapter(pdev))
   109			return NOTIFY_DONE;
   110	
   111		mutex_lock(&tb->lock);
   112		port = tb_pci_find_port(tb, pdev);
   113		if (!port)
   114			goto out;
   115	
   116		switch (action) {
   117		case BUS_NOTIFY_ADD_DEVICE:
   118			port->pdev = pdev;
   119			tb_port_dbg(port, "associated with %s\n", pci_name(pdev));
   120			break;
   121		case BUS_NOTIFY_DEL_DEVICE:
   122			port->pdev = NULL;
   123			tb_port_dbg(port, "no longer associated with %s\n",
   124				    pci_name(pdev));
   125			break;
   126		}
   127	out:
   128		mutex_unlock(&tb->lock);
   129		return NOTIFY_DONE;
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
