Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C64E2CA6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 02:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736650030; cv=none; b=S3TNI6BOyJMfuT2nqSc5WhHGld40Cgeo9LklcTjwKo48fdH3p/9lX8eSWNCA0FwLly7iJoHQmilYBP7KVjB57t9jIHsXXG1Tr48jwvkMCgBxJOw3JFfuSMcX0eeoHVtHwCUYxxqaLWjy83lYKuOTuwYaCaVexWrmRqB2vV/hgww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736650030; c=relaxed/simple;
	bh=tC+FZQnUpBYJYYDYdrWFxCyg6s7hQcOBBrd4T0XZCRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBTxESMWwOTw6sBNtnU0mP0QR12ANFsIC8pc7UeuYxcqe3FA6UMHgWtjMmsZzSI428Yjd2O9tavqKtMhLixf/z/yqz8Ee6j/fjkETKPVuZB8ft56yXNTzMvdXO7BZu5cjk5cAsJwbie1vLPylf9eoxy/XiZsBjsp0LYV+61k4Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3dRCieu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3dRCieu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736650027; x=1768186027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tC+FZQnUpBYJYYDYdrWFxCyg6s7hQcOBBrd4T0XZCRc=;
  b=U3dRCieugybWMcHlfFivT9us7VUd9CnznLnkjRWknd63jIzlwp2GiB/3
   ySvwC1OTOMJltjdC5aqjrTRNUi54Ppaw4NRXu7m3Wqo0jMobOT73J1QiE
   XYrIqgG3xEkzCxoyCMtMAjQfYWwfRh6CajgUDt02M6BCmn2SoD9mKiX1j
   tQrvcmM5oEu+IF2fjX4OpAfBJvwGSFAZiY76Koqv/x79VaAuk72D+lqFK
   KNYuueu66rQp0CxYPhTnJni6EBzj6RDQ9LscPjsswypXZXW42PZYnNthv
   fGguytt4IqnC0MlNAnBVnvO0zrdWaDV2WeKqOS4CoalMOiwSEM+IHB1+z
   g==;
X-CSE-ConnectionGUID: IRhIsKFBRQ6l4/0F2kmqCg==
X-CSE-MsgGUID: Ocw+/hSvShiTpYsFWE5G0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="54452410"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="54452410"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 18:47:06 -0800
X-CSE-ConnectionGUID: ITd+GfG0RTCW3Okq20Vb0Q==
X-CSE-MsgGUID: FXwhBYQrT9uw/V5PqLh1ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104602637"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jan 2025 18:47:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWo0F-000LUR-09;
	Sun, 12 Jan 2025 02:47:03 +0000
Date: Sun, 12 Jan 2025 10:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFCv2 04/13] irqchip: Have CONFIG_IRQ_MSI_IOMMU be
 selected by the irqchips that need it
Message-ID: <202501121047.kclzTxfe-lkp@intel.com>
References: <a371fbe1c68e891a38f9cc8eadf2e93d4921e246.1736550979.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a371fbe1c68e891a38f9cc8eadf2e93d4921e246.1736550979.git.nicolinc@nvidia.com>

Hi Nicolin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on awilliam-vfio/next]
[also build test ERROR on awilliam-vfio/for-linus linus/master v6.13-rc6 next-20250110]
[cannot apply to tip/irq/core shuah-kselftest/next shuah-kselftest/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolin-Chen/genirq-msi-Store-the-IOMMU-IOVA-directly-in-msi_desc-instead-of-iommu_cookie/20250111-113429
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/a371fbe1c68e891a38f9cc8eadf2e93d4921e246.1736550979.git.nicolinc%40nvidia.com
patch subject: [PATCH RFCv2 04/13] irqchip: Have CONFIG_IRQ_MSI_IOMMU be selected by the irqchips that need it
config: i386-buildonly-randconfig-001-20250112 (https://download.01.org/0day-ci/archive/20250112/202501121047.kclzTxfe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501121047.kclzTxfe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121047.kclzTxfe-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/dma-iommu.c: In function 'iommu_put_dma_cookie':
>> drivers/iommu/dma-iommu.c:452:19: error: 'struct iommu_domain' has no member named 'sw_msi'
     452 |         if (domain->sw_msi != iommu_dma_sw_msi)
         |                   ^~


vim +452 drivers/iommu/dma-iommu.c

0db2e5d18f76a6 Robin Murphy    2015-10-01  441  
0db2e5d18f76a6 Robin Murphy    2015-10-01  442  /**
0db2e5d18f76a6 Robin Murphy    2015-10-01  443   * iommu_put_dma_cookie - Release a domain's DMA mapping resources
fdbe574eb69312 Robin Murphy    2017-01-19  444   * @domain: IOMMU domain previously prepared by iommu_get_dma_cookie() or
fdbe574eb69312 Robin Murphy    2017-01-19  445   *          iommu_get_msi_cookie()
0db2e5d18f76a6 Robin Murphy    2015-10-01  446   */
0db2e5d18f76a6 Robin Murphy    2015-10-01  447  void iommu_put_dma_cookie(struct iommu_domain *domain)
0db2e5d18f76a6 Robin Murphy    2015-10-01  448  {
44bb7e243bd4b4 Robin Murphy    2016-09-12  449  	struct iommu_dma_cookie *cookie = domain->iova_cookie;
44bb7e243bd4b4 Robin Murphy    2016-09-12  450  	struct iommu_dma_msi_page *msi, *tmp;
0db2e5d18f76a6 Robin Murphy    2015-10-01  451  
a46299c793362d Jason Gunthorpe 2025-01-10 @452  	if (domain->sw_msi != iommu_dma_sw_msi)
a46299c793362d Jason Gunthorpe 2025-01-10  453  		return;
a46299c793362d Jason Gunthorpe 2025-01-10  454  
44bb7e243bd4b4 Robin Murphy    2016-09-12  455  	if (!cookie)
0db2e5d18f76a6 Robin Murphy    2015-10-01  456  		return;
0db2e5d18f76a6 Robin Murphy    2015-10-01  457  
f7f07484542fae Robin Murphy    2021-12-17  458  	if (cookie->type == IOMMU_DMA_IOVA_COOKIE && cookie->iovad.granule) {
a17e3026bc4da9 Robin Murphy    2021-12-17  459  		iommu_dma_free_fq(cookie);
44bb7e243bd4b4 Robin Murphy    2016-09-12  460  		put_iova_domain(&cookie->iovad);
f7f07484542fae Robin Murphy    2021-12-17  461  	}
44bb7e243bd4b4 Robin Murphy    2016-09-12  462  
44bb7e243bd4b4 Robin Murphy    2016-09-12  463  	list_for_each_entry_safe(msi, tmp, &cookie->msi_page_list, list) {
44bb7e243bd4b4 Robin Murphy    2016-09-12  464  		list_del(&msi->list);
44bb7e243bd4b4 Robin Murphy    2016-09-12  465  		kfree(msi);
44bb7e243bd4b4 Robin Murphy    2016-09-12  466  	}
44bb7e243bd4b4 Robin Murphy    2016-09-12  467  	kfree(cookie);
0db2e5d18f76a6 Robin Murphy    2015-10-01  468  	domain->iova_cookie = NULL;
0db2e5d18f76a6 Robin Murphy    2015-10-01  469  }
0db2e5d18f76a6 Robin Murphy    2015-10-01  470  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
