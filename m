Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8707F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 03:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711940945; cv=none; b=XMUdKSTr/B2+0nqs9PawmMRa8hkidTG9uG5Eooj2mB/s6k6gnWSnllcFiZdkpfjZQqIuzc7D1NXG9YjItO9QmK+cFX2fBioC4ATChFmfZ+J/dVQZ8kHyLWSqjL/5XIvGe/dyhuzhIioTRzF0iOSSIkYE6KJjsP0aunKmntuEVBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711940945; c=relaxed/simple;
	bh=O4Lr1xIC0Z7v6ri2VVYZcWnlCgyoBrNiluqDqj5QWC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=isNhBmG+rjd3CGJRWXQBpdj7kSadGMWk7A9AJsIia07qQAK8FbM+Et+8qCnnKtFIa1JEXX2aMnN3MxMFpp39xPRm6VGDsv2/S9OdfK/i040wdFf2yWCLkmDV7fsxedTxjqK6fjWrqFSIadaoLn9/1Zfh3pKJc3qrPRBOELhCbfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f6kEb4hy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6kEb4hy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711940944; x=1743476944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O4Lr1xIC0Z7v6ri2VVYZcWnlCgyoBrNiluqDqj5QWC8=;
  b=f6kEb4hy+6Xk2AA68ufzkoIIuiOm6nYZ+9C9AWQqeVpzTLuHclysuOgM
   j00Dsr6kSHVg9+ZiTMFWBMtjo3a9v0kyTx2a8sx0+XGi4pWKIhMGnqcvO
   a0ArEA2PYL6MmEhq6/J1fH3U7+7q2oNk2MhdtfxmS3pN0GK1OkUNlhyYI
   G/22ThFKHxAxbWCNAwE15o5JHni2fjfzzOxWqMu0bT10BJeoFf4XAzu5H
   xb40fWsISClPQ/ukhw3KOP8TeZknbxubMfHRp62ZkYMVaai6xYykcXahA
   6BTS6g5qFzHR+IYQT2oyXXSYMARJL/kVdZ00ygBvtxNjRyTRyVpfYeK22
   w==;
X-CSE-ConnectionGUID: EfIn0D0PTLegEHLSjEzjFQ==
X-CSE-MsgGUID: 8NlYD/z+RU6QRxAKxURtOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="6953704"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="6953704"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 20:09:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="48562882"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Mar 2024 20:09:02 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rr82d-0001c4-0u;
	Mon, 01 Apr 2024 03:08:59 +0000
Date: Mon, 1 Apr 2024 11:08:03 +0800
From: kernel test robot <lkp@intel.com>
To: Geoff Levand <geoff@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [geoff-ps3:ps3-queue-v6.9 16/17]
 arch/powerpc/platforms/ps3/device-init.c:785:17-23: ERROR: application of
 sizeof to pointer
