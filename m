Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F27148FF2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 16:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708621070; cv=none; b=Mohczb2D/o0I86KsBO3kdTcH2AbOd7zHIe94P221DwH0k/Oze9hsYHKfO39CTYi83mFrv+oZmSY4kQQRL7AfB17jjtL60PP3KLj95dDdmC/umKhSb0sO5Kq4mj1OrKJZNOAGsZB+jF7Lh8SVih34pPAGudgFbLTTyqd6LAS/PBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708621070; c=relaxed/simple;
	bh=B5T/4V8bYNacbgQ51PS0TZyhOwI2QlMLwZSp+iCswGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=leyKDK/C4yEtDEOxKa9Q/vOimjBoYsHH3+rfsSHEUjJsKORNGPlkgNisA/PMKYbGJM1w/JJkaZRjUQE52vLGEeCeW/agL3bL7VeowZRb4gLuY4mzD7pWg+A2Fe0oMUwUBwO5wye5kYE4Q1G6pwhCvGW87wqK49iCrilDxiuoqiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bzcGlLMm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzcGlLMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708621068; x=1740157068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B5T/4V8bYNacbgQ51PS0TZyhOwI2QlMLwZSp+iCswGU=;
  b=bzcGlLMmPz6AGmey+8klt0Vv8xcs+uCSth6E7AibNq/lcRAk6VdrxJOy
   fE7mFGjfrDcP8sgTUOHWVAIvWd+eyEweEdhHT3yygObeqmUwKKYK74u7I
   tc6l2V6evchgQFwRUSXCjlJfGgv6pXdi3Qvi52cmL7IRN4ytXMXiTLNoO
   PgRVggJVPl85NH8FFGuAVqDU8wiae6DGyg4khmN9UAijWvw+CoTymjAr0
   2vVK7ZSnVys19FBJmbxwJzDXYkOlPy6Vmnv0FlYWTGRiXFRQSk6Z7K4UE
   vrl7samwLVw8BU9bMX+wVCY+EiM9QGd+cP+DAXWmOMcOHaxp+mrogjEwn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="5813122"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5813122"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 08:57:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="936874285"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="936874285"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2024 08:57:42 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdCOC-0006XI-1o;
	Thu, 22 Feb 2024 16:57:40 +0000
Date: Fri, 23 Feb 2024 00:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/sysctl.c:2616:5: sparse: sparse: symbol
 'setup_pagecache_limit' was not declared. Should it be static?
