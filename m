Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34AE125D6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Jul 2025 08:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753001155; cv=none; b=km6iixqqG9OvGIF1GiMNoXbl28UC5w78yGEpzPGGM8n/wmwHuAiheSyuJkVcY4Gasfd0UL/oMq8InjhYd7qvJTzd0vg8pza6g8wcYef6c7dwi/HxPDkJQlb5Qhq+NFX5pwgaxuWmXb2MCufk47ECA6YSgtkEVhlX5+2NSDPCRt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753001155; c=relaxed/simple;
	bh=addBMxBIgAWNg0NdxYY2tcqv3bj4tzCwer+IEUVWOUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d3Mq3kaoQoUjpFdt93Bdfpx/8wvXZRGq6N/AN/X1W1wUoZEslCoO9By6qq/5AAsZ3rYSLMr5pC78wmTirGxbD7WbyUZWqMt16Xexhuls/dLkViv5+mVb706G9srZ/z25a0SII5gGpGwWBP+kkf09/TBnGtb8btOmotl+3Sz/jYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLGlGNRn; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLGlGNRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753001154; x=1784537154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=addBMxBIgAWNg0NdxYY2tcqv3bj4tzCwer+IEUVWOUU=;
  b=iLGlGNRnjQOWf/SIErcm/JTHCZUbnhoMOGahVSVUiqt78ja2IfJvi561
   7+YO89yGEyikhT8F1VeGcB9eg77x9OHT+ilzSOr5lZkfpAW/8I79bh8bh
   KIzv4OQfibNO0W2PP1I9v13X8QBxmu00NBUyqbeUxmfcCnNfCx89s6IJP
   7Bbo2jB7BxtocSE+JMI3Vs9OkZjZAWcRKKfy5MPMXOu+hB1sIU7hhn8WB
   u+axlmy5qL1PMk9x5iDcIRYaksHPLcS+ce5VoHiEJAvsFVi6v7hM1TI4x
   iEDNzgHaHrBJIbpGBQIuMOywXmgEHb8Wx5J9wALu9rnomy6+L8wRoNTG5
   Q==;
X-CSE-ConnectionGUID: w3lFBAfeQYy8r2aLrQinfA==
X-CSE-MsgGUID: laubpBrkTP2/ND09jWGCKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="54951353"
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="54951353"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 01:45:53 -0700
X-CSE-ConnectionGUID: ML1S1et4R/KvbPvjE69JIQ==
X-CSE-MsgGUID: 4nTY+b+/QqmpiKSLfOsECQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="164232499"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Jul 2025 01:45:52 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udPg5-000G1B-1l;
	Sun, 20 Jul 2025 08:45:49 +0000
Date: Sun, 20 Jul 2025 16:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:next 6/26] vmlinux.o: error: objtool:
 __sev_es_ist_enter+0x91: call to __this_cpu_ist_bottom_va() leaves
 .noinstr.text section
Message-ID: <202507201620.VqD4nnIr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git next
head:   bbcbb857d0378d4f3d1067851b06fe1880910f97
commit: 9baf05c36b57e60541b001f49e29155702f5e702 [6/26] x86/cea: Export an API to get per CPU exception stacks for KVM to use
config: x86_64-randconfig-161-20250720 (https://download.01.org/0day-ci/archive/20250720/202507201620.VqD4nnIr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250720/202507201620.VqD4nnIr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507201620.VqD4nnIr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: __sev_es_ist_enter+0x91: call to __this_cpu_ist_bottom_va() leaves .noinstr.text section
>> vmlinux.o: error: objtool: __sev_es_ist_exit+0x15: call to __this_cpu_ist_top_va() leaves .noinstr.text section
>> vmlinux.o: error: objtool: kernel_exc_vmm_communication+0x20: call to __this_cpu_ist_bottom_va() leaves .noinstr.text section
>> vmlinux.o: error: objtool: vc_switch_off_ist+0xca: call to __this_cpu_ist_top_va() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
