Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792103033F6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 06:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771051218; cv=none; b=nMCax5bnHCuTyOJ9WiOeQ7XzQzAD23DJIsCw7L6WonxTaxF7Vd2XqwmkZw7kKJcro8ylKNlAD0WUNiPOlDkMWgPNAtrjoBotnBTRgB65ILMixF4trn46A8Sxa67nW1+Kwkwcc5g1GX3HbjjYwvawvVkcVUt+D8hagz/IEs+VrRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771051218; c=relaxed/simple;
	bh=bO2idU6Uj27UCb5pZhDSDh+Hr9FPhhlDTDcr7rUakJs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Va5AzGBPBNnBrg7r+vigJaLwkpC52lt1lUpKfyx5CcPu1CuR3H5SWozYTNgFqiHOLnRIrQAm67vHwS48XtxplWp8KXKtyiif63UJv/hYhJO5Sk+AK9dpEoFbZrhpVObj1luNZciGBMyRCYjmCoqJ8sb/uVQbMlHK2eZnWwuOlLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+AFLCnt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+AFLCnt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771051216; x=1802587216;
  h=date:from:to:cc:subject:message-id;
  bh=bO2idU6Uj27UCb5pZhDSDh+Hr9FPhhlDTDcr7rUakJs=;
  b=D+AFLCntf9PqK3P+/XAelTltADkuZLFjkKKDi0NJWsX7iOCjKLVDJD9m
   R4+VQi+WotHw5qgNiHx/uGmx/UmrwvyRnGvQvj5jQJCajRq4trHq3Thsd
   5t2dw11Vbn407Wn5xvcptvU5A3vN19LAcstfiuNeWpKsCv/VNMp5lmeQf
   az8NmFkFQB+0V8x9QHvgGE81NkqiaQkP1D3xJE1z5a6jsmj7jP1wJkZpZ
   vyw49scNIfrwdzPSH8s217QpN/QCSytQb76FpIJxnhXfzuymh41V7RIfb
   CI9R3hpCZEP7EfDnLjSWBXlzo10Qs4aE+VzljqONm0zrSMX4q5dKUQZfI
   g==;
X-CSE-ConnectionGUID: 9qj/EcjITOS7nCVXJq8lug==
X-CSE-MsgGUID: 1P2l3rqwQLS+6v1Awdz+4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="71424917"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="71424917"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 22:40:15 -0800
X-CSE-ConnectionGUID: 53B/IVPaT9eVaVCJ//N0zA==
X-CSE-MsgGUID: f65CnCNXQNim+7I1s5v4KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="217264121"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Feb 2026 22:40:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr9K7-00000000wIA-2roT;
	Sat, 14 Feb 2026 06:40:11 +0000
Date: Sat, 14 Feb 2026 14:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next 98/144]
 fs/smb/common/smbdirect/smbdirect_mr.c:288:33: warning: '%s' directive
 argument is null
