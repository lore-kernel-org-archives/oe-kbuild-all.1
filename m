Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD323D393
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 14:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708527076; cv=none; b=P7HhoYUr530ripAyezskEt2+SgHA5ZFMvBHPv0AtOU72ubKteBxOOIA5f/hOREX5Q723XfvZHkWZzFVzmLKLBl4aNpdfMQ+hQj3AA+J1ruVpY2PY+LOHYwY+I4cmGPKWO6E/ZB5ZCLrZPvoTMU/8GEKjZ0kobrbFy+wSgOBBmzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708527076; c=relaxed/simple;
	bh=DEBUiUpRwNwVxbLnikgtYUwVFB5k/08fvnayAtV+TB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PCRy6HLruZctSMMbdoHvCW45NdRuCU5+suMcnvBzHPqAS90iExApaqKg7G2LD99eymTs11Mr7KEhCQjqOEe4iopPX5yeJ13+PioLPde2GmrV/qrds+YgVxf+ApMfQ652FVhGr3OLu/XNPt1AkZG3CujALm7jYTdZedV2g2uoq0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elgkSod5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elgkSod5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708527073; x=1740063073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DEBUiUpRwNwVxbLnikgtYUwVFB5k/08fvnayAtV+TB8=;
  b=elgkSod5kqFz9UZ+6p4rlPH98i6EaIrIFF1VIpQ7tRmq/bJmCKBQiFkK
   RpQ0SM1Q/46Ikin137tCLcS2jm62viPHoYi5opJtJRsfkgy05qMVHTsJq
   +9hR1oEa46YmBT9Qjz3S+yQTs1kBq02mMqzQUqzmrXEwjUV/u57pqt1VP
   l8XTIzN2oNHFmtaVCzJjQJQpQt9xqaiJ9uP3WrDPxzS2isRp9xUzYWyor
   P2RHTYDXTCZmObqX/nFuHFfkgnfuzmPnSoHKcLlBi1P6JcwbcBIys4XdP
   WxniGf/2mrHLaIbZkfuAtyh2AHQf8HBt+jlXD4NCxeKaoLuG3IMa/SaF0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="3172338"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="3172338"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 06:51:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9751926"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Feb 2024 06:51:05 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcnw4-0005Q8-2B;
	Wed, 21 Feb 2024 14:51:02 +0000
Date: Wed, 21 Feb 2024 22:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:4.14-main 5375/28369] net/core/dev.c:8808:17:
 error: implicit declaration of function 'rps_table_init'; did you mean
 'udp_table_init'?
Message-ID: <202402212230.cDc8htCY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 4.14-main
head:   d8596a70452e988b924cced76234cb516485149d
commit: a293bdb3d53aac4216fb379f84aa25aa65aaa3ef [5375/28369] [gmac] added second gmac
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20240221/202402212230.cDc8htCY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402212230.cDc8htCY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402212230.cDc8htCY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/workqueue.h:9,
                    from include/linux/rhashtable.h:26,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:9,
                    from include/linux/sched.h:15,
                    from include/linux/uaccess.h:5,
                    from net/core/dev.c:75:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:179:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     179 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:144:39: note: in definition of macro '__setup_timer'
     144 |                 (_timer)->function = (_fn);                             \
         |                                       ^~~
   In file included from include/linux/sctp.h:57,
                    from net/core/dev.c:146:
   include/uapi/linux/sctp.h: At top level:
   include/uapi/linux/sctp.h:348:1: warning: alignment 4 of 'struct sctp_paddr_change' is less than 8 [-Wpacked-not-aligned]
     348 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:668:1: warning: alignment 4 of 'struct sctp_setpeerprim' is less than 8 [-Wpacked-not-aligned]
     668 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:667:33: warning: 'sspp_addr' offset 4 in 'struct sctp_setpeerprim' isn't aligned to 8 [-Wpacked-not-aligned]
     667 |         struct sockaddr_storage sspp_addr;
         |                                 ^~~~~~~~~
   include/uapi/linux/sctp.h:681:1: warning: alignment 4 of 'struct sctp_prim' is less than 8 [-Wpacked-not-aligned]
     681 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:680:33: warning: 'ssp_addr' offset 4 in 'struct sctp_prim' isn't aligned to 8 [-Wpacked-not-aligned]
     680 |         struct sockaddr_storage ssp_addr;
         |                                 ^~~~~~~~
   include/uapi/linux/sctp.h:728:1: warning: alignment 4 of 'struct sctp_paddrparams' is less than 8 [-Wpacked-not-aligned]
     728 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:722:33: warning: 'spp_address' offset 4 in 'struct sctp_paddrparams' isn't aligned to 8 [-Wpacked-not-aligned]
     722 |         struct sockaddr_storage spp_address;
         |                                 ^~~~~~~~~~~
   include/uapi/linux/sctp.h:835:1: warning: alignment 4 of 'struct sctp_paddrinfo' is less than 8 [-Wpacked-not-aligned]
     835 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:829:33: warning: 'spinfo_address' offset 4 in 'struct sctp_paddrinfo' isn't aligned to 8 [-Wpacked-not-aligned]
     829 |         struct sockaddr_storage spinfo_address;
         |                                 ^~~~~~~~~~~~~~
   net/core/dev.c: In function 'net_dev_init':
