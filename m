Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637914EB43
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 21:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712438874; cv=none; b=CyTcBVttaga+afS7AdDe+DUA46IQYMeyxu00eCaAt4wrALIZp/TcVPYx2DAimKXHuEjWKo3uRUZVMqop8rIozvzzqttstHGhjnhyHUuMyNUaLbNVheH9UicGbYoCmwxkspb/k0oelpzSPEJSQPA7lWJpUwwrTiyvjMvc06HkaIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712438874; c=relaxed/simple;
	bh=2b0Nr3gYJ0JwKErKfy/BhcuaCFAxl4R9PEkoCmiww3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NKbMe+UR4OiLdXUOyBXjsbcTKkRw1bKdWYVhLlyRLnAWn08bvDFSxFWWTAakbCxjlhEXXoHRkc9JlWqxKNqEsgJOCfK0PU20nVnkP7F9mcwwasGu0VUFN+vk4DL9gI8vkf5Nz3Ayd5EKvjsgJqaXHAUdPpu/mtPBX/fpnn/iHvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QzzVxGV4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QzzVxGV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712438872; x=1743974872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2b0Nr3gYJ0JwKErKfy/BhcuaCFAxl4R9PEkoCmiww3c=;
  b=QzzVxGV4w2GZTz97LVa5PsAmgNM5y2cSjXbDdznsY6WgCsvooC3QWhdn
   MMf98HEjgVszoNAIS4Kqu9h52s98xEL8BDI2BL64mBVnnNnavSAY9nMQu
   NJhUBTyoq7frbcnY1PdssH8lJbn0Ak5BH9i1SdqD6z+qn7WFp9xExCe4H
   +fRkg/JaWGLjwI+6e+tH1RhyF1tEOjlmQV6+lAgLtssFNusbONh8zVV9l
   qOFWFFY103cYT1i6sy62BZnfvnhIQu5IUdHbInUNDTwC6v1GtqAl0sgOm
   ClKh4RDk6iqxWBRqf2AArO8uOuyByc4zZJDIyCtWfOXiHgIuXsNIuli98
   w==;
X-CSE-ConnectionGUID: 0UKz21eOTUyBvckjos2HoA==
X-CSE-MsgGUID: 3Z3P0sapSIOoRl9oZD1pgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="19112409"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="19112409"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 14:27:52 -0700
X-CSE-ConnectionGUID: KYxn87VZR120CWBkVPMQ/Q==
X-CSE-MsgGUID: QMf2aKdPTyigqXPXCtwPYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="20034968"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2024 14:27:50 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtDZj-0003r0-1N;
	Sat, 06 Apr 2024 21:27:47 +0000
Date: Sun, 7 Apr 2024 05:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [drm-misc:for-linux-next 1/3]
 drivers/accel/qaic/qaic_debugfs.h:16:5: warning: no previous prototype for
 'qaic_bootlog_register'
Message-ID: <202404070542.VUa3Q4PZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   e495e523b888a6155f82c767d34c8d712a41ee54
commit: 5f8df5c6def641c164ed1b673d47a41fdd0013f8 [1/3] accel/qaic: Add bootlog debugfs
config: csky-randconfig-r113-20240407 (https://download.01.org/0day-ci/archive/20240407/202404070542.VUa3Q4PZ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240407/202404070542.VUa3Q4PZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070542.VUa3Q4PZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/accel/qaic/qaic_drv.c:31:
>> drivers/accel/qaic/qaic_debugfs.h:16:5: warning: no previous prototype for 'qaic_bootlog_register' [-Wmissing-prototypes]
      16 | int qaic_bootlog_register(void) { return 0; }
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/accel/qaic/qaic_debugfs.h:17:6: warning: no previous prototype for 'qaic_bootlog_unregister' [-Wmissing-prototypes]
      17 | void qaic_bootlog_unregister(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/accel/qaic/qaic_debugfs.h:18:6: warning: no previous prototype for 'qaic_debugfs_init' [-Wmissing-prototypes]
      18 | void qaic_debugfs_init(struct qaic_drm_device *qddev) {}
         |      ^~~~~~~~~~~~~~~~~


vim +/qaic_bootlog_register +16 drivers/accel/qaic/qaic_debugfs.h

    10	
    11	#ifdef CONFIG_DEBUG_FS
    12	int qaic_bootlog_register(void);
    13	void qaic_bootlog_unregister(void);
    14	void qaic_debugfs_init(struct qaic_drm_device *qddev);
    15	#else
  > 16	int qaic_bootlog_register(void) { return 0; }
  > 17	void qaic_bootlog_unregister(void) {}
  > 18	void qaic_debugfs_init(struct qaic_drm_device *qddev) {}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
