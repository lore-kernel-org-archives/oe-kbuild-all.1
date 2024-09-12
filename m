Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DCF370
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 00:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726100066; cv=none; b=fEz4l5mdZaY5xiZgiQ/EHkjb9q7YkDdxVrh2alkQ0JFZ1f9L4+LPpFPaXfAxUYddgJRvqgzOVw5L9J/Zzxt27I8MuNbCtbp9uLmETVkJDpNIpOlBNwEXzI64rhOqu8SGULV8/ye3rP/gGM5KMpmWemWFjZOkKrqiK79uufdqTPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726100066; c=relaxed/simple;
	bh=12+NB9YEG7KpDHuZmeezxNALCsQXgR67FJp54p5HMsk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eQZNJgpFsRZSPnNEkuKYmYWrqVWgKNIUGiMNBSeaPCPO+p+mppaeeL8YJdCj8wdXfrN5K9EuQcdGNQezGvRMilMuNFw6YyXD4tRcmbxDgNHLGb8AtixdGrkk2rtPWXzopWqsHqj6pRUDaxkHasBX5bxRPMnzYtgXsADEr4ttSwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kck0jGYa; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kck0jGYa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726100064; x=1757636064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=12+NB9YEG7KpDHuZmeezxNALCsQXgR67FJp54p5HMsk=;
  b=kck0jGYaaiS29aGaSO6tMZn3pqdWIsnWHjOSjhMJL5j5cdBURAcaI4VA
   2o4p1kyhDGNbDo34vQWBUwyHkVsT6TaVnpplDylblrtA+Dg+p4SPm0dJb
   gWzMDfoNcicZk0TDJNnYMn+9Oyfz6VWagY5PQx4kR+tlwsK4B7RH8MAW3
   /bhk+MHULcri7KU2BdNywDDL+0wd99PWMYW3QBNqiDpWl+Xqb7RaeXwYq
   d6Iw+rpdUS4rFtdjNObE/rFr2a1x8YlKmHULBLgTDSL3W3OFDLS1QWx/D
   lJ8EnexnetEb0heMiNbyAlJJy9Y5i3SADJM6C3CfJVFncsF9WMAs5IerJ
   A==;
X-CSE-ConnectionGUID: T+qkk2uYRTmBOemBxVWAUA==
X-CSE-MsgGUID: RbqEbxu1So+wv+eH1Ly7PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28818171"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="28818171"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 17:14:23 -0700
X-CSE-ConnectionGUID: nvr8ihRvQm+aYofgihVXpg==
X-CSE-MsgGUID: gCDtb45fQuicOXUyj/lfWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="104990685"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Sep 2024 17:14:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soXTX-0004Io-2y;
	Thu, 12 Sep 2024 00:14:19 +0000
Date: Thu, 12 Sep 2024 08:14:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yifan Qiao <qiaoyifan4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29933/30000] mm/backing-dev.c:226:1: sparse:
 sparse: symbol 'dev_attr_min_bytes' was not declared. Should it be static?
Message-ID: <202409120855.xGnhP78f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e23f76121de26a57b9f398c8b1ce5405a88acd8a
commit: 9d961dd8f6989bee222015da75553f9800b46714 [29933/30000] mm: add /sys/class/bdi/<bdi>/min_bytes knob
config: x86_64-randconfig-123-20240910 (https://download.01.org/0day-ci/archive/20240912/202409120855.xGnhP78f-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409120855.xGnhP78f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409120855.xGnhP78f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/backing-dev.c:226:1: sparse: sparse: symbol 'dev_attr_min_bytes' was not declared. Should it be static?
   mm/backing-dev.c:254:1: sparse: sparse: symbol 'dev_attr_max_bytes' was not declared. Should it be static?

vim +/dev_attr_min_bytes +226 mm/backing-dev.c

   208	
   209	static ssize_t min_bytes_store(struct device *dev,
   210			struct device_attribute *attr, const char *buf, size_t count)
   211	{
   212		struct backing_dev_info *bdi = dev_get_drvdata(dev);
   213		u64 bytes;
   214		ssize_t ret;
   215	
   216		ret = kstrtoull(buf, 10, &bytes);
   217		if (ret < 0)
   218			return ret;
   219	
   220		ret = bdi_set_min_bytes(bdi, bytes);
   221		if (!ret)
   222			ret = count;
   223	
   224		return ret;
   225	}
 > 226	DEVICE_ATTR_RW(min_bytes);
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
