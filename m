Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA9147772
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 05:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726293287; cv=none; b=S7Hu2oviJgnolb2a/1Qixori7s+HdunnyskNfqfD936Q3Fi9PjeSI5NrOFFmsvBym0BtwkS9FitBplhOnxTcrYt0PnJqpGt0QZtGxjjayws9G3jHbFdSOwdnecoU+hYUy3T5CK9e8YPG7tMDuoWZhOi9jStmdih6goFfLwfv6NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726293287; c=relaxed/simple;
	bh=H+iYvcQ9XioPjFKFREd8PMrSb8rYoXR2ql7uq4H1ltY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JbWrIx45pB83G30clIsZhCVcI6T5IPHm+/k+jVprJizeMfRU9JxnG3tekdllXK/4kJJmj5sRTIdPeyalVIlXEoeVDUDzQus99hkGh2Nor3v8pM92jacFiloLGya81asClHL2rmDCqrNETRJN0N2GBOljLcYJo8zBMpmomRCbLKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTL39B0p; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTL39B0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726293285; x=1757829285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H+iYvcQ9XioPjFKFREd8PMrSb8rYoXR2ql7uq4H1ltY=;
  b=CTL39B0p6/9idTpqa6rh85FSmJZIDRSZgGwsy7yQ44RjhHNwrojz+uZy
   HEHErvWKQBVKEHdcfcPc3oW67nIdyCOmX3JBYPNcPr4s3NnUCKaYcBY5o
   NZKKtpnXk4zzdxg4CsClL+G1rA2rlDTlL5TP/V378uebGdostCDVEkwu4
   zlB6kX6EnKWcNrshvcduEzSCyTOOo+vLWF/jXYrR5/pgvhp8GUBvneWE/
   6WIEcFIKsz7HS5gtKQ+j+scEhLf9knETQgifM0wQ0GdC4/uz8sRIyEDxn
   utOJx0/mrON0BLVpBMfCBZZPrLWAhdLs8wyYqrrVezVZq59o9e/3fE/0x
   Q==;
X-CSE-ConnectionGUID: sA5zfnprT3COtyoexTT/Fw==
X-CSE-MsgGUID: OJpU8Fr+RMO2ufLzi47jpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="42678421"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="42678421"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 22:54:44 -0700
X-CSE-ConnectionGUID: idrWsrRMRBCPhq3/XUlqpA==
X-CSE-MsgGUID: 2VLwizyVSPCk3pD6jK98vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="98995429"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Sep 2024 22:54:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spLk1-0007QW-11;
	Sat, 14 Sep 2024 05:54:41 +0000
Date: Sat, 14 Sep 2024 13:53:47 +0800
From: kernel test robot <lkp@intel.com>
To: Junxian Huang <huangjunxian6@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 for-next 1/2] RDMA/core: Provide
 rdma_user_mmap_disassociate() to disassociate mmap pages
Message-ID: <202409141318.taosbZWa-lkp@intel.com>
References: <20240913122955.1283597-2-huangjunxian6@hisilicon.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913122955.1283597-2-huangjunxian6@hisilicon.com>

Hi Junxian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rdma/for-next]
[also build test WARNING on linus/master v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Junxian-Huang/RDMA-core-Provide-rdma_user_mmap_disassociate-to-disassociate-mmap-pages/20240913-204413
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/20240913122955.1283597-2-huangjunxian6%40hisilicon.com
patch subject: [PATCH v5 for-next 1/2] RDMA/core: Provide rdma_user_mmap_disassociate() to disassociate mmap pages
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240914/202409141318.taosbZWa-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141318.taosbZWa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141318.taosbZWa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/core/uverbs_main.c: In function 'ib_uverbs_mmap':
>> drivers/infiniband/core/uverbs_main.c:710:1: warning: label 'out_mutex' defined but not used [-Wunused-label]
     710 | out_mutex:
         | ^~~~~~~~~


vim +/out_mutex +710 drivers/infiniband/core/uverbs_main.c

   691	
   692	static int ib_uverbs_mmap(struct file *filp, struct vm_area_struct *vma)
   693	{
   694		struct ib_uverbs_file *file = filp->private_data;
   695		struct ib_ucontext *ucontext;
   696		int ret = 0;
   697		int srcu_key;
   698	
   699		srcu_key = srcu_read_lock(&file->device->disassociate_srcu);
   700		ucontext = ib_uverbs_get_ucontext_file(file);
   701		if (IS_ERR(ucontext)) {
   702			ret = PTR_ERR(ucontext);
   703			goto out_srcu;
   704		}
   705	
   706		mutex_lock(&file->disassociation_lock);
   707	
   708		vma->vm_ops = &rdma_umap_ops;
   709		ret = ucontext->device->ops.mmap(ucontext, vma);
 > 710	out_mutex:
   711		mutex_unlock(&file->disassociation_lock);
   712	out_srcu:
   713		srcu_read_unlock(&file->device->disassociate_srcu, srcu_key);
   714		return ret;
   715	}
   716	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
