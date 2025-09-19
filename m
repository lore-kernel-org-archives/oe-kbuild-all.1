Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE1636B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 22:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758319360; cv=none; b=u8BX8rBzle8V8OAcWYgu/G+ky1W/jLlmmGBrw3uDfZHM6+mSBtMmi2lhvGJh17ua5eEEE7lo3lbkfq5iA9BRSwCzHw4f6hoWURNv5TDKvNZR1tbS4qULhi0hjFaXSD/R0nqn5qIXiEgB3MQexek9uYWq7eZrKIJ2F0oUBI23TfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758319360; c=relaxed/simple;
	bh=FWxKxoodl4DOX1UaukxEstG//jpLn/S93vAmvqGWmFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bcOnX+5S7mM1RHwtEy4ISEQrcBgy5VLW4VLSHL+BHG1Im72JPepOFDGfFbaL8D8ZEr6qkn/EH/v1OG/0vA46jbuB9QOwwJ0Zb2WLUcYt9z/x1d1xkh66LnBgV83gl1PiL+YQbHTxyQ8dUK3+Hya4maGl90w/pyTs37MxK65ybTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VS+AQwUD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VS+AQwUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758319358; x=1789855358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FWxKxoodl4DOX1UaukxEstG//jpLn/S93vAmvqGWmFQ=;
  b=VS+AQwUD4lC2pXHP+Jcx8y3MQ/Wh+r0ve0AwCH0l9KoB/MxCGhrH3e9C
   mWUBgCUhMQPaK64R+SC1hJ+RKgmxzubCaT144CQxHI4ZtqYstggdveml0
   OPIawvNB0TcpQo4FYQU89Vfo9xrSZqpbWddpyhMI2rqng4JLcu81QhCam
   LvTPy8fU3gkYbj515LkosEEp9VOQPu6tjGDklhSRfcpHXhkv3gkhafmbZ
   ha+3HSItYl5vzAXK/bBqf3azl/XEz9UH0/Bndq7MRaNCoJp8ksvWfouBq
   2H6KfoNaJM8yKY3dSQpD9mc/XOZkQ16sUrp2OQCGZ5SZgsSX36+XdpWJH
   w==;
X-CSE-ConnectionGUID: d9CrhcmwTCydOWJMrrlw5A==
X-CSE-MsgGUID: X5Yv58iYRjmzh2gU8UCUQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60616106"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60616106"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 15:02:35 -0700
X-CSE-ConnectionGUID: dTWlW7ZjTrOalzI/DUhAmw==
X-CSE-MsgGUID: LcZxM6XvS6e+EyoK3xBXwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="175857348"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Sep 2025 15:02:33 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzjBX-0004qx-1W;
	Fri, 19 Sep 2025 22:02:31 +0000
Date: Sat, 20 Sep 2025 06:01:34 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 35/35] WARNING: modpost: EXPORT symbol
 "__tracepoint_sched_set_state_tp" [vmlinux] version generation failed,
 symbol will not be versioned.
