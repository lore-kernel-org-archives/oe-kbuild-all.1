Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8A431A7B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 17:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5yM7Cl+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697477115; x=1729013115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UPb90TO1IdCd0XfNNfxNYvOq40xjZO71NzhTwzCgRDk=;
  b=J5yM7Cl+LXeHbivAXl3FcEYE2bFL27xv/yqmCGV7dnD1ccqP1R5GDMML
   k469A8W2zuVkQ/b8fSHfi2WX6KUNxJ0xVMBEKdEzAAz96vg13n9pDrY9y
   BcctauZAkyJB1zC87FjiQ8/Ltm6W66KmlIF4gQZMechE+vjKft7xjbj/p
   YRemSmwKmmHJli+4s/kbMjFD3/itB9tv6vkB2VOMQ4Z88FON/badEi+Ln
   oCkENYLtd7cXUeCnb6F2CQdN1wCer6a0g98ltz4WKi2bblIT/zpVpSy0a
   IQIdyM7HXpzfHzj1s5t0rUwKYCpjpgad7sYL9eVi2Pdy5nDb1uzhoN4i4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="7162578"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="7162578"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 10:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="821646840"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="821646840"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Oct 2023 10:25:10 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsRL2-0008XZ-1F;
	Mon, 16 Oct 2023 17:25:08 +0000
Date: Tue, 17 Oct 2023 01:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: Om Prakash Singh <quic_omprsing@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 11571/12451] qcom-rng.c:undefined reference to
 `devm_hwrng_register'
Message-ID: <202310170132.IrOpHglA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4d0515b235dec789578d135a5db586b25c5870cb
commit: f29cd5bb64c258f29b4c49452532481f50eb43ca [11571/12451] crypto: qcom-rng - Add hw_random interface support
config: arm64-randconfig-r015-20220507 (https://download.01.org/0day-ci/archive/20231017/202310170132.IrOpHglA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310170132.IrOpHglA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170132.IrOpHglA-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/crypto/qcom-rng.o: in function `qcom_rng_probe':
>> qcom-rng.c:(.text+0x224): undefined reference to `devm_hwrng_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