>> net/core/dev.c:8808:17: error: implicit declaration of function 'rps_table_init'; did you mean 'udp_table_init'? [-Werror=implicit-function-declaration]
    8808 |                 rps_table_init();
         |                 ^~~~~~~~~~~~~~
         |                 udp_table_init
   net/core/dev.c: In function 'do_xdp_generic':
   net/core/dev.c:4042:36: warning: this statement may fall through [-Wimplicit-fallthrough=]
    4042 |                                 if (err)
         |                                    ^
   net/core/dev.c:4045:25: note: here
    4045 |                         case XDP_TX:
         |                         ^~~~
   In file included from include/linux/if_ether.h:23,
                    from net/core/dev.c:92:
   In function '__skb_queue_before',
       inlined from '__skb_queue_tail' at include/linux/skbuff.h:1831:2,
       inlined from 'enqueue_to_backlog' at net/core/dev.c:3915:4,
       inlined from 'netif_rx_internal' at net/core/dev.c:4105:9:
   include/linux/skbuff.h:1797:9: warning: array subscript 'struct sk_buff[0]' is partly outside array bounds of 'struct softnet_data[1]' [-Warray-bounds=]
    1797 |         __skb_insert(newsk, next->prev, next, list);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from arch/alpha/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/current.h:5,
                    from ./arch/alpha/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12:
   net/core/dev.c: In function 'netif_rx_internal':
   net/core/dev.c:277:23: note: at offset 88 into object 'softnet_data' of size 280
     277 | EXPORT_PER_CPU_SYMBOL(softnet_data);
         |                       ^~~~~~~~~~~~
   include/linux/export.h:65:28: note: in definition of macro '___EXPORT_SYMBOL'
      65 |         extern typeof(sym) sym;                                         \
         |                            ^~~
   include/linux/percpu-defs.h:181:36: note: in expansion of macro 'EXPORT_SYMBOL'
     181 | #define EXPORT_PER_CPU_SYMBOL(var) EXPORT_SYMBOL(var)
         |                                    ^~~~~~~~~~~~~
   net/core/dev.c:277:1: note: in expansion of macro 'EXPORT_PER_CPU_SYMBOL'
     277 | EXPORT_PER_CPU_SYMBOL(softnet_data);
         | ^~~~~~~~~~~~~~~~~~~~~
   In function '__skb_insert',
       inlined from '__skb_queue_before' at include/linux/skbuff.h:1797:2,
       inlined from '__skb_queue_tail' at include/linux/skbuff.h:1831:2,
       inlined from 'enqueue_to_backlog' at net/core/dev.c:3915:4,
       inlined from 'netif_rx_internal' at net/core/dev.c:4105:9:
   include/linux/skbuff.h:1691:21: warning: array subscript 'struct sk_buff[0]' is partly outside array bounds of 'struct softnet_data[1]' [-Warray-bounds=]
    1691 |         next->prev  = prev->next = newsk;
         |         ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   net/core/dev.c: In function 'netif_rx_internal':
   net/core/dev.c:277:23: note: at offset 88 into object 'softnet_data' of size 280
     277 | EXPORT_PER_CPU_SYMBOL(softnet_data);
         |                       ^~~~~~~~~~~~
   include/linux/export.h:65:28: note: in definition of macro '___EXPORT_SYMBOL'
      65 |         extern typeof(sym) sym;                                         \
         |                            ^~~
   include/linux/percpu-defs.h:181:36: note: in expansion of macro 'EXPORT_SYMBOL'
     181 | #define EXPORT_PER_CPU_SYMBOL(var) EXPORT_SYMBOL(var)
         |                                    ^~~~~~~~~~~~~
   net/core/dev.c:277:1: note: in expansion of macro 'EXPORT_PER_CPU_SYMBOL'
     277 | EXPORT_PER_CPU_SYMBOL(softnet_data);
         | ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +8808 net/core/dev.c

  8802	
  8803			sd->backlog.poll = process_backlog;
  8804			sd->backlog.weight = weight_p;
  8805		}
  8806	
  8807		if (IS_ENABLED(CONFIG_RPS))
> 8808			rps_table_init();
  8809	
  8810		dev_boot_phase = 0;
  8811	
  8812		/* The loopback device is special if any other network devices
  8813		 * is present in a network namespace the loopback device must
  8814		 * be present. Since we now dynamically allocate and free the
  8815		 * loopback device ensure this invariant is maintained by
  8816		 * keeping the loopback device as the first device on the
  8817		 * list of network devices.  Ensuring the loopback devices
  8818		 * is the first device that appears and the last network device
  8819		 * that disappears.
  8820		 */
  8821		if (register_pernet_device(&loopback_net_ops))
  8822			goto out;
  8823	
  8824		if (register_pernet_device(&default_device_ops))
  8825			goto out;
  8826	
  8827		open_softirq(NET_TX_SOFTIRQ, net_tx_action);
  8828		open_softirq(NET_RX_SOFTIRQ, net_rx_action);
  8829	
  8830		rc = cpuhp_setup_state_nocalls(CPUHP_NET_DEV_DEAD, "net/dev:dead",
  8831					       NULL, dev_cpu_dead);
  8832		WARN_ON(rc < 0);
  8833		rc = 0;
  8834	out:
  8835		return rc;
  8836	}
  8837	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
