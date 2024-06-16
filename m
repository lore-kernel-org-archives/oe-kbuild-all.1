Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D00C2ED
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 16:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718556692; cv=none; b=BLlZkS0sqyTsMNS0J2I/m7jW91MhQPdhy8iHJlvSn+wEkfVPhRnGp/W0BJa/yVm/PtWNYB8ZFANhurFA16wK48ZBGBE8M7GvIxDAsNUEz0HzYPYXgR9hOrRFWOhnFs8PnKtc4zghB6iklgo4Z+11NX3tKNYlWI4mh1yYKJnrSwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718556692; c=relaxed/simple;
	bh=70pCr2wVYDKJvpAtOgDq80t2m0R6zoJ9NxlSsz4Yvqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uFyH7lrLCwczvwrK41ZWQpy/rQwnkFx+r4623G6qb2XgmY3Yd43NZDrUimi2YliePe8JOne7XNQHjMPp6AY9IUXqkOlrS2dh+Lqjov9TSZqWY2jPMn7WacPU3Mie3/OD3lGtIvKmaJVLt6c0a4JwSgrHK5BvS/w0LmHSsLbIStE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ha4DxkfI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ha4DxkfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718556689; x=1750092689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=70pCr2wVYDKJvpAtOgDq80t2m0R6zoJ9NxlSsz4Yvqk=;
  b=ha4DxkfIoFvEsR0qvwniLVXQ4cRpYnAAu9lXOLHJk0ggH0LJqZjavf0Z
   1nHZ35nlyZ1rOiDqmVnYjftrdTSrTA5pkGFHhI7U/WpvG+k/GDa+SsE+h
   fyNz2J5Z1V5tUrLlc5jT8ixOF14hznEYICEuOZbS3BV6qe9SCZBF9xQbs
   hNW8UBXE0TAU9SLyJveehzCKiWOAVTB4G0mw3Jpk3oPPr7/KVCyYVefZy
   AH0QeNebt16uRNAKwfDYAA4FRGjEr2rlRBGDHfktTkvp9yyKeCcbZ3nDj
   pbRtc5u056aSk/oHVZWWDY0qE8Oup2VS/N/PSJxYwOLcnY71WUqrnmRH2
   A==;
X-CSE-ConnectionGUID: 4UEnH+RmTLOMTTBMXvV5DQ==
X-CSE-MsgGUID: E0LzgOykRICjvfCymWMILg==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="32931817"
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="32931817"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 09:51:28 -0700
X-CSE-ConnectionGUID: Dv/OUPHRRayT8HXAM/3aKA==
X-CSE-MsgGUID: xoqB+VADQ3CU71wwZfB8Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="40868022"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Jun 2024 09:51:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIt6D-00034u-2g;
	Sun, 16 Jun 2024 16:51:25 +0000
Date: Mon, 17 Jun 2024 00:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:clocks 22/22] drivers/ptp/ptp_vmclock.c:324:17: warning:
 'strncpy' specified bound 32 equals destination size
Message-ID: <202406170041.Oha1EulC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux clocks
head:   9e1c3b823d497efa4e0acb21b226a72e4d6e8a53
commit: 271bd03d9ae077ef80973de134409b507e76193e [22/22] ptp: Add vDSO-style vmclock support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240617/202406170041.Oha1EulC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170041.Oha1EulC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170041.Oha1EulC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ptp/ptp_vmclock.c: In function 'vmclock_probe':
>> drivers/ptp/ptp_vmclock.c:324:17: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
     324 |                 strncpy(st->ptp_clock_info.name, st->name, sizeof(st->ptp_clock_info.name));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +324 drivers/ptp/ptp_vmclock.c

   252	
   253	static int vmclock_probe(struct platform_device *pdev)
   254	{
   255		struct device *dev = &pdev->dev;
   256		struct vmclock_state *st;
   257		int ret;
   258	
   259		st = devm_kzalloc(dev, sizeof (*st), GFP_KERNEL);
   260		if (!st)
   261			return -ENOMEM;
   262	
   263		if (has_acpi_companion(dev))
   264			ret = vmclock_probe_acpi(dev, st);
   265		else
   266			ret = -EINVAL; /* Only ACPI for now */
   267	
   268		if (ret)
   269			goto out;
   270	
   271		st->clk = devm_memremap(dev, st->phys_addr, sizeof(*st->clk),
   272					MEMREMAP_WB);
   273		if (IS_ERR(st->clk)) {
   274			ret = PTR_ERR(st->clk);
   275			st->clk = NULL;
   276			goto out;
   277		}
   278	
   279		if (st->clk->magic != VMCLOCK_MAGIC ||
   280		    st->clk->size < sizeof(*st->clk) ||
   281		    st->clk->version != 1) {
   282			ret = -EINVAL;
   283			goto out;
   284		}
   285	
   286		if (IS_ENABLED(CONFIG_ARM64) &&
   287		    st->clk->counter_id == VMCLOCK_COUNTER_ARM_VCNT) {
   288			/* Can we check it's the virtual counter? */
   289			st->cs_id = CSID_ARM_ARCH_COUNTER;
   290		} else if (IS_ENABLED(CONFIG_X86) &&
   291			   st->clk->counter_id == VMCLOCK_COUNTER_X86_TSC) {
   292			st->cs_id = CSID_X86_TSC;
   293		}
   294	
   295		ret = ida_alloc(&vmclock_ida, GFP_KERNEL);
   296		if (ret < 0)
   297			goto out;
   298	
   299		st->index = ret;
   300	        ret = devm_add_action_or_reset(&pdev->dev, vmclock_put_idx, st);
   301		if (ret)
   302			goto out;
   303	
   304		st->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "vmclock%d", st->index);
   305		if (!st->name) {
   306			ret = -ENOMEM;
   307			goto out;
   308		}
   309	
   310		/* If the structure is big enough, it can be mapped to userspace */
   311		if (st->clk->size >= PAGE_SIZE) {
   312			st->miscdev.minor = MISC_DYNAMIC_MINOR;
   313			st->miscdev.fops = &vmclock_miscdev_fops;
   314			st->miscdev.name = st->name;
   315	
   316			ret = misc_register(&st->miscdev);
   317			if (ret)
   318				goto out;
   319		}
   320	
   321		/* If there is valid clock information, register a PTP clock */
   322		if (st->cs_id) {
   323			st->ptp_clock_info = ptp_vmclock_info;
 > 324			strncpy(st->ptp_clock_info.name, st->name, sizeof(st->ptp_clock_info.name));
   325			st->ptp_clock = ptp_clock_register(&st->ptp_clock_info, dev);
   326	
   327			if (IS_ERR(st->ptp_clock)) {
   328				ret = PTR_ERR(st->ptp_clock);
   329				st->ptp_clock = NULL;
   330				vmclock_remove(pdev);
   331				goto out;
   332			}
   333		}
   334	
   335		dev_set_drvdata(dev, st);
   336	
   337	 out:
   338		return ret;
   339	}
   340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
