Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE222F6562
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 19:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787511870; cv=none; b=Uob6gVajfagfjFS826ppcr4eXHZ6GqiXIdK48/HiAZf/K033EJiEchpWvyrUkt2NrN5bCYdrB2P/ei82BoSvavfLrFYX91Y1dhdKS55Szh8KxSowLNgdZm8UKMqqds77ixnzhf/GTD+IyDgObiCj2LQBWJZkpW1m+lNjpg9m7zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787511870; c=relaxed/simple;
	bh=Ew4mM8FH5XGFqfU5vTtB0+zSsHJEfBHM6Z229mro0b0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KFLa/6uuQV05+XVy/zuUIj0cYhmIy9yaa92l7Ottg+/FTDwt8dN6AmyRSFyy2AXPq8CZ8vqHrYO2iQbF1jQzfa3hIrSwXWm0Iqs+Nj+yRqfIdF8ss3Z36OZGif/nol6NyjVn+H2vNN5NrtqLq8zquT/A072hsej+LDWQLpF8o2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECehJ/J2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECehJ/J2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787511869; x=1819047869;
  h=date:from:to:cc:subject:message-id;
  bh=Ew4mM8FH5XGFqfU5vTtB0+zSsHJEfBHM6Z229mro0b0=;
  b=ECehJ/J2ggrTcoLA6QEEOzNBzeOn1MXuTOVVwGjnHA3POkq+AbpsbTUj
   ld1gHL9ANb42HuUeQX7wZ2kXa9PKB3wj8RnvyXZOAGrWywtMhmWxt2KP8
   clior7UrIQLRsal5Ou8mt4YJBQ6s4vYUX/qgGpD4ds+MKwswIrplpNWiL
   HocNaZ2NH3ap1UEJcZUnvMcAeMU3KfheImN5UGNTbmj/TIZLVjPthvIpa
   DGo48QijyEhEot7pjsLzI26tof8xmuOHqyheJxwzUmez3Cb5gQRfUlney
   mG+cm/LD481kTW7BZoWHxQd1yzgmbUlwi/rMvTAM5af0K2WIwxYtiAQAY
   Q==;
X-CSE-ConnectionGUID: EcQLZTMET4OOiTSy4MfTTw==
X-CSE-MsgGUID: NyM0VYmSRCOG/96dcsrLUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="99499994"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="99499994"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 12:04:28 -0700
X-CSE-ConnectionGUID: I4YevscMRjCGreCOVSCyqA==
X-CSE-MsgGUID: 70UpVr5QT3eSol7h3gG5qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="260652267"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Aug 2026 12:04:09 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyDU7-000000000yp-2uIA;
	Sun, 23 Aug 2026 19:04:01 +0000
Date: Mon, 24 Aug 2026 03:03:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 13/13]
 drivers/virt/gunyah/rsc_mgr.c:303:47: sparse: sparse: restricted __le32
 degrades to integer
Message-ID: <202608240245.bdW3IJVu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   057f1cf6ccb302346c3799917ec8893efcd87011
commit: 4db95aa21ae4d2b0fc50c8e538e692bca8fd8c4c [13/13] ANDROID: virt: gunyah: Do not allocate irq for GH_RM_RESOURCE_NO_VIRQ
config: arm64-randconfig-r133-20260823 (https://download.01.org/0day-ci/archive/20260824/202608240245.bdW3IJVu-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240245.bdW3IJVu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240245.bdW3IJVu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virt/gunyah/rsc_mgr.c:303:47: sparse: sparse: restricted __le32 degrades to integer
   drivers/virt/gunyah/rsc_mgr.c:792:26: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/virt/gunyah/rsc_mgr.c:791:38: sparse: signed value source

vim +303 drivers/virt/gunyah/rsc_mgr.c

   289	
   290	struct gh_resource *gh_rm_alloc_resource(struct gh_rm *rm, struct gh_rm_hyp_resource *hyp_resource)
   291	{
   292		struct gh_resource *ghrsc;
   293		int ret;
   294	
   295		ghrsc = kzalloc(sizeof(*ghrsc), GFP_KERNEL);
   296		if (!ghrsc)
   297			return NULL;
   298	
   299		ghrsc->type = hyp_resource->type;
   300		ghrsc->capid = le64_to_cpu(hyp_resource->cap_id);
   301		ghrsc->irq = IRQ_NOTCONNECTED;
   302		ghrsc->rm_label = le32_to_cpu(hyp_resource->resource_label);
 > 303		if (hyp_resource->virq && hyp_resource->virq != GH_RM_RESOURCE_NO_VIRQ) {
   304			struct gh_irq_chip_data irq_data = {
   305				.gh_virq = le32_to_cpu(hyp_resource->virq),
   306			};
   307	
   308			ret = irq_domain_alloc_irqs(rm->irq_domain, 1, NUMA_NO_NODE, &irq_data);
   309			if (ret < 0) {
   310				dev_err(rm->dev,
   311					"Failed to allocate interrupt for resource %d label: %d: %d\n",
   312					ghrsc->type, ghrsc->rm_label, ret);
   313				kfree(ghrsc);
   314				return NULL;
   315			} else {
   316				ghrsc->irq = ret;
   317			}
   318		}
   319	
   320		return ghrsc;
   321	}
   322	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
