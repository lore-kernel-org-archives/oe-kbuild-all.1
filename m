Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEA6163
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 00:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709856992; cv=none; b=AvPHV86Nle+LzOL63ah+WgYzD95VX+UnbySihofG0xgkpublYcadYo7rOrgiSiWdZOmrCvVPi/fhx31wobJUAbxiHDsUf/1M8EYFaYgOEg4s3t3L7iChyfE8W7P7v1Ha/lyou85iLXCAatgl0FZ3K98szW0cI2gOSI3vhsza7Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709856992; c=relaxed/simple;
	bh=awllsoPRtd1BxeHspZgJ4jARhdS2nt9me+D3G0Tc308=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LMoEZJUTCcBuyG3LIyWnHZ8wyeTcGRBQYub22WBd3sbjKHcuorTbNVvYMZ7H9fBNr0WdKOU3WGGToGHQfvQdb6zleQom+mzbgU5FDYFITBXkfsVTMSJwVrQIQSbxXxlmVzs+YAFA06T8sVxD0y6fMVrteOGdpyYRUoKvVG/cJok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vw61BaeT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vw61BaeT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709856990; x=1741392990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=awllsoPRtd1BxeHspZgJ4jARhdS2nt9me+D3G0Tc308=;
  b=Vw61BaeTrUQDhIm6zncyEud5gANZ/KF9FxtrGkSa3/S1RnvYhXi5hWjd
   cBLdAbDKIjZcmyYYkuVMCMPVYL0xwFljt28Ep6KOOhhvvXIKAz5S7wfJS
   z5+L6HBcIQrhxazBoc+Nz4+EGKtF/2er4UiKV8l8Z3PrppuBhbgr0UerI
   TEGgKRgWdPLDEWrtHsU1RBoW1MGcHAaHv+hLS13Brk/9lMxSapQnbW40B
   Ru2jat2wuGXlCod/80Nd9tmN6F+c4dsrmN2fzWlvMKldKo0Wp83uERabT
   Nlr8mLEhy9z+HX9yZTYv7VzBmYXW/8PNQs+A86v5ZVvgJiJo2ArJeygD/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4729966"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4729966"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 16:16:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="10172351"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Mar 2024 16:16:26 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riNuR-0005pd-2k;
	Fri, 08 Mar 2024 00:16:23 +0000
Date: Fri, 8 Mar 2024 08:15:28 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: arch/x86/platform/uv/uv_irq.c:39:27: error: no member named
 'irq_dest_mode' in 'struct apic'
Message-ID: <202403080803.jaM34gF8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: c83102f73a8f2320494df0865453bba81468f97b x86/apic: Cleanup destination mode
date:   9 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240308/202403080803.jaM34gF8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080803.jaM34gF8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080803.jaM34gF8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/platform/uv/uv_irq.c:19:
   arch/x86/include/asm/uv/uv_hub.h:892:24: error: use of undeclared identifier 'dest_Fixed'
     892 |         unsigned long dmode = dest_Fixed;
         |                               ^
   arch/x86/include/asm/uv/uv_hub.h:895:11: error: use of undeclared identifier 'dest_NMI'
     895 |                 dmode = dest_NMI;
         |                         ^
   arch/x86/platform/uv/uv_irq.c:38:31: error: no member named 'irq_delivery_mode' in 'struct apic'; did you mean 'delivery_mode'?
      38 |         entry->delivery_mode    = apic->irq_delivery_mode;
         |                                         ^~~~~~~~~~~~~~~~~
         |                                         delivery_mode
   arch/x86/include/asm/apic.h:301:27: note: 'delivery_mode' declared here
     301 |         enum apic_delivery_modes delivery_mode;
         |                                  ^
>> arch/x86/platform/uv/uv_irq.c:39:27: error: no member named 'irq_dest_mode' in 'struct apic'
      39 |         entry->dest_mode        = apic->irq_dest_mode;
         |                                   ~~~~  ^
   4 errors generated.


vim +39 arch/x86/platform/uv/uv_irq.c

^590eaf1fec755 Kaixu Xia 2021-03-16  26  
^590eaf1fec755 Kaixu Xia 2021-03-16  27  static void uv_program_mmr(struct irq_cfg *cfg, struct uv_irq_2_mmr_pnode *info)
^590eaf1fec755 Kaixu Xia 2021-03-16  28  {
^590eaf1fec755 Kaixu Xia 2021-03-16  29  	unsigned long mmr_value;
^590eaf1fec755 Kaixu Xia 2021-03-16  30  	struct uv_IO_APIC_route_entry *entry;
^590eaf1fec755 Kaixu Xia 2021-03-16  31  
^590eaf1fec755 Kaixu Xia 2021-03-16  32  	BUILD_BUG_ON(sizeof(struct uv_IO_APIC_route_entry) !=
^590eaf1fec755 Kaixu Xia 2021-03-16  33  		     sizeof(unsigned long));
^590eaf1fec755 Kaixu Xia 2021-03-16  34  
^590eaf1fec755 Kaixu Xia 2021-03-16  35  	mmr_value = 0;
^590eaf1fec755 Kaixu Xia 2021-03-16  36  	entry = (struct uv_IO_APIC_route_entry *)&mmr_value;
^590eaf1fec755 Kaixu Xia 2021-03-16  37  	entry->vector		= cfg->vector;
^590eaf1fec755 Kaixu Xia 2021-03-16  38  	entry->delivery_mode	= apic->irq_delivery_mode;
^590eaf1fec755 Kaixu Xia 2021-03-16 @39  	entry->dest_mode	= apic->irq_dest_mode;
^590eaf1fec755 Kaixu Xia 2021-03-16  40  	entry->polarity		= 0;
^590eaf1fec755 Kaixu Xia 2021-03-16  41  	entry->trigger		= 0;
^590eaf1fec755 Kaixu Xia 2021-03-16  42  	entry->mask		= 0;
^590eaf1fec755 Kaixu Xia 2021-03-16  43  	entry->dest		= cfg->dest_apicid;
^590eaf1fec755 Kaixu Xia 2021-03-16  44  
^590eaf1fec755 Kaixu Xia 2021-03-16  45  	uv_write_global_mmr64(info->pnode, info->offset, mmr_value);
^590eaf1fec755 Kaixu Xia 2021-03-16  46  }
^590eaf1fec755 Kaixu Xia 2021-03-16  47  

:::::: The code at line 39 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
