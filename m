Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853872F7AA8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Sep 2025 11:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757329892; cv=none; b=BDnFWMpqKR8JSuMbon8tjr3OBFDbyorSvd4dL8rYdhB05oT8bThunOR0StcosN2P9ApsbYEAqpfOjDRkRyM0vip0c3DeuxYg/ZA7Kyat1wC0oQfU32d5qjGz/gL2JXhoRe1FYyJWHdHtWt+D8GxmdfBCIC6UelyUdlcMxs4o3YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757329892; c=relaxed/simple;
	bh=YKxz8hwWeDwaCafpl49+pOGiJDVL/k2+YeQ2QeYmbfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lUUHOjo1WKu6a5RhF8a9rtdyMQRxfkx9+3iJl2HApK1M+WaM8nyH/+zUr7aobWfN6gLIZn6sluGXJ0vCyXTAwHc7xD/apND4ursMEfYWlLM4V2Ods1uryoJxKyXrSZnRXNyF34opZ9xQtrl/nMji4BAKTFDJwV2PN0lgRCKGr9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+KbvJyh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+KbvJyh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757329891; x=1788865891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YKxz8hwWeDwaCafpl49+pOGiJDVL/k2+YeQ2QeYmbfg=;
  b=g+KbvJyhkYxZdrdHrkLfxsz5/98oaz4kI6eOzLZy166uWFMKPRK8QEm/
   SZFB3acqGGRNlKvC6+m75dGxQZC6/0ITJLhrtYOQk+QXAVKsQRrvPIoax
   sot423FectYOHQaewSdndoktUanqQ+rZMojRI6veaqdijYUTdpTPz2SKJ
   KTb7nSBAlimKwcKXZsAbF5Jd4gkiCo5JEdx2G1lIDfrd5AOyMXcbs1TLI
   VBP+Hq/WO7hSMlIxwR1+gUFeKLDGK3SWonsruu5d2J3VEgbtEdboJ1sca
   tdW0t75h3ah3boyb+fHmDq6ca9WBftxUMkRCRX8oRG/2ZVfBGsG8Iox+9
   w==;
X-CSE-ConnectionGUID: fDyJVCCDS1aTWzxo0OnvxA==
X-CSE-MsgGUID: aVm91G19QbmxyUlacIUuDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59692501"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="59692501"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 04:11:29 -0700
X-CSE-ConnectionGUID: qWvMJAusSxuVgxvEKwzwpw==
X-CSE-MsgGUID: bGxwBTUqRVKyCOxUX0fXyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="172027837"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Sep 2025 04:11:27 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvZmO-0003kt-37;
	Mon, 08 Sep 2025 11:11:24 +0000
Date: Mon, 8 Sep 2025 19:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, ZhaoLong Wang <wangzhaolong1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2866/2866] ld.lld: error: undefined symbol:
 trace_event_buffer_reserve
Message-ID: <202509081908.rkRF0I49-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   00fccee10860a6b522c55bd4b2f4b40d349c2b52
commit: 1119ec49ac4ac643e6d7c9a5a834040aef87612e [2866/2866] mm, fs: Add BPF_READAHEAD build option for bpf readhead
config: x86_64-buildonly-randconfig-002-20250909 (https://download.01.org/0day-ci/archive/20250908/202509081908.rkRF0I49-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250908/202509081908.rkRF0I49-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509081908.rkRF0I49-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: trace_event_buffer_reserve
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_event_raw_event_initcall_level)
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_event_raw_event_initcall_start)
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_event_raw_event_initcall_finish)
   >>> referenced 823 more times
--
>> ld.lld: error: undefined symbol: trace_event_buffer_commit
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_event_raw_event_initcall_level)
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_event_raw_event_initcall_start)
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_event_raw_event_initcall_finish)
   >>> referenced 823 more times
--
>> ld.lld: error: undefined symbol: trace_print_bitmask_seq
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_raw_output_ipi_raise)
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_raw_output_ipi_send_cpumask)
--
>> ld.lld: error: undefined symbol: trace_output_call
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_raw_output_pm_qos_update_flags)
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_raw_output_802154_rdev_set_short_addr)
--
>> ld.lld: error: undefined symbol: blk_fill_rwbs
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_event_raw_event_block_rq_requeue)
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(perf_trace_block_rq_requeue)
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_event_raw_event_block_rq_completion)
   >>> referenced 13 more times
--
>> ld.lld: error: undefined symbol: trace_print_hex_seq
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_raw_output_host1x_cdma_push_gather)
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_raw_output_regmap_bulk)
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_raw_output_scsi_dispatch_cmd_start)
   >>> referenced 9 more times
--
>> ld.lld: error: undefined symbol: __tracepoint_devres_log
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(add_dr)
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(devres_remove)
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(devres_release_all)
   >>> referenced 15 more times
--
>> ld.lld: error: undefined symbol: __SCT__tp_func_devres_log
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(add_dr)
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(devres_remove)
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(devres_release_all)
   >>> referenced 6 more times
--
>> ld.lld: error: undefined symbol: nvme_trace_disk_name
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_raw_output_nvme_setup_cmd)
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_raw_output_nvme_complete_rq)
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_raw_output_nvme_sq)
--
>> ld.lld: error: undefined symbol: nvme_trace_parse_fabrics_cmd
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_raw_output_nvme_setup_cmd)
--
>> ld.lld: error: undefined symbol: nvme_trace_parse_nvm_cmd
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(trace_raw_output_nvme_setup_cmd)
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
