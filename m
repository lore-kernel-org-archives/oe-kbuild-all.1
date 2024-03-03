Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2FD8F40
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709455246; cv=none; b=tvougE+56744rA2eWpOajknoCcQ7lQLp/EbvdKtbeyEGzDyFEkrd6DfgF+2GsGThX+e9KoTPZHfrLBOrdroXsCOP+82wjLwMsWYns3FmZsuNAsoqxc+0ZYcQd+KikAC74h10Lvy+ulcowJWBBveGZbiPsneK50At/vnZkGvObqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709455246; c=relaxed/simple;
	bh=rfhVLw0pd5R7RWYW/yDU+IfuDrF96TY0awZQZ1T5vbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oFcbWyGEhRni1feUOEwev5aBaMpfobUFuDvfS398TLCTcnmI47d7fPyKubhGfP60I6C5BvW2t06gFlhS9pU74jjOMP+OT7iXQURL1PPg9E9i/Fc/jhNSUUd8JxC4lgttSDP8abnZqiDHJ+A5g44ZC6pJ2P67ViDVZZQdMPhqZTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/8qbVM1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/8qbVM1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709455244; x=1740991244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rfhVLw0pd5R7RWYW/yDU+IfuDrF96TY0awZQZ1T5vbg=;
  b=c/8qbVM1XrLZb4dlnb1wru3BVwNCoN1OmjpWWdaAJ23kOdKyxYlMjTgn
   OAAUDmFzOZxxGXmJOuv6j26E4gO3o37tUAWVfEnI/22tv5FLBsbsmaBxY
   y6lL4eqWvnkhtLfqWUmVHPEos095ABLeaAUnF1yGmxdN1SJihEpHFKiCn
   w7LZLRLghg0Lxzlyuaq5VzfH78mAwTdFAi+rlntccOU4UiXBY319uYnWw
   CHSNgnTMt+legeqmzTlaTEttUWcJW/HtEftIw/2bHKSpI+uaPa149fqJg
   3UXu9kAIh/ECJMM4SsUXz4hrZ4ljTg+X2xkLUN+tdsIIFIfRaxq4jZTeH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="21496134"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="21496134"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 00:40:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="13231283"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Mar 2024 00:40:40 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rghOg-0001XW-0G;
	Sun, 03 Mar 2024 08:40:38 +0000
Date: Sun, 3 Mar 2024 16:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: mm/vmscan.c:4118:1: sparse: sparse: symbol 'pagecache_reclaim_wq'
 was not declared. Should it be static?
Message-ID: <202403031648.7bd4yX3Y-lkp@intel.com>
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
date:   3 years ago
config: x86_64-randconfig-122-20240303 (https://download.01.org/0day-ci/archive/20240303/202403031648.7bd4yX3Y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031648.7bd4yX3Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031648.7bd4yX3Y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/trace/events/vmscan.h:101:1: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long flags @@     got restricted gfp_t [usertype] gfp_flags @@
   include/trace/events/vmscan.h:101:1: sparse:     expected unsigned long flags
   include/trace/events/vmscan.h:101:1: sparse:     got restricted gfp_t [usertype] gfp_flags
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long flags @@     got restricted gfp_t [usertype] gfp_flags @@
   include/trace/events/vmscan.h:185:1: sparse:     expected unsigned long flags
   include/trace/events/vmscan.h:185:1: sparse:     got restricted gfp_t [usertype] gfp_flags
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast from restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long flags @@     got restricted gfp_t [usertype] gfp_flags @@
   include/trace/events/vmscan.h:463:1: sparse:     expected unsigned long flags
   include/trace/events/vmscan.h:463:1: sparse:     got restricted gfp_t [usertype] gfp_flags
   mm/vmscan.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/vmscan.h):
   include/trace/events/vmscan.h:75:1: sparse: sparse: cast to restricted gfp_t
   include/trace/events/vmscan.h:75:1: sparse: sparse: cast to restricted gfp_t
   include/trace/events/vmscan.h:75:1: sparse: sparse: restricted gfp_t degrades to integer
   include/trace/events/vmscan.h:75:1: sparse: sparse: restricted gfp_t degrades to integer
   include/trace/events/vmscan.h:101:1: sparse: sparse: cast to restricted gfp_t
   include/trace/events/vmscan.h:101:1: sparse: sparse: cast to restricted gfp_t
   include/trace/events/vmscan.h:101:1: sparse: sparse: restricted gfp_t degrades to integer
   include/trace/events/vmscan.h:101:1: sparse: sparse: restricted gfp_t degrades to integer
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast to restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: cast to restricted gfp_t
   include/trace/events/vmscan.h:185:1: sparse: sparse: restricted gfp_t degrades to integer
   include/trace/events/vmscan.h:185:1: sparse: sparse: restricted gfp_t degrades to integer
   include/trace/events/vmscan.h:267:1: sparse: sparse: cast to restricted isolate_mode_t
   include/trace/events/vmscan.h:267:1: sparse: sparse: cast to restricted isolate_mode_t
   include/trace/events/vmscan.h:267:1: sparse: sparse: restricted isolate_mode_t degrades to integer
   include/trace/events/vmscan.h:267:1: sparse: sparse: restricted isolate_mode_t degrades to integer
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast to restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: cast to restricted gfp_t
   include/trace/events/vmscan.h:463:1: sparse: sparse: restricted gfp_t degrades to integer
   include/trace/events/vmscan.h:463:1: sparse: sparse: restricted gfp_t degrades to integer
>> mm/vmscan.c:4118:1: sparse: sparse: symbol 'pagecache_reclaim_wq' was not declared. Should it be static?
>> mm/vmscan.c:4119:1: sparse: sparse: symbol 'kpagecache_limitd_wq' was not declared. Should it be static?
   mm/vmscan.c:4740:48: sparse: sparse: context imbalance in 'check_move_unevictable_pages' - unexpected unlock
--
>> drivers/nvme/host/pci.c:1035:56: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __le16 [usertype] status @@     got int @@
   drivers/nvme/host/pci.c:1035:56: sparse:     expected restricted __le16 [usertype] status
   drivers/nvme/host/pci.c:1035:56: sparse:     got int
--
>> drivers/thermal/intel/int340x_thermal/processor_thermal_device.c:548:50: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/thermal/intel/int340x_thermal/processor_thermal_device.c:552:36: sparse: sparse: cast removes address space '<asn:2>' of expression

vim +/pagecache_reclaim_wq +4118 mm/vmscan.c

  4112	
  4113	/*
  4114	 * Potential page cache reclaimers who are not able to take
  4115	 * reclaim lock on any zone are sleeping on this waitqueue.
  4116	 * So this is basically a congestion wait queue for them.
  4117	 */
> 4118	DECLARE_WAIT_QUEUE_HEAD(pagecache_reclaim_wq);
> 4119	DECLARE_WAIT_QUEUE_HEAD(kpagecache_limitd_wq);
  4120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
