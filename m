Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CE0224D7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 21:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737494431; cv=none; b=p+MitKfRaRky+4YfxXKiU+lufXEtZo8MUbDFRulCRCjOU7TMJhiDPISzxpWscBIdftvupSi2l/fhvJ9le0KoKXQOdnzGBCPzhCjYJu03EJZtkckHXHXHbdlnwimmNTxkx+pFuwmV3+q+zB5B/t0W+Uqc8Yi8b7JLUEl7TO+/RDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737494431; c=relaxed/simple;
	bh=p0bNyGC6Vnn4iMBYvbVjjOWJHQ1KaarpahEpc9bOp+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rkv468cIJQTSQvBM7anfi1rKmyc1cG6k3yjtsZx72hRWk86bnnB6Iwh+bFKiv0R2B2aZ56qy2iXRScaF9UHiR6SbLwZFXD+9Aux2/RYl3HJnHek+dbM7Yfkv3AjJVSJmCIb/Hh8bZFwxmUnlISlY+4Q9PxzoxKHe0cTenucNwyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/pStsrT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/pStsrT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737494428; x=1769030428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p0bNyGC6Vnn4iMBYvbVjjOWJHQ1KaarpahEpc9bOp+w=;
  b=V/pStsrTAEnbIeW5ZiDHesoGNKS8+bsX31/PCXa/mFc2gHh5BVBQZ32H
   wWwvEqt4kRIS5d+au5SpJ2vcLN/Ag+jnr47wQIkT7wGKqDcN3e2tQRizz
   o/nk1zWw3TWeXmh4iHk+9iwJLJCKN0SGCtJP19MNnn3Dy5+6RNyJ3HWtr
   8wdreKGq4nHQW6nkfzacbyY2zV2m44BkV7e6k2odvhMQrBLJehLT8+rrT
   FDriitN+TR9i8u3RUoFlkQXZOpsfl5aiFVjAEVawW6LvfPiFR/OKTlZib
   My/CPrtwL6MW6D3TTFVSApQ/ZyXkTXbSnj7LQs/7lWzhm/D8Kzjk/rqqj
   A==;
X-CSE-ConnectionGUID: twidklsXQ7aRCqAwsT2Trw==
X-CSE-MsgGUID: p1EKdz9NSV+lGc7eMrNQvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37956041"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="37956041"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 13:20:27 -0800
X-CSE-ConnectionGUID: w/AMdUSgS/mELaS5mN+j6g==
X-CSE-MsgGUID: p2TV6c8bTXKPma8MN4gdQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="137754617"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Jan 2025 13:20:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taLfc-000Z07-01;
	Tue, 21 Jan 2025 21:20:24 +0000
Date: Wed, 22 Jan 2025 05:19:29 +0800
From: kernel test robot <lkp@intel.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/kernel/eeh_pe.c:670: warning: Function parameter or
 struct member 'root' not described in 'eeh_pe_state_clear'
