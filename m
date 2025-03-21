Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6681E9B34
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742591918; cv=none; b=WUDG0ECP8ICEtNaRdTzLqw/2pLIKsfybxAM0wEbMhvWObUmUST14qTrdlvRm2ULLLihnnrGqrtWdRUtlUSUu5qz7Nkvt7Nqw32NVnu0FiDdjInlLANYjXfN2js83xzAMxmFAP84y0VNCqdQOVGXXrPEFk0gDJxcuGWGNd8ZHCLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742591918; c=relaxed/simple;
	bh=brMi4hgINymg5wZjY6SMuMGGsxJ/jIT+iRFsY3xk0Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTg4N1YcZXzpsu13h2aVAb4ta6aKkdSQuJJ84DVB1yHjbR2AedTasvPIRVtFYzOrf2QtUCzbiHFqdNSe9WEx40L+QaTXOCrt6pVJchnhFOZcUu+BeAWDyyilN0nrnQLi6GKh54eVvXTLpAMEUJYHsRdj9lVuPYYPtm8ltt+zPsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E6T7js/i; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6T7js/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742591916; x=1774127916;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=brMi4hgINymg5wZjY6SMuMGGsxJ/jIT+iRFsY3xk0Dc=;
  b=E6T7js/inW64ym1MPjq3ETpXREGv1IetEEy9E/BjCVoThC7t14XXlmMd
   NS2U17qY0Mg0cWH+qgNwlIK7IyTnwxw3baP91VOE/S5iUB1qStVn3gZdD
   iE/BBiO0tXo92kTVQpgJ9l6FOk/BCE8BvSg2YNHpqXChI6v2Nv5npZZ9q
   DQTPZF8VNjv6FZ0FfkSVG6h60KFs8kf+tXTLlgluBXTm3AOa1TCLDddAh
   l/jQWIaBkmZgXnoVhrpFfqUdqvQg3Ji7f2HsdHdRoteKwy5c+wcI0IAi2
   klhKVtlLkPXQVENstj72yhzKj3A/DGXyZMtmxtluEb3g0Emf0Tqf+9bLq
   g==;
X-CSE-ConnectionGUID: 02fJi9eYTbS88Xc5PNfEaw==
X-CSE-MsgGUID: g7Fy+/WqQcqPTjRe77/B4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="54086248"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="54086248"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 14:18:36 -0700
X-CSE-ConnectionGUID: pHekjAkQQg22h837qV7cZQ==
X-CSE-MsgGUID: P+oUFKLwS5i7bw0R4ve1yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="124284545"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Mar 2025 14:18:34 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvjlA-0001hP-1j;
	Fri, 21 Mar 2025 21:18:32 +0000
Date: Sat, 22 Mar 2025 05:17:55 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] ufs: delegate the interrupt service routine to a
 threaded irq handler
Message-ID: <202503220500.wdAtsfb8-lkp@intel.com>
References: <20250321-topic-ufs-use-threaded-irq-v1-1-7a55816a4b1d@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321-topic-ufs-use-threaded-irq-v1-1-7a55816a4b1d@linaro.org>

Hi Neil,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ff7f9b199e3f4cc7d61df5a9a26a7cbb5c1492e6]