Message-ID: <202602141435.Sm9ZppiO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next
head:   5cf574b306a01ec7f3a507e999b524ee39f0dee0
commit: c333a45eeca9b8b3609714335e9f3f0a741fa55b [98/144] smb: client: make use of smbdirect.ko
config: arm64-randconfig-003-20260214 (https://download.01.org/0day-ci/archive/20260214/202602141435.Sm9ZppiO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141435.Sm9ZppiO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141435.Sm9ZppiO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/smb/common/smbdirect/smbdirect_internal.h:26,
                    from fs/smb/common/smbdirect/smbdirect_mr.c:7:
   fs/smb/common/smbdirect/smbdirect_mr.c: In function 'smbdirect_connection_mr_io_recovery_work':
>> fs/smb/common/smbdirect/smbdirect_mr.c:288:33: warning: '%s' directive argument is null [-Wformat-overflow=]
     288 |                                 "ib_alloc_mr failed ret=%d (%s) type=0x%x depth=%u\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_socket.h:529:66: note: in definition of macro '___smbdirect_log_generic'
     529 |                 __smbdirect_log_printf(sc, func, line, lvl, cls, fmt, ##args);  \
         |                                                                  ^~~
   fs/smb/common/smbdirect/smbdirect_socket.h:552:17: note: in expansion of macro '__smbdirect_log_generic'
     552 |                 __smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_RDMA_MR, fmt, ##args)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_mr.c:287:25: note: in expansion of macro 'smbdirect_log_rdma_mr'
     287 |                         smbdirect_log_rdma_mr(sc, SMBDIRECT_LOG_ERR,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_mr.c:288:61: note: format string is defined here
     288 |                                 "ib_alloc_mr failed ret=%d (%s) type=0x%x depth=%u\n",
         |                                                             ^~
   fs/smb/common/smbdirect/smbdirect_mr.c:276:33: warning: '%s' directive argument is null [-Wformat-overflow=]
     276 |                                 "ib_dereg_mr failed ret=%u (%s)\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_socket.h:529:66: note: in definition of macro '___smbdirect_log_generic'
     529 |                 __smbdirect_log_printf(sc, func, line, lvl, cls, fmt, ##args);  \
         |                                                                  ^~~
   fs/smb/common/smbdirect/smbdirect_socket.h:552:17: note: in expansion of macro '__smbdirect_log_generic'
     552 |                 __smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_RDMA_MR, fmt, ##args)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_mr.c:275:25: note: in expansion of macro 'smbdirect_log_rdma_mr'
     275 |                         smbdirect_log_rdma_mr(sc, SMBDIRECT_LOG_ERR,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_mr.c:276:61: note: format string is defined here
     276 |                                 "ib_dereg_mr failed ret=%u (%s)\n",
         |                                                             ^~
   fs/smb/common/smbdirect/smbdirect_mr.c: In function 'smbdirect_connection_get_mr_io':
   fs/smb/common/smbdirect/smbdirect_mr.c:187:25: warning: '%s' directive argument is null [-Wformat-overflow=]
     187 |                         "wait_event_interruptible ret=%d (%s)\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_socket.h:529:66: note: in definition of macro '___smbdirect_log_generic'
     529 |                 __smbdirect_log_printf(sc, func, line, lvl, cls, fmt, ##args);  \
         |                                                                  ^~~
   fs/smb/common/smbdirect/smbdirect_socket.h:552:17: note: in expansion of macro '__smbdirect_log_generic'
     552 |                 __smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_RDMA_MR, fmt, ##args)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_mr.c:186:17: note: in expansion of macro 'smbdirect_log_rdma_mr'
     186 |                 smbdirect_log_rdma_mr(sc, SMBDIRECT_LOG_ERR,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_mr.c:187:59: note: format string is defined here
     187 |                         "wait_event_interruptible ret=%d (%s)\n",
         |                                                           ^~
   fs/smb/common/smbdirect/smbdirect_mr.c: In function 'smbdirect_connection_register_mr_io':
   fs/smb/common/smbdirect/smbdirect_mr.c:421:17: warning: '%s' directive argument is null [-Wformat-overflow=]
     421 |                 "ib_post_send failed ret=%d (%s) reg_wr->key=0x%x\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_socket.h:529:66: note: in definition of macro '___smbdirect_log_generic'
     529 |                 __smbdirect_log_printf(sc, func, line, lvl, cls, fmt, ##args);  \
         |                                                                  ^~~
   fs/smb/common/smbdirect/smbdirect_socket.h:552:17: note: in expansion of macro '__smbdirect_log_generic'
     552 |                 __smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_RDMA_MR, fmt, ##args)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_mr.c:420:9: note: in expansion of macro 'smbdirect_log_rdma_mr'
     420 |         smbdirect_log_rdma_mr(sc, SMBDIRECT_LOG_ERR,
         |         ^~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_mr.c:421:46: note: format string is defined here
     421 |                 "ib_post_send failed ret=%d (%s) reg_wr->key=0x%x\n",
         |                                              ^~
   fs/smb/common/smbdirect/smbdirect_mr.c:377:25: warning: '%s' directive argument is null [-Wformat-overflow=]
     377 |                         "ib_dma_map_sg num_pages=%u dir=%x ret=%d (%s)\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_socket.h:529:66: note: in definition of macro '___smbdirect_log_generic'
     529 |                 __smbdirect_log_printf(sc, func, line, lvl, cls, fmt, ##args);  \
         |                                                                  ^~~
   fs/smb/common/smbdirect/smbdirect_socket.h:552:17: note: in expansion of macro '__smbdirect_log_generic'
     552 |                 __smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_RDMA_MR, fmt, ##args)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_mr.c:376:17: note: in expansion of macro 'smbdirect_log_rdma_mr'
     376 |                 smbdirect_log_rdma_mr(sc, SMBDIRECT_LOG_ERR,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_mr.c:377:68: note: format string is defined here
     377 |                         "ib_dma_map_sg num_pages=%u dir=%x ret=%d (%s)\n",
         |                                                                    ^~
   fs/smb/common/smbdirect/smbdirect_mr.c: In function 'smbdirect_connection_deregister_mr_io':
   fs/smb/common/smbdirect/smbdirect_mr.c:512:33: warning: '%s' directive argument is null [-Wformat-overflow=]
     512 |                                 "ib_post_send failed ret=%d (%s)\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_socket.h:529:66: note: in definition of macro '___smbdirect_log_generic'
     529 |                 __smbdirect_log_printf(sc, func, line, lvl, cls, fmt, ##args);  \
         |                                                                  ^~~
   fs/smb/common/smbdirect/smbdirect_socket.h:552:17: note: in expansion of macro '__smbdirect_log_generic'
     552 |                 __smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_RDMA_MR, fmt, ##args)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_mr.c:511:25: note: in expansion of macro 'smbdirect_log_rdma_mr'
     511 |                         smbdirect_log_rdma_mr(sc, SMBDIRECT_LOG_ERR,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_mr.c:512:62: note: format string is defined here
     512 |                                 "ib_post_send failed ret=%d (%s)\n",
         |                                                              ^~
   fs/smb/common/smbdirect/smbdirect_mr.c: In function 'smbdirect_connection_create_mr_list':
   fs/smb/common/smbdirect/smbdirect_mr.c:49:33: warning: '%s' directive argument is null [-Wformat-overflow=]
      49 |                                 "ib_alloc_mr failed ret=%d (%s) type=0x%x max_frmr_depth=%u\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_socket.h:529:66: note: in definition of macro '___smbdirect_log_generic'
     529 |                 __smbdirect_log_printf(sc, func, line, lvl, cls, fmt, ##args);  \
         |                                                                  ^~~
   fs/smb/common/smbdirect/smbdirect_socket.h:552:17: note: in expansion of macro '__smbdirect_log_generic'
--
   In file included from fs/smb/common/smbdirect/smbdirect_internal.h:26,
                    from fs/smb/common/smbdirect/smbdirect_connection.c:7:
   fs/smb/common/smbdirect/smbdirect_connection.c: In function 'smbdirect_connection_post_recv_io':
>> fs/smb/common/smbdirect/smbdirect_connection.c:1516:25: warning: '%s' directive argument is null [-Wformat-overflow=]
    1516 |                         "ib_post_recv failed ret=%d (%s)\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_socket.h:529:66: note: in definition of macro '___smbdirect_log_generic'
     529 |                 __smbdirect_log_printf(sc, func, line, lvl, cls, fmt, ##args);  \
         |                                                                  ^~~
   fs/smb/common/smbdirect/smbdirect_socket.h:546:17: note: in expansion of macro '__smbdirect_log_generic'
     546 |                 __smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_RDMA_RECV, fmt, ##args)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_connection.c:1515:17: note: in expansion of macro 'smbdirect_log_rdma_recv'
    1515 |                 smbdirect_log_rdma_recv(sc, SMBDIRECT_LOG_ERR,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_connection.c:1516:54: note: format string is defined here
    1516 |                         "ib_post_recv failed ret=%d (%s)\n",
         |                                                      ^~
   fs/smb/common/smbdirect/smbdirect_connection.c: In function 'smbdirect_connection_recv_io_refill':
   fs/smb/common/smbdirect/smbdirect_connection.c:1749:33: warning: '%s' directive argument is null [-Wformat-overflow=]
    1749 |                                 "smbdirect_connection_post_recv_io failed rc=%d (%s)\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_socket.h:529:66: note: in definition of macro '___smbdirect_log_generic'
     529 |                 __smbdirect_log_printf(sc, func, line, lvl, cls, fmt, ##args);  \
         |                                                                  ^~~
   fs/smb/common/smbdirect/smbdirect_socket.h:546:17: note: in expansion of macro '__smbdirect_log_generic'
     546 |                 __smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_RDMA_RECV, fmt, ##args)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_connection.c:1748:25: note: in expansion of macro 'smbdirect_log_rdma_recv'
    1748 |                         smbdirect_log_rdma_recv(sc, SMBDIRECT_LOG_ERR,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_connection.c:1749:82: note: format string is defined here
    1749 |                                 "smbdirect_connection_post_recv_io failed rc=%d (%s)\n",
         |                                                                                  ^~


vim +288 fs/smb/common/smbdirect/smbdirect_mr.c

1fed7d7a575b09 Stefan Metzmacher 2025-09-19  249  
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  250  /*
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  251   * The work queue function that recovers MRs
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  252   * We need to call ib_dereg_mr() and ib_alloc_mr() before this MR can be used
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  253   * again. Both calls are slow, so finish them in a workqueue. This will not
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  254   * block I/O path.
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  255   * There is one workqueue that recovers MRs, there is no need to lock as the
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  256   * I/O requests calling smbd_register_mr will never update the links in the
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  257   * mr_list.
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  258   */
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  259  static void smbdirect_connection_mr_io_recovery_work(struct work_struct *work)
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  260  {
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  261  	struct smbdirect_socket *sc =
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  262  		container_of(work, struct smbdirect_socket, mr_io.recovery_work);
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  263  	struct smbdirect_socket_parameters *sp = &sc->parameters;
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  264  	struct smbdirect_mr_io *mr;
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  265  	int ret;
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  266  
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  267  	list_for_each_entry(mr, &sc->mr_io.all.list, list) {
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  268  		if (mr->state != SMBDIRECT_MR_ERROR)
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  269  			/* This MR is being used, don't recover it */
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  270  			continue;
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  271  
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  272  		/* recover this MR entry */
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  273  		ret = ib_dereg_mr(mr->mr);
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  274  		if (ret) {
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  275  			smbdirect_log_rdma_mr(sc, SMBDIRECT_LOG_ERR,
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  276  				"ib_dereg_mr failed ret=%u (%s)\n",
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  277  				ret, errname(ret));
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  278  			smbdirect_socket_schedule_cleanup(sc, ret);
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  279  			continue;
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  280  		}
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  281  
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  282  		mr->mr = ib_alloc_mr(sc->ib.pd,
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  283  				     sc->mr_io.type,
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  284  				     sp->max_frmr_depth);
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  285  		if (IS_ERR(mr->mr)) {
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  286  			ret = PTR_ERR(mr->mr);
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  287  			smbdirect_log_rdma_mr(sc, SMBDIRECT_LOG_ERR,
1fed7d7a575b09 Stefan Metzmacher 2025-09-19 @288  				"ib_alloc_mr failed ret=%d (%s) type=0x%x depth=%u\n",
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  289  				ret, errname(ret), sc->mr_io.type, sp->max_frmr_depth);
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  290  			smbdirect_socket_schedule_cleanup(sc, ret);
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  291  			continue;
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  292  		}
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  293  
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  294  		mr->state = SMBDIRECT_MR_READY;
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  295  
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  296  		/* smbdirect_mr->state is updated by this function
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  297  		 * and is read and updated by I/O issuing CPUs trying
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  298  		 * to get a MR, the call to atomic_inc_return
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  299  		 * implicates a memory barrier and guarantees this
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  300  		 * value is updated before waking up any calls to
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  301  		 * get_mr() from the I/O issuing CPUs
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  302  		 */
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  303  		if (atomic_inc_return(&sc->mr_io.ready.count) == 1)
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  304  			wake_up(&sc->mr_io.ready.wait_queue);
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  305  	}
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  306  }
1fed7d7a575b09 Stefan Metzmacher 2025-09-19  307  

:::::: The code at line 288 was first introduced by commit
:::::: 1fed7d7a575b0967f9600859934b925b2a11b564 smb: smbdirect: introduce smbdirect_mr.c with client mr code

:::::: TO: Stefan Metzmacher <metze@samba.org>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
