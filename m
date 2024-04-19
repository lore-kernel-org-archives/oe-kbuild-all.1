Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE582B9B0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 22:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713565176; cv=none; b=kpzvWDKQmoz5EQ+OjcB5rTML9Ko8viv8BT+W9hIMtUwQjZtfIxM8ALs98tE4irtymLXTEwx8KlEKZ3Ru3g4DAWlOnz4Eq4cdzP24EybaGmFmbaBUMpHXy3/vzrCC3+upEgpet2iS87+KbARYyddDS90V9E27zYSnCZSLsus5tEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713565176; c=relaxed/simple;
	bh=+iJWIDidwooIiBMGUtOPJoOXLUMLTTrq+C4hwU7z1eA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z5ceBpS/StgsyB7IqXNYr0ds6lIrpdq8MB0hqobYFhT+iWUEIWYYSkVZf2hkkhQedJ9mcx/UWqIsR9IQ2e1zFs0EyIwzHpZ0u1ymIFKtSAZSoFcGRIgHnxQK3PdH74JIu0C8UDd/GDZrj/2oZKM67upqAoDtfUw6/X9ClVRPywI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGMAh/Qu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGMAh/Qu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713565175; x=1745101175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+iJWIDidwooIiBMGUtOPJoOXLUMLTTrq+C4hwU7z1eA=;
  b=kGMAh/Qu204WctIXNJeDpfoQhogWg5T6jTbdSjwK399cj+eb1mfvhY2b
   JvQ7Xbk0h5Aa855fAYxqC65bcx5n3EjkbMXSb5HrEhvajfySPfHa8/+0p
   IWc/+JI3FS34J/NNVjhmRFJMfW3JIhxoYqA5Kza5G3jknIg3fz0Do8fSq
   gFFatBMao2GRnMN9QDEFEgRmPWMfvxHzEbskIXAeL1ItQZGPlnYjzsegU
   Ku4CzE+jvbDsjpDyaB8WqIrF1zgDL9Gz9GF9RpefbgzCgsnlYhAEzijXo
   OutgSggjIsRT+1c7Oh8LvDvmE4L3V4+6nMG104hJcULtplw1hDN+YLbwZ
   w==;
X-CSE-ConnectionGUID: rK6Tp5IwTgiRfqBt1QMElg==
X-CSE-MsgGUID: nyfjwRDCSH+hbnWm9SL0jg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="13027731"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="13027731"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 15:19:34 -0700
X-CSE-ConnectionGUID: JtIeLse5SG6Fohg7rbv7yg==
X-CSE-MsgGUID: qKWmfrRrQUa4St0PEY0Czw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="23524666"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 19 Apr 2024 15:19:34 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxwZv-000AVs-0d;
	Fri, 19 Apr 2024 22:19:31 +0000
Date: Sat, 20 Apr 2024 06:19:13 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:pr/24 1/2] drivers/net/ethernet/intel/idpf/xdp.c:524:25:
 error: implicit declaration of function 'idpf_assign_bpf_prog'
Message-ID: <202404200629.uVAbWx38-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux pr/24
head:   42a12ce7cb33457d91d1e6d17fd99720031d4385
commit: 74fabbe0878bc78e5d903a1824a6c6d0b953f462 [1/2] idpf: handle xdp unloading while the driver is being removed
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240420/202404200629.uVAbWx38-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200629.uVAbWx38-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200629.uVAbWx38-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/intel/idpf/xdp.c: In function 'idpf_xdp_setup_prog':
>> drivers/net/ethernet/intel/idpf/xdp.c:524:25: error: implicit declaration of function 'idpf_assign_bpf_prog' [-Werror=implicit-function-declaration]
     524 |                         idpf_assign_bpf_prog(current_prog, prog);
         |                         ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/idpf/xdp.c:524:46: error: 'current_prog' undeclared (first use in this function); did you mean 'current_work'?
     524 |                         idpf_assign_bpf_prog(current_prog, prog);
         |                                              ^~~~~~~~~~~~
         |                                              current_work
   drivers/net/ethernet/intel/idpf/xdp.c:524:46: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +/idpf_assign_bpf_prog +524 drivers/net/ethernet/intel/idpf/xdp.c

   500	
   501	/**
   502	 * idpf_xdp_setup_prog - Add or remove XDP eBPF program
   503	 * @vport: vport to setup XDP for
   504	 * @xdp: XDP program and extack
   505	 */
   506	static int
   507	idpf_xdp_setup_prog(struct idpf_vport *vport, struct netdev_bpf *xdp)
   508	{
   509		struct idpf_netdev_priv *np = netdev_priv(vport->netdev);
   510		struct idpf_adapter *adapter = np->adapter;
   511		struct bpf_prog *prog = xdp->prog;
   512		struct xdp_attachment_info *info;
   513		bool needs_reconfig, vport_is_up;
   514		u16 idx = vport->idx;
   515		int err;
   516	
   517		vport_is_up = np->state == __IDPF_VPORT_UP;
   518	
   519		info = &vport->adapter->vport_config[idx]->user_config.xdp;
   520		needs_reconfig = !!info->prog != !!prog;
   521	
   522		if (test_bit(IDPF_REMOVE_IN_PROG, adapter->flags)) {
   523			if (!prog) {
 > 524				idpf_assign_bpf_prog(current_prog, prog);
   525				libeth_xdp_set_redirect(vport->netdev, prog);
   526	
   527				return 0;
   528			} else {
   529				return -EINVAL;
   530			}
   531		}
   532	
   533		if (!needs_reconfig) {
   534			idpf_copy_xdp_prog_to_qs(vport, prog);
   535			xdp_attachment_setup(info, xdp);
   536	
   537			return 0;
   538		}
   539	
   540		if (!vport_is_up) {
   541			idpf_send_delete_queues_msg(vport);
   542		} else {
   543			set_bit(IDPF_VPORT_DEL_QUEUES, vport->flags);
   544			idpf_vport_stop(vport);
   545		}
   546	
   547		idpf_deinit_rss(vport);
   548		xdp_attachment_setup(info, xdp);
   549	
   550		err = idpf_xdp_reconfig_queues(vport);
   551		if (err) {
   552			NL_SET_ERR_MSG_MOD(xdp->extack,
   553					   "Could not reconfigure the queues after XDP setup");
   554			return err;
   555		}
   556	
   557		libeth_xdp_set_redirect(vport->netdev, prog);
   558	
   559		if (vport_is_up) {
   560			err = idpf_vport_open(vport, false);
   561			if (err) {
   562				NL_SET_ERR_MSG_MOD(xdp->extack,
   563						   "Could not reopen the vport after XDP setup");
   564				return err;
   565			}
   566		}
   567	
   568		return 0;
   569	}
   570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
