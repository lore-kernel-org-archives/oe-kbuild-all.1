Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BBA382
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 00:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731456877; cv=none; b=ZSU/+95IHUcsSPbyfbaiUn+uWwv3OgUjkSgGZDGB7Ax5hlPAPHphEgj1nod3qcScN0HIW3X+ExGxrvSXhFp0HVjZ9qWpjLrMUSg1mDn8srUjnxB4UGJSmIkrP3wGmrh/o11SgiXwSOsrgfDj0glwV1TEuFGk/YRGUfing+pD1hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731456877; c=relaxed/simple;
	bh=wgocs9VZhC3L763hhcseqs4EVe2IDGgPxL7+pj/ELW0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SqDuITWgb9fVbRKBrrPJDrt3/ytMnrGmTuh4bfvYHw6jirKGHRKErTOvz9wxBLtSeSs14moPB/Z4hv1SorQ7ss0fl6JuSUjwWsuJoF8ruUSovJGQeo6YxkdnALML2BSRK3MvSECy/Z+PoymgXLxrDYz+LVg37z4P6rRXNzTVSqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0tL3AvO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0tL3AvO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731456877; x=1762992877;
  h=date:from:cc:subject:message-id:mime-version;
  bh=wgocs9VZhC3L763hhcseqs4EVe2IDGgPxL7+pj/ELW0=;
  b=h0tL3AvOIZ9ZjHyvjoZQ4VmNbUfYWuXjdRVa8DA+zRQtK7lxCJagT1LN
   LiCvkcQe7AakIbYfed0e1Efys6YfMhYVk1k6By5CnfQptPe807iL/LYZb
   6j6b6NKU5nNxitlWF5+59AUAj+kb0Ha8vUTX59PZQ0lSESRdC60BDCM8d
   BhDibHK0ZeutvTq8rDowLdwXPxPaFMvOW41yUObPDvuovwa0ENicixIyu
   2OCV1wHo4ss/tm843JX3deVql4nAHVPb0bjlYOz3nKdF59sx+pqN01Eid
   blinIavdisiO2Ehk6cPFl8JtK++kLgdhwpyEVoSLrmhAxghd1OBEqniIa
   w==;
X-CSE-ConnectionGUID: D3sifUl+TzOmHaWK6LokSg==
X-CSE-MsgGUID: ROv83cH/Trm9ZVF6ydlBDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53875978"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53875978"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 16:14:36 -0800
X-CSE-ConnectionGUID: s8muOC0FTIG8q7E+krcmVA==
X-CSE-MsgGUID: pGTe6CNRQ+uOTCDuy/E6zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="91737004"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Nov 2024 16:14:35 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB11k-0001rZ-2W
	for oe-kbuild-all@lists.linux.dev;
	Wed, 13 Nov 2024 00:14:32 +0000
Date: Wed, 13 Nov 2024 08:13:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/dovetail-xenomai 3877/13313]
 kernel/irq/chip.c:551:13: warning: no previous prototype for function
 'forward_irq_event'
Message-ID: <202411130846.wV5behCn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Philippe,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.6/dovetail-xenomai
head:   8025dd14d72f1eee946ab67036c7a3a569861654
commit: eecd1ea84eb02b73c7daca82302f32a7e90941e2 [3877/13313] genirq: irq_pipeline: fix boot hang w/ IRQ_PIPELINE off
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241113/202411130846.wV5behCn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130846.wV5behCn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130846.wV5behCn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/chip.c:551:13: warning: no previous prototype for function 'forward_irq_event' [-Wmissing-prototypes]
     551 | irqreturn_t forward_irq_event(struct irq_desc *desc)
         |             ^
   kernel/irq/chip.c:551:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     551 | irqreturn_t forward_irq_event(struct irq_desc *desc)
         | ^
         | static 
   1 warning generated.


vim +/forward_irq_event +551 kernel/irq/chip.c

   550	
 > 551	irqreturn_t forward_irq_event(struct irq_desc *desc)
   552	{
   553		return IRQ_NONE;
   554	}
   555	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
