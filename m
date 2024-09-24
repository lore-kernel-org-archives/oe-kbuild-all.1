Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A184A41760
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 20:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727210142; cv=none; b=U3GM+rsw0UNXNSDqSD4tSW83rsca8/AiRtfvO/lrhUb2U+kMQfLyU4uLJpobK0p1xWDJ0BVpaF9P4QCpA7o2ZdKIzvp85sQ1O+y1Nzw/OYNfJiBBDYA5iCoVyxLQzbyeweaJJB6/btrCbcgKaUDJyrEgiRp8qeUhkp8+hHIiV4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727210142; c=relaxed/simple;
	bh=2wiLAnixWDySLrqversEKjvOWIUVSzRM5c2Fd/8Ttx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MggKeUsJn+T4NX2tVnWY57Py/3g9mDaLQXEjlfLwxc9pQF+g9/kxeVPVB6nilCVuukfMAhtUGDOWZgIM35xVkQmi9SkU69awIXxSXHvvBNIxNFbWq4AvpjNsucGf8qNs3D21SlDTT54rZweSAJHBJxDewDxM/0o9UL5C32jre9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ey7zDkta; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ey7zDkta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727210140; x=1758746140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2wiLAnixWDySLrqversEKjvOWIUVSzRM5c2Fd/8Ttx8=;
  b=ey7zDktajUFMF2fdIrLsehdo2b1MEtmUD88f/CB+fyj821QGwoTgPVAq
   WhgxDI0pYoT1Q9NweyS49U34ncXNDH6rbCM+YZp7oLlolEjLRUlohRorK
   WL8ZD69jCQV6xegtpewGhF0oG3nWduzgEEm62uXv60UB946wYKKUesTMU
   YkVHMOMxFvSRuE68oLIQQSNDPD0xuOTa1dx/UPPHY+1o3Q6S62yxVl6uH
   KshNAutZYDqsNZXQzdHXUho3YlivtrR4biSpgQBDi0HJ66Sm1BWgjoOdg
   mivF2Zl+QIEPf3+bOmjkj51af3F8CkJJTfI+zCLf4shkBfxvbhy+JVzDt
   g==;
X-CSE-ConnectionGUID: ZjK7305EQ8eqLaf0ZgTdxA==
X-CSE-MsgGUID: 3Q7DE1W5TxyKeMdVAJ5n3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="30121530"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="30121530"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 13:35:40 -0700
X-CSE-ConnectionGUID: 6t159R3jS+mL+R7FtF4lkA==
X-CSE-MsgGUID: AfLjvgJDQq6aPnUj4fkqsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="94869102"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Sep 2024 13:35:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stCG1-000Iox-0H;
	Tue, 24 Sep 2024 20:35:37 +0000
Date: Wed, 25 Sep 2024 04:35:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiongmengbiao <xiongmengbiao@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13559/14103]
 drivers/crypto/ccp/hygon/csv-dev.c:1009:5: warning: no previous prototype
 for 'vpsp_do_cmd'
Message-ID: <202409250431.vVzeCQ88-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d25e57f47750555950b12145f98d5168319e6712
commit: 0195654dac59fc8953825bf947cd62040cc0c040 [13559/14103] drivers/crypto/ccp: remove multi-level pointers processing for vpsp
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240925/202409250431.vVzeCQ88-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409250431.vVzeCQ88-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250431.vVzeCQ88-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/csv-dev.c:942:5: warning: no previous prototype for '__vpsp_do_cmd_locked' [-Wmissing-prototypes]
     942 | int __vpsp_do_cmd_locked(uint32_t vid, int cmd, void *data, int *psp_ret)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/ccp/hygon/csv-dev.c:1009:5: warning: no previous prototype for 'vpsp_do_cmd' [-Wmissing-prototypes]
    1009 | int vpsp_do_cmd(uint32_t vid, int cmd, void *data, int *psp_ret)
         |     ^~~~~~~~~~~


vim +/vpsp_do_cmd +1009 drivers/crypto/ccp/hygon/csv-dev.c

  1008	
> 1009	int vpsp_do_cmd(uint32_t vid, int cmd, void *data, int *psp_ret)
  1010	{
  1011		int rc;
  1012		int mutex_enabled = READ_ONCE(hygon_psp_hooks.psp_mutex_enabled);
  1013	
  1014		if (is_vendor_hygon() && mutex_enabled) {
  1015			if (psp_mutex_lock_timeout(&hygon_psp_hooks.psp_misc->data_pg_aligned->mb_mutex,
  1016						PSP_MUTEX_TIMEOUT) != 1) {
  1017				return -EBUSY;
  1018			}
  1019		} else {
  1020			mutex_lock(hygon_psp_hooks.sev_cmd_mutex);
  1021		}
  1022	
  1023		rc = __vpsp_do_cmd_locked(vid, cmd, data, psp_ret);
  1024	
  1025		if (is_vendor_hygon() && mutex_enabled)
  1026			psp_mutex_unlock(&hygon_psp_hooks.psp_misc->data_pg_aligned->mb_mutex);
  1027		else
  1028			mutex_unlock(hygon_psp_hooks.sev_cmd_mutex);
  1029	
  1030		return rc;
  1031	}
  1032	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
