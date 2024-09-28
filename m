Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3EE17C9E8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727525118; cv=none; b=B4jVZLVaD78dZaxCptpqtYJ3vodlbIVRQaKEZ4DOg/ZLunqAUTjLLb0qzupKJ13pMklRmpQILfEXfWMIx8zeKnGSv9YKwv1IOKocXo5/RONyEGGCRi7WmOAJjrRAo3ZjzDVmXiNu/pYRZ+ky1dxz+M6cE5e7297Q50MgZlRoAtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727525118; c=relaxed/simple;
	bh=lDjSkqhWpqIeuAYpIhAFp3vpphLlqw85BWy8UoZJ6p4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nVrTXvhDIimfkTrqLdnipIPeuAwrjzuXGtdG/Z3a6OccTSseM6iAUJhxK+UfAOyUy5IaFuWA4MXPG9ht8W+DyvAGQn5AxAXtqXhgIDk/+45tNFY8gkhVqObO5w4u9MNjOgqVfngOokinNVTz1U44QC0rD09mB5IY/mN+OyZRWHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFvvcjJk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFvvcjJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727525116; x=1759061116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lDjSkqhWpqIeuAYpIhAFp3vpphLlqw85BWy8UoZJ6p4=;
  b=YFvvcjJkdMoyummASdO+d8MsUfiR8lf6ttUOxWX7XAcVnJ9vfNlA6SF1
   MmxVlvm4DfuyI/8V2TMnxeth3zJOACG+XIp9F1wwDA/MhVhymKWTaSXFu
   UoJk1gL0R7EFO0u1TWhrTgSKubKWMKi5Q3cm53ZBGdMD6Zcj+9/yUbB5F
   IdyOknyetNev/rbZhZkbpGmiaJdKWfcXJt/HHkqtBfJWmsLAbf4zspiqm
   MODoFSEpLxlgvRWd+J3/fGLPAA590wA3jyTocwGyRX6sHiHw1F8nJ3EPo
   7QrXUHWlBQrnr1RQThBFd5fr9IIDd3112uXq25J9m2layW2Npxu/6nP3h
   A==;
X-CSE-ConnectionGUID: SQQ7t0raRSWaIrvP+NqW1g==
X-CSE-MsgGUID: oMxS7FlaQ9GJLdO6HzRFDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26173774"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26173774"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 05:05:15 -0700
X-CSE-ConnectionGUID: tDD9PdCoSAexTmZVUgFqsQ==
X-CSE-MsgGUID: PO2wkfoLRwqJXOjecAJNNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77736772"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Sep 2024 05:05:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suWCF-000NEh-2A;
	Sat, 28 Sep 2024 12:05:11 +0000
Date: Sat, 28 Sep 2024 20:04:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 114/16788]
 drivers/soc/imx/busfreq-imx8mq.c:304:6: error: redefinition of
 'request_bus_freq'
Message-ID: <202409281918.4cqpMahU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jindong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 75d39f9900d193384e7499f45a63e9268709d9fa [114/16788] MA-17911 soc: imx: Allow IMX8M_BUSFREQ to be loadable as module
config: arm-randconfig-001-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281918.4cqpMahU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281918.4cqpMahU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281918.4cqpMahU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/imx/busfreq-imx8mq.c:304:6: error: redefinition of 'request_bus_freq'
     304 | void request_bus_freq(enum bus_freq_mode mode)
         |      ^~~~~~~~~~~~~~~~
   In file included from drivers/soc/imx/busfreq-imx8mq.c:16:
   include/linux/busfreq-imx.h:58:20: note: previous definition of 'request_bus_freq' with type 'void(enum bus_freq_mode)'
      58 | static inline void request_bus_freq(enum bus_freq_mode mode)
         |                    ^~~~~~~~~~~~~~~~
>> drivers/soc/imx/busfreq-imx8mq.c:340:6: error: redefinition of 'release_bus_freq'
     340 | void release_bus_freq(enum bus_freq_mode mode)
         |      ^~~~~~~~~~~~~~~~
   include/linux/busfreq-imx.h:61:20: note: previous definition of 'release_bus_freq' with type 'void(enum bus_freq_mode)'
      61 | static inline void release_bus_freq(enum bus_freq_mode mode)
         |                    ^~~~~~~~~~~~~~~~
>> drivers/soc/imx/busfreq-imx8mq.c:393:5: error: redefinition of 'get_bus_freq_mode'
     393 | int get_bus_freq_mode(void)
         |     ^~~~~~~~~~~~~~~~~
   include/linux/busfreq-imx.h:72:19: note: previous definition of 'get_bus_freq_mode' with type 'int(void)'
      72 | static inline int get_bus_freq_mode(void)
         |                   ^~~~~~~~~~~~~~~~~


vim +/request_bus_freq +304 drivers/soc/imx/busfreq-imx8mq.c