Message-ID: <202509200531.ciLj1ln7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   b57fd8af63116c56536eb40f04dbe4f2206ec4ed
commit: b57fd8af63116c56536eb40f04dbe4f2206ec4ed [35/35] sched: Enable capability analysis for core.c and fair.c
config: s390-defconfig (https://download.01.org/0day-ci/archive/20250920/202509200531.ciLj1ln7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200531.ciLj1ln7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509200531.ciLj1ln7-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: EXPORT symbol "__tracepoint_sched_set_state_tp" [vmlinux] version generation failed, symbol will not be versioned.
Is "__tracepoint_sched_set_state_tp" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "set_cpus_allowed_ptr" [vmlinux] version generation failed, symbol will not be versioned.
Is "set_cpus_allowed_ptr" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "single_task_running" [vmlinux] version generation failed, symbol will not be versioned.
Is "single_task_running" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "schedule" [vmlinux] version generation failed, symbol will not be versioned.
Is "schedule" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "crypto_larval_alloc" [vmlinux] version generation failed, symbol will not be versioned.
Is "crypto_larval_alloc" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "crypto_alg_tested" [vmlinux] version generation failed, symbol will not be versioned.
Is "crypto_alg_tested" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "rhashtable_insert_slow" [vmlinux] version generation failed, symbol will not be versioned.
Is "rhashtable_insert_slow" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "rhashtable_walk_start_check" [vmlinux] version generation failed, symbol will not be versioned.
Is "rhashtable_walk_start_check" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save_flags" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "stack_depot_save" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "schedule" [arch/s390/mm/cmm.ko] has no CRC!
WARNING: modpost: "schedule" [arch/s390/crypto/prng.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "schedule" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "single_task_running" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "schedule" [kernel/rcu/rcutorture.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "schedule" [kernel/rcu/refscale.ko] has no CRC!
WARNING: modpost: "set_cpus_allowed_ptr" [kernel/rcu/refscale.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [kernel/torture.ko] has no CRC!
WARNING: modpost: "set_cpus_allowed_ptr" [kernel/torture.ko] has no CRC!
WARNING: modpost: "schedule" [fs/dlm/dlm.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [fs/dlm/dlm.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [fs/dlm/dlm.ko] has no CRC!
WARNING: modpost: "schedule" [fs/netfs/netfs.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [fs/netfs/netfs.ko] has no CRC!
WARNING: modpost: "schedule" [fs/squashfs/squashfs.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [fs/fat/fat.ko] has no CRC!
WARNING: modpost: "schedule" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "schedule" [fs/nfs/nfs.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [fs/nfs/nfsv3.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [fs/nfs/nfsv4.ko] has no CRC!
WARNING: modpost: "schedule" [fs/nfs/nfsv4.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "schedule" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "schedule" [fs/smb/client/cifs.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [fs/smb/client/cifs.ko] has no CRC!
WARNING: modpost: "schedule" [fs/autofs/autofs4.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [fs/jfs/jfs.ko] has no CRC!
WARNING: modpost: "schedule" [fs/jfs/jfs.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [fs/nilfs2/nilfs2.ko] has no CRC!
WARNING: modpost: "schedule" [fs/nilfs2/nilfs2.ko] has no CRC!
WARNING: modpost: "schedule" [fs/cachefiles/cachefiles.ko] has no CRC!
WARNING: modpost: "schedule" [fs/ocfs2/ocfs2.ko] has no CRC!
WARNING: modpost: "schedule" [fs/ocfs2/ocfs2_stack_user.ko] has no CRC!
WARNING: modpost: "schedule" [fs/ocfs2/dlmfs/ocfs2_dlmfs.ko] has no CRC!
WARNING: modpost: "schedule" [fs/ocfs2/cluster/ocfs2_nodemanager.ko] has no CRC!
WARNING: modpost: "schedule" [fs/ocfs2/dlm/ocfs2_dlm.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [fs/ocfs2/dlm/ocfs2_dlm.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "schedule" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "schedule" [fs/bcachefs/bcachefs.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [fs/bcachefs/bcachefs.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [lib/test_lockup.ko] has no CRC!
WARNING: modpost: "schedule" [arch/s390/lib/test_unwind.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/virtio/virtio_balloon.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/virtio/virtio_mem.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/char/virtio_console.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/char/hw_random/s390-trng.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/gpu/drm/drm.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [drivers/gpu/drm/drm.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/gpu/drm/virtio/virtio-gpu.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/block/nbd.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/block/drbd/drbd.ko] has no CRC!
WARNING: modpost: "set_cpus_allowed_ptr" [drivers/block/drbd/drbd.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [drivers/misc/lkdtm/lkdtm.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/misc/lkdtm/lkdtm.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/misc/genwqe/genwqe_card.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/scsi/libiscsi.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/nvme/host/nvme-core.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [drivers/net/tun.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/net/tun.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/net/tap.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [drivers/net/vxlan/vxlan.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [drivers/net/ppp/ppp_generic.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/net/ppp/ppp_generic.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/raid1.ko] has no CRC!
>> WARNING: modpost: "__tracepoint_sched_set_state_tp" [drivers/md/raid1.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/raid10.ko] has no CRC!
WARNING: modpost: "__tracepoint_sched_set_state_tp" [drivers/md/raid10.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/raid456.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/md-cluster.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/bcache/bcache.ko] has no CRC!
WARNING: modpost: "__tracepoint_sched_set_state_tp" [drivers/md/bcache/bcache.ko] has no CRC!
WARNING: modpost: "__tracepoint_sched_set_state_tp" [drivers/md/dm-bufio.ko] has no CRC!
WARNING: modpost: "__tracepoint_sched_set_state_tp" [drivers/md/dm-crypt.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/dm-crypt.ko] has no CRC!
WARNING: modpost: "__tracepoint_sched_set_state_tp" [drivers/md/dm-delay.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/dm-delay.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/dm-multipath.ko] has no CRC!
WARNING: modpost: "__tracepoint_sched_set_state_tp" [drivers/md/dm-snapshot.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/dm-snapshot.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/dm-mirror.ko] has no CRC!
WARNING: modpost: "__tracepoint_sched_set_state_tp" [drivers/md/dm-log-userspace.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/dm-vdo/dm-vdo.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/dm-clone.ko] has no CRC!
WARNING: modpost: "__tracepoint_sched_set_state_tp" [drivers/md/dm-integrity.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/dm-writecache.ko] has no CRC!
WARNING: modpost: "__tracepoint_sched_set_state_tp" [drivers/md/dm-writecache.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/s390/char/vmlogrdr.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/s390/char/tape.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/s390/char/monreader.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/s390/char/vmur.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/s390/scsi/zfcp.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/vdpa/vdpa_user/vduse.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/vfio/pci/mlx5/mlx5-vfio-pci.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/infiniband/core/iw_cm.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/infiniband/core/ib_uverbs.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/infiniband/core/rdma_ucm.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/vhost/vhost_net.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/vhost/vhost.ko] has no CRC!
WARNING: modpost: "__tracepoint_sched_set_state_tp" [drivers/vhost/vhost.ko] has no CRC!
WARNING: modpost: "schedule" [samples/ftrace/ftrace-direct-modify.ko] has no CRC!
WARNING: modpost: "__tracepoint_sched_set_state_tp" [samples/ftrace/ftrace-direct-modify.ko] has no CRC!
WARNING: modpost: "schedule" [samples/ftrace/ftrace-direct-multi.ko] has no CRC!
WARNING: modpost: "schedule" [samples/ftrace/ftrace-direct-multi-modify.ko] has no CRC!
WARNING: modpost: "__tracepoint_sched_set_state_tp" [samples/ftrace/ftrace-direct-multi-modify.ko] has no CRC!
WARNING: modpost: "__tracepoint_sched_set_state_tp" [net/core/pktgen.ko] has no CRC!
WARNING: modpost: "schedule" [net/core/pktgen.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/sched/act_ct.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/sched/cls_flower.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [net/netlink/netlink_diag.ko] has no CRC!
WARNING: modpost: "schedule" [net/netfilter/nf_conntrack.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/netfilter/nf_tables.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [net/netfilter/nf_tables.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/netfilter/nf_flow_table.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [net/netfilter/nf_flow_table.ko] has no CRC!
WARNING: modpost: "schedule" [net/netfilter/ipvs/ip_vs.ko] has no CRC!
WARNING: modpost: "__tracepoint_sched_set_state_tp" [net/netfilter/ipvs/ip_vs.ko] has no CRC!
WARNING: modpost: "__tracepoint_sched_set_state_tp" [net/iucv/af_iucv.ko] has no CRC!
WARNING: modpost: "schedule" [net/sunrpc/sunrpc.ko] has no CRC!
WARNING: modpost: "set_cpus_allowed_ptr" [net/sunrpc/sunrpc.ko] has no CRC!
WARNING: modpost: "__tracepoint_sched_set_state_tp" [net/sunrpc/sunrpc.ko] has no CRC!
WARNING: modpost: "schedule" [net/sunrpc/auth_gss/auth_rpcgss.ko] has no CRC!
WARNING: modpost: "schedule" [net/sunrpc/xprtrdma/rpcrdma.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [net/sctp/sctp.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/sctp/sctp.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/rds/rds.ko] has no CRC!
WARNING: modpost: "schedule" [net/rds/rds.ko] has no CRC!
WARNING: modpost: "schedule" [net/rds/rds_rdma.ko] has no CRC!
WARNING: modpost: "schedule" [net/rds/rds_tcp.ko] has no CRC!
WARNING: modpost: "__tracepoint_sched_set_state_tp" [net/smc/smc.ko] has no CRC!
WARNING: modpost: "schedule" [net/smc/smc.ko] has no CRC!
WARNING: modpost: "schedule" [net/ceph/libceph.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
