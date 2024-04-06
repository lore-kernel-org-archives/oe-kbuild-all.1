Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BAD632
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 00:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712363955; cv=none; b=H4AjALfb9FIeYY+RBVVC8Mv4QC8cU/MoKaeui6/JjnFNIenziBeiAcDrl13PdK+g4vLi323bLzEKQBLLrYgLGzD231Oj+sHAp3RbLRCMAAm63T5IMt/e0DaobH7Z6/SRtPO6aYPpsd48R6Q3jGceZV2L40eUcqjsyqWqD1bU0SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712363955; c=relaxed/simple;
	bh=PQFhyTRo+0lTFOLr1+mtqUeEG2gS7EFtEdMibGLzzxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j2kc2WcPvct8ul9wptlTNwUHaEeX2DedPskNpIRS1KF8Y1D69aZZdS5p2Gr/R7HUCH29sgtujIRoe05xVERJZqKmms8Bcq1dTq0WC9ca1pgCPTPhut2ND3gdEo3eACp9O/KOacnTFB8pmh6fGQjYumhsGej/GzA/bPRCsQbTSu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2Eoo/Lw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2Eoo/Lw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712363954; x=1743899954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PQFhyTRo+0lTFOLr1+mtqUeEG2gS7EFtEdMibGLzzxY=;
  b=m2Eoo/Lw3QbC6mTek6LP8vQWsBmrmv35+KhB+TvV9ZCxYF1ZKh7ZPOhm
   KsB/ALI522SoC0K7ivH8/t1nb9INTgH+mwfGEhGdfhsGSBwqfEKBHpLk1
   OIrV/HritEBSE/XHGCCRuYOmbmyeMBmqqLvKZFhFrzy1OfDrzj2lV2UVM
   snWQqoWFtMTMuLz834Qp6v+nxltyB6IR8uaINN5676gsSFNn7tIok3it/
   JAB4DEqsJCHXzScE7Avy6mfvtYrrun3CGJPIjh5ZpscOwM02J+yzEuasm
   hOJOBsv/RKDbNAos3PC1MpltCtn0WsHUxkKq5MkWNJZDanmNz3CJ63ekn
   g==;
X-CSE-ConnectionGUID: 4e/fg3IsQlWS6f1TgJ4w2A==
X-CSE-MsgGUID: 8nngTFO9RMipV966vFHjcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="11533005"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="11533005"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 17:39:13 -0700
X-CSE-ConnectionGUID: EUvUyVczQU2+AMG5nlqlsQ==
X-CSE-MsgGUID: SmbS6D3/SaWFO3kVFnhcVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19397198"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Apr 2024 17:39:12 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsu5N-0002vm-0B;
	Sat, 06 Apr 2024 00:39:09 +0000
Date: Sat, 6 Apr 2024 08:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 69/93]
 arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5079:22: error:
 'kvm_vm_stats_read_iter' undeclared here (not in a function); did you mean
 'kvm_vcpu_stats_read_iter'?
Message-ID: <202404060855.g3TTkKkf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   222e1965f038cbce873a9392d6b9e0df82837498
commit: ef0f2e8cc6f036e45cface7a6e208ffcf4de2fbf [69/93] virt: convert to ->read_iter and ->write_iter
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240406/202404060855.g3TTkKkf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060855.g3TTkKkf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060855.g3TTkKkf-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5079:22: error: 'kvm_vm_stats_read_iter' undeclared here (not in a function); did you mean 'kvm_vcpu_stats_read_iter'?
    5079 |         .read_iter = kvm_vm_stats_read_iter,
         |                      ^~~~~~~~~~~~~~~~~~~~~~
         |                      kvm_vcpu_stats_read_iter
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5059:16: warning: 'kvm_vm_stats_read' defined but not used [-Wunused-function]
    5059 | static ssize_t kvm_vm_stats_read(struct file *file, char __user *user_buffer,
         |                ^~~~~~~~~~~~~~~~~


vim +5079 arch/loongarch/kvm/../../../virt/kvm/kvm_main.c

  5058	
> 5059	static ssize_t kvm_vm_stats_read(struct file *file, char __user *user_buffer,
  5060				      size_t size, loff_t *offset)
  5061	{
  5062		struct kvm *kvm = file->private_data;
  5063	
  5064		return kvm_stats_read(kvm->stats_id, &kvm_vm_stats_header,
  5065					&kvm_vm_stats_desc[0], &kvm->stat,
  5066					sizeof(kvm->stat), user_buffer, size, offset);
  5067	}
  5068	
  5069	static int kvm_vm_stats_release(struct inode *inode, struct file *file)
  5070	{
  5071		struct kvm *kvm = file->private_data;
  5072	
  5073		kvm_put_kvm(kvm);
  5074		return 0;
  5075	}
  5076	
  5077	static const struct file_operations kvm_vm_stats_fops = {
  5078		.owner = THIS_MODULE,
> 5079		.read_iter = kvm_vm_stats_read_iter,
  5080		.release = kvm_vm_stats_release,
  5081		.llseek = noop_llseek,
  5082	};
  5083	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