4c33d92ddf0ca4 Bai Ping 2017-10-30  303  
4c33d92ddf0ca4 Bai Ping 2017-10-30 @304  void request_bus_freq(enum bus_freq_mode mode)
4c33d92ddf0ca4 Bai Ping 2017-10-30  305  {
4c33d92ddf0ca4 Bai Ping 2017-10-30  306  	mutex_lock(&bus_freq_mutex);
4c33d92ddf0ca4 Bai Ping 2017-10-30  307  
4c33d92ddf0ca4 Bai Ping 2017-10-30  308  	if (mode == BUS_FREQ_HIGH)
4c33d92ddf0ca4 Bai Ping 2017-10-30  309  		high_bus_count++;
4c33d92ddf0ca4 Bai Ping 2017-10-30  310  	else if (mode == BUS_FREQ_AUDIO)
4c33d92ddf0ca4 Bai Ping 2017-10-30  311  		audio_bus_count++;
4c33d92ddf0ca4 Bai Ping 2017-10-30  312  	else if (mode == BUS_FREQ_LOW)
4c33d92ddf0ca4 Bai Ping 2017-10-30  313  		low_bus_count++;
4c33d92ddf0ca4 Bai Ping 2017-10-30  314  
4c33d92ddf0ca4 Bai Ping 2017-10-30  315  	if (busfreq_suspended || !bus_freq_scaling_initialized ||
4c33d92ddf0ca4 Bai Ping 2017-10-30  316  		!bus_freq_scaling_is_active) {
4c33d92ddf0ca4 Bai Ping 2017-10-30  317  		mutex_unlock(&bus_freq_mutex);
4c33d92ddf0ca4 Bai Ping 2017-10-30  318  		return;
4c33d92ddf0ca4 Bai Ping 2017-10-30  319  	}
4c33d92ddf0ca4 Bai Ping 2017-10-30  320  
4c33d92ddf0ca4 Bai Ping 2017-10-30  321  	cancel_low_bus_freq_handler();
4c33d92ddf0ca4 Bai Ping 2017-10-30  322  
4c33d92ddf0ca4 Bai Ping 2017-10-30  323  	if ((mode == BUS_FREQ_HIGH) && (!high_bus_freq_mode)) {
4c33d92ddf0ca4 Bai Ping 2017-10-30  324  		set_high_bus_freq(1);
4c33d92ddf0ca4 Bai Ping 2017-10-30  325  		mutex_unlock(&bus_freq_mutex);
4c33d92ddf0ca4 Bai Ping 2017-10-30  326  		return;
4c33d92ddf0ca4 Bai Ping 2017-10-30  327  	}
4c33d92ddf0ca4 Bai Ping 2017-10-30  328  
4c33d92ddf0ca4 Bai Ping 2017-10-30  329  	if ((mode == BUS_FREQ_AUDIO) && (!high_bus_freq_mode) &&
4c33d92ddf0ca4 Bai Ping 2017-10-30  330  		 (!audio_bus_freq_mode)) {
4c33d92ddf0ca4 Bai Ping 2017-10-30  331  		set_low_bus_freq();
4c33d92ddf0ca4 Bai Ping 2017-10-30  332  		mutex_unlock(&bus_freq_mutex);
4c33d92ddf0ca4 Bai Ping 2017-10-30  333  		return;
4c33d92ddf0ca4 Bai Ping 2017-10-30  334  	}
4c33d92ddf0ca4 Bai Ping 2017-10-30  335  
4c33d92ddf0ca4 Bai Ping 2017-10-30  336  	mutex_unlock(&bus_freq_mutex);
4c33d92ddf0ca4 Bai Ping 2017-10-30  337  }
4c33d92ddf0ca4 Bai Ping 2017-10-30  338  EXPORT_SYMBOL(request_bus_freq);
4c33d92ddf0ca4 Bai Ping 2017-10-30  339  
4c33d92ddf0ca4 Bai Ping 2017-10-30 @340  void release_bus_freq(enum bus_freq_mode mode)
4c33d92ddf0ca4 Bai Ping 2017-10-30  341  {
4c33d92ddf0ca4 Bai Ping 2017-10-30  342  	mutex_lock(&bus_freq_mutex);
4c33d92ddf0ca4 Bai Ping 2017-10-30  343  	if (mode == BUS_FREQ_HIGH) {
4c33d92ddf0ca4 Bai Ping 2017-10-30  344  		if (high_bus_count == 0) {
4c33d92ddf0ca4 Bai Ping 2017-10-30  345  			dev_err(busfreq_dev, "high bus count mismatch!\n");
4c33d92ddf0ca4 Bai Ping 2017-10-30  346  			dump_stack();
4c33d92ddf0ca4 Bai Ping 2017-10-30  347  			mutex_unlock(&bus_freq_mutex);
4c33d92ddf0ca4 Bai Ping 2017-10-30  348  			return;
4c33d92ddf0ca4 Bai Ping 2017-10-30  349  		}
4c33d92ddf0ca4 Bai Ping 2017-10-30  350  		high_bus_count--;
4c33d92ddf0ca4 Bai Ping 2017-10-30  351  	} else if (mode == BUS_FREQ_AUDIO) {
4c33d92ddf0ca4 Bai Ping 2017-10-30  352  		if (audio_bus_count == 0) {
4c33d92ddf0ca4 Bai Ping 2017-10-30  353  			dev_err(busfreq_dev, "audio bus count mismatch!\n");
4c33d92ddf0ca4 Bai Ping 2017-10-30  354  			dump_stack();
4c33d92ddf0ca4 Bai Ping 2017-10-30  355  			mutex_unlock(&bus_freq_mutex);
4c33d92ddf0ca4 Bai Ping 2017-10-30  356  			return;
4c33d92ddf0ca4 Bai Ping 2017-10-30  357  		}
4c33d92ddf0ca4 Bai Ping 2017-10-30  358  		audio_bus_count--;
4c33d92ddf0ca4 Bai Ping 2017-10-30  359  	} else if (mode == BUS_FREQ_LOW) {
4c33d92ddf0ca4 Bai Ping 2017-10-30  360  		if (low_bus_count == 0) {
4c33d92ddf0ca4 Bai Ping 2017-10-30  361  			dev_err(busfreq_dev, "low bus count mismatch!\n");
4c33d92ddf0ca4 Bai Ping 2017-10-30  362  			dump_stack();
4c33d92ddf0ca4 Bai Ping 2017-10-30  363  			mutex_unlock(&bus_freq_mutex);
4c33d92ddf0ca4 Bai Ping 2017-10-30  364  			return;
4c33d92ddf0ca4 Bai Ping 2017-10-30  365  		}
4c33d92ddf0ca4 Bai Ping 2017-10-30  366  		low_bus_count--;
4c33d92ddf0ca4 Bai Ping 2017-10-30  367  	}
4c33d92ddf0ca4 Bai Ping 2017-10-30  368  
4c33d92ddf0ca4 Bai Ping 2017-10-30  369  	if (busfreq_suspended || !bus_freq_scaling_initialized ||
4c33d92ddf0ca4 Bai Ping 2017-10-30  370  		!bus_freq_scaling_is_active) {
4c33d92ddf0ca4 Bai Ping 2017-10-30  371  		mutex_unlock(&bus_freq_mutex);
4c33d92ddf0ca4 Bai Ping 2017-10-30  372  		return;
4c33d92ddf0ca4 Bai Ping 2017-10-30  373  	}
4c33d92ddf0ca4 Bai Ping 2017-10-30  374  
4c33d92ddf0ca4 Bai Ping 2017-10-30  375  	if ((!audio_bus_freq_mode) && (high_bus_count == 0) &&
4c33d92ddf0ca4 Bai Ping 2017-10-30  376  		(audio_bus_count != 0)) {
4c33d92ddf0ca4 Bai Ping 2017-10-30  377  		set_low_bus_freq();
4c33d92ddf0ca4 Bai Ping 2017-10-30  378  		mutex_unlock(&bus_freq_mutex);
4c33d92ddf0ca4 Bai Ping 2017-10-30  379  		return;
4c33d92ddf0ca4 Bai Ping 2017-10-30  380  	}
4c33d92ddf0ca4 Bai Ping 2017-10-30  381  
4c33d92ddf0ca4 Bai Ping 2017-10-30  382  	if ((!low_bus_freq_mode) && (high_bus_count == 0) &&
4c33d92ddf0ca4 Bai Ping 2017-10-30  383  		(audio_bus_count == 0)) {
4c33d92ddf0ca4 Bai Ping 2017-10-30  384  		set_low_bus_freq();
4c33d92ddf0ca4 Bai Ping 2017-10-30  385  		mutex_unlock(&bus_freq_mutex);
f21ac11d38e96c Bai Ping 2018-01-08  386  		return;
4c33d92ddf0ca4 Bai Ping 2017-10-30  387  	}
4c33d92ddf0ca4 Bai Ping 2017-10-30  388  
4c33d92ddf0ca4 Bai Ping 2017-10-30  389  	mutex_unlock(&bus_freq_mutex);
4c33d92ddf0ca4 Bai Ping 2017-10-30  390  }
4c33d92ddf0ca4 Bai Ping 2017-10-30  391  EXPORT_SYMBOL(release_bus_freq);
4c33d92ddf0ca4 Bai Ping 2017-10-30  392  
4c33d92ddf0ca4 Bai Ping 2017-10-30 @393  int get_bus_freq_mode(void)
4c33d92ddf0ca4 Bai Ping 2017-10-30  394  {
4c33d92ddf0ca4 Bai Ping 2017-10-30  395  	return cur_bus_freq_mode;
4c33d92ddf0ca4 Bai Ping 2017-10-30  396  }
4c33d92ddf0ca4 Bai Ping 2017-10-30  397  EXPORT_SYMBOL(get_bus_freq_mode);
4c33d92ddf0ca4 Bai Ping 2017-10-30  398  

:::::: The code at line 304 was first introduced by commit
:::::: 4c33d92ddf0ca4ea4f89663dc13cdff6ef2695b6 MLK-16689-03 driver: soc: Add busfreq driver for imx8mq

:::::: TO: Bai Ping <ping.bai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
