Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206FC2B9B9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 16:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735575796; cv=none; b=fjiesSJifuVTAqYTxHreLsZSvBhvcbGZpb88MM9Zz5MGZwL4k55dbaxBSVZsRXP/8Do/SQAzBf/wxlBCEjgLPrJM6mdxCkhzTnutGMtuTQGPzZRLDuxJTG+KnOG+Q1yeMPAjQ+aY843lCO3jsXalj3TOpKZBnM/5hCVnliSoj+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735575796; c=relaxed/simple;
	bh=y89CUTYlxMEvYRvDmNeEZkaWD8n+wwedYPvSOKzQTU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rlgr5XOfDMXXfMCNNA1w5uMDK0MJsL3hv4B040Z24+69lpf0/DD8chF3BpBFkgJZet7/NExLOvIQTvvonwkLwNzDXE7B4DAZSO05WyTOZSIlLBiOCN4kvd6xvquy3wSN6IiJxJ1fMN8t8oNJtIC3vKjPZv4D7NQnxcwnKrqBd0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b3VQxHv1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b3VQxHv1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735575794; x=1767111794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y89CUTYlxMEvYRvDmNeEZkaWD8n+wwedYPvSOKzQTU4=;
  b=b3VQxHv1SidspZW8udv11b1FBfLHey3DXtsWXl5Q5+/eDm9TiYtYQaUy
   /PsXFWV16DIZ25QEQnK7XlqE0lfSIMqjDCvBZt9eUv9TqHMKqf/pErvrU
   Ke4WSUD2MoA9zyWwrb+Aebo3mBKFGWdj9Bk+8jVxEvkbjjl6qYF4IvzrZ
   amLJ6yXBJXLOW/A7OMBDXLxj5g/QTOPiHOhZWqlIDt9LfmKu1izs3G1m0
   TNrtUqVOO6luIH7hcuRjvP0Vd984WTfnTvnMgN2oHXy3uALXaY45iwCUf
   NZfLdhEQEsl7kwCYaXtJLiFATjaCS39ZBdM/3WzdGb791t7KVWMD9wMAW
   Q==;
X-CSE-ConnectionGUID: BL9Ch/FrS9eDriEfHekyrw==
X-CSE-MsgGUID: +BBpgoxJS4SgRSifGy19oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39638115"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="39638115"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 08:23:14 -0800
X-CSE-ConnectionGUID: 8AEObhpQQEmzkHH/Qbyc5Q==
X-CSE-MsgGUID: JguxpvPJQxWelvWQU5Uamg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100667869"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Dec 2024 08:23:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSIXu-0006BU-2B;
	Mon, 30 Dec 2024 16:23:10 +0000
Date: Tue, 31 Dec 2024 00:22:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1673/1673] arch/x86/kvm/svm/csv.c:129:52: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202412310023.KFzowK2B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5672a2cb8a45de45872d2dd25d3dd94348c070eb
commit: 07a18fb6c71ef75cc1205999cd2493b567649466 [1673/1673] KVM: SVM: Prepare memory pool to allocate buffers for KVM_CSV_COMMAND_BATCH
config: x86_64-randconfig-121-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310023.KFzowK2B-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310023.KFzowK2B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310023.KFzowK2B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/svm/csv.c:53:5: sparse: sparse: symbol 'csv_vm_attestation' was not declared. Should it be static?
>> arch/x86/kvm/svm/csv.c:129:52: sparse: sparse: Using plain integer as NULL pointer
>> arch/x86/kvm/svm/csv.c:129:6: sparse: sparse: symbol 'g_trans_mempool' was not declared. Should it be static?

vim +129 arch/x86/kvm/svm/csv.c

   127	
   128	static size_t g_mempool_offset;
 > 129	void *g_trans_mempool[TRANS_MEMPOOL_BLOCK_NUM] = { 0, };
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
