Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A971D8E08
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728312899; cv=none; b=TEC9ba4NCM1m6wTfhYTLK9W2mPUO5O87XmT/zjp9LqKFOGTOQr/0GaaqWRSLpGUe9cIAVXFp07E8xNEPcEMPH3T1BurHU52lG7/NK/2txOgcJG9E8iTGM5BxnoDgbtzNLXnEy3nUA1LnhLd2wyKFQYuc6tvR95GvCpqZ7k4MQlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728312899; c=relaxed/simple;
	bh=qcosYlpp4cE9rWP9ZkowIZuv3lzoFODDTSP6fK/NRx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XCpR2VNp5WbBWF1YdvE83VVeWRtwTNVi3m2yk8AeHS7EgUV5z8FzD+BP7K/X2jBDy62uv849NiAf1w78XkkzK3mafk/W0Sg5BCGE96ezlDOjwUwjJvP3XVV9GPj+xvMzdwCQ7ZyVJitQoIQ1YB2e8jgigUTALFVbQeb9tZLUDsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKO4wyjN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKO4wyjN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728312898; x=1759848898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qcosYlpp4cE9rWP9ZkowIZuv3lzoFODDTSP6fK/NRx4=;
  b=EKO4wyjNUBUIvdOMiTmFjhjOuLCV+rmUEj45zhtUoJJjmpeVCZJHVUmD
   z70B+Am9NcpRvrlK4EIAsQnT/MqfcloHMNYTX4acRmPhH2J5Rr6Uh3wXI
   kTRCsRpqTvDCzjB0enyOS3aeSwTzohvwzmS5WqCLRak9OcRRSBbgk2Ue5
   ZhghnDdpKvCUMk1SYjHC+mK4lwe9vwMPNcMgiRIEZniSiEKnxAHJn2SCh
   n5aNd4osP3tZp3W2G7HSCFALJ0ADD1oPsf192azRyAPri09/VTUm1xL3Q
   gpLvQjhmg409LSfTJw0RVeh3gL0/Wm9ElHfw0aIkMllWOFtWL+9K3vWxi
   Q==;
X-CSE-ConnectionGUID: MQDuqG0MThiZuOAZR41TYw==
X-CSE-MsgGUID: gZdzrAPgTua8Ut15IQUgfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27276129"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="27276129"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 07:54:58 -0700
X-CSE-ConnectionGUID: 0PKJgu88QuKTrXccCgQHMQ==
X-CSE-MsgGUID: h7F18YdiSiavUq4AO9XGcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="112960959"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Oct 2024 07:54:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxp8Q-000586-1a;
	Mon, 07 Oct 2024 14:54:54 +0000
Date: Mon, 7 Oct 2024 22:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3832/16788]
 drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:45: error: implicit declaration of
 function 'pgprot_cached_ns'
Message-ID: <202410072225.i5EcKvfK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 156e54bbc99018164252576ccb464eaf23a84266 [3832/16788] vfio/fsl-mc: Map the VFIO region according to the flags received from the mc firmware
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241007/202410072225.i5EcKvfK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410072225.i5EcKvfK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410072225.i5EcKvfK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_mmap_mmio':
>> drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:45: error: implicit declaration of function 'pgprot_cached_ns' [-Werror=implicit-function-declaration]
     375 |                         vma->vm_page_prot = pgprot_cached_ns(vma->vm_page_prot);
         |                                             ^~~~~~~~~~~~~~~~
>> drivers/vfio/fsl-mc/vfio_fsl_mc.c:375:45: error: incompatible types when assigning to type 'pgprot_t' {aka 'struct pgprot'} from type 'int'
   cc1: some warnings being treated as errors


vim +/pgprot_cached_ns +375 drivers/vfio/fsl-mc/vfio_fsl_mc.c

   359	
   360	static int vfio_fsl_mc_mmap_mmio(struct vfio_fsl_mc_region region,
   361					 struct vm_area_struct *vma)
   362	{
   363		u64 size = vma->vm_end - vma->vm_start;
   364		u64 pgoff, base;
   365	
   366		pgoff = vma->vm_pgoff &
   367			((1U << (VFIO_FSL_MC_OFFSET_SHIFT - PAGE_SHIFT)) - 1);
   368		base = pgoff << PAGE_SHIFT;
   369	
   370		if (region.size < PAGE_SIZE || base + size > region.size)
   371			return -EINVAL;
   372	
   373		if (region.type & FSL_MC_REGION_CACHEABLE) {
   374			if (!(region.type & FSL_MC_REGION_SHAREABLE))
 > 375				vma->vm_page_prot = pgprot_cached_ns(vma->vm_page_prot);
   376		} else
   377			vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
   378	
   379		vma->vm_pgoff = (region.addr >> PAGE_SHIFT) + pgoff;
   380	
   381		return remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
   382				       size, vma->vm_page_prot);
   383	}
   384	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
