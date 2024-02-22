Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3E122EEF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708595937; cv=none; b=i0d5l7N8oXx2NGF/hZyae2HBfanCJ8DvGBeDXbo+HfnKJYCdVpnZrv0l33h3uaORAsls7FfQptLv/xjBEcYaSPyYG/LSRalOmB9tVOx/L8hMy4k9MqJZ7juzEDg4IFvq8ZX7vjpf+DutkaiaHczIOJ7MgmYJ1LO7YlwmMiB4qyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708595937; c=relaxed/simple;
	bh=NBUtaGBsq3vKLhFksNedKSmDIzCWauIMUneem4nIunk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PkoKYe4bgIwbAfKQkrXRUMhMxNVqUxqM2adZXbs7kuPXD4Yc32MyIjYzThBWQnlaViMeuU2uiKd/cs59IIzEyd9bdKR0ClmaW54abbtqCOWC5gjIzUovRoTYAFGqHG74GAXtLMuc8lFCyuhg4A/daos8z7F3T5eDxNcTh0QTgSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pv87byfp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pv87byfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708595936; x=1740131936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NBUtaGBsq3vKLhFksNedKSmDIzCWauIMUneem4nIunk=;
  b=Pv87byfp4RgfQqUnkZGwvvfYuZ/kL7iixF1PI93O/Z+4Zjx0DSl7X3cy
   QEhY5SBis54FANThFIs9yIRdCXADtcQoFSXJ6T4UT4FdBoXc/WstO/v5p
   UZhwOlci7Gq5iHQ32Jf6sy2ar24qMW5Nnnj9hOAlCkPbJpH6bcnwR0FoZ
   DxTZKcrRQbjLXoCYCl/45ZQUAB/zeBQik21JQlxzhIZWs7DIf2swe4ZRk
   5hsAWOJAR40Yu2yURDa75Ntjv1ZLbwE0uJkc8Hq+PLkR2L3DNlzAhjFNz
   AppLSVkRtjP3dti7z/F7kIKHg8NFux77vvo23sb3KJoOgTcHOw4xgA97q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13431009"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="13431009"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 01:58:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5433636"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Feb 2024 01:58:53 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd5qs-0006CG-1H;
	Thu, 22 Feb 2024 09:58:50 +0000
