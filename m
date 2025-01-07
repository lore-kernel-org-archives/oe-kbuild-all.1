Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573E11D8DFE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 21:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736284473; cv=none; b=jct2iz28qIVNMQ8aHyUC4XBfuN1dlLTPnf9v9c+yEcQrdG1Y7TYXrpM+A3qQ35KjgqrgNCU60Td/+W3yy97qV3RBC9kDfU8qwxdQzci4LV9pnKq1joPXvkqI8BCEyDwuMAIOUJsW7mlS1BbF1EX3/oJEqTw51KLCdQ26N40q4mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736284473; c=relaxed/simple;
	bh=c+nxGaBVXXfcK5TN46qh5QaxVznbZEP9lt6hvESyNnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZTc3F9Qcc6ybF5GHPpsob4PiLui+OMqHj0oPXLDxd4afko1CdZ+LIY5ILxdAuj0VVjAZw6M7p+x9VWCMb7UxkBmRF416Ybn7FyiaDnrybqh5rSzQBRCeJNK7ndm7eoie+2z+OKQT17r5Tij9azpR6dAzHuyxpeMH4lo4jgaFw1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWL2l+No; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWL2l+No"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736284472; x=1767820472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c+nxGaBVXXfcK5TN46qh5QaxVznbZEP9lt6hvESyNnk=;
  b=VWL2l+No3nark8NeMCmjp8K7N0pJqfM9kFwq1ZbGVC/O4HxI0eoogVAC
   LMv2SwzcTjRG4GeJ7zTRuNlCR5eDi7VdJCAShj8FWjCFvXz4wogew6bkM
   11Pbw9dCq73SvGTFf41losmKXYdE7gtZcgqTDfEWhnBm4cINhrZlGC0op
   zAg3RpMG76vzujsxiGdVnaUxgWtAWUcNmNlXwqd9D8jiMUNS3K7WBRXUq
   FHZr+VLrX0HH1f1oJvAAIXkMNP09ai1dvVmqZxmqPxk6+/EvQkzJ4QmQs
   9k+9uvmdbjbeL0QNmPvzh2QdY1eOLEe5u/kt0kZbjVswNnbyYdbk7g8K1
   g==;
X-CSE-ConnectionGUID: gmDO1ephQ6KZOLprm57T0w==
X-CSE-MsgGUID: RM9ZO+1oRRGQFpqa1QieyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36186018"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36186018"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 13:14:31 -0800
X-CSE-ConnectionGUID: CCw7XcRKTfqlBUv+e2qLKQ==
X-CSE-MsgGUID: /O561IFcTYG3KLzl8u+VMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="107754609"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Jan 2025 13:14:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVGuB-000FEX-0u;
	Tue, 07 Jan 2025 21:14:27 +0000
Date: Wed, 8 Jan 2025 05:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/kernel/eeh_pe.c:670: warning: Function parameter or
 struct member 'root' not described in 'eeh_pe_state_clear'
Message-ID: <202501080538.nx0eXGFn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fbfd64d25c7af3b8695201ebc85efe90be28c5a3
commit: 9ed5ca66aa66e5ce2e1d8758250a4d740052c8cd powerpc/eeh: Add include_passed to eeh_pe_state_clear()
date:   6 years ago
config: powerpc64-randconfig-002-20231105 (https://download.01.org/0day-ci/archive/20250108/202501080538.nx0eXGFn-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080538.nx0eXGFn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080538.nx0eXGFn-lkp@intel.com/

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
