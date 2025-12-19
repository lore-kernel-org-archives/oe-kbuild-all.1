Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C8F22A4F6;
	Fri, 19 Dec 2025 10:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766140519; cv=none; b=XFFbG9bBevXvz3n3DsLPTWVWYl5mQvfk+V/dyXrj740fJ3YN/ogc0iJNpwgBwmEytOcuZwnEsVZ/o1ehPdGAlhquY0vyOZ6LXRLWvd7AJGdI1dAPNZJBjFusqzIlmH5vr4X8oBrln4RVDVPDUCbOWZY5lUJJ9LhArlhxtL2lISM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766140519; c=relaxed/simple;
	bh=QshOmqUDSVTLUgXBIaEzhN6jo6ndnz+fdxIlijkGBJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fP3XeBZxOaGdRP3do069ZWABipQ66BdEjUv2ZVOJTK0B4TGlgL4PTwEeXSkWyrL7qxgTwGXALv2673bf1JFsI4Fohsb8IMfrcDajG/NMRxUl6DWf9evAqPPvdF+JSC9VoCBh4YrPUDJAW1xBVdvCcyWoUat63YfiILQq0GljMN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZdbziCyB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdbziCyB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEF3C4CEF1;
	Fri, 19 Dec 2025 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766140519;
	bh=QshOmqUDSVTLUgXBIaEzhN6jo6ndnz+fdxIlijkGBJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZdbziCyBW1Y2LV0HRXrt5Brtr8hN+PRBWVG78xryrtb8fLhAwkVUdAjgX8PDbr4vL
	 e4SpOCNrL1i6XQkbkFU1K5kP48gi8GIQgeX9c2tGsqfggTiLlKjURiWEHdEN6L8Nf5
	 05/s7R/9ooA1C+ikf7UJtvZrAXR3DvgyUFKdzzFoST/wGEhKqgKy/lv5odpFfmJt9G
	 66oEl+z13nfa668RUmVs8HtRr16EheHnGjfUm/u6F1XgyF6DGHS4AnJZz397YUCyNb
	 AaP7n7YMfeEMYmF4MnEIhjPNkWKKHxNLJaiso98muhtm+6qP3Wj75tLsPmZbLznB7a
	 /oDzt+0XtYWOQ==
Date: Fri, 19 Dec 2025 11:35:14 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: Re: drivers/irqchip/irq-gic-v5-its.c:854:13: sparse: sparse:
 restricted __le64 degrades to integer
Message-ID: <aUUqYjLtLKWA4bHq@lpieralisi>
References: <202512131849.30ZRTBeR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512131849.30ZRTBeR-lkp@intel.com>

On Sat, Dec 13, 2025 at 06:56:34PM +0800, kernel test robot wrote:
> Hi Lorenzo,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
> commit: 53bb952a625fd3247647c7a28366ce990a579415 arm64: Kconfig: Enable GICv5
> date:   5 months ago
> config: arm64-randconfig-r113-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131849.30ZRTBeR-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 12.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131849.30ZRTBeR-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512131849.30ZRTBeR-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    drivers/irqchip/irq-gic-v5-its.c:854:13: sparse: sparse: cast to restricted __le64
> >> drivers/irqchip/irq-gic-v5-its.c:854:13: sparse: sparse: restricted __le64 degrades to integer
> >> drivers/irqchip/irq-gic-v5-its.c:854:13: sparse: sparse: restricted __le64 degrades to integer
> 
> vim +854 drivers/irqchip/irq-gic-v5-its.c
> 
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  845  
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  846  static int gicv5_its_map_event(struct gicv5_its_dev *its_dev, u16 event_id, u32 lpi)
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  847  {
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  848  	struct gicv5_its_chip_data *its = its_dev->its_node;
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  849  	u64 itt_entry;
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  850  	__le64 *itte;
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  851  
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  852  	itte = gicv5_its_device_get_itte_ref(its_dev, event_id);
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  853  
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03 @854  	if (FIELD_GET(GICV5_ITTL2E_VALID, *itte))
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  855  		return -EEXIST;

Yep, that missed an le64_to_cpu() on the *itte value, fixed, will post the fix
shortly.

Thanks,
Lorenzo

> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  856  
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  857  	itt_entry = FIELD_PREP(GICV5_ITTL2E_LPI_ID, lpi) |
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  858  		    FIELD_PREP(GICV5_ITTL2E_VALID, 0x1);
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  859  
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  860  	its_write_table_entry(its, itte, itt_entry);
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  861  
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  862  	gicv5_its_itt_cache_inv(its, its_dev->device_id, event_id);
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  863  
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  864  	return 0;
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  865  }
> 57d72196dfc850 Lorenzo Pieralisi 2025-07-03  866  
> 
> :::::: The code at line 854 was first introduced by commit
> :::::: 57d72196dfc8502b7e376ecdffb11c4f8766f26d irqchip/gic-v5: Add GICv5 ITS support
> 
> :::::: TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
> :::::: CC: Marc Zyngier <maz@kernel.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
