Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4D445014
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 05:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719035260; cv=none; b=aJy3MrzPiqXlo0r2vYFP9g4/LRmUjv2+zJxrm+eeiAm+mDc67+whVtVJJJc4FmEBB5jxngiVQLFDihvy28jlZp86tnjVLQjQARbtwApuWj1ePYvO2dhOS0ZweFbbqGWmpB4D47ZbxTz1j5As2wQh3uKDSzgZJWi0dWV4rT0zAII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719035260; c=relaxed/simple;
	bh=3NlF+MNmoISU1i2vYYeOmxpY6JizlLEQQo3LwcSDizM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QN3aw8gy8pQRpW/rIp7IU613zypusOBzjQM3tMdYL8jxOeLMvnWtctwTFwHexmDDwqJX8Go3v1mLofcYAJ3WmKD1LLowpczy3n3zqd0oYR4FP4UV81wdASStFnkbYZDdO530e1kNLveIA6obhjRqov3ZqErRz1RCaOLdzJGWdtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7laFGtw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7laFGtw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719035258; x=1750571258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3NlF+MNmoISU1i2vYYeOmxpY6JizlLEQQo3LwcSDizM=;
  b=T7laFGtwvprZFbrcBHl+zgamGGvRYcXSoyP6jKfeTqOIwYNqtODW906J
   RwaTJBKw00pmw7Ix8J8e3ua6xGD51ISztlfUBG8OdZNq2ZceVDsJslaWz
   hdTH6Rfe42ot5HyXelb2sr1LPiIiGZeuBzVT31Kxa4+wv2eqlc8NAANge
   /YDUhgIQ0VrDgm5JdhwUuayFYZfz7wEtximPLZ0zsY3goiv0ZeoXOLeHt
   OXDlkfYe3OfPCh0Ug6mlxWETw6am99ommwBUgkN7syuTAV51ywJnj2une
   z2FjT9tidvsYregVhj1oFxbxjmZaOslJuV+pIx4pHCOE6p9qRVFoKs7oW
   Q==;
X-CSE-ConnectionGUID: dFmw42ENRkmBzkbdH/Y6/A==
X-CSE-MsgGUID: GUQpgIlnSROoZNRuEWEB7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15908731"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="15908731"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 22:47:37 -0700
X-CSE-ConnectionGUID: g6qPnKToQYSL2/7INzVT8Q==
X-CSE-MsgGUID: lWDQx9dBSFm9DUylxe/lUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="74005551"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Jun 2024 22:47:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKtb3-0009Nl-2n;
	Sat, 22 Jun 2024 05:47:33 +0000
Date: Sat, 22 Jun 2024 13:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15565/23022] arch/x86/kvm/svm.c:1903
 sev_vm_destroy() warn: inconsistent indenting
Message-ID: <202406221300.KSmWRO3o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3441ff8f5dfa49d91987c2ef11a2d1647a0d56ff
commit: 457eaaadf6723ca66af506471c5209bb4983f87d [15565/23022] KVM: SVM: Periodically schedule when unregistering regions on destroy
config: x86_64-randconfig-161-20240622 (https://download.01.org/0day-ci/archive/20240622/202406221300.KSmWRO3o-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221300.KSmWRO3o-lkp@intel.com/

smatch warnings:
arch/x86/kvm/svm.c:1903 sev_vm_destroy() warn: inconsistent indenting

vim +1903 arch/x86/kvm/svm.c

  1883	
  1884	static void sev_vm_destroy(struct kvm *kvm)
  1885	{
  1886		struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
  1887		struct list_head *head = &sev->regions_list;
  1888		struct list_head *pos, *q;
  1889	
  1890		if (!sev_guest(kvm))
  1891			return;
  1892	
  1893		mutex_lock(&kvm->lock);
  1894	
  1895		/*
  1896		 * if userspace was terminated before unregistering the memory regions
  1897		 * then lets unpin all the registered memory.
  1898		 */
  1899		if (!list_empty(head)) {
  1900			list_for_each_safe(pos, q, head) {
  1901				__unregister_enc_region_locked(kvm,
  1902					list_entry(pos, struct enc_region, list));
> 1903					cond_resched();
  1904			}
  1905		}
  1906	
  1907		mutex_unlock(&kvm->lock);
  1908	
  1909		sev_unbind_asid(kvm, sev->handle);
  1910		sev_asid_free(kvm);
  1911	}
  1912	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
