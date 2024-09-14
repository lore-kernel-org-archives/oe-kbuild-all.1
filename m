Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DB319E98B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 06:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726297011; cv=none; b=h+9krypAdhrkCKXS/P1WtyhRNV9OSBlf93tpTXYeTc20eVXbfT2eOjOFP4wwRmKNxupZn+oJW2ES3Ikn1BG/we0E0fLA0/ZPXAHebZyhmeixTliqsrP0/ZUI6u703m6LvLfO+wIllLJbY/cYuNECdxHtNqZC82wFNpiPYfGqnxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726297011; c=relaxed/simple;
	bh=SlPWg4xrKSmGpuYy0V8giq0u/U2HdTCPn4NhP/iGwm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppkt6sDuM4N5CktEW/ZTmKZE41c7oyRG3/3ZZtqXed64fL55fC7PitPSGxmmk/Pd1XgDP8/gJxqVD5qqz/HSNzF4QWL4xmPHPk0O5GaPtHGSh1nzeG5IEw7G4Ix2OXBsbkKjqIaSdT7C4ZyzvauiWinBz/wUThyaGUXr2XrPV0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ydg2L8hO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ydg2L8hO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726297010; x=1757833010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SlPWg4xrKSmGpuYy0V8giq0u/U2HdTCPn4NhP/iGwm4=;
  b=Ydg2L8hOhmzL8RC/Bo2bKnjH/xW8t5IZzSa0O2WtkFOYPSpjd/dHtI4y
   C+FJA2m9iTEaKGM+8oilgME0tu2OcbupMKneQwtSkxKF5coOctOM+pptf
   ofwXM4CDMpxANxt+MY8G15HniJSNPw+Psq+XKiQ22dvB61Mr11oHWahJv
   h1NPIgGJ7nVimjD6/sF37lRSNAqgWvLaQ7ffh+zS9Udu++Af7ZIFX1+Uz
   0WpfY+kDgDv5f9Ozp+xI1dpccqhYtsoSKc8BMM59mPhz98KYLU6Nmhb9u
   iAiwRxHHR9mNu3sCyB1GvM0mew4tjtBzsp7GUhEBIG0I9Jhj6dmIMPm05
   Q==;
X-CSE-ConnectionGUID: QeEresYQSIeesMnmYwmoYw==
X-CSE-MsgGUID: gmowEDdlRC+8Gmfi8rev5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="47714848"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="47714848"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 23:56:48 -0700
X-CSE-ConnectionGUID: lO/wkg17TTOPfNNao4Zvwg==
X-CSE-MsgGUID: q+0ZEeIEQMSthr8+U9qXcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="68572245"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Sep 2024 23:56:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spMi5-0007Te-18;
	Sat, 14 Sep 2024 06:56:45 +0000
Date: Sat, 14 Sep 2024 14:56:16 +0800
From: kernel test robot <lkp@intel.com>
To: Junxian Huang <huangjunxian6@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 for-next 1/2] RDMA/core: Provide
 rdma_user_mmap_disassociate() to disassociate mmap pages
Message-ID: <202409141457.kItwfqw3-lkp@intel.com>
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
config: i386-randconfig-051-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141457.kItwfqw3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141457.kItwfqw3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141457.kItwfqw3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/core/uverbs_main.c:710:1: warning: unused label 'out_mutex' [-Wunused-label]
     710 | out_mutex:
         | ^~~~~~~~~~
   1 warning generated.


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
