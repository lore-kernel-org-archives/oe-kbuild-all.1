Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8005A95C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 03:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730001431; cv=none; b=PTsKW0bydL7v6DmqmJDwqHTnBjSoQ+PQPfk+DGXtRVmMMD7iNRm0YEYD0WfWC4tVWqkYAuYMGk//oGkugKEp1e8L3RH0lvZllZBBBooiSlGr+bdQwa1LrzzpTlhatmnP+cgsVR4JknKVc2qjy15Hdm11wTAHEvK7GcRVUAyy9To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730001431; c=relaxed/simple;
	bh=97B4MYwCrnDCFOe15LlSBYdD5uVkXpaNY3K7FvDtm+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ld6yEtYE6nqNE0rr9E7VOZ6zat25uwV4pdA+euiDYZBuT7Akh+jU5yCRJtX3PpYaONNjZZKIqlJ9FAeeO1/AksRQ39F29qlTPNEv0Bks/OMJIqSyrJd0L2ErCOOufIp6NynPH6zEjROiWIRIwaGXLuhP3xZ5soYGX+kFUcK/SQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIHAgb8N; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIHAgb8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730001429; x=1761537429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=97B4MYwCrnDCFOe15LlSBYdD5uVkXpaNY3K7FvDtm+o=;
  b=BIHAgb8N11IdOpOF0p3garx395dny/vQ1l6GMcIEYYVFUYy1Z7Qhrm2J
   G/8hRA9v5pOK6ZS/5kTkYOtFMQGPzgWzIvknWYEb8EWJ0LGNarlowiVvX
   Ov6OXCX22lMwNQUGvFMBYREkug2LSRODcEu1/ba36nveAQ5ZJAnmAJLIZ
   m8M36Kjyf3Lh12hxnG5mbbdmSr5QE5s19/dLfQqfzOwq2/K31CoLPoM4i
   FwqYoSoSxgaVbP2Nm5y8rj81JO+JI1Nhep2x6WYLL3eRq5UMuXigG2adT
   IHF0c2CgDKqShKxsvKNiEqsMlI9e2DEHrfd4K184E8tZ+62wPiIl1JQ0f
   Q==;
X-CSE-ConnectionGUID: YH+1nVIWQt2c4pU42iaIEg==
X-CSE-MsgGUID: YcCeYV16SZqvHWcxIaFuiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29816149"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29816149"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 20:57:09 -0700
X-CSE-ConnectionGUID: 1WkfGEBdTWWNrt3Qlkc6xg==
X-CSE-MsgGUID: CtRJwN8fRtyFo4k/6woxxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="85244352"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2024 20:57:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4uOn-000aLC-0B;
	Sun, 27 Oct 2024 03:57:05 +0000
Date: Sun, 27 Oct 2024 11:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/unfudge_irq_bypass 2/51]
 arch/s390/kvm/../../../virt/kvm/kvm_main.c:223:28: error: 'struct irq_data'
 has no member named 'parent_data'
Message-ID: <202410271116.ZSfCL3aY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/unfudge_irq_bypass
head:   4aabe03fb639d226a7f54d30e5437e4865d88913
commit: ef91e567b4bbcff2ac70badfa3aeb3622076428a [2/51] ***HACK*** KVM: Hack in an ioctl() to provide a dummy IRQ bypass producer
config: s390-randconfig-001-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271116.ZSfCL3aY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271116.ZSfCL3aY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271116.ZSfCL3aY-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/kvm/../../../virt/kvm/kvm_main.c: In function '__kvm_irq_producer_set_vcpu_affinity':
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:180:14: error: implicit declaration of function 'cpu_feature_enabled' [-Wimplicit-function-declaration]
     180 |         if (!cpu_feature_enabled(X86_FEATURE_SVM)) {
         |              ^~~~~~~~~~~~~~~~~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:180:34: error: 'X86_FEATURE_SVM' undeclared (first use in this function); did you mean 'X86_FEATURE_ANY'?
     180 |         if (!cpu_feature_enabled(X86_FEATURE_SVM)) {
         |                                  ^~~~~~~~~~~~~~~
         |                                  X86_FEATURE_ANY
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:180:34: note: each undeclared identifier is reported only once for each function it appears in
   arch/s390/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_setup_dummy_iommu':
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:223:28: error: 'struct irq_data' has no member named 'parent_data'
     223 |                 data = data->parent_data;
         |                            ^~


vim +223 arch/s390/kvm/../../../virt/kvm/kvm_main.c

   205	
   206	static void kvm_setup_dummy_iommu(void)
   207	{
   208		unsigned long flags;
   209		struct irq_desc *desc = irq_get_desc_lock(floppy_irq, &flags, 0);
   210		struct irq_data *data;
   211		struct irq_chip *chip;
   212	
   213		BUILD_BUG_ON(!IS_ENABLED(CONFIG_IRQ_DOMAIN_HIERARCHY));
   214	
   215		if (WARN_ON_ONCE(!desc))
   216			return;
   217	
   218		data = irq_desc_get_irq_data(desc);
   219		do {
   220			chip = irq_data_get_irq_chip(data);
   221			if (chip && chip->irq_set_vcpu_affinity)
   222				break;
 > 223			data = data->parent_data;
   224		} while (data);
   225	
   226		if (data) {
   227			pr_warn("Huh.  Floppy can post IRQs?\n");
   228			goto out;
   229		}
   230	
   231		data = irq_desc_get_irq_data(desc);
   232		chip = irq_data_get_irq_chip(data);
   233		if (!chip) {
   234			pr_warn("Fudge.  There goes that idea\n");
   235			goto out;
   236		}
   237	
   238		chip->irq_set_vcpu_affinity = kvm_irq_producer_set_vcpu_affinity;
   239		folly_chip = chip;
   240	out:
   241		irq_put_desc_unlock(desc, flags);
   242	}
   243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
