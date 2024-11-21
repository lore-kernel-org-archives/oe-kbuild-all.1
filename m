Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA34AD31
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 01:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732152008; cv=none; b=TXhN8QHjAEEKiJDyrc8CTYR44a0FS9HjU1U5szRWQiD+XITAm2qILVWbSeOXOvRcShhAlApmzLt8bnj4XL/hky49P2lSY45hUvdZ8vKKLLAvOlCilVM4lf2ztf2QZDSQRM2P2mcNZOYo7LLf8PCfM4a2pG2P3vvrIhlQ83RBHEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732152008; c=relaxed/simple;
	bh=Z4Zs/rRd5Wl8HK7l9rRVXc7gbEIm2Pb+wQlI4JYYD0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AIlFthWT+/LA7WLtP9nch4xVTMcVqxrGnZxelj1fYLraHF2Q7+PF/oKmPKHbi9r2l/m2EVBFxebIb/ScXUonIJeXiACZxJLjHnZcCmj2MRA9eFLMbusiVQ2fQucSLn5+1vx4otPgNiIHdUiZ7z01meSGXYn1qTV+mLsQcGoB2aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUQdjYAY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUQdjYAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732152007; x=1763688007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z4Zs/rRd5Wl8HK7l9rRVXc7gbEIm2Pb+wQlI4JYYD0w=;
  b=QUQdjYAYxbCojwKkNm91xhOCRjFcHHjxt5wkr07qYfNM1oOIkLTNfI1U
   GWaYKooCrpAwz6MH9fzhp3ZaDYMOUugDvQgf4iw/EhR11axdeXXyR5v2i
   XA61WMm2Tr7ZC24ULvEeKVdhOzjH8O3f+gvKrE/FWp2DNoVsfYQozgoL4
   gxPpEJ3tIGxKxdtB9qn91CKioM4WbMbyL+LrMXI02c7RylfCctn2SU600
   I3eDfShfzmPA6wz4Bo8rjd2O/1rzGBIbFHsS3G5lk51yaZ8mzdN5qexrF
   ARdImizByCm6yPNxmuPeetlizDGWu2TLNJyIYv9pMtuMrNMJ7AnGgkLxQ
   A==;
X-CSE-ConnectionGUID: eCtTDt/KTNCea1+NGyLXSA==
X-CSE-MsgGUID: YKZtzcjpSwydHJTtyCC6zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="31606588"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="31606588"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 17:20:05 -0800
X-CSE-ConnectionGUID: QF/OaeHMSiKxvqQxNJmjcA==
X-CSE-MsgGUID: bEf+qh7hRx+d3sFjyTSdLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="90076893"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Nov 2024 17:20:04 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDvrV-0001HA-11;
	Thu, 21 Nov 2024 01:20:01 +0000
Date: Thu, 21 Nov 2024 09:19:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jyri Sarha <jyri.sarha@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:probes_ipc4_get_config 6/6]
 sound/soc/sof/sof-client-probes-ipc3.c:165: warning: Function parameter or
 struct member 'sof_probe_info_type' not described in
 'ipc3_probes_points_info'
Message-ID: <202411210906.rErAEaEK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux probes_ipc4_get_config
head:   b3d76a472b0c079cfaaabf5a227a3eef8663148d
commit: b3d76a472b0c079cfaaabf5a227a3eef8663148d [6/6] ASoC: SOF: sof-client-probes: Add available points_info(), IPC4 only
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241121/202411210906.rErAEaEK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210906.rErAEaEK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210906.rErAEaEK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/sof-client-probes-ipc3.c:165: warning: Function parameter or struct member 'sof_probe_info_type' not described in 'ipc3_probes_points_info'


vim +165 sound/soc/sof/sof-client-probes-ipc3.c

c0b3dcd844f1a1 Jyri Sarha 2022-08-04  150  
c0b3dcd844f1a1 Jyri Sarha 2022-08-04  151  /**
c0b3dcd844f1a1 Jyri Sarha 2022-08-04  152   * ipc3_probes_points_info - retrieve list of active probe points
c0b3dcd844f1a1 Jyri Sarha 2022-08-04  153   * @cdev:		SOF client device
c0b3dcd844f1a1 Jyri Sarha 2022-08-04  154   * @desc:	Returned list of active probes
c0b3dcd844f1a1 Jyri Sarha 2022-08-04  155   * @num_desc:	Returned count of active probes
c0b3dcd844f1a1 Jyri Sarha 2022-08-04  156   *
c0b3dcd844f1a1 Jyri Sarha 2022-08-04  157   * Host sends PROBE_POINT_INFO request to obtain list of active probe
c0b3dcd844f1a1 Jyri Sarha 2022-08-04  158   * points, valid for disconnection when given probe is no longer
c0b3dcd844f1a1 Jyri Sarha 2022-08-04  159   * required.
c0b3dcd844f1a1 Jyri Sarha 2022-08-04  160   */
c0b3dcd844f1a1 Jyri Sarha 2022-08-04  161  static int ipc3_probes_points_info(struct sof_client_dev *cdev,
c0b3dcd844f1a1 Jyri Sarha 2022-08-04  162  				   struct sof_probe_point_desc **desc,
b3d76a472b0c07 Jyri Sarha 2024-11-16  163  				   size_t *num_desc,
b3d76a472b0c07 Jyri Sarha 2024-11-16  164  				   enum sof_probe_info_type)
c0b3dcd844f1a1 Jyri Sarha 2022-08-04 @165  {
c0b3dcd844f1a1 Jyri Sarha 2022-08-04  166  	return ipc3_probes_info(cdev, SOF_IPC_PROBE_POINT_INFO,
b3d76a472b0c07 Jyri Sarha 2024-11-16  167  				(void **)desc, num_desc,
b3d76a472b0c07 Jyri Sarha 2024-11-16  168  				PROBES_INFO_ACTIVE_PROBES);
c0b3dcd844f1a1 Jyri Sarha 2022-08-04  169  }
c0b3dcd844f1a1 Jyri Sarha 2022-08-04  170  

:::::: The code at line 165 was first introduced by commit
:::::: c0b3dcd844f1a14be28765bf00bddb63e044b680 ASoC: SOF: probes: Separate IPC3 operations to a separate file

:::::: TO: Jyri Sarha <jyri.sarha@intel.com>
:::::: CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
