Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790F2280A5C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766318762; cv=none; b=GX7fOxjl2yhio/sjACNp4iOj5p5GCY/1lUv4JSx1nr0asuDKIbhceakvtBP95JGnoFobWZlCKEV6e/PpFYnRJ5Qff5RUNNSU79xgt1YPiSteXRdU+yjctx/63RyERzoevXRPtT/ePDHZqfXA5PFHUjPD3I91U09q2v6dYGVPDmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766318762; c=relaxed/simple;
	bh=eJqxoh9loBFopIpJDgogPAcHljJUg/NS+fXuVJevvvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qu2SOry3SkChBWvBXzE4BFi0pVD8yvpcVJTpohlAlLY7r1BeyDCMk4BLcDiPgcoqx+NDrxy4m8Y5rBsvZSfpXsNE8IKwwZHn+ZBaaAeKtMZKigrpTpxu5H6675p9vM92ErTqCRro5VSVM1c6xNKJWrYuV71qItP7L3Suh+QlnS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I12AHIlS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I12AHIlS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766318760; x=1797854760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eJqxoh9loBFopIpJDgogPAcHljJUg/NS+fXuVJevvvo=;
  b=I12AHIlSy+r5ZwgzjP+rPO2qPUHtpMHpWgPH/q3NzOMsyjFNEltJXlVe
   ObJLbYO6erAUfF5jA+eQwW997yuEfK35V7D8mGeUDu7eOcMTVoo+XAQl7
   DcwtZux+A7MdLG+FyRse7Xc4gAmAK4kepNsynz3HhGccbO+TGKCaP4Qto
   8pnF4cVeocAQqPgq713xRs+x0f6Ky0vZ7DJsGgUwS7pnWIqjsK+pC56ka
   rYEdGKvIDG5545yW6T0TD0djY9bGwnhvT4IZWUjNTPMWsH0F9g5ALpt4S
   hGKc9XrfjDPc18HZr33tmH/186jJWtHrlT4q/p/TxV/HMGeRUXIxJDiK7
   w==;
X-CSE-ConnectionGUID: PAYEWud3TrCCeNv0f9E3fw==
X-CSE-MsgGUID: 1MMLSe7dTW6skMA7PVq9fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79658647"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79658647"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 04:06:00 -0800
X-CSE-ConnectionGUID: gPjrlpYqTH+j2cT7tbgg3Q==
X-CSE-MsgGUID: 39lZWWSdT4SXf5jelVtZhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="229953216"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 21 Dec 2025 04:05:59 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXICC-0000000052C-3hLd;
	Sun, 21 Dec 2025 12:05:56 +0000
Date: Sun, 21 Dec 2025 13:05:14 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] drivers/block/loop.c:1989:6:
 warning: no previous prototype for 'loop_process_cmd_list'
Message-ID: <202512211357.IPGR9IZJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   16aa689262af24cd0897f463b3d0dd9ecee6b37c
commit: aa8a9034d8a0e18d37fff6c6053f470be77637ae [1/1] ANDROID: loop: export loop_process_cmd_list
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251221/202512211357.IPGR9IZJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211357.IPGR9IZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211357.IPGR9IZJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/loop.c:1989:6: warning: no previous prototype for 'loop_process_cmd_list' [-Wmissing-prototypes]
    1989 | void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/loop_process_cmd_list +1989 drivers/block/loop.c

  1988	
> 1989	void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
  1990	{
  1991		struct loop_device *lo = disk->private_data;
  1992		loop_process_work(NULL, cmd_list, lo);
  1993	}
  1994	EXPORT_SYMBOL_GPL(loop_process_cmd_list);
  1995	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