Message-ID: <202501220503.sCxDuVI6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sam,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b9d8a295ed6bc3cee846f8e3f27c9c6e9ebe43f2
commit: 9ed5ca66aa66e5ce2e1d8758250a4d740052c8cd powerpc/eeh: Add include_passed to eeh_pe_state_clear()
date:   6 years ago
config: powerpc64-randconfig-002-20231105 (https://download.01.org/0day-ci/archive/20250122/202501220503.sCxDuVI6-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501220503.sCxDuVI6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501220503.sCxDuVI6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/kernel/eeh_pe.c:282: warning: cannot understand function prototype: 'struct eeh_pe_get_flag '
   arch/powerpc/kernel/eeh_pe.c:602: warning: Function parameter or struct member 'root' not described in 'eeh_pe_state_mark'
   arch/powerpc/kernel/eeh_pe.c:602: warning: Function parameter or struct member 'state' not described in 'eeh_pe_state_mark'
   arch/powerpc/kernel/eeh_pe.c:602: warning: Excess function parameter 'pe' description in 'eeh_pe_state_mark'
   arch/powerpc/kernel/eeh_pe.c:620: warning: Function parameter or struct member 'root' not described in 'eeh_pe_mark_isolated'
   arch/powerpc/kernel/eeh_pe.c:620: warning: Excess function parameter 'pe' description in 'eeh_pe_mark_isolated'
   arch/powerpc/kernel/eeh_pe.c:655: warning: Function parameter or struct member 'mode' not described in 'eeh_pe_dev_mode_mark'
   arch/powerpc/kernel/eeh_pe.c:655: warning: expecting prototype for eeh_pe_dev_state_mark(). Prototype was for eeh_pe_dev_mode_mark() instead
>> arch/powerpc/kernel/eeh_pe.c:670: warning: Function parameter or struct member 'root' not described in 'eeh_pe_state_clear'
>> arch/powerpc/kernel/eeh_pe.c:670: warning: Excess function parameter 'data' description in 'eeh_pe_state_clear'
   arch/powerpc/kernel/eeh_pe.c:869: warning: Function parameter or struct member 'edev' not described in 'eeh_restore_one_device_bars'
   arch/powerpc/kernel/eeh_pe.c:869: warning: Excess function parameter 'data' description in 'eeh_restore_one_device_bars'


vim +670 arch/powerpc/kernel/eeh_pe.c

d2b0f6f77ee525 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-04-24  658  
5b6635294418a9 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan  2012-09-07  659  /**
9ed5ca66aa66e5 arch/powerpc/kernel/eeh_pe.c            Sam Bobroff 2018-11-29  660   * eeh_pe_state_clear - Clear state for the PE
5b6635294418a9 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan  2012-09-07  661   * @data: EEH PE
9ed5ca66aa66e5 arch/powerpc/kernel/eeh_pe.c            Sam Bobroff 2018-11-29  662   * @state: state
9ed5ca66aa66e5 arch/powerpc/kernel/eeh_pe.c            Sam Bobroff 2018-11-29  663   * @include_passed: include passed-through devices?
5b6635294418a9 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan  2012-09-07  664   *
5b6635294418a9 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan  2012-09-07  665   * The function is used to clear the indicated state from the
5b6635294418a9 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan  2012-09-07  666   * given PE. Besides, we also clear the check count of the PE
5b6635294418a9 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan  2012-09-07  667   * as well.
5b6635294418a9 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan  2012-09-07  668   */
9ed5ca66aa66e5 arch/powerpc/kernel/eeh_pe.c            Sam Bobroff 2018-11-29  669  void eeh_pe_state_clear(struct eeh_pe *root, int state, bool include_passed)
5b6635294418a9 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan  2012-09-07 @670  {
9ed5ca66aa66e5 arch/powerpc/kernel/eeh_pe.c            Sam Bobroff 2018-11-29  671  	struct eeh_pe *pe;
22fca179240941 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-09-30  672  	struct eeh_dev *edev, *tmp;
22fca179240941 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-09-30  673  	struct pci_dev *pdev;
5b6635294418a9 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan  2012-09-07  674  
9ed5ca66aa66e5 arch/powerpc/kernel/eeh_pe.c            Sam Bobroff 2018-11-29  675  	eeh_for_each_pe(root, pe) {
d2b0f6f77ee525 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-04-24  676  		/* Keep the state of permanently removed PE intact */
432227e9077eec arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-12-11  677  		if (pe->state & EEH_PE_REMOVED)
9ed5ca66aa66e5 arch/powerpc/kernel/eeh_pe.c            Sam Bobroff 2018-11-29  678  			continue;
9ed5ca66aa66e5 arch/powerpc/kernel/eeh_pe.c            Sam Bobroff 2018-11-29  679  
9ed5ca66aa66e5 arch/powerpc/kernel/eeh_pe.c            Sam Bobroff 2018-11-29  680  		if (!include_passed && eeh_pe_passed(pe))
9ed5ca66aa66e5 arch/powerpc/kernel/eeh_pe.c            Sam Bobroff 2018-11-29  681  			continue;
d2b0f6f77ee525 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-04-24  682  
5b6635294418a9 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan  2012-09-07  683  		pe->state &= ~state;
d2b0f6f77ee525 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-04-24  684  
22fca179240941 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-09-30  685  		/*
22fca179240941 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-09-30  686  		 * Special treatment on clearing isolated state. Clear
22fca179240941 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-09-30  687  		 * check count since last isolation and put all affected
22fca179240941 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-09-30  688  		 * devices to normal state.
22fca179240941 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-09-30  689  		 */
22fca179240941 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-09-30  690  		if (!(state & EEH_PE_ISOLATED))
9ed5ca66aa66e5 arch/powerpc/kernel/eeh_pe.c            Sam Bobroff 2018-11-29  691  			continue;
22fca179240941 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-09-30  692  
5b6635294418a9 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan  2012-09-07  693  		pe->check_count = 0;
22fca179240941 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-09-30  694  		eeh_pe_for_each_dev(pe, edev, tmp) {
22fca179240941 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-09-30  695  			pdev = eeh_dev_to_pci_dev(edev);
22fca179240941 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-09-30  696  			if (!pdev)
22fca179240941 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-09-30  697  				continue;
22fca179240941 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-09-30  698  
22fca179240941 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-09-30  699  			pdev->error_state = pci_channel_io_normal;
22fca179240941 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-09-30  700  		}
5b6635294418a9 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan  2012-09-07  701  
b6541db1395298 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-10-01  702  		/* Unblock PCI config access if required */
b6541db1395298 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-10-01  703  		if (pe->state & EEH_PE_CFG_RESTRICTED)
b6541db1395298 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2014-10-01  704  			pe->state &= ~EEH_PE_CFG_BLOCKED;
5b6635294418a9 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan  2012-09-07  705  	}
39bfd715b48374 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2015-07-30  706  }
39bfd715b48374 arch/powerpc/kernel/eeh_pe.c            Gavin Shan  2015-07-30  707  

:::::: The code at line 670 was first introduced by commit
:::::: 5b6635294418a954b5f911375b86d3552cf93f36 powerpc/eeh: Trace EEH state based on PE

:::::: TO: Gavin Shan <shangw@linux.vnet.ibm.com>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
