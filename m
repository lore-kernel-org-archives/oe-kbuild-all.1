Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53D466B25
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706693840; cv=none; b=cLZJN5+Jjaa2pclzdaymlS+nvOocDtQ31IUoGnJGwwBxiqltO/jsqdyq3jvAjEhtxOQ22fa74jSfOPafLmvwW8hjG7pLVY1NZYG1CFVE7J7N3b2RPdeKVfUenk8PgDjjCDj4yBeKWPFrXCw29kkwuVNzAgX1pSLXlFRt40YkQx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706693840; c=relaxed/simple;
	bh=We2RC7PTza+pIZrt15gqKgEG96xufDjUDddxw1TqCEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NzafgD2STpYlMMfpQE2FJwftaPmINS/DjUea7vRZXDs+o0nDcCN3h3VfvwIX8O7wU0vkwFLSdLIyo2l1LppelzSDmB88JEIq2b4GKcUPq+bTjG8ftg58+HLz+EWbcEm1u1bBz4Z6zt9yWy3App9gGjNfAPWM1BxIBaZI9bwVtXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0/AZEAO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0/AZEAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706693838; x=1738229838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=We2RC7PTza+pIZrt15gqKgEG96xufDjUDddxw1TqCEo=;
  b=G0/AZEAOpS7+BCAmjuEd3jthv47ZLdnEHqSEPxTj07MpdYTm3ltoWM32
   zfnxHzpY0I2MXGlF7ApcrnsOSzVJtXNr8xTjweWclemtdzRrpcbhw4d1b
   encQKc1CMUdBf2bM4V02pI7dH2m+/nXDZ4HamjtpR29xOF1ur8bCTgBbp
   2ZUfbSHu4Gjr0BVXfxCR40mHvlbEE9RgGEYnpOSo1jVWkmtODsaqjoAGQ
   sgfLOIifuVzzxfOZ8drBGBDt3zqsD1R2Qdg2hMzNPLy8HAW6XUZirxBxT
   grmF55ZDdzlu3miJXLjHP0bKblVl8cP4h0ykorUVcM854iYrpQmkC26Vg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2488803"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="2488803"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 01:37:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="36805506"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 31 Jan 2024 01:37:17 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV71r-0001On-1w;
	Wed, 31 Jan 2024 09:37:12 +0000
Date: Wed, 31 Jan 2024 17:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2852/2881] make[5]: *** No rule to make target
 'arch/x86/crypto/sm3-zhaoxin-gmi.o', needed by 'arch/x86/crypto/built-in.a'.
Message-ID: <202401311709.vD4xY2lB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3fa3a33cab8bb921b3e1f6639855f4549009cd90
commit: 492d0f14535f44a57c5ea2b5d3d618f5f8bc928c [2852/2881] Add support for Zhaoxin GMI SM3 Secure Hash algorithm
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240131/202401311709.vD4xY2lB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311709.vD4xY2lB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311709.vD4xY2lB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'arch/x86/crypto/sm3-zhaoxin-gmi.o', needed by 'arch/x86/crypto/built-in.a'.
   make[5]: Target 'arch/x86/crypto/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
