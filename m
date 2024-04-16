Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1E9137C59
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 19:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713295852; cv=none; b=P3gl3Gi4nqwqDxuqUYGVe4uPeIlUNbB0/Xr8xFhxLm8Q7frXd9XyFS3HzcY8p//qoVRChaSkJLcpAwd9QoFrk5wVlaOLj77rKrZDXtTz1j6E3htjJBv8FASGu+RzdpK2z5qyCvQYIbfeHpvXYpgH+c97oRY3j1dnFGcoeSG3bw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713295852; c=relaxed/simple;
	bh=mg9cKio5KRmFU9AIM5QekrhkK0LKhZXtX5UpLdTryjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hwu3cvzW7hbvqUXG0auzj4jQDbnhDrBztxaU3gLLk2qvpsE5rlJHZUyFOtdfY2OgovzV5AyTPX/Roz5IE4hOiXAM5Z1IW0TcoZcHHD+KSLTeNxHx8Gx075+jSHQ6/RusfZesNIIGCm7Tlyl2odvopBHZV2i7Ds/NyGV+iWk6qBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOw9qfdf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOw9qfdf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713295851; x=1744831851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mg9cKio5KRmFU9AIM5QekrhkK0LKhZXtX5UpLdTryjw=;
  b=fOw9qfdfrREk2MShwKwd6yDmZF/TdmTJJBh5vXpP+vjNuseMfQVc984u
   lJ+qcu6my50SFtUQZGBYd3rLBphOxfpf9Z1mR93wWMqeL9UHEmXFEhpSS
   xv42GX9nWyr/XKrKhZHVsXyexus/GX3GP7OTFYnNYHY4PdyWN6N4mD6Pf
   VSMg0n6JftVbQ02/trR5k6U4irt4Atias1DeKJiSd6LcV9bTC40iu3M8K
   5AwpwFq4PV+07tn/DesU+h0Ke4LtCcVum/uOsB96GYpLoDhB8b+4JTaiv
   RibeosMZEsosp2ermT1GvWi0z6rMsayjCFwCQeDoabtmYCwXSZhyDiJxB
   A==;
X-CSE-ConnectionGUID: Hvdr7pTyQtSBqG+zetWVmQ==
X-CSE-MsgGUID: +EPzS6MJTyS1mw3p5flM+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19362868"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="19362868"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:30:50 -0700
X-CSE-ConnectionGUID: VMPWsMCQRPepLzO56FzQsQ==
X-CSE-MsgGUID: UW3P5+VNS72RwKqK7zTq9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="45651480"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 16 Apr 2024 12:30:49 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwoVy-0005fk-2q;
	Tue, 16 Apr 2024 19:30:46 +0000
Date: Wed, 17 Apr 2024 03:30:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5790/6520] netdev.c:undefined reference to
 `page_pool_alloc_pages'
Message-ID: <202404170348.thxrboF1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66e4190e92ce0e4a50b2f6be0e5f5b2e47e072f4
commit: 1580cbcbfe770b0a7fb76735c1a601483335c1c2 [5790/6520] net: netdevsim: add some fake page pool use
config: powerpc-randconfig-r006-20211103 (https://download.01.org/0day-ci/archive/20240417/202404170348.thxrboF1-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404170348.thxrboF1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404170348.thxrboF1-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/net/netdevsim/netdev.o: in function `nsim_pp_hold_write':
>> netdev.c:(.text+0x378): undefined reference to `page_pool_alloc_pages'
   powerpc-linux-ld: drivers/net/netdevsim/netdev.o: in function `nsim_open':
>> netdev.c:(.text+0x2288): undefined reference to `page_pool_create'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
