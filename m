Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39BB13D520
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 10:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737714148; cv=none; b=aD/x1twui9F0K5rBTS8iFmTmR49SmKC26qa4kptwcfZsbut6wWdHfL7oO0KQN0CabJ+eHavTsHnQvfq0ICzDm1Q4DpOrpYqpZ/gpcIoynCFQ3Sl07P3a1J5VnzFngPTQgsmwtrn+5h1JENqZcPqpVYEtXIUPWWbcvBlbKnGRTgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737714148; c=relaxed/simple;
	bh=l/RPtmlHlfxZ2p5NsNGrj/8x+hN8uSaPjJEy1cHU7b0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pBWwEiQMSwCgO2iHTxK2S7ZibgNPChhIEUVAOctNEvdAq7jx74nCMGAy09bxzuhYBSGWJAVPkNBAnieU+WwN8Cn53BVGbAwImsrr3zTDBGAl6RZ6rJ/hTKSfx3wudBMKmSyD8t7lCULjAk1bKRydt4Dm7jQVXj4iaDW1B9XVuiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/QrrLbB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/QrrLbB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737714147; x=1769250147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/RPtmlHlfxZ2p5NsNGrj/8x+hN8uSaPjJEy1cHU7b0=;
  b=f/QrrLbBAYj1PM0TLsNswBy0/8lewy9/EUZhYS9blY0WLPpfTSwe5b/s
   gD78t74cPpANHI6+Dz4TlZlkQ16ovwatZd0832QeQYcTLUMrBTkU84lwp
   Ud3vHqrS65wBqH0NM2K45BJ5s2qoURTZ+7i45LR4CtC9fenMedB4Z8vq0
   8k7xGEn1NDVlLYimSEQXmnmrrKoExE/en8QPEF6ezrf6nvq0IJOXNblm6
   b6K2UFsNK2/zlVpyR/o0XeSCLGzvqFHALz/aiH8xYmQOc51oNuuNXnh19
   Qh0LihnNHK1sQRAnqx0jX+UYu9ty0zKAe2Mr3N+p5OgEFRYJNNhi1kPKH
   g==;
X-CSE-ConnectionGUID: MIdnf5X1ROCRgUwiRulNQw==
X-CSE-MsgGUID: dj/atvOgS7mo5gv0CKIKmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="42170963"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="42170963"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 02:22:26 -0800
X-CSE-ConnectionGUID: X7pR136ITp6LTBhZ0OFfbw==
X-CSE-MsgGUID: E+4IV4koRMSdSzl8fZ/jPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112362065"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jan 2025 02:22:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbGpT-000cYt-0e;
	Fri, 24 Jan 2025 10:22:23 +0000
Date: Fri, 24 Jan 2025 18:21:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1413/1413]
 drivers/clk/qcom/dispcc-sdm845.o: warning: objtool: missing symbol for
 section .exit.text
Message-ID: <202501241852.Lcc4ytWS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   da51139d17e9d53d61a9877d9042e43b85d71ee1
commit: 81351776c9fbbbd0de1dc1542f30aacfe68efc4e [1413/1413] clk: qcom: Add display clock controller driver for SDM845
config: x86_64-buildonly-randconfig-004-20250122 (https://download.01.org/0day-ci/archive/20250124/202501241852.Lcc4ytWS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501241852.Lcc4ytWS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241852.Lcc4ytWS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/clk/qcom/dispcc-sdm845.c:7:
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'disp_cc_sdm845_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   drivers/clk/qcom/dispcc-sdm845.c:682:1: note: in expansion of macro 'module_exit'
     682 | module_exit(disp_cc_sdm845_exit);
         | ^~~~~~~~~~~
   drivers/clk/qcom/dispcc-sdm845.c:678:20: note: 'cleanup_module' target declared here
     678 | static void __exit disp_cc_sdm845_exit(void)
         |                    ^~~~~~~~~~~~~~~~~~~
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'disp_cc_sdm845_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/module.h:115:41: note: in expansion of macro 'module_init'
     115 | #define subsys_initcall(fn)             module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/clk/qcom/dispcc-sdm845.c:676:1: note: in expansion of macro 'subsys_initcall'
     676 | subsys_initcall(disp_cc_sdm845_init);
         | ^~~~~~~~~~~~~~~
   drivers/clk/qcom/dispcc-sdm845.c:672:19: note: 'init_module' target declared here
     672 | static int __init disp_cc_sdm845_init(void)
         |                   ^~~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/dispcc-sdm845.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
