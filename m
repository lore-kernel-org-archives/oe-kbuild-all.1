Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33B91C01
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 08:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711183019; cv=none; b=h5J8rNMF76twfIMEzdCkpzd7hd7rNZQU5MRG4aE6O0B2566kbYs/d5+sO1+75PV0yCCFh1I1j4mcXfd75roEpkMf62oxPJtAgNgdBYqgtOKhTn9UVKlNJvqZB5lj6pp5d10TrUy+x3QIvAd0DcfPIQez16pZw6/2XCzWJr4pXlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711183019; c=relaxed/simple;
	bh=sCIqpQS156Pr2zrMrihMzRHrJLNGPMSLBY/Bw/O6xK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RdTN4JOmbZS7yrFMbMx02O9Mxn5gS1e81AHEETZL0dPHnl1vWH8V3GITEYBzgATijBUJ+vRGlZPVWYiu5s7PSq0cRvGB2PK1UKPso3+D7I7xD5Ns4zUxDpn3JjA1qR3//Jn8v39tUtYA8qUOXb883EQd9HZaR2ccdyB6MPy+Deo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3hK/iMJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3hK/iMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711183017; x=1742719017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sCIqpQS156Pr2zrMrihMzRHrJLNGPMSLBY/Bw/O6xK0=;
  b=e3hK/iMJo9wFbihonxUMuCOsLsS1jiurzkwBA3fxAR9LqZToC1nfMK3z
   /cmxJfQ8d6ryAkKo6YX7LnU3LfM74hLjS99f2EEnBZZEODR/QV4QAi2U0
   2Dix7skqr09IyA8/OHGEGljUrWvvRyq9rQjnaGvY6c2PEdXNLeNftBacX
   oHsz0B6MzrQMV8IpJXnphmiA7P9OpHeuMiv+vw/8VaojeyPRriaLL8DDx
   PerVBXrRZJ1/vl/ga+xWfagxvSd7QjvixHYjfk+qxBYKVcLQjhFLYhu4c
   2XRKpX88MVLb7EbwFiUNIxZj0pljTUNroaQve68MV95O2xh6s57+N3Si3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6092931"
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="6092931"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 01:36:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="38256756"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Mar 2024 01:36:53 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnwry-000Kzf-1o;
	Sat, 23 Mar 2024 08:36:50 +0000
Date: Sat, 23 Mar 2024 16:36:15 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 20/48] ERROR: modpost: "fg_console"
 [drivers/video/fbdev/ls2k500sfb.ko] undefined!
Message-ID: <202403231626.mftBObOE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   e0ee18f8b8228a1b9598534057943383c2ed23a5
commit: 3a50da023fae0cfab612bffb333d4b1343299208 [20/48] fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: x86_64-randconfig-015-20240323 (https://download.01.org/0day-ci/archive/20240323/202403231626.mftBObOE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403231626.mftBObOE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403231626.mftBObOE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/isdn/hardware/mISDN/mISDNisar.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/isdn/mISDN/mISDN_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/isdn/mISDN/l1oip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/of_mmc_spi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/memconsole.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/memconsole-coreboot.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-apple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-aureal.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-betopff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-bigbenff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cypress.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-dr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elecom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ezkey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-kbd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-mouse.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ite.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lenovo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-magicmouse.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-maltron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-mf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-monterey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-prodikeys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-pl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-petalynx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-primax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-redragon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sjoy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sony.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-speedlink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steelseries.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gaff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tivo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-twinhan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-uclogic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zpff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewsonic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-waltop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-loopback.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-power-supply.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-gbphy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-sdio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_tkip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_wep.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/fbtft/fbtft.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/intel-vbtn.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/intel-rst.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/classmate-laptop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/goldfish/goldfish_pipe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/maps/map_funcs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/yenta_socket.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/i82092.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy-fb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestream-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kretprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_htb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_red.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_ingress.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_prio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_multiq.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_drr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_plug.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_mqprio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_mqprio_lib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_skbprio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_cbs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nf_conntrack.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nf_conntrack_netlink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nf_nat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/nf_defrag_ipv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/nf_reject_ipv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/iptable_nat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/unix/unix_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/nf_defrag_ipv6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/nf_reject_ipv6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/packet/af_packet_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif_socket.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/vmw_vsock/vsock_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/toa/toa.o
>> ERROR: modpost: "fg_console" [drivers/video/fbdev/ls2k500sfb.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
