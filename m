Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E1B347D0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 10:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757587929; cv=none; b=gQQFXeI1SYhUomITBA5Pgxy/08CDgZals2KwmLAyXp8W3I2KnZB4faYPUVibXUt53DhjqzVYV+JKp/3L92RsuV0MuQOjSL5BHPMYK8dwzIJMYjdP5YOau8vTOZjCLaW+5ZgkKJZz7fN/FXp2WoP9KSwLBpp0k7G8wLXOlxBN+ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757587929; c=relaxed/simple;
	bh=5rCpc0HpsiVnTuBMqzwS9qdGBiCQqtc+BJeQO+JHLVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cCil4b6QP4foCEVwZodfOO5+al4+oU3aMn69FHVIHt7b1WJlB/g9MDmyCuDWogCCGcCi2YeZUXsTEDK+G7OP9R4nKQyITOuIKqq5uSd9ZCQ6xN9tO0wh2yBKBDAlT7CBoT8NUxBFn0CPs9gib+XpQt2NDkWS/PWOEf/BDxLAW/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLlegCnl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLlegCnl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757587928; x=1789123928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5rCpc0HpsiVnTuBMqzwS9qdGBiCQqtc+BJeQO+JHLVs=;
  b=kLlegCnlu0ItZTGV7zwu077Hy3U0Qo9lDAdOidDChtzkDBb03INniLkJ
   pBG9XdZWr9u+3R6OPhGijYfEW4ZF31ZuEG/FOt6FOPWpehsq5OAoCpegF
   den7ZOLJmvv1BS+0bs3Y7Wes4leIqoLV9gvODV9BejKyG8bUkRmZm51jh
   hSdz7Ti9QQxJoMcN15Irc/0k+dDIUJ1CHXV+/trwy06/hYHoqdoY+TojM
   FkpbbWICqAp56IWePZPI13UATE7e4JiAUuk1o018uTfjc4sgyWMQoJ0Mq
   POSkP0Q9h7D3Z8Pa0QKPWybIt0vlz5OwoovLtLYyqfIJd/k3RREzs3iNx
   g==;
X-CSE-ConnectionGUID: kR2X3LEQQAmUjKiMh57sqA==
X-CSE-MsgGUID: 4G4ebqPUSAmTB7fr/K81uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="85358546"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="85358546"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 03:52:07 -0700
X-CSE-ConnectionGUID: Qz/ID3SgReGALyCHg1fKCg==
X-CSE-MsgGUID: 88O1g4tlQeqnVRe6EZ73/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="177998359"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 11 Sep 2025 03:52:05 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uweuE-0000GK-2V;
	Thu, 11 Sep 2025 10:51:59 +0000
Date: Thu, 11 Sep 2025 18:51:01 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>
Subject: [leon-rdma:rdma-next 62/91] kernel/dma/debug.c:1066:21: error:
 implicit declaration of function 'PhysHighMem'; did you mean 'PageHighMem'?
Message-ID: <202509111844.9JlQC0cG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   7b294e4143b3ba625b0409377961e8d51669029d
commit: 56d1a6769b68dfcbf8b26a75a7329aeb8e3c3b6a [62/91] dma-debug: refactor to use physical addresses for page mapping
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20250911/202509111844.9JlQC0cG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509111844.9JlQC0cG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509111844.9JlQC0cG-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/dma/debug.c: In function 'check_for_stack':
>> kernel/dma/debug.c:1066:21: error: implicit declaration of function 'PhysHighMem'; did you mean 'PageHighMem'? [-Wimplicit-function-declaration]
    1066 |                 if (PhysHighMem(phys))
         |                     ^~~~~~~~~~~
         |                     PageHighMem


vim +1066 kernel/dma/debug.c

  1058	
  1059	static void check_for_stack(struct device *dev, phys_addr_t phys)
  1060	{
  1061		void *addr;
  1062		struct vm_struct *stack_vm_area = task_stack_vm_area(current);
  1063	
  1064		if (!stack_vm_area) {
  1065			/* Stack is direct-mapped. */
> 1066			if (PhysHighMem(phys))
  1067				return;
  1068			addr = phys_to_virt(phys);
  1069			if (object_is_on_stack(addr))
  1070				err_printk(dev, NULL, "device driver maps memory from stack [addr=%p]\n", addr);
  1071		} else {
  1072			/* Stack is vmalloced. */
  1073			int i;
  1074	
  1075			for (i = 0; i < stack_vm_area->nr_pages; i++) {
  1076				if (__phys_to_pfn(phys) !=
  1077				    page_to_pfn(stack_vm_area->pages[i]))
  1078					continue;
  1079	
  1080				addr = (u8 *)current->stack + i * PAGE_SIZE +
  1081				       (phys % PAGE_SIZE);
  1082				err_printk(dev, NULL, "device driver maps memory from stack [probable addr=%p]\n", addr);
  1083				break;
  1084			}
  1085		}
  1086	}
  1087	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