url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/ufs-delegate-the-interrupt-service-routine-to-a-threaded-irq-handler/20250322-001050
base:   ff7f9b199e3f4cc7d61df5a9a26a7cbb5c1492e6
patch link:    https://lore.kernel.org/r/20250321-topic-ufs-use-threaded-irq-v1-1-7a55816a4b1d%40linaro.org
patch subject: [PATCH RFC] ufs: delegate the interrupt service routine to a threaded irq handler
config: arc-randconfig-002-20250322 (https://download.01.org/0day-ci/archive/20250322/202503220500.wdAtsfb8-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220500.wdAtsfb8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220500.wdAtsfb8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ufs/core/ufshcd.c: In function 'ufshcd_intr':
>> drivers/ufs/core/ufshcd.c:7039:6: warning: unused variable 'retries' [-Wunused-variable]
     int retries = hba->nutrs;
         ^~~~~~~
>> drivers/ufs/core/ufshcd.c:7037:14: warning: unused variable 'retval' [-Wunused-variable]
     irqreturn_t retval = IRQ_NONE;
                 ^~~~~~
>> drivers/ufs/core/ufshcd.c:7036:19: warning: unused variable 'enabled_intr_status' [-Wunused-variable]
     u32 intr_status, enabled_intr_status = 0;
                      ^~~~~~~~~~~~~~~~~~~
--
>> drivers/ufs/core/ufshcd.c:6986: warning: expecting prototype for ufshcd_intr(). Prototype was for ufshcd_threaded_intr() instead


vim +/retries +7039 drivers/ufs/core/ufshcd.c

  6975	
  6976	/**
  6977	 * ufshcd_intr - Threaded interrupt service routine
  6978	 * @irq: irq number
  6979	 * @__hba: pointer to adapter instance
  6980	 *
  6981	 * Return:
  6982	 *  IRQ_HANDLED - If interrupt is valid
  6983	 *  IRQ_NONE    - If invalid interrupt
  6984	 */
  6985	static irqreturn_t ufshcd_threaded_intr(int irq, void *__hba)
> 6986	{
  6987		u32 intr_status, enabled_intr_status = 0;
  6988		irqreturn_t retval = IRQ_NONE;
  6989		struct ufs_hba *hba = __hba;
  6990		int retries = hba->nutrs;
  6991	
  6992		intr_status = ufshcd_readl(hba, REG_INTERRUPT_STATUS);
  6993	
  6994		/*
  6995		 * There could be max of hba->nutrs reqs in flight and in worst case
  6996		 * if the reqs get finished 1 by 1 after the interrupt status is
  6997		 * read, make sure we handle them by checking the interrupt status
  6998		 * again in a loop until we process all of the reqs before returning.
  6999		 */
  7000		while (intr_status && retries--) {
  7001			enabled_intr_status = intr_status & hba->intr_en;
  7002			ufshcd_writel(hba, intr_status, REG_INTERRUPT_STATUS);
  7003			if (enabled_intr_status)
  7004				retval |= ufshcd_sl_intr(hba, enabled_intr_status);
  7005	
  7006			intr_status = ufshcd_readl(hba, REG_INTERRUPT_STATUS);
  7007		}
  7008	
  7009		if (enabled_intr_status && retval == IRQ_NONE &&
  7010		    (!(enabled_intr_status & UTP_TRANSFER_REQ_COMPL) ||
  7011		     hba->outstanding_reqs) && !ufshcd_eh_in_progress(hba)) {
  7012			dev_err(hba->dev, "%s: Unhandled interrupt 0x%08x (0x%08x, 0x%08x)\n",
  7013						__func__,
  7014						intr_status,
  7015						hba->ufs_stats.last_intr_status,
  7016						enabled_intr_status);
  7017			ufshcd_dump_regs(hba, 0, UFSHCI_REG_SPACE_SIZE, "host_regs: ");
  7018		}
  7019	
  7020		ufshcd_writel(hba, hba->intr_en, REG_INTERRUPT_ENABLE);
  7021	
  7022		return retval;
  7023	}
  7024	
  7025	/**
  7026	 * ufshcd_intr - Main interrupt service routine
  7027	 * @irq: irq number
  7028	 * @__hba: pointer to adapter instance
  7029	 *
  7030	 * Return:
  7031	 *  IRQ_WAKE_THREAD - If interrupt is valid
  7032	 *  IRQ_NONE	    - If invalid interrupt
  7033	 */
  7034	static irqreturn_t ufshcd_intr(int irq, void *__hba)
  7035	{
> 7036		u32 intr_status, enabled_intr_status = 0;
> 7037		irqreturn_t retval = IRQ_NONE;
  7038		struct ufs_hba *hba = __hba;
> 7039		int retries = hba->nutrs;
  7040	
  7041		intr_status = ufshcd_readl(hba, REG_INTERRUPT_STATUS);
  7042		hba->ufs_stats.last_intr_status = intr_status;
  7043		hba->ufs_stats.last_intr_ts = local_clock();
  7044	
  7045		if (unlikely(!intr_status))
  7046			return IRQ_NONE;
  7047	
  7048		hba->intr_en = ufshcd_readl(hba, REG_INTERRUPT_ENABLE);
  7049		ufshcd_writel(hba, 0, REG_INTERRUPT_ENABLE);
  7050	
  7051		return IRQ_WAKE_THREAD;
  7052	}
  7053	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
