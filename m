Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9463C060E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 21:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790545795; cv=none; b=fUZE2jZlaYPUGeqHQlFQjCYTji95iBc5iduXFEuN1CKyRqjxqcUzJIRbL3FHK9Y/jVKDcldvFX2xCLFNg92mYRbBqmGVHGEmHBkZ1DtrVL3WiF6FNn6I+JpZ9TakFbqlD38dWjBfyfXifK2BqPbJGsmlJ1wdQ/ZwKPtNP19FK08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790545795; c=relaxed/simple;
	bh=+iTlaAXeG+to4Ties7cATVCAgHeGGwa9q5dppRZKI+o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O2Dom62R53kpUKnKzVIE4cI0o0PrHAPz4ociBROg0xQVDeSB3Vgse0kCsGO/v+WNhpb7D2fpSwacAcsB6qd3RcJtN3zyEXr79vOuCunCSdePkQifAzUr2LBE8znRWbWZm+PAe0Ypg+WrOWCiecYiILG3bx/X+30BWOtjHzC7JlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlDdaA1z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlDdaA1z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790545793; x=1822081793;
  h=date:from:to:cc:subject:message-id;
  bh=+iTlaAXeG+to4Ties7cATVCAgHeGGwa9q5dppRZKI+o=;
  b=dlDdaA1zcyYHFZJGN3titppXegy4bql7u4pNxWXLIEvZle+zcI5v642q
   M7u9YUeC8YVObPNo13v4SlPqJZ7vlBhC/CkieYlpygO3KyPI+xImHBT4d
   BcQjAi9HslkGz/c9leHDix1BapxvXoJ+8DpbJxWFdteTmoVMFjy/FZD+r
   xfJen6X+n4tFlJCOfvmHeqPX4hbeu82YblBj9dAw+58s16VjNZDno2cBk
   CdOegtU1ky2GPRcE0lm3x66+jZKc6P2CCOqDfoNVg2sjfPFMqUuFieRMj
   +uW2pmTJiiKtOSLaSjWFHwikNoWjQXmfBeYnxZIGzFI8TrJr6XHN7VGyE
   A==;
X-CSE-ConnectionGUID: aGiYUo+GTZGvZ3r4HkO7wg==
X-CSE-MsgGUID: QkWe6XqIRiyXqInbRP66nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="100580316"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="100580316"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 14:49:52 -0700
X-CSE-ConnectionGUID: AwRA741nSqmnTuUUaDjlXQ==
X-CSE-MsgGUID: PUjQmVuvTIGEbE6XVu1hNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="273494938"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Sep 2026 14:49:51 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAwkm-00000000NCM-1ex5;
	Sun, 27 Sep 2026 21:49:48 +0000
Date: Mon, 28 Sep 2026 05:49:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-lts 17/17]
 drivers/remoteproc/qcom_q6v5_pas.c:86:6: warning: no previous prototype for
 function 'adsp_segment_dump'
Message-ID: <202609280529.rHQ9rphQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15-lts
head:   7e505717b3a71ca117610a0206603ff695736e50
commit: dfc82cefe7e475a84df64dcdc14ffa5da630921c [17/17] remoteproc: qcom: pas: Adjust the phys addr wrt the mem region
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260928/202609280529.rHQ9rphQ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609280529.rHQ9rphQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609280529.rHQ9rphQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/qcom_q6v5_pas.c:86:6: warning: no previous prototype for function 'adsp_segment_dump' [-Wmissing-prototypes]
      86 | void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
         |      ^
   drivers/remoteproc/qcom_q6v5_pas.c:86:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      86 | void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
         | ^
         | static 
   1 warning generated.


vim +/adsp_segment_dump +86 drivers/remoteproc/qcom_q6v5_pas.c

    85	
  > 86	void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
    87			       void *dest, size_t offset, size_t size)
    88	{
    89		struct qcom_adsp *adsp = rproc->priv;
    90		int total_offset;
    91	
    92		total_offset = segment->da + segment->offset + offset - adsp->mem_phys;
    93		if (total_offset < 0 || total_offset + size > adsp->mem_size) {
    94			dev_err(adsp->dev,
    95				"invalid copy request for segment %pad with offset %zu and size %zu)\n",
    96				&segment->da, offset, size);
    97			memset(dest, 0xff, size);
    98			return;
    99		}
   100	
   101		memcpy_fromio(dest, adsp->mem_region + total_offset, size);
   102	}
   103	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
