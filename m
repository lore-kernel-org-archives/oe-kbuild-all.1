Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749BF18C924
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Nov 2024 14:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732458750; cv=none; b=MST2pdntUm/27vbpONlh1RbzhlMpEYJoq3sNRjHDDdh4Xe1lhq8WlrDW7ourgIR50BTgR5LffhbXYPIJfVLtjvuCJ/tpjphMJRT1qnuRTaxstvsTVX1M8R2tC2b8L/yFgtRfhaGhZQ6Ya5kToS3fkm9bCOD82pT2Dv0WWjaOfQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732458750; c=relaxed/simple;
	bh=xH1KRQHV4+p3E6x2UxDfwd7UnP46uSGmRRqG3yEcO/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VaND5GS2pcIZW7+sioLaq7zn3KjH9Pu3bq4adQh84XghYiT/CnjUN2BBrJaV9VKjjkHEAzURrKp1mwpDPSdzj6f7K0/xcGNt7q2S4buHHSVYJFcOZJKqD9cdtzYmWbz5xxmCHwNdO/dV8aqYG+lmFUnur2w22TER+KvqxfXhK2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVIGBL7E; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVIGBL7E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732458748; x=1763994748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xH1KRQHV4+p3E6x2UxDfwd7UnP46uSGmRRqG3yEcO/w=;
  b=DVIGBL7EC11H4LgRumZReUXJHvJPlYnySKHqQGHQgfp/ByWsJxJ1ab28
   cR76bJUijfzioDoCHR4BzbmPyrxEFN5dSAujRBpcNft9fQGY2RDSCY2Mw
   wBgiVaJ2j8Jw7BL/XUKb4sUgugFF4l/eOuphGjSo3o6Wlpw4eFuH272T/
   C30RvblTBkN+bSTwhx5lOA+FqgUd7Z8h1eiMN48PIUT04c8lFJBzGJR7P
   4+/yTNlO6RuCeOOjTN8iZANIT1Um8EhEpr8AKwBs9MyNuAdtE++aJyTTF
   bSTNYkE8Xiw+RRp8e38tqHviCG3qLkmuct3IE+VnPBqnzEHwrdljtWpd/
   Q==;
X-CSE-ConnectionGUID: LL2PgbW3SC6aO5eoZopwKg==
X-CSE-MsgGUID: EP5c5HE2Tcuvd/c7J4EXTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="49978325"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="49978325"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 06:32:28 -0800
X-CSE-ConnectionGUID: IykvITu3TPaxGhkh65XdPA==
X-CSE-MsgGUID: 3c6Of97uRZm4A465AKgkcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="96094458"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Nov 2024 06:32:27 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFDey-00052P-2Q;
	Sun, 24 Nov 2024 14:32:24 +0000
Date: Sun, 24 Nov 2024 22:31:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback-dev 18/18] ld.lld: error: undefined
 symbol: __aeabi_ldivmod
Message-ID: <202411242226.LIJS1y07-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback-dev
head:   36ae93bcb2d7a7e6d13533fb976c545fc85bdee8
commit: 36ae93bcb2d7a7e6d13533fb976c545fc85bdee8 [18/18] media: v4l2-loopback: Remove v4l2l_mod64()
config: arm-randconfig-002-20241124 (https://download.01.org/0day-ci/archive/20241124/202411242226.LIJS1y07-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241124/202411242226.LIJS1y07-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411242226.LIJS1y07-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __aeabi_ldivmod
   >>> referenced by v4l2-loopback.c:2008 (drivers/media/v4l2-core/v4l2-loopback.c:2008)
   >>>               drivers/media/v4l2-core/v4l2-loopback.o:(v4l2_loopback_write) in archive vmlinux.a
   >>> referenced by v4l2-loopback.c:1512 (drivers/media/v4l2-core/v4l2-loopback.c:1512)
   >>>               drivers/media/v4l2-core/v4l2-loopback.o:(get_capture_buffer) in archive vmlinux.a
   >>> referenced by v4l2-loopback.c:1519 (drivers/media/v4l2-core/v4l2-loopback.c:1519)
   >>>               drivers/media/v4l2-core/v4l2-loopback.o:(get_capture_buffer) in archive vmlinux.a
   >>> referenced 2 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