Message-ID: <202402230052.Lw2PxrCE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.
date:   2 years, 11 months ago
config: x86_64-randconfig-123-20240222 (https://download.01.org/0day-ci/archive/20240223/202402230052.Lw2PxrCE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402230052.Lw2PxrCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402230052.Lw2PxrCE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sysctl.c:2981:9: sparse: sparse: mixing declarations and code
>> kernel/sysctl.c:2616:5: sparse: sparse: symbol 'setup_pagecache_limit' was not declared. Should it be static?
   kernel/sysctl.c:2361:66: sparse: sparse: self-comparison always evaluates to false
--
>> mm/page_alloc.c:8554:36: sparse: sparse: non-ANSI function declaration of function 'pagecache_over_limit'
   mm/page_alloc.c:106:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:318:27: sparse: sparse: restricted gfp_t degrades to integer
--
>> fs/ioctl.c:706:14: sparse: sparse: symbol 'nv_ioctl_id' was not declared. Should it be static?
>> fs/ioctl.c:707:14: sparse: sparse: symbol 'nv_cmd_id_get_gram' was not declared. Should it be static?
--
>> kernel/tkernel/shield_mounts.c:225:5: sparse: sparse: symbol 'shield_mounts_release' was not declared. Should it be static?
--
>> kernel/tkernel/trackgpu.c:13:25: sparse: sparse: symbol 'gpu_list' was not declared. Should it be static?
>> kernel/tkernel/trackgpu.c:15:10: sparse: sparse: symbol 'gpu_req_count' was not declared. Should it be static?
>> kernel/tkernel/trackgpu.c:91:5: sparse: sparse: symbol 'comm_pid' was not declared. Should it be static?
>> kernel/tkernel/trackgpu.c:120:15: sparse: sparse: incompatible types in comparison expression (different type sizes):
   kernel/tkernel/trackgpu.c:120:15: sparse:    unsigned long *
   kernel/tkernel/trackgpu.c:120:15: sparse:    int *
--
   kernel/trace/trace.c:5013:1: sparse: sparse: trying to concatenate 8539-character string (8191 bytes max)
   kernel/trace/trace.c:919:6: sparse: sparse: symbol 'tracing_snapshot_instance_cond' was not declared. Should it be static?
   kernel/trace/trace.c:2738:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct trace_export **list @@     got struct trace_export [noderef] <asn:4> ** @@
   kernel/trace/trace.c:2738:28: sparse:     expected struct trace_export **list
   kernel/trace/trace.c:2738:28: sparse:     got struct trace_export [noderef] <asn:4> **
   kernel/trace/trace.c:2752:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct trace_export **list @@     got struct trace_export [noderef] <asn:4> ** @@
   kernel/trace/trace.c:2752:33: sparse:     expected struct trace_export **list
   kernel/trace/trace.c:2752:33: sparse:     got struct trace_export [noderef] <asn:4> **
>> kernel/trace/trace.c:3006:46: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct trace_buffer_struct * @@
   kernel/trace/trace.c:3006:46: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/trace/trace.c:3006:46: sparse:     got struct trace_buffer_struct *
>> kernel/trace/trace.c:3022:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got int * @@
   kernel/trace/trace.c:3022:9: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   kernel/trace/trace.c:3022:9: sparse:     got int *
>> kernel/trace/trace.c:3029:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct trace_buffer_struct *buffers @@     got struct trace_buffer_struct [noderef] <asn:3> * @@
   kernel/trace/trace.c:3029:17: sparse:     expected struct trace_buffer_struct *buffers
   kernel/trace/trace.c:3029:17: sparse:     got struct trace_buffer_struct [noderef] <asn:3> *
   kernel/trace/trace.c: note: in included file:
   kernel/trace/trace.h:1432:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] <asn:4> *filter @@
   kernel/trace/trace.h:1432:38: sparse:     expected struct event_filter *filter
   kernel/trace/trace.h:1432:38: sparse:     got struct event_filter [noderef] <asn:4> *filter
   kernel/trace/trace.c:2690:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace.c:2690:9: sparse:    struct trace_export [noderef] <asn:4> *
   kernel/trace/trace.c:2690:9: sparse:    struct trace_export *
   kernel/trace/trace.c:2705:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace.c:2705:9: sparse:    struct trace_export [noderef] <asn:4> *
   kernel/trace/trace.c:2705:9: sparse:    struct trace_export *
--
>> kernel/tkernel/netatop/netatop.c:1015:12: sparse: sparse: non-ANSI function declaration of function 'gctaskexit'
>> kernel/tkernel/netatop/netatop.c:1049:12: sparse: sparse: non-ANSI function declaration of function 'gcsockinfo'
>> kernel/tkernel/netatop/netatop.c:1259:12: sparse: sparse: non-ANSI function declaration of function 'gctaskinfo'
>> kernel/tkernel/netatop/netatop.c:1332:14: sparse: sparse: non-ANSI function declaration of function 'wipesockinfo'
>> kernel/tkernel/netatop/netatop.c:1360:14: sparse: sparse: non-ANSI function declaration of function 'wipetaskinfo'
>> kernel/tkernel/netatop/netatop.c:1388:14: sparse: sparse: non-ANSI function declaration of function 'wipetaskexit'
>> kernel/tkernel/netatop/netatop.c:1673:13: sparse: sparse: non-ANSI function declaration of function 'init_module'
>> kernel/tkernel/netatop/netatop.c:1764:16: sparse: sparse: non-ANSI function declaration of function 'cleanup_module'
   kernel/tkernel/netatop/netatop.c:342:10: sparse: sparse: unknown field name in initializer
   kernel/tkernel/netatop/netatop.c:343:10: sparse: sparse: unknown field name in initializer
   kernel/tkernel/netatop/netatop.c:344:10: sparse: sparse: unknown field name in initializer
   kernel/tkernel/netatop/netatop.c:345:10: sparse: sparse: unknown field name in initializer
   kernel/tkernel/netatop/netatop.c:346:10: sparse: sparse: unknown field name in initializer
   kernel/tkernel/netatop/netatop.c:1507:1: sparse: sparse: symbol 'getsockopt' redeclared with different type (incompatible argument 3 (different address spaces)):
   kernel/tkernel/netatop/netatop.c:1507:1: sparse:    int static [signed] [toplevel] getsockopt( ... )
   kernel/tkernel/netatop/netatop.c:328:25: sparse: note: previously declared as:
   kernel/tkernel/netatop/netatop.c:328:25: sparse:    int static [signed] [toplevel] getsockopt( ... )
   kernel/tkernel/netatop/netatop.c:1712:13: sparse: sparse: undefined identifier 'nf_register_sockopt'
   kernel/tkernel/netatop/netatop.c:1725:17: sparse: sparse: undefined identifier 'nf_unregister_sockopt'
   kernel/tkernel/netatop/netatop.c:1744:9: sparse: sparse: undefined identifier 'nf_register_net_hook'
   kernel/tkernel/netatop/netatop.c:1745:9: sparse: sparse: undefined identifier 'nf_register_net_hook'
   kernel/tkernel/netatop/netatop.c:1774:9: sparse: sparse: undefined identifier 'nf_unregister_net_hook'
   kernel/tkernel/netatop/netatop.c:1775:9: sparse: sparse: undefined identifier 'nf_unregister_net_hook'
   kernel/tkernel/netatop/netatop.c:1779:9: sparse: sparse: undefined identifier 'nf_unregister_sockopt'
