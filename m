Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C798B1BF33
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 00:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781225823; cv=none; b=SkNCDWnDmNl3P5lx3oeZyrUhaVHzecwkWSuJ3p6IPn0EKxhUybW8+D5tmy14ghEhrOMhsAKaaU1v2LOTQj50K2t09AT7z8gBYVrQ1HGBdKHkgcFBx2M278nkVv8J5bjTzIZll6BQMzvApPTfqzhUZASUIrqumjNOK6o9QkmT99M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781225823; c=relaxed/simple;
	bh=ySUkO/URq+kM+rnYOlzNBJRwHnR/MX8vl8fsm6DOqew=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tjH9Sd+Spltjerh4BlalGVBLJ0xGsiUWHcCL2nQEA7DxNI5b/2UiPjlHv0c0z4BbBpgXCIjEy1L6VS1Shif3S524OHXpQjTu6nb+aDv3LssKZVR9IaY+QEDK4xyPqM+yL4Lwfw16BvdHZmSnZrTVtlr0lGwPm1AzMHfJiUYf9fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DmKqivrl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmKqivrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781225822; x=1812761822;
  h=date:from:to:cc:subject:message-id;
  bh=ySUkO/URq+kM+rnYOlzNBJRwHnR/MX8vl8fsm6DOqew=;
  b=DmKqivrlvbQuPrgH7cL2adFCRZ2BnqY7wtTwmZLg3KXXO/ONuLq4ai1T
   X1lIdbxWY5y5dCpy8EAR8W5MrALG2Kq/0p6KubezzIXFKipRIbZSUMEcW
   x0sO65TyR9nQgjRav7dd035234OzWRXWx7I45Z0bfqjnmXgucmJ66VS/0
   bOo0kG+AvMV7Ur5pWdcdEQNYOoGqcDwGPaD+IL8ndUvoc15QQdZ5sI6NP
   IsGPkgvu1khWAvOKAljtgdW7xHGSrdjNiVUNbyJIg3xEUjA34hHrmZNTg
   eLnmXrikoP4XL5DpdWuhoG5VgoHpJz7YNpClSUY575gHikoceOR32dGrz
   A==;
X-CSE-ConnectionGUID: SnrShkU8SviJfuTVsFhU/w==
X-CSE-MsgGUID: y00pS1TTS6mJjC8gGa7cMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107489450"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="107489450"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 17:57:01 -0700
X-CSE-ConnectionGUID: Vq27zdRFRSO9N1sS79Gm7A==
X-CSE-MsgGUID: zBemxCjCSayhfIM5ptPxjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="240312242"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jun 2026 17:56:59 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXqCf-0000000049h-1Uw8;
	Fri, 12 Jun 2026 00:56:57 +0000
Date: Fri, 12 Jun 2026 02:56:52 +0200
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>,
 Nuno Sa <nuno.sa@analog.com>
Subject: [nsa:xlnx/fix/buf-mmap-multibuffer 21989/27391] htmldocs:
 Warning: Documentation/devicetree/bindings/iio/adc/adi,ltc2308.yaml
 references a file that doesn't exist:
 Documentation/devicetree/bindings/iio/adc/adc.txt
Message-ID: <202606120233.Et23zS8E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nunojsa/linux xlnx/fix/buf-mmap-multibuffer
head:   a26a8baba71e866951f6abf4fc6c0504770c272e
commit: 376cf0bcf46b1f077b06f8055326635df92bb13e [21989/27391] Merge tag 'xilinx-v2022.2' of https://github.com/Xilinx/linux-xlnx.git
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260612/202606120233.Et23zS8E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120233.Et23zS8E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/admin-guide/sysctl/kernel.rst: :doc:`accounting/delay-accounting.rst`
   Warning: Documentation/bpf/index.rst references a file that doesn't exist: Documentation/bpf/libbpf/libbpf.rst
>> Warning: Documentation/devicetree/bindings/iio/adc/adi,ltc2308.yaml references a file that doesn't exist: Documentation/devicetree/bindings/iio/adc/adc.txt
>> Warning: Documentation/devicetree/bindings/iio/adc/adi,ltc2308.yaml references a file that doesn't exist: Documentation/devicetree/bindings/iio/adc/adc.txt
   Warning: Documentation/devicetree/bindings/net/xilinx_axienet.txt references a file that doesn't exist: Documentation/devicetree/bindings/net/xilinx_tsn.txt
   Warning: Documentation/filesystems/locks.rst references a file that doesn't exist: Documentation/filesystems/mandatory-locking.rst
   Warning: Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst references a file that doesn't exist: Documentation/core-api/irq/irq-affinity
   Warning: Documentation/translations/zh_CN/core-api/memory-hotplug.rst references a file that doesn't exist: Documentation/core-api/memory_hotplug.rst
   Warning: Documentation/translations/zh_CN/doc-guide/kernel-doc.rst references a file that doesn't exist: Documentation/rust/docs.rst
--
   Documentation/admin-guide/sysctl/kernel.rst: :doc:`accounting/delay-accounting.rst`
   Warning: Documentation/bpf/index.rst references a file that doesn't exist: Documentation/bpf/libbpf/libbpf.rst
>> Warning: Documentation/devicetree/bindings/iio/adc/adi,ltc2308.yaml references a file that doesn't exist: Documentation/devicetree/bindings/iio/adc/adc.txt
>> Warning: Documentation/devicetree/bindings/iio/adc/adi,ltc2308.yaml references a file that doesn't exist: Documentation/devicetree/bindings/iio/adc/adc.txt
   Warning: Documentation/devicetree/bindings/net/xilinx_axienet.txt references a file that doesn't exist: Documentation/devicetree/bindings/net/xilinx_tsn.txt
   Warning: Documentation/filesystems/locks.rst references a file that doesn't exist: Documentation/filesystems/mandatory-locking.rst
   Warning: Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst references a file that doesn't exist: Documentation/core-api/irq/irq-affinity
   Warning: Documentation/translations/zh_CN/core-api/memory-hotplug.rst references a file that doesn't exist: Documentation/core-api/memory_hotplug.rst
   Warning: Documentation/translations/zh_CN/doc-guide/kernel-doc.rst references a file that doesn't exist: Documentation/rust/docs.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
