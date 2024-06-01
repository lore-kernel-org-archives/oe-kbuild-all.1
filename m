Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2B3A94B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jun 2024 05:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717218550; cv=none; b=XT3lijGbPyBS+F2dwEcDuBKAOrB3/R+2tlaxvyiX2pt47Uxp1L98NamxWrnkRpbzubrx9sBwoB9BiO5HcKLvbWzPEqNbXWttR/cgLzvzs/WDo/bb5J0nlC+a9VDwdL98eTL6kANNkTrdYI+XHHG0WwROpvKSxBhsLG52UZk9vyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717218550; c=relaxed/simple;
	bh=khUUZrMFUUyQqLOCiDcg4+kjqvLRJCXVPe2wDyyzs9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UdtSZ+of0QCXA11cyX59MPnS8RRDycGmpdCFX1PkbkXHh7VH0kXdSQDjJ+VpCFk8TtdH6npoIOoQOHXwSpl+f2k4X918RnstzTMV2Y9ZDUK2ZXVayo4FXqEOmIZM3yMIIJM05DddWZkQzocBvNGjZHCtuNdNf41TqzF12w7qW54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTqLtMCu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTqLtMCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717218548; x=1748754548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=khUUZrMFUUyQqLOCiDcg4+kjqvLRJCXVPe2wDyyzs9k=;
  b=OTqLtMCuFuLGsjPcf/mCduGESGoRjCdKp+U715TDSlcg8+z00KJYk0cJ
   DGrRfIFldtkI/qW/0YTFgnpT0z77Wi8lekLpJOhoN3f9RF3ny5lMsl09z
   S5wMMmqqaZlcudc52dRv9sPWkb8mx0hS6ggi3uZyADstWyc3/W7lc8ap/
   WePv7XCMwLyA/YeH3TII6kH6SjFk6Nr0EFC/V+Fh/GCleBQ+SVy11O7cK
   U57XrwXjJdwLRFq2paMtMjyhSepzQ4XgiF2kqEKN6XzmjfpoSODDtcrzO
   tIdr3VZM/6yltd+3PwOQ9+uCpcQmcH+G2gEqNvCg55r++CJYGjtWgfPxb
   A==;
X-CSE-ConnectionGUID: PHkXH6BsTQOfh2VnbOiH4Q==
X-CSE-MsgGUID: 6ZPlTzWsScCxn68d12SHMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17570133"
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="17570133"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 22:09:07 -0700
X-CSE-ConnectionGUID: 5sekydbFSbaQxj7lAXc1Pw==
X-CSE-MsgGUID: nRILS0HATIOm5wHlmc9nDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="40797317"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 31 May 2024 22:09:06 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDGzI-000IQO-0A;
	Sat, 01 Jun 2024 05:09:04 +0000
Date: Sat, 1 Jun 2024 13:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 34/61]
 drivers/media/platform/cadence/cdns-csi2rx.c:406:15: warning: variable
 'used_vc' is used uninitialized whenever 'for' loop exits because its
 condition is false
Message-ID: <202406011359.qVrQBfFU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   7c8d2ae114253c40001c092b53871beb0cebbc80
commit: 5d5b27e252781c3f8dd015acf2c26672b51a2094 [34/61] media: cadence: csi2rx: Enable multi-stream support
config: i386-randconfig-001-20240601 (https://download.01.org/0day-ci/archive/20240601/202406011359.qVrQBfFU-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406011359.qVrQBfFU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406011359.qVrQBfFU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/cadence/cdns-csi2rx.c:406:15: warning: variable 'used_vc' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
     406 |                 for (i = 0; i < fd.num_entries; i++) {
         |                             ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/cadence/cdns-csi2rx.c:413:37: note: uninitialized use occurs here
     413 |                         CSI2RX_STREAM_DATA_CFG_VC_SELECT(used_vc);
         |                                                          ^~~~~~~
   drivers/media/platform/cadence/cdns-csi2rx.c:52:51: note: expanded from macro 'CSI2RX_STREAM_DATA_CFG_VC_SELECT'
      52 | #define CSI2RX_STREAM_DATA_CFG_VC_SELECT(n)             BIT((n) + 16)
         |                                                              ^
   include/vdso/bits.h:7:30: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/media/platform/cadence/cdns-csi2rx.c:406:15: note: remove the condition if it is always true
     406 |                 for (i = 0; i < fd.num_entries; i++) {
         |                             ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/cadence/cdns-csi2rx.c:404:13: note: initialize the variable 'used_vc' to silence this warning
     404 |                 u8 used_vc;
         |                           ^
         |                            = '\0'
   1 warning generated.


vim +406 drivers/media/platform/cadence/cdns-csi2rx.c

   382	
   383	static void csi2rx_update_vc_select(struct csi2rx_priv *csi2rx,
   384					    struct v4l2_subdev_state *state)
   385	{
   386		struct v4l2_mbus_frame_desc fd = {0};
   387		struct v4l2_subdev_route *route;
   388		unsigned int i;
   389		int ret;
   390	
   391		for (i = 0; i < CSI2RX_STREAMS_MAX; i++)
   392			csi2rx->vc_select[i] = 0;
   393	
   394		ret = csi2rx_get_frame_desc_from_source(csi2rx, &fd);
   395		if (ret || fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
   396			dev_dbg(csi2rx->dev,
   397				"Failed to get source frame desc, allowing only VC=0\n");
   398			goto err_no_fd;
   399		}
   400	
   401		/* If source provides per-stream VC info, use it to filter by VC */
   402		for_each_active_route(&state->routing, route) {
   403			int cdns_stream = route->source_pad - CSI2RX_PAD_SOURCE_STREAM0;
   404			u8 used_vc;
   405	
 > 406			for (i = 0; i < fd.num_entries; i++) {
   407				if (fd.entry[i].stream == route->sink_stream) {
   408					used_vc = fd.entry[i].bus.csi2.vc;
   409					break;
   410				}
   411			}
   412			csi2rx->vc_select[cdns_stream] |=
   413				CSI2RX_STREAM_DATA_CFG_VC_SELECT(used_vc);
   414		}
   415	
   416	err_no_fd:
   417		for (i = 0; i < CSI2RX_STREAMS_MAX; i++) {
   418			if (!csi2rx->vc_select[i]) {
   419				csi2rx->vc_select[i] =
   420					CSI2RX_STREAM_DATA_CFG_VC_SELECT(0);
   421			}
   422		}
   423	}
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
