Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CDF298994
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 22:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581647; cv=none; b=jCfdl0efeCCmSvrbhmj/s0g4yXZX0ehgKVWsEMADSHOwSdTbCevuxEON5ra4sag+c34deX18//fwBd4ErMhtBG3Wjn5/cSJlftXahFOPLV4uHUuN1ds4riDZiDvQ3EISZNHSLISM3J6iF7K62eqyTmk0NbgfqRvD79+7nz1Zh4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581647; c=relaxed/simple;
	bh=XXVXC+Shy9kigiAXXUaEazZEITHCNc5vcrDfk1/sIr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SMCoWYgQ67X4Vb1nEDZ6sZic8TEaqE0/pmBMVpCjxgWo434p3p5c9zaiaDNVft/Dt+3j9TXwe6JpDEmb5TuLzbq+XTojbr/Ylne99phNVZkuOv1l7XxWEIj1fzIKUN81F+V0CTG8JpkbojBjNJZIpP7dTo9hd9y4PkkfgyEebvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzzQMsx/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzzQMsx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751581646; x=1783117646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XXVXC+Shy9kigiAXXUaEazZEITHCNc5vcrDfk1/sIr0=;
  b=RzzQMsx/5BxNDf45dTmNvd7A2Nd22uGA3rd3CmhnVm9Pn6Jqp535mb0s
   BCFenTQKxToLhgpZO0dgfh3xPRPNebVOokvNJpTNIIKq3e8C5at8Gec7I
   7B9BIerASq8N/iRTN6QERrZmcp6orCuzfPbikwp8nDbZ/XAOsaPHg6Tp/
   Jvpn/JHtjKhToS7jHczn8dWjxCSUAkDAzPVFzC5QeCDVN+knvgPiI6FMn
   18+si7LmJGd63BlavOLziXcvOdOHNZc+o4XAAeVI6NkaqglU865K4C4an
   JZW5iMTLAMFgfxW7pJUXbV8HUaozvs1wdpTGxuMWwHFggarw6/z2FZ6jd
   Q==;
X-CSE-ConnectionGUID: 6IwEF8tHT+e8tgIekn+Uqw==
X-CSE-MsgGUID: eIm204ynTnCMLoqI98Ocng==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76467841"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="76467841"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 15:27:25 -0700
X-CSE-ConnectionGUID: ztAlc2pRRC25O+a3z6p0iw==
X-CSE-MsgGUID: Kuln32lmSquiMG2TuKzUig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="154250574"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jul 2025 15:27:24 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXSOn-00034L-2U;
	Thu, 03 Jul 2025 22:27:21 +0000
Date: Fri, 4 Jul 2025 06:26:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, y00878127 <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2454/2454] drivers/coda/coda.c:264: warning:
 Function parameter or member 's_smmu_id' not described in 'is_cc_vmid'
Message-ID: <202507040646.2QNfCtsv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9b85bcf0e6357841885264f42859bec05c9073f4
commit: c5161d7e11a7e30755b2ec55aaebfd500193cbbc [2454/2454] virtCCA supports SR-IOV in CoDA scenarios.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250704/202507040646.2QNfCtsv-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040646.2QNfCtsv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040646.2QNfCtsv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/coda/coda.c:264: warning: Function parameter or member 's_smmu_id' not described in 'is_cc_vmid'
>> drivers/coda/coda.c:660: warning: Function parameter or member 'pci_dev' not described in 'virtcca_create_ste_entry'
>> drivers/coda/coda.c:660: warning: Excess function parameter 'smmu' description in 'virtcca_create_ste_entry'
>> drivers/coda/coda.c:660: warning: Excess function parameter 'master' description in 'virtcca_create_ste_entry'
>> drivers/coda/coda.c:660: warning: Excess function parameter 'sid' description in 'virtcca_create_ste_entry'
--
>> drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:56: warning: Function parameter or member 's_smmu_id' not described in 'virtcca_smmu_cmdq_need_forward'


vim +264 drivers/coda/coda.c

ad540a13eb8292 yangxiangkai 2024-09-20  254  
ad540a13eb8292 yangxiangkai 2024-09-20  255  /**
c5161d7e11a7e3 yxk          2025-05-07  256   * is_cc_vmid - Whether the VM is confidential VM
c5161d7e11a7e3 yxk          2025-05-07  257   * @vmid: VM id
ad540a13eb8292 yangxiangkai 2024-09-20  258   *
ad540a13eb8292 yangxiangkai 2024-09-20  259   * Returns:
c5161d7e11a7e3 yxk          2025-05-07  260   * %true if the VM is confidential
c5161d7e11a7e3 yxk          2025-05-07  261   * %false if the VM is not confidential
ad540a13eb8292 yangxiangkai 2024-09-20  262   */
c5161d7e11a7e3 yxk          2025-05-07  263  bool is_cc_vmid(u32 vmid, u64 s_smmu_id)
ad540a13eb8292 yangxiangkai 2024-09-20 @264  {
ad540a13eb8292 yangxiangkai 2024-09-20  265  	int bkt;
c5161d7e11a7e3 yxk          2025-05-07  266  	struct coda_dev_hash_node *obj;
c5161d7e11a7e3 yxk          2025-05-07  267  	bool secure = false;
ad540a13eb8292 yangxiangkai 2024-09-20  268  
c5161d7e11a7e3 yxk          2025-05-07  269  	spin_lock(&coda_dev_lock);
c5161d7e11a7e3 yxk          2025-05-07  270  	hash_for_each(g_coda_dev_htable, bkt, obj, node) {
c5161d7e11a7e3 yxk          2025-05-07  271  		if (vmid > 0 && obj->vmid == vmid && obj->s_smmu_id == s_smmu_id) {
c5161d7e11a7e3 yxk          2025-05-07  272  			secure = obj->secure;
c5161d7e11a7e3 yxk          2025-05-07  273  			spin_unlock(&coda_dev_lock);
c5161d7e11a7e3 yxk          2025-05-07  274  			return secure;
c5161d7e11a7e3 yxk          2025-05-07  275  		}
ad540a13eb8292 yangxiangkai 2024-09-20  276  	}
ad540a13eb8292 yangxiangkai 2024-09-20  277  
c5161d7e11a7e3 yxk          2025-05-07  278  	spin_unlock(&coda_dev_lock);
c5161d7e11a7e3 yxk          2025-05-07  279  	return secure;
ad540a13eb8292 yangxiangkai 2024-09-20  280  }
ad540a13eb8292 yangxiangkai 2024-09-20  281  EXPORT_SYMBOL_GPL(is_cc_vmid);
ad540a13eb8292 yangxiangkai 2024-09-20  282  

:::::: The code at line 264 was first introduced by commit
:::::: ad540a13eb8292fc92651b3bf281088a502a85f9 virtcca feature: fix msi iova map

:::::: TO: yangxiangkai <yangxiangkai@huawei.com>
:::::: CC: yangxiangkai <yangxiangkai@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
