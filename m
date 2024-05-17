Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691D071B39
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 14:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715957197; cv=none; b=dhufUnWSJegktgZyW6dwhqQt7d7VJAjU1JfNbrKgiKj5cCkLkqabqPSXGSchVatobt+pIN6DJcGDsmUBuW7H/AmfIt9Vk/q94l6tDby170qwn2RWl95jzr2FN6wc/VUUmQaXgACXLMOMQuHKeJub08nRKoQsOhBPBBzXLRsu06E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715957197; c=relaxed/simple;
	bh=gvrf+zEhnnmjTfASj7g1U4tseq21WGEcuRC2k5OkLfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JOjs39rowU3q30JhwzDiuuXdkZBy+jcVQEc9b2TDsgSgtOq2K3Ic7uKReSz1ro6OY1dnV/igrVTqFvGwvephvMtfxmwxLHRxM4wVASu6tSpDSEwfrcvwfDENye3LKs3vC0VPyGqr4DocW+QjClSu4v6S3qjDDXFUHw6fpFwsaUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFEymK/n; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFEymK/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715957195; x=1747493195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gvrf+zEhnnmjTfASj7g1U4tseq21WGEcuRC2k5OkLfg=;
  b=BFEymK/n2h4cm3zkOTruNnrZu4d8gqYwRN3wepNdYj3GCaUvGgm8ROE6
   X5J/qm656Ti3afcRQQDDsD1PMd2TkZ4lyIII/kCmSNdriF35UmHQcuSz5
   PKomx1GuFyTM3NhkkFUQQNzdNTPawk6KiOaNff+GkiB3gd9OC6XKUovfJ
   EjW/wPcXJva++ha17F3seRm0ctfG2HWURbeaWF2MbDoJOpFz3QNZuXOXm
   BvitmBD7lyKOzhBE2GJD7XvBJ8gKxiW9Mh/jWs6MSyEA+DEAZpalNBkUI
   +bS+L1/EM1jzNTYfnw506yw0ilGUsbFflHUIyhzoB/8ImzqtcBhYXpquA
   w==;
X-CSE-ConnectionGUID: 9I9Gdq1YRq+59Blf7QG4fg==
X-CSE-MsgGUID: 2ulDJ0nlTYuBMJgxVFXE4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="11575475"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="11575475"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 07:46:35 -0700
X-CSE-ConnectionGUID: Xfsp2xR7RWaBHjv/EDexBw==
X-CSE-MsgGUID: lHMwePoXS9amwG/0uW8ENA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="36384810"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 17 May 2024 07:46:32 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7yqh-0000oA-19;
	Fri, 17 May 2024 14:46:26 +0000
Date: Fri, 17 May 2024 22:45:35 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6626/6628]
 drivers/crypto/ccp/hygon/psp-dev.c:197:6: warning: no previous prototype for
 'vpsp_set_default_vid_permission'
Message-ID: <202405172217.5nZ7NMSm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   95dac159be359bc7ba42421426462f1a96f50ee9
commit: 49d6d59f664cbf3c13fc0bd01b952a2e9fdbc7d2 [6626/6628] Allow VM without a configured vid to use TKM
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240517/202405172217.5nZ7NMSm-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405172217.5nZ7NMSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405172217.5nZ7NMSm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/psp-dev.c:53:10: warning: no previous prototype for 'atomic64_exchange' [-Wmissing-prototypes]
      53 | uint64_t atomic64_exchange(volatile uint64_t *dst, uint64_t val)
         |          ^~~~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/psp-dev.c:67:5: warning: no previous prototype for 'psp_mutex_init' [-Wmissing-prototypes]
      67 | int psp_mutex_init(struct psp_mutex *mutex)
         |     ^~~~~~~~~~~~~~
>> drivers/crypto/ccp/hygon/psp-dev.c:197:6: warning: no previous prototype for 'vpsp_set_default_vid_permission' [-Wmissing-prototypes]
     197 | void vpsp_set_default_vid_permission(uint32_t is_allow)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/psp-dev.c:504:5: warning: no previous prototype for '__vpsp_do_cmd_locked' [-Wmissing-prototypes]
     504 | int __vpsp_do_cmd_locked(uint32_t vid, int cmd, void *data, int *psp_ret)
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/vpsp_set_default_vid_permission +197 drivers/crypto/ccp/hygon/psp-dev.c

   190	
   191	/**
   192	 * When 'allow_default_vid' is set to 1,
   193	 * QEMU is allowed to use 'vid 0' by default
   194	 * in the absence of a valid 'vid' setting.
   195	 */
   196	uint32_t allow_default_vid = 1;
 > 197	void vpsp_set_default_vid_permission(uint32_t is_allow)
   198	{
   199		allow_default_vid = is_allow;
   200	}
   201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
