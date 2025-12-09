Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9AB2D9EEA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 18:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765303567; cv=none; b=VcZM9E4/Rred4XfVFNmWTPxMFWQ91aPeHMHxNe7YVqeGzaeAf6cFn4H4rmpmgeW1ctm57gKBkav3lIHSUeyEpjZEWIgJtHpBQzvYbC6E+cQyCG2kAFmxLb/EbMUTOKoL3wDTqtxHPmgUovn3vlJckm1v8yZnESDcuAQM0kc3ZOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765303567; c=relaxed/simple;
	bh=BIhbpujaBd/Ey0BGuUIoScMltJUr17Od4WaWo0SEAsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPF0zbV/0sq9+YjulYnuQ5rmMeVrtfaOsd6bOzVEkS44BRiWj1h4sSP/KhnAA/1HG3Y0tcLw4LOzUVy2afpKEmWK9xUaFboVKJpY3UqLR6KTaxD+myyKmNh3Yrl32HQpy1QA7IlhHsK75tHkPC0oHjX3C3kIdKj5d0fCd/y0Z74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EokTYuUB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EokTYuUB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765303566; x=1796839566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BIhbpujaBd/Ey0BGuUIoScMltJUr17Od4WaWo0SEAsg=;
  b=EokTYuUBozi/ko2CfxSIjdJtauMaiRwchIjADjagItzz+G9Cg1f+aI4d
   HBIFSIMb1FaSb6MFcUn7G3haLZxLqEY42wAEDHV5eG00EW85+jm4SdhYO
   ryibEiJRMskqI2WVnotaolYCDp2PFvOOqcUf9mLJntkZo754c+CiewmAm
   l8Qwz64gShc6Vp1TMzDh0HsAoTI4jpUC1Xl2M5ig8MPFXUnudubzMs389
   K3/g0tAHUnUiKK3NaKuErimYfnp7Imx5frAFKFELi/+TOkcA+q5WCwqrc
   9hdHCW0fyAY840s60UhQ6Qrm/zdsyXxiBzTkau27trTMEEr7FpGbf0ske
   Q==;
X-CSE-ConnectionGUID: ouEn2+5ZQE6ZIgb/Yq+srg==
X-CSE-MsgGUID: 322bd453S22Of2lcbTBd8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77884482"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="77884482"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 10:06:01 -0800
X-CSE-ConnectionGUID: LRL7bE/YQkS1C+nZL/74rg==
X-CSE-MsgGUID: jsYyQLA4Q8ahdsYXczW1TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="226955192"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Dec 2025 10:06:00 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT261-0000000028D-1diS;
	Tue, 09 Dec 2025 18:05:57 +0000
Date: Wed, 10 Dec 2025 02:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: "ping.gao" <ping.gao@samsung.com>, jh80.chung@samsung.com,
	ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, "ping.gao" <ping.gao@samsung.com>
Subject: Re: [PATCH] mmc: dw_mmc: Use pre_request & post_request_end helper
Message-ID: <202512100130.DkmKHepR-lkp@intel.com>
References: <20251209064910.3643039-1-ping.gao@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209064910.3643039-1-ping.gao@samsung.com>

Hi ping.gao,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on ulf-hansson-mmc-mirror/next v6.18 next-20251209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ping-gao/mmc-dw_mmc-Use-pre_request-post_request_end-helper/20251209-144626
base:   linus/master
patch link:    https://lore.kernel.org/r/20251209064910.3643039-1-ping.gao%40samsung.com
patch subject: [PATCH] mmc: dw_mmc: Use pre_request & post_request_end helper
config: csky-randconfig-002-20251209 (https://download.01.org/0day-ci/archive/20251210/202512100130.DkmKHepR-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512100130.DkmKHepR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100130.DkmKHepR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mmc/host/dw_mmc.c: In function 'dw_mci_request_end':
>> drivers/mmc/host/dw_mmc.c:1902:56: error: 'struct dw_mci' has no member named 'drv_dat'; did you mean 'drv_data'?
    1902 |         const struct dw_mci_drv_data *drv_data = host->drv_dat
         |                                                        ^~~~~~~
         |                                                        drv_data
   In file included from arch/csky/include/asm/bug.h:18,
                    from include/linux/bug.h:5,
                    from include/linux/random.h:6,
                    from include/linux/nodemask.h:94,
                    from include/linux/list_lru.h:12,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from drivers/mmc/host/dw_mmc.c:10:
>> include/asm-generic/bug.h:154:29: error: expected expression before '{' token
     154 | #define WARN_ON(condition) ({                                           \
         |                             ^
   drivers/mmc/host/dw_mmc.c:1904:9: note: in expansion of macro 'WARN_ON'
    1904 |         WARN_ON(host->cmd || host->data);
         |         ^~~~~~~


vim +1902 drivers/mmc/host/dw_mmc.c

  1895	
  1896	static void dw_mci_request_end(struct dw_mci *host, struct mmc_request *mrq)
  1897		__releases(&host->lock)
  1898		__acquires(&host->lock)
  1899	{
  1900		struct dw_mci_slot *slot;
  1901		struct mmc_host	*prev_mmc = host->slot->mmc;
> 1902		const struct dw_mci_drv_data *drv_data = host->drv_dat
  1903	
  1904		WARN_ON(host->cmd || host->data);
  1905	
  1906		host->slot->mrq = NULL;
  1907		host->mrq = NULL;
  1908		if (!list_empty(&host->queue)) {
  1909			slot = list_entry(host->queue.next,
  1910					  struct dw_mci_slot, queue_node);
  1911			list_del(&slot->queue_node);
  1912			dev_vdbg(host->dev, "list not empty: %s is next\n",
  1913				 mmc_hostname(slot->mmc));
  1914			host->state = STATE_SENDING_CMD;
  1915			dw_mci_start_request(host, slot);
  1916		} else {
  1917			dev_vdbg(host->dev, "list empty\n");
  1918	
  1919			if (host->state == STATE_SENDING_CMD11)
  1920				host->state = STATE_WAITING_CMD11_DONE;
  1921			else
  1922				host->state = STATE_IDLE;
  1923		}
  1924	
  1925		spin_unlock(&host->lock);
  1926		mmc_request_done(prev_mmc, mrq);
  1927		if (drv_data && drv_data->post_request_end)
  1928			drv_data->post_request_end(host);
  1929		spin_lock(&host->lock);
  1930	}
  1931	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
