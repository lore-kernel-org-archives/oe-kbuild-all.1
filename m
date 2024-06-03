Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37D263D5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 07:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717400031; cv=none; b=upcL06Tyge5VeALWr7RkZTizZSOAAPNXZpoxBYO/XT8VYi2TRlsby4ebZqXbyYEzDaMX+rHoRYHOiM5v62o7C8UEumJLiKnMDzgbgTGONi599pow3FE5CShJTQPmwlAaBHfIWKeUiqHUpCkVdy6s3h7MKsbAbDSTUKgQG9b4UUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717400031; c=relaxed/simple;
	bh=HAyyIRZKIqQiknxH/Qv0R/q0l/9YCOjXPHe8KHRIW2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CjwWFhUkaE5QoTocdALjXXid6E3LGSTX9u6UBsBTHu1puAvxWGgO5Sz84Fs9Bvm5nFLje140myIxtfbUwwlxmsIzYcIvTWTP28+/RNf3AYX5oY2r02jwiVGx689/CB0d62bdpLsdEKAi/r9LO7xSkPfQX9VA+AVwyALIDRoWGS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5hXb22o; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5hXb22o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717400030; x=1748936030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HAyyIRZKIqQiknxH/Qv0R/q0l/9YCOjXPHe8KHRIW2c=;
  b=A5hXb22o+/7TfWi+yHEVnzaSLsNzm/JXfGV7cRf1GYOS899wY/Dj2/ea
   0Ikbq6k+CuPekeQoPdMWb89ykGYffbONkUv3tDkDpYxckIRriL3dX8FeR
   j10FsJ4yXpDG3caaHMPRrn6I4+lTODG7wvfVogrLcTvOs2qRAe1ICVfKb
   1V9SSbjSP8969i/6y3FVuD+N3KnufyqO6oPcXC7AALIotrda466bbycRo
   YKxFGCXr4iQsOux5b7uzYOqLvo5l+w0A88DEp4At83NOwwDEc1uXUoIFn
   WK8TZr+IkYdb5HfXzQ8swUPUZ6xFAv6ZwdjA5n9Wakl3/hi7yxHy9fEEN
   g==;
X-CSE-ConnectionGUID: q4OhHU97St6BCkCTfU9jiQ==
X-CSE-MsgGUID: yCSJH8ejSAGBCct/l0t0YA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="24507030"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="24507030"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 00:33:49 -0700
X-CSE-ConnectionGUID: Rg2qHim/QTWCHLrJZbE2Dg==
X-CSE-MsgGUID: o7QfnvTXRnaWiHEqAWWySQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="67636021"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Jun 2024 00:33:47 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sE2CH-000LAB-2b;
	Mon, 03 Jun 2024 07:33:40 +0000
Date: Mon, 3 Jun 2024 15:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [linux-next:master 3415/3461] drivers/hwmon/cros_ec_hwmon.c:34:18:
 sparse: sparse: cast to restricted __le16
Message-ID: <202406031506.HgEi9sBs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   861a3cb5a2a8480d361fa6708da24747d6fa72fe
commit: e8665a172378986159ce8aaf45712c43472f5866 [3415/3461] hwmon: add ChromeOS EC driver
config: x86_64-randconfig-r111-20240603 (https://download.01.org/0day-ci/archive/20240603/202406031506.HgEi9sBs-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240603/202406031506.HgEi9sBs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406031506.HgEi9sBs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/cros_ec_hwmon.c:34:18: sparse: sparse: cast to restricted __le16

vim +34 drivers/hwmon/cros_ec_hwmon.c

    25	
    26	static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index, u16 *speed)
    27	{
    28		int ret;
    29	
    30		ret = cros_ec_cmd_readmem(cros_ec, EC_MEMMAP_FAN + index * 2, 2, speed);
    31		if (ret < 0)
    32			return ret;
    33	
  > 34		*speed = le16_to_cpu(*speed);
    35		return 0;
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
