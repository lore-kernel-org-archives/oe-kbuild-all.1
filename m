Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DEF14D452
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 06:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724825746; cv=none; b=hEn7e60NrpwH4eMljmXa+tPE8ZNwmgOlLo2FTFrjQfyayOYKSd2VtyvKTSByoNNBLjZRHSUuQ6uX3bkv2qIlt4mg1lTU1IEQbDPBc2Usopk9wpC7R6+IYSB1e9eYeOz7/c0M3gaK+LJOvcpXd67iTOU9/LFpKdW4MAXeVBlXBr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724825746; c=relaxed/simple;
	bh=y0ez0qDTKWr3wwq5M6Zg31OJ+ga5i59RRryI5kBoot0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FmQWQ7hJkKbsUoxvrg30aOOiim45NQ5xf1oCvR2EN2KWCSJsDtLWUSGW0227FPscRnCB+Z82uS4h+qTkc0jVxSjOkglZDHcDdquTTtclqW8MN8vngXFDu1ZIcFwGDoklnXsqlAt/2kDGHuCE7lNZDzwZRobQ9zFSxBdJ+rFP7bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWo8RQbj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWo8RQbj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724825744; x=1756361744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y0ez0qDTKWr3wwq5M6Zg31OJ+ga5i59RRryI5kBoot0=;
  b=CWo8RQbjvT8XzsVa7UkOV246JTLm6KPct/pooTwgAcBpHtqwZNVUgSgt
   gJ1Lifv4mg72lwmJltb56mhTmkeol15iEyAIa1wIV64eP8peKDGEw5X0P
   Pgsyy05LbZVikf3Ld01m1/Zl4KvQHPrZL0Llba0O+EhyZNdiecfE/wBhw
   B7zBOdqmkrBE5klGVtew9Sb0LVPnt1FzHJZoknPvWtsM6XLJZsI3wTYqu
   ukzypiPsDGXZ4E77Q1KoyYJnbF/RJdhb+h4b5uFopE/5oKR1pl0y4thhl
   icRbQIqe3g07kGmz7dNbwEbdEfz9ZLXtS2qGEtPuWHrMQ8gzgyYhxVDts
   g==;
X-CSE-ConnectionGUID: xd48CE55QMaiKjz+E8LW5g==
X-CSE-MsgGUID: B0X5MprZTmO9KsUlUZ543A==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23213330"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="23213330"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 23:15:42 -0700
X-CSE-ConnectionGUID: cRiBBmF2QZuLlL/Jzznsbw==
X-CSE-MsgGUID: hQkBIDTZS9S84HxUJyf2vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="62774735"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Aug 2024 23:15:41 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjBxy-000KXs-1Y;
	Wed, 28 Aug 2024 06:15:38 +0000
Date: Wed, 28 Aug 2024 14:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17746/23570] drivers/dax/.tmp_bus.o:
 warning: objtool: __dax_driver_register()+0xd5: unreachable instruction
Message-ID: <202408281448.DeW129VU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7ad52b4435297d752bdb8c2fce6524544448d4af
commit: 9bb67bd58e6a7e3ef00793b4966be7bb0a346830 [17746/23570] Intel: device-dax: Add support for a dax override driver
config: x86_64-buildonly-randconfig-004-20240825 (https://download.01.org/0day-ci/archive/20240828/202408281448.DeW129VU-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281448.DeW129VU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281448.DeW129VU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dax/.tmp_bus.o: warning: objtool: __dax_driver_register()+0xd5: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
