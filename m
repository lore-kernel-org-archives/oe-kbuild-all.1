Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C9B15442D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 22:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726094002; cv=none; b=N3yY87sLb+BWIWTK9Z86UimVDWlgier/hZ2BaDXqK5m5rVMvBgZhKahD7zblRtr6Vv1Z7hE3eIA3il2peaBLSnb7xRC3OeUmFTT5PjEykHh8kyS5i+xUbtGon6Lb1ROnx/WsJC9te7SErr1nQSRXjDlF38oNivOdlfiravpNzrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726094002; c=relaxed/simple;
	bh=TU7TRBmIdhFiJdQKYEoJew2i9hYETlQuX0qGVkVQQBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jKfHVpnecXC7zSTCvt2OPeBcn6p0CjQy+fM4KdJFuQytYrJMGtUmfJsNyR/vmE4B0mEN8VFyAGSbbsm2sDjMKUhJr/S+WYQDwc0fSq9QLZYrc4pG0bhwh9vXgOb8nKMNt9gjL4uuX5Tp2Joe6I5BB8WREHlthX15G+U1JtBkVj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1SGmYBK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1SGmYBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726094001; x=1757630001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TU7TRBmIdhFiJdQKYEoJew2i9hYETlQuX0qGVkVQQBI=;
  b=Z1SGmYBKKw4dbiK8prldw6BoparEAh0J56dmFPyxFUt+VniqA3upnCBl
   nswmjXq5LaQ6E2CNEkbspKI+7amRDVy6T3DqmV1hzKZG8kuZZmJqfXLZd
   cFfFpqETnm9sLz92q7AWBt6fcQPGFy7IrDz5x5nLfDnwOCMnGlkHNaIin
   EoSVbEEiskgLcCVt1uij5o/c59KQKdfLU/cDaR1W6DxXonAbneygj5ceO
   xGSco5sB+u2CExbHsgWcB27BIsZWxOCrd1i5AtpUW1igfzhF8yQ4e1AaQ
   +7ckjBPRY2sjPL59ma8M4RBSU7a29RJsyxQG8lEh3+zrLs6fN6OE5/F36
   Q==;
X-CSE-ConnectionGUID: jDX4yICyQkKwIEJ68HRT4A==
X-CSE-MsgGUID: RZO8J/8kR4W6bnXNtl/1Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="35492935"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="35492935"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 15:33:20 -0700
X-CSE-ConnectionGUID: 1lXrvRqASGuY1JQkiNg6MQ==
X-CSE-MsgGUID: MYJ9lyoVShSryPsle44QfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="104966000"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Sep 2024 15:33:19 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soVtk-0004Du-27;
	Wed, 11 Sep 2024 22:33:16 +0000
Date: Thu, 12 Sep 2024 06:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yifan Qiao <qiaoyifan4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29928/30000] mm/backing-dev.c:226:1: sparse:
 sparse: symbol 'dev_attr_max_bytes' was not declared. Should it be static?
Message-ID: <202409120633.GHlgrbZp-lkp@intel.com>
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
commit: 5796e536bbd9187296ded6d4d1cb3152113c6e85 [29928/30000] mm: add knob /sys/class/bdi/<bdi>/max_bytes
config: x86_64-randconfig-123-20240910 (https://download.01.org/0day-ci/archive/20240912/202409120633.GHlgrbZp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409120633.GHlgrbZp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409120633.GHlgrbZp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/backing-dev.c:226:1: sparse: sparse: symbol 'dev_attr_max_bytes' was not declared. Should it be static?

vim +/dev_attr_max_bytes +226 mm/backing-dev.c

   208	
   209	static ssize_t max_bytes_store(struct device *dev,
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
   220		ret = bdi_set_max_bytes(bdi, bytes);
   221		if (!ret)
   222			ret = count;
   223	
   224		return ret;
   225	}
 > 226	DEVICE_ATTR_RW(max_bytes);
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
