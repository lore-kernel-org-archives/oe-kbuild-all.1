Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435A518030
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 15:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727538923; cv=none; b=sNHCeCdJN5z+UhFgYenWku/8rW72tOL6X/7kEqty7peoQ4ZUSIixomeNZosiNBi4E/C9V7cWiM9l1gGa+shyKxNYDCQgIJZadS6TGfwgfPfIPev7qZKY59RQMfvl4CnO/x9V4+yJw1Oum4uSowRHPu1ft9YKgRuhM5cT184WrFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727538923; c=relaxed/simple;
	bh=O6AMbQWDCQIbpaelS8dd3UbgEe8rlCO+7dXya7gk01Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FuRrZzHa+fLITkSAClRva0x2s/anbaJ8WESGup3JsfvcUjHXBMYG8rqIevjj3OrJyOo1G5rRyAuugFwV+zA2HBQosVw4/YdBZjKbYWckSLTnS80OnCreZs45RkoDMVZlPsae4lCaC9IY1SiSYM1n+aRwVaBGLspho8IO6BP6SxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkXJXabV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkXJXabV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727538922; x=1759074922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O6AMbQWDCQIbpaelS8dd3UbgEe8rlCO+7dXya7gk01Y=;
  b=YkXJXabV4shluPcM3OcL6Qg3SUV8MOBgZTKl4etW4M92jep4i6042qHV
   IonN9+YtXiSLLgcM0lX+hbBUMrASByQsPSuWdxOAdNBbwsluLHL3quBRA
   5q7pmQ9dkJm7x1+Nzcf26u+0vj67+3imou4MCXte8H1AY48htyqjfklBZ
   rtyEpOsq9S/rXdAfGhgPOEonBnxa5B5sIbDZu5X38J8VZx1Kg1qFaDCMz
   PGAGZaloi7Jywk67z92aayLrWsUVU1APCxjztEjnc0F3RNLjvDr5EHwW/
   8VI7BRJG4qlISwRMMl10mTJZeRVOE44jp9gui6bFgpAM7Sx6IEoOl3cTZ
   A==;
X-CSE-ConnectionGUID: UeekdvVmSgmz0eNpFuTTRQ==
X-CSE-MsgGUID: Za0fyUemQeG2nEHgEP5T9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26542400"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26542400"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 08:55:21 -0700
X-CSE-ConnectionGUID: FVUv4okqTl+t2fewfHhXEA==
X-CSE-MsgGUID: jmqNdMNCSNqaYhLLPl1FdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72408421"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Sep 2024 08:55:19 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suZmv-000NOJ-0X;
	Sat, 28 Sep 2024 15:55:17 +0000
Date: Sat, 28 Sep 2024 23:54:39 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 159/16788]
 sound/soc/fsl/fsl_easrc_m2m.c:19:6: warning: no previous prototype for
 function 'fsl_easrc_get_status'
Message-ID: <202409282301.XswSu76j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 719a8ccd080c197dfe5f8373fbacc3928626300e [159/16788] MLK-21940-4: ASoC: fsl_easrc: Support the m2m function
config: i386-buildonly-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240928/202409282301.XswSu76j-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282301.XswSu76j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282301.XswSu76j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/fsl/fsl_easrc.c:1754:
>> sound/soc/fsl/fsl_easrc_m2m.c:19:6: warning: no previous prototype for function 'fsl_easrc_get_status' [-Wmissing-prototypes]
      19 | void fsl_easrc_get_status(struct fsl_asrc_pair *ctx,
         |      ^
   sound/soc/fsl/fsl_easrc_m2m.c:19:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      19 | void fsl_easrc_get_status(struct fsl_asrc_pair *ctx,
         | ^
         | static 
>> sound/soc/fsl/fsl_easrc_m2m.c:282:5: warning: no previous prototype for function 'fsl_easrc_process_buffer_pre' [-Wmissing-prototypes]
     282 | int fsl_easrc_process_buffer_pre(struct fsl_easrc_m2m *m2m, bool dir)
         |     ^
   sound/soc/fsl/fsl_easrc_m2m.c:282:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     282 | int fsl_easrc_process_buffer_pre(struct fsl_easrc_m2m *m2m, bool dir)
         | ^
         | static 
>> sound/soc/fsl/fsl_easrc_m2m.c:415:6: warning: no previous prototype for function 'fsl_easrc_submit_dma' [-Wmissing-prototypes]
     415 | void fsl_easrc_submit_dma(struct fsl_easrc_m2m *m2m)
         |      ^
   sound/soc/fsl/fsl_easrc_m2m.c:415:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     415 | void fsl_easrc_submit_dma(struct fsl_easrc_m2m *m2m)
         | ^
         | static 
   3 warnings generated.


vim +/fsl_easrc_get_status +19 sound/soc/fsl/fsl_easrc_m2m.c

    18	
  > 19	void fsl_easrc_get_status(struct fsl_asrc_pair *ctx,
    20				  struct asrc_status_flags *flags)
    21	{
    22		flags->overload_error = 0;
    23	}
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
