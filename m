Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9E317C68
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 04:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733201441; cv=none; b=Y2x/+GYlJUGjYzDx4UfGyLP1PAtd+5vyzeebyHRFzLeV6/lo0ZTm7pMg1UIJL2KPe565hB7z+RISbY9zG0BssN82Ze0g7qu6i1L9JzL7S80LJY5MKVhE4O3Y+jqJsZI7gfMFyWBJwkkdxUSyWP1QllCN5W+qmmVogjhfChNNVx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733201441; c=relaxed/simple;
	bh=VZObTby+wrUpCZmyv6XIYVl38CzMpOARrRIOlQH/QNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X28uyFNnNXu0DIRhye4aRw9p2NhmVEmtJGFP5Nyue9SMuUO2Octb9s2i+9b4yVZbbmNiCD18EecD8oq7u/PsdLwe/vENSmfbxijggmL0bgg5U+qxJNIxXKc852zgvTnzDIEKXNebaEaGko4PquvQ5R8LOV1kk+9pKj7ZtrO3lQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lxdsy/40; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lxdsy/40"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733201440; x=1764737440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VZObTby+wrUpCZmyv6XIYVl38CzMpOARrRIOlQH/QNw=;
  b=Lxdsy/40JKmT7rXciwbIVqhSL/Cv+cBTRKTTvn6/ItsWQoTKtoK7zV1R
   It+06sNRR/p3Ai/R2WdQ1p3iPqeNlDPosHvr7Fq996LlF+hIKkuIGx0yg
   VzbfAozPwvXGuttqrwIirFRmOc9D0mumblDFXXk3kDR5lHBaXolBhs6+4
   mxeyphBn+gNHwpKIJVFjrUPU7aDGRo/tQBgsQnUQZ/PqijdOf+rEAdRpG
   va97ELJUqfi9DhSxL6em4ESicKBVXIwgFXQSH2Srk4ysbH3Od7KEeFMTM
   DaalUjy+M6qAbKgDQ7AcjfP2gLwXGLL0glzv0/2hvPLRgcP3kD+rqYeCC
   g==;
X-CSE-ConnectionGUID: wvDXsu4LQ8iEwjW76W3XsQ==
X-CSE-MsgGUID: nrpfipyqSxaTqWe1dqNQtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37172931"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="37172931"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 20:50:38 -0800
X-CSE-ConnectionGUID: YNyk7VkzRaWK30zUQG49JA==
X-CSE-MsgGUID: oHIhDmU1T9yMLOqs52Nleg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="124152610"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Dec 2024 20:50:35 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIKro-00007p-1r;
	Tue, 03 Dec 2024 04:50:32 +0000
Date: Tue, 3 Dec 2024 12:50:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kashyap Desai <kashyap.desai@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Hannes Reinecke <hare@suse.de>, Tomas Henzl <thenzl@redhat.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>
Subject: drivers/scsi/mpi3mr/mpi3mr_fw.c:360:58: warning: '%d' directive
 output may be truncated writing between 1 and 3 bytes into a region of size
 between 1 and 32
Message-ID: <202412031228.7IB2UW85-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
commit: 824a156633dfdb0e17979a0d0bb2c757d1bb949c scsi: mpi3mr: Base driver code
date:   3 years, 6 months ago
config: x86_64-randconfig-015-20240106 (https://download.01.org/0day-ci/archive/20241203/202412031228.7IB2UW85-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031228.7IB2UW85-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031228.7IB2UW85-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/mpi3mr/mpi3mr_fw.c: In function 'mpi3mr_setup_isr':
>> drivers/scsi/mpi3mr/mpi3mr_fw.c:360:58: warning: '%d' directive output may be truncated writing between 1 and 3 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     360 |         snprintf(intr_info->name, MPI3MR_NAME_LENGTH, "%s%d-msix%d",
         |                                                          ^~
   drivers/scsi/mpi3mr/mpi3mr_fw.c:360:55: note: directive argument in the range [0, 255]
     360 |         snprintf(intr_info->name, MPI3MR_NAME_LENGTH, "%s%d-msix%d",
         |                                                       ^~~~~~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_fw.c:360:55: note: directive argument in the range [0, 65535]
   drivers/scsi/mpi3mr/mpi3mr_fw.c:360:9: note: 'snprintf' output between 8 and 45 bytes into a destination of size 32
     360 |         snprintf(intr_info->name, MPI3MR_NAME_LENGTH, "%s%d-msix%d",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     361 |             mrioc->driver_name, mrioc->id, index);
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/scsi/mpi3mr/mpi3mr_os.c: In function 'mpi3mr_probe':
>> drivers/scsi/mpi3mr/mpi3mr_os.c:210:33: warning: '%d' directive writing between 1 and 3 bytes into a region of size between 1 and 32 [-Wformat-overflow=]
     210 |         sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id);
         |                                 ^~
   drivers/scsi/mpi3mr/mpi3mr_os.c:210:30: note: directive argument in the range [0, 255]
     210 |         sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id);
         |                              ^~~~~~
   drivers/scsi/mpi3mr/mpi3mr_os.c:210:9: note: 'sprintf' output between 2 and 35 bytes into a destination of size 32
     210 |         sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +360 drivers/scsi/mpi3mr/mpi3mr_fw.c

   340	
   341	/**
   342	 * mpi3mr_request_irq - Request IRQ and register ISR
   343	 * @mrioc: Adapter instance reference
   344	 * @index: IRQ vector index
   345	 *
   346	 * Request threaded ISR with primary ISR and secondary
   347	 *
   348	 * Return: 0 on success and non zero on failures.
   349	 */
   350	static inline int mpi3mr_request_irq(struct mpi3mr_ioc *mrioc, u16 index)
   351	{
   352		struct pci_dev *pdev = mrioc->pdev;
   353		struct mpi3mr_intr_info *intr_info = mrioc->intr_info + index;
   354		int retval = 0;
   355	
   356		intr_info->mrioc = mrioc;
   357		intr_info->msix_index = index;
   358		intr_info->op_reply_q = NULL;
   359	
 > 360		snprintf(intr_info->name, MPI3MR_NAME_LENGTH, "%s%d-msix%d",
   361		    mrioc->driver_name, mrioc->id, index);
   362	
   363		retval = request_threaded_irq(pci_irq_vector(pdev, index), mpi3mr_isr,
   364		    mpi3mr_isr_poll, IRQF_SHARED, intr_info->name, intr_info);
   365		if (retval) {
   366			ioc_err(mrioc, "%s: Unable to allocate interrupt %d!\n",
   367			    intr_info->name, pci_irq_vector(pdev, index));
   368			return retval;
   369		}
   370	
   371		return retval;
   372	}
   373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