Message-ID: <202404011140.XIsjBjur-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-linux.git ps3-queue-v6.9
head:   dc948075b6eb13520ec93b1739a5bd6270e2803d
commit: 187f6e3cc0d1111a352b95ad3da531c436b84984 [16/17] powerpc/ps3: Fix allmodconfig warning
config: powerpc64-randconfig-r054-20240401 (https://download.01.org/0day-ci/archive/20240401/202404011140.XIsjBjur-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404011140.XIsjBjur-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/ps3/device-init.c:785:17-23: ERROR: application of sizeof to pointer

vim +785 arch/powerpc/platforms/ps3/device-init.c

   760	
   761	/**
   762	 * ps3_probe_thread - Background repository probing at system startup.
   763	 *
   764	 * This implementation only supports background probing on a single bus.
   765	 * It uses the hypervisor's storage device notification mechanism to wait until
   766	 * a storage device is ready.  The device notification mechanism uses a
   767	 * pseudo device to asynchronously notify the guest when storage devices become
   768	 * ready.  The notification device has a block size of 512 bytes.
   769	 */
   770	
   771	static int ps3_probe_thread(void *data)
   772	{
   773		struct {
   774			struct ps3_notification_device dev;
   775			u8 buf[512];
   776		} *local;
   777		struct ps3_notify_cmd *notify_cmd;
   778		struct ps3_notify_event *notify_event;
   779		int res;
   780		unsigned int irq;
   781		u64 lpar;
   782	
   783		pr_debug(" -> %s:%u: kthread started\n", __func__, __LINE__);
   784	
 > 785		local = kzalloc(sizeof(local), GFP_KERNEL);
   786		if (!local)
   787			return -ENOMEM;
   788	
   789		lpar = ps3_mm_phys_to_lpar(__pa(&local->buf));
   790		notify_cmd = (struct ps3_notify_cmd *)&local->buf;
   791		notify_event = (struct ps3_notify_event *)&local->buf;
   792	
   793		/* dummy system bus device */
   794		local->dev.sbd.bus_id = (u64)data;
   795		local->dev.sbd.dev_id = PS3_NOTIFICATION_DEV_ID;
   796		local->dev.sbd.interrupt_id = PS3_NOTIFICATION_INTERRUPT_ID;
   797	
   798		res = lv1_open_device(local->dev.sbd.bus_id, local->dev.sbd.dev_id, 0);
   799		if (res) {
   800			pr_err("%s:%u: lv1_open_device failed %s\n", __func__,
   801			       __LINE__, ps3_result(res));
   802			goto fail_free;
   803		}
   804	
   805		res = ps3_sb_event_receive_port_setup(&local->dev.sbd,
   806			PS3_BINDING_CPU_ANY, &irq);
   807		if (res) {
   808			pr_err("%s:%u: ps3_sb_event_receive_port_setup failed %d\n",
   809			       __func__, __LINE__, res);
   810		       goto fail_close_device;
   811		}
   812	
   813		spin_lock_init(&local->dev.lock);
   814		rcuwait_init(&local->dev.wait);
   815	
   816		res = request_irq(irq, ps3_notification_interrupt, 0,
   817				  "ps3_notification", &local->dev);
   818		if (res) {
   819			pr_err("%s:%u: request_irq failed %d\n", __func__, __LINE__,
   820			       res);
   821			goto fail_sb_event_receive_port_destroy;
   822		}
   823	
   824		/* Setup and write the request for device notification. */
   825		notify_cmd->operation_code = 0; /* must be zero */
   826		notify_cmd->event_mask = 1UL << notify_region_probe;
   827	
   828		res = ps3_notification_read_write(&local->dev, lpar, 1);
   829		if (res)
   830			goto fail_free_irq;
   831	
   832		set_freezable();
   833		/* Loop here processing the requested notification events. */
   834		do {
   835			try_to_freeze();
   836	
   837			memset(notify_event, 0, sizeof(*notify_event));
   838	
   839			res = ps3_notification_read_write(&local->dev, lpar, 0);
   840			if (res)
   841				break;
   842	
   843			pr_debug("%s:%u: notify event type 0x%llx bus id %llu dev id %llu"
   844				 " type %llu port %llu\n", __func__, __LINE__,
   845				notify_event->event_type, notify_event->bus_id,
   846				notify_event->dev_id, notify_event->dev_type,
   847				notify_event->dev_port);
   848	
   849			if (notify_event->event_type != notify_region_probe ||
   850				notify_event->bus_id != local->dev.sbd.bus_id) {
   851				pr_warn("%s:%u: bad notify_event: event %llu, dev_id %llu, dev_type %llu\n",
   852					__func__, __LINE__, notify_event->event_type,
   853					notify_event->dev_id, notify_event->dev_type);
   854				continue;
   855			}
   856	
   857			ps3_find_and_add_device(local->dev.sbd.bus_id,
   858				notify_event->dev_id);
   859	
   860		} while (!kthread_should_stop());
   861	
   862	fail_free_irq:
   863		free_irq(irq, &local->dev);
   864	fail_sb_event_receive_port_destroy:
   865		ps3_sb_event_receive_port_destroy(&local->dev.sbd, irq);
   866	fail_close_device:
   867		lv1_close_device(local->dev.sbd.bus_id, local->dev.sbd.dev_id);
   868	fail_free:
   869		kfree(local);
   870	
   871		probe_task = NULL;
   872	
   873		pr_debug(" <- %s:%u: kthread finished\n", __func__, __LINE__);
   874	
   875		return 0;
   876	}
   877	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