Date: Thu, 22 Feb 2024 17:58:47 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Durrant <pdurrant@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [linux-next:master 7475/8619] arch/x86/kvm/xen.c:660:46: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202402221721.mhF8MNVh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4893c639cc3659cefaa675bf1e59f4e7571afb5c
commit: 01a871852b1133fc5f611ad7c0c072870c90aede [7475/8619] KVM: x86/xen: allow shared_info to be mapped by fixed HVA
config: x86_64-randconfig-121-20240221 (https://download.01.org/0day-ci/archive/20240222/202402221721.mhF8MNVh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221721.mhF8MNVh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221721.mhF8MNVh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/xen.c:660:46: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __user *hva @@     got void * @@
   arch/x86/kvm/xen.c:660:46: sparse:     expected void [noderef] __user *hva
   arch/x86/kvm/xen.c:660:46: sparse:     got void *
   arch/x86/kvm/xen.c:452:9: sparse: sparse: context imbalance in 'kvm_xen_update_runstate_guest' - unexpected unlock
   arch/x86/kvm/xen.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression

vim +660 arch/x86/kvm/xen.c

   615	
   616	int kvm_xen_hvm_set_attr(struct kvm *kvm, struct kvm_xen_hvm_attr *data)
   617	{
   618		int r = -ENOENT;
   619	
   620	
   621		switch (data->type) {
   622		case KVM_XEN_ATTR_TYPE_LONG_MODE:
   623			if (!IS_ENABLED(CONFIG_64BIT) && data->u.long_mode) {
   624				r = -EINVAL;
   625			} else {
   626				mutex_lock(&kvm->arch.xen.xen_lock);
   627				kvm->arch.xen.long_mode = !!data->u.long_mode;
   628	
   629				/*
   630				 * Re-initialize shared_info to put the wallclock in the
   631				 * correct place. Whilst it's not necessary to do this
   632				 * unless the mode is actually changed, it does no harm
   633				 * to make the call anyway.
   634				 */
   635				r = kvm->arch.xen.shinfo_cache.active ?
   636					kvm_xen_shared_info_init(kvm) : 0;
   637				mutex_unlock(&kvm->arch.xen.xen_lock);
   638			}
   639			break;
   640	
   641		case KVM_XEN_ATTR_TYPE_SHARED_INFO:
   642		case KVM_XEN_ATTR_TYPE_SHARED_INFO_HVA: {
   643			int idx;
   644	
   645			mutex_lock(&kvm->arch.xen.xen_lock);
   646	
   647			idx = srcu_read_lock(&kvm->srcu);
   648	
   649			if (data->type == KVM_XEN_ATTR_TYPE_SHARED_INFO) {
   650				gfn_t gfn = data->u.shared_info.gfn;
   651	
   652				if (gfn == KVM_XEN_INVALID_GFN) {
   653					kvm_gpc_deactivate(&kvm->arch.xen.shinfo_cache);
   654					r = 0;
   655				} else {
   656					r = kvm_gpc_activate(&kvm->arch.xen.shinfo_cache,
   657							     gfn_to_gpa(gfn), PAGE_SIZE);
   658				}
   659			} else {
 > 660				void __user * hva = (void *)data->u.shared_info.hva;
   661	
   662				if (!PAGE_ALIGNED(hva) || !access_ok(hva, PAGE_SIZE)) {
   663					r = -EINVAL;
   664				} else if (!hva) {
   665					kvm_gpc_deactivate(&kvm->arch.xen.shinfo_cache);
   666					r = 0;
   667				} else {
   668					r = kvm_gpc_activate_hva(&kvm->arch.xen.shinfo_cache,
   669								 (unsigned long)hva, PAGE_SIZE);
   670				}
   671			}
   672	
   673			srcu_read_unlock(&kvm->srcu, idx);
   674	
   675			if (!r && kvm->arch.xen.shinfo_cache.active)
   676				r = kvm_xen_shared_info_init(kvm);
   677	
   678			mutex_unlock(&kvm->arch.xen.xen_lock);
   679			break;
   680		}
   681		case KVM_XEN_ATTR_TYPE_UPCALL_VECTOR:
   682			if (data->u.vector && data->u.vector < 0x10)
   683				r = -EINVAL;
   684			else {
   685				mutex_lock(&kvm->arch.xen.xen_lock);
   686				kvm->arch.xen.upcall_vector = data->u.vector;
   687				mutex_unlock(&kvm->arch.xen.xen_lock);
   688				r = 0;
   689			}
   690			break;
   691	
   692		case KVM_XEN_ATTR_TYPE_EVTCHN:
   693			r = kvm_xen_setattr_evtchn(kvm, data);
   694			break;
   695	
   696		case KVM_XEN_ATTR_TYPE_XEN_VERSION:
   697			mutex_lock(&kvm->arch.xen.xen_lock);
   698			kvm->arch.xen.xen_version = data->u.xen_version;
   699			mutex_unlock(&kvm->arch.xen.xen_lock);
   700			r = 0;
   701			break;
   702	
   703		case KVM_XEN_ATTR_TYPE_RUNSTATE_UPDATE_FLAG:
   704			if (!sched_info_on()) {
   705				r = -EOPNOTSUPP;
   706				break;
   707			}
   708			mutex_lock(&kvm->arch.xen.xen_lock);
   709			kvm->arch.xen.runstate_update_flag = !!data->u.runstate_update_flag;
   710			mutex_unlock(&kvm->arch.xen.xen_lock);
   711			r = 0;
   712			break;
   713	
   714		default:
   715			break;
   716		}
   717	
   718		return r;
   719	}
   720	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
