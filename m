Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FC176049
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 10:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712228394; cv=none; b=tlv41z/FcI559AxPifoYT+2Jzt4vDm2wPRD5Q/X0g2B7HJZny6Rk4JLzuPRk5y5FvV3lyQ086hvY7cy0y5RgDa5S/32Er5RRffUjKCQ4hrT8lMONwe8z9pdw/7OcebqqUrnyJxsW5fr6s8IugxZ0Z5yXunGZY1puO++lF5C0YyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712228394; c=relaxed/simple;
	bh=BiLxkMMK4X1HlsJ0lg9rRJC/64lBfgmFYAPjHdNoygE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qndOMgb+AdwdSD5VizJhyPRfZBAjcg41iI63PNDQ0Ak0svEqcDMoNXqqivi2y8TPtbtxy/o/7ZZ0coP72tTf9H0xAq0WirvhP4ZxMwpXrhbXa9LUNUtjt6PxBFbP6bnEt2Fzyn58AS0VNrAbyrw7rCuT4FRN6tfHeUhfDqWY9As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BuHmSqWd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuHmSqWd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712228387; x=1743764387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BiLxkMMK4X1HlsJ0lg9rRJC/64lBfgmFYAPjHdNoygE=;
  b=BuHmSqWdPbqZv9ja3CJl+TnzYNNlGpSmfobQH5RgikJsJI7hRAOPquu3
   +ndewwCHK3KV6gIagp/iO8QX5OA8FhKNTuD5MRDGNNfpoxJrqhNpPPjBe
   bttZFr2BwJTICUuZrq7B2lmAKr81wL7nighkBQfE05E6ie2gQS3pSl4Zy
   2nceu9WrSsfE94GoeaKHwn+9W5xPpWb6c4sXgTBGs7IuvEYgAmFICRBtW
   vRoVhszt47SNTK1J3VvRy2hds37dkPFYLEYTSHmPRO4l4Z7T0sJpEtdiQ
   hOuZgJ5HFwUrbaplv37WcBQZct1Ui9OSKvIyV1my8FQdnP6yUlBja1ueU
   A==;
X-CSE-ConnectionGUID: 9VAOfaagQBKCj+gIsfWX2A==
X-CSE-MsgGUID: gdfeMRTKSZW/V0NhslvOeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="25007138"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="25007138"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 03:59:45 -0700
X-CSE-ConnectionGUID: ggnl4FexSrSSOG8ipGZQ3A==
X-CSE-MsgGUID: pzs/hhh8S1id31NjZczhyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="19204096"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Apr 2024 03:59:44 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsKon-0000xc-24;
	Thu, 04 Apr 2024 10:59:41 +0000
Date: Thu, 4 Apr 2024 18:59:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7041/7280] ld.lld: error: duplicate symbol:
 remove_mbx_irq
Message-ID: <202404041822.U2KyOb5f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5cf97fd1b2bc5ef3aefe91efc63c73b4721a7a44
commit: bf177ad1d8f72824180b44563c09f37562f645de [7041/7280] drivers: initial support for rnpgbevf drivers from Mucse Technology
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240404/202404041822.U2KyOb5f-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041822.U2KyOb5f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041822.U2KyOb5f-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: remove_mbx_irq
   >>> defined at rnpvf_main.c
   >>>            drivers/net/ethernet/mucse/rnpvf/rnpvf_main.o:(remove_mbx_irq) in archive vmlinux.a
   >>> defined at rnpgbevf_main.c
   >>>            drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.o:(.text+0x9B40) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_remove_mbx_irq
   >>> defined at rnpvf_main.c
   >>>            drivers/net/ethernet/mucse/rnpvf/rnpvf_main.o:(__cfi_remove_mbx_irq) in archive vmlinux.a
   >>> defined at rnpgbevf_main.c
   >>>            drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.o:(.text+0x9B00) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: register_mbx_irq
   >>> defined at rnpvf_main.c
   >>>            drivers/net/ethernet/mucse/rnpvf/rnpvf_main.o:(register_mbx_irq) in archive vmlinux.a
   >>> defined at rnpgbevf_main.c
   >>>            drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.o:(.text+0x9D80) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_register_mbx_irq
   >>> defined at rnpvf_main.c
   >>>            drivers/net/ethernet/mucse/rnpvf/rnpvf_main.o:(__cfi_register_mbx_irq) in archive vmlinux.a
   >>> defined at rnpgbevf_main.c
   >>>            drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.o:(.text+0x9D40) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
