Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BE31B85EE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 03:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726457992; cv=none; b=rz3x0vsnBHgnEDkfYLbJiE6JiwWJmmhnGJu45FNCh/RnEZbm1uSV4VBTVQczLUYj9yFv4C1T84+2OY7jAi+HBQRjK9hdntn4QfDT0af7jqWdy/11D4SuPEnBrhhOj65zWrYjHr/TVMIIDcl0NGI0B9AIz3+e+X5DOJ6wEavNLkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726457992; c=relaxed/simple;
	bh=tH1BoqBerxPg6UhEygpY2OqTYVQlMPWoQDxvmPDbOfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bhdoHiviTUY75UgB4Cx8bqfBeDzl1IvFYsdyi2AKQQyNcviKI7p7MIIxhAHXnhfRBiMY2w08GztrfQel2BVqPMq6aOLVOthjQ1jB5krcG6cFvraByVeHj6m3JuwpZLHsUayQ0sJ3WCi3eJ/8udFUSfBk3L98e0e+sUIAUz4eSbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5hR4DxF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5hR4DxF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726457990; x=1757993990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tH1BoqBerxPg6UhEygpY2OqTYVQlMPWoQDxvmPDbOfs=;
  b=J5hR4DxFgni4jhD1IOzIK+rCk8Vh53awxBjQ+VC2rHRVdxP9ynQZ99nV
   g+Y6vsA/I3wrSQ1h2mO7k5KaXi5VA4ZkiayHYZYG0tOs9APhTnYYzlQAD
   LlvTdUO5BP6xyj7cAGI6RJJGR8XlxTXlzwpQMNzlnxFdlCH8WrytIrWhd
   L9wpYjrLCrvsOassm3b6mpM1mNIaIMO2gbv+5W0WABjI1I/IDdlpSwGgK
   u2cYZqqigExLkNtYaiua4y9NCT1Z28SHIFt7nEvFKFKpV8qI4tSoBmEsz
   wwD9eE9w3m8qd+oUv5IZQCT6Gw9tG08aRZGwRaK0iXM79U+DAd2AkE/Ns
   Q==;
X-CSE-ConnectionGUID: jWWK9r2MQzKJ+aEvpXPGmw==
X-CSE-MsgGUID: FsmRf3TkR7eEoF+I/gOkDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24815543"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="24815543"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 20:39:49 -0700
X-CSE-ConnectionGUID: s11limhzQumVgD/ET62JkA==
X-CSE-MsgGUID: z0sVtGpgQRGknN43TEeuag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="68456449"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Sep 2024 20:39:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq2aY-0009Jy-1v;
	Mon, 16 Sep 2024 03:39:46 +0000
Date: Mon, 16 Sep 2024 11:39:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1625/13950] ls2k500sfb.c:undefined reference to
 `fg_console'
Message-ID: <202409161114.sOtMxgv1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   84404f248a61323e09909849803ea4efce81742f
commit: 8248d42b7c5f4338a54f26d8efebec8614b43466 [1625/13950] fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: loongarch-randconfig-r064-20240916 (https://download.01.org/0day-ci/archive/20240916/202409161114.sOtMxgv1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161114.sOtMxgv1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161114.sOtMxgv1-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/video/fbdev/ls2k500sfb.o: in function `.L152':
>> ls2k500sfb.c:(.text+0xf9c): undefined reference to `fg_console'
>> loongarch64-linux-ld: ls2k500sfb.c:(.text+0xfa0): undefined reference to `fg_console'
   loongarch64-linux-ld: net/ipv4/inet_hashtables.o: in function `inet_ehash_nolisten':
   inet_hashtables.c:(.text+0x2ff0): undefined reference to `sysctl_local_port_allocation'
   loongarch64-linux-ld: inet_hashtables.c:(.text+0x3000): undefined reference to `sysctl_local_port_allocation'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