--
>> block/blk-core.c:108:55: sparse: sparse: restricted req_flags_t degrades to integer
--
>> drivers/acpi/sysfs.c:446:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] <asn:2> *base @@     got void * @@
   drivers/acpi/sysfs.c:446:14: sparse:     expected void [noderef] <asn:2> *base
   drivers/acpi/sysfs.c:446:14: sparse:     got void *
>> drivers/acpi/sysfs.c:449:59: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected void const *from @@     got void [noderef] <asn:2> *base @@
   drivers/acpi/sysfs.c:449:59: sparse:     expected void const *from
   drivers/acpi/sysfs.c:449:59: sparse:     got void [noderef] <asn:2> *base
>> drivers/acpi/sysfs.c:451:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *logical_address @@     got void [noderef] <asn:2> *base @@
   drivers/acpi/sysfs.c:451:30: sparse:     expected void *logical_address
   drivers/acpi/sysfs.c:451:30: sparse:     got void [noderef] <asn:2> *base
--
>> net/core/net-procfs.c:296:45: sparse: sparse: cast removes address space '<asn:3>' of expression
>> net/core/net-procfs.c:296:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:3> *mib @@     got void [noderef] <asn:3> ** @@
   net/core/net-procfs.c:296:45: sparse:     expected void [noderef] <asn:3> *mib
   net/core/net-procfs.c:296:45: sparse:     got void [noderef] <asn:3> **
--
>> net/ipv4/tcp_input.c:2011:30: sparse: sparse: incompatible types in comparison expression (different signedness):
   net/ipv4/tcp_input.c:2011:30: sparse:    int *
   net/ipv4/tcp_input.c:2011:30: sparse:    unsigned int *
   net/ipv4/tcp_input.c: note: in included file:
>> include/net/tcp.h:1158:13: sparse: sparse: restricted __be32 degrades to integer
   include/net/tcp.h:1159:14: sparse: sparse: restricted __be32 degrades to integer
   net/ipv4/tcp_input.c:6710:17: sparse: sparse: context imbalance in 'tcp_conn_request' - unexpected unlock
--
>> net/toa/toa.c:23:15: sparse: sparse: symbol 'sk_data_ready_addr' was not declared. Should it be static?
>> net/toa/toa.c:29:24: sparse: sparse: symbol 'toa_stats' was not declared. Should it be static?
>> net/toa/toa.c:123:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:123:33: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   net/toa/toa.c:123:33: sparse:     got struct toa_stat_mib *
>> net/toa/toa.c:127:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] sin_port @@     got unsigned short [addressable] [usertype] port @@
   net/toa/toa.c:127:47: sparse:     expected restricted __be16 [usertype] sin_port
   net/toa/toa.c:127:47: sparse:     got unsigned short [addressable] [usertype] port
