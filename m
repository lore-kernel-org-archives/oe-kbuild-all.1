Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5DA5F577
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 16:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707840424; cv=none; b=FIBC75NNcHqITiwJEhmHl+mq2gunkZlgqpTnwJlxzjYtd/I1nBTmRR0BjEQjJj6QWl19QecNRjOSNqidqm2uRdB2kx4tum+o8Y9AFCkeL46nc1N3WzlMMQ1vEmZ0PrgxdWwZvjzz3brZflL31H3aQJL40RZWQAP1rHn+SfZYWE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707840424; c=relaxed/simple;
	bh=nmjIcymCKahLtJENupGUcHlTAtLG/KczObTiK9d2xpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QbQZ7P2GbC1CDwne3n5ZxYzO6guPW8CPVGstnRJyoIMZtsqpHphfgwqh9RvaoN2sPAdyeqb/V9/lzMo0h68wuu+Jfmrn3TStVbUwx5HU15nRgRtvwQPDRUXMm5wBSnsehLYqHXtM8gH/YXBU6gsQxgBvVKj5TdexW2l5mu9zpPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwmKfF2a; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwmKfF2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707840423; x=1739376423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nmjIcymCKahLtJENupGUcHlTAtLG/KczObTiK9d2xpo=;
  b=PwmKfF2aoiGw27I68D4YU1d6U4OoXTYkCV2KgprszwPjUmHOU2eOlany
   v3xBNNad4yTGzXOPhPQS7uHYjQVN09DbmK1QeoCNsBkRPdERcW1DIG3lA
   LRs0akRm7pnJkbBLxSU48bWFiZnVQGU/Ql/CexuDEFAk73qcoPW/91QZN
   pthG6BkYHVuBB7fQVmK6CyzGS2B3F9AGZ/geP2Vt/bAKt1tYtdrc1maQR
   PVCMUc5yjfkbkEUPxLEsenQyuFzD4R8ePximYsDu4/Nv3vWwQ8VmAxij+
   3y59N7ExPS35ADq9r/RoAD5iYO8NF/qXw4SRRKmugKtNycOeBFjmlOFAU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1997397"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1997397"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 08:07:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="3290096"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Feb 2024 08:06:58 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZvJ9-0007rM-2X;
	Tue, 13 Feb 2024 16:06:55 +0000
Date: Wed, 14 Feb 2024 00:06:11 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie-new 60/63]
 drivers/net/ethernet/intel/idpf/idpf_xdp.c:290:30-77: WARNING avoid newline
 at end of message in NL_SET_ERR_MSG_MOD
Message-ID: <202402140050.5vu3xoSM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   523ccbdcd2be0fd8d7790a993bf83e9fbfc531e1
commit: d4d56eee3a987070ae86f10e9468b6e6c2f3ad8d [60/63] idpf: implement XDP_SETUP_PROG in ndo_bpf for splitq
config: i386-randconfig-051-20240213 (https://download.01.org/0day-ci/archive/20240214/202402140050.5vu3xoSM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402140050.5vu3xoSM-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/idpf/idpf_xdp.c:290:30-77: WARNING avoid newline at end of message in NL_SET_ERR_MSG_MOD
   drivers/net/ethernet/intel/idpf/idpf_xdp.c:283:29-81: WARNING avoid newline at end of message in NL_SET_ERR_MSG_MOD

vim +290 drivers/net/ethernet/intel/idpf/idpf_xdp.c

   241	
   242	/**
   243	 * idpf_xdp_setup_prog - Add or remove XDP eBPF program
   244	 * @vport: vport to setup XDP for
   245	 * @prog: XDP program
   246	 * @extack: netlink extended ack
   247	 */
   248	static int
   249	idpf_xdp_setup_prog(struct idpf_vport *vport, struct bpf_prog *prog,
   250			    struct netlink_ext_ack *extack)
   251	{
   252		struct idpf_netdev_priv *np = netdev_priv(vport->netdev);
   253		bool needs_reconfig, vport_is_up;
   254		struct bpf_prog **current_prog;
   255		u16 idx = vport->idx;
   256		int err;
   257	
   258		vport_is_up = np->state == __IDPF_VPORT_UP;
   259	
   260		current_prog = &vport->adapter->vport_config[idx]->user_config.xdp_prog;
   261		needs_reconfig = !!(*current_prog) != !!prog;
   262	
   263		if (!needs_reconfig) {
   264			idpf_copy_xdp_prog_to_qs(vport, prog);
   265			idpf_assign_bpf_prog(current_prog, prog);
   266	
   267			return 0;
   268		}
   269	
   270		if (!vport_is_up) {
   271			idpf_send_delete_queues_msg(vport);
   272		} else {
   273			set_bit(IDPF_VPORT_DEL_QUEUES, vport->flags);
   274			idpf_vport_stop(vport);
   275		}
   276	
   277		idpf_deinit_rss(vport);
   278	
   279		idpf_assign_bpf_prog(current_prog, prog);
   280	
   281		err = idpf_xdp_reconfig_queues(vport);
   282		if (err) {
   283			NL_SET_ERR_MSG_MOD(extack, "Could not reconfigure the queues after XDP setup\n");
   284			return err;
   285		}
   286	
   287		if (vport_is_up) {
   288			err = idpf_vport_open(vport, false);
   289			if (err) {
 > 290				NL_SET_ERR_MSG_MOD(extack, "Could not re-open the vport after XDP setup\n");
   291				return err;
   292			}
   293		}
   294	
   295		return 0;
   296	}
   297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