>> net/toa/toa.c:128:54: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] s_addr @@     got unsigned int [addressable] [usertype] ip @@
   net/toa/toa.c:128:54: sparse:     expected restricted __be32 [usertype] s_addr
   net/toa/toa.c:128:54: sparse:     got unsigned int [addressable] [usertype] ip
   net/toa/toa.c:130:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:130:33: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   net/toa/toa.c:130:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:135:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:135:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   net/toa/toa.c:135:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:138:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:138:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   net/toa/toa.c:138:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:163:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:163:33: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   net/toa/toa.c:163:33: sparse:     got struct toa_stat_mib *
>> net/toa/toa.c:164:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] sin6_port @@     got unsigned short [addressable] [usertype] port @@
   net/toa/toa.c:164:48: sparse:     expected restricted __be16 [usertype] sin6_port
   net/toa/toa.c:164:48: sparse:     got unsigned short [addressable] [usertype] port
>> net/toa/toa.c:165:94: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted __be32 [usertype] w4 @@     got unsigned int [addressable] [usertype] ip @@
   net/toa/toa.c:165:94: sparse:     expected restricted __be32 [usertype] w4
   net/toa/toa.c:165:94: sparse:     got unsigned int [addressable] [usertype] ip
   net/toa/toa.c:167:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:167:33: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   net/toa/toa.c:167:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:170:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:170:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   net/toa/toa.c:170:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:173:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:173:17: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   net/toa/toa.c:173:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:207:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:207:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   net/toa/toa.c:207:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:209:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:209:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   net/toa/toa.c:209:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:235:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:235:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   net/toa/toa.c:235:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:237:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:237:25: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   net/toa/toa.c:237:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:343:65: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:343:65: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   net/toa/toa.c:343:65: sparse:     got struct toa_stat_mib *
>> net/toa/toa.c:377:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct toa_stat_mib *[addressable] [toplevel] ext_stats @@     got struct toa_stat_mib [noderef] <asn:3> * @@
   net/toa/toa.c:377:32: sparse:     expected struct toa_stat_mib *[addressable] [toplevel] ext_stats
   net/toa/toa.c:377:32: sparse:     got struct toa_stat_mib [noderef] <asn:3> *
>> net/toa/toa.c:401:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:3> *__pdata @@     got struct toa_stat_mib *[addressable] [toplevel] ext_stats @@
   net/toa/toa.c:401:29: sparse:     expected void [noderef] <asn:3> *__pdata
   net/toa/toa.c:401:29: sparse:     got struct toa_stat_mib *[addressable] [toplevel] ext_stats
>> net/toa/toa.c:417:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:3> *__pdata @@     got struct toa_stat_mib *[addressable] [assigned] [toplevel] ext_stats @@
   net/toa/toa.c:417:29: sparse:     expected void [noderef] <asn:3> *__pdata
   net/toa/toa.c:417:29: sparse:     got struct toa_stat_mib *[addressable] [assigned] [toplevel] ext_stats
--
>> drivers/w1/slaves/w1_ds28e04.c:342:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got char *buf @@
   drivers/w1/slaves/w1_ds28e04.c:342:13: sparse:     expected void const volatile [noderef] <asn:1> *
   drivers/w1/slaves/w1_ds28e04.c:342:13: sparse:     got char *buf
>> drivers/w1/slaves/w1_ds28e04.c:356:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got char const *buf @@
   drivers/w1/slaves/w1_ds28e04.c:356:13: sparse:     expected void const volatile [noderef] <asn:1> *
   drivers/w1/slaves/w1_ds28e04.c:356:13: sparse:     got char const *buf

vim +/setup_pagecache_limit +2616 kernel/sysctl.c

  2615	
> 2616	int setup_pagecache_limit(void)
  2617	{
  2618		/* reclaim $ADDITIONAL_RECLAIM_PAGES more than limit. */
  2619		vm_pagecache_limit_reclaim_ratio = vm_pagecache_limit_ratio + ADDITIONAL_RECLAIM_RATIO;
  2620	
  2621		if (vm_pagecache_limit_reclaim_ratio > 100)
  2622			vm_pagecache_limit_reclaim_ratio = 100;
  2623		if (vm_pagecache_limit_ratio == 0)
  2624			vm_pagecache_limit_reclaim_ratio = 0;
  2625	
  2626		vm_pagecache_limit_pages = vm_pagecache_limit_ratio * totalram_pages() / 100;
  2627		vm_pagecache_limit_reclaim_pages = vm_pagecache_limit_reclaim_ratio * totalram_pages() / 100;
  2628		return 0;
  2629	}
  2630	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
