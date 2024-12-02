Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B801F9ABD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 08:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733127281; cv=none; b=FMz//LYbMYPDD8ynoqEzXX4Xwcw8kgbzzUtPOUI09t/27AJSGb0/o4hoK7t1BVXge9dxLmc5Zv6/bH+T3sySkCBrMxFpiP6Lu/7boPuxy3IJwP+Pf10dsGN9P0gcIy07nlve6ywEFH/F3pMLOxY45z+km5QdqxnMcGqA+Ra1MBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733127281; c=relaxed/simple;
	bh=1wfWeKWrJLetTrCCm6umjj0RDLwBCmtp+t8eULkVoSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ho8qM38IXIlWXAP4boZavicgHg+V0RU0nwAFcbvxk42qszYre5h3M9YYozcZaguvQgSnwEhQOmSGV4qM8zI29BkfMrixSQLi+XOgTNzJmsQcA73qQo1roxCn8ZkMbwqwd3ZreRhc0nWHra006mEukIbXCReSX5B5hZwHgm86W+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1BDS+he; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1BDS+he"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733127279; x=1764663279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1wfWeKWrJLetTrCCm6umjj0RDLwBCmtp+t8eULkVoSM=;
  b=H1BDS+henDV0aLIvr6xzGVHawraFjyWD1jKuyp9peGmmBxD8kRPJaZY0
   ygp+/jSm0+3xc6yNipucdag1WxqhxN2AWLBAkHON73Hi7AJlgrQlO4+tK
   4+x6gdPMdKfX4IfPej++46YoS210AtIKDNPnPasV2kTqHJuFZ0iqksNi/
   mcNBSXS46wAJoSY1rMNiPnOATeBGWI9U+aOtg3tK65uDskQ73sAm3CsVf
   tOG+7l3edcNoq+6MjeueGsmU6QSECnHEzWt29KPdFP1HLmyJqL00nkGs4
   4sqsUa2W6/0ttvhBWvha89wP2Qcw0feunAGgsU1wimlIXeYjnJ3gmb45h
   w==;
X-CSE-ConnectionGUID: cJYwNiu7Q3K1O2Wk6yXEKQ==
X-CSE-MsgGUID: LlD0ky7iSxq+ylQSJMBC2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33342012"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="33342012"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 00:14:39 -0800
X-CSE-ConnectionGUID: j7BbsX+hQaG4qfcQv13Dyw==
X-CSE-MsgGUID: wwnZZlBNREKqblcW7nPf3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="97109247"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Dec 2024 00:14:38 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI1Yz-0002Bp-0a;
	Mon, 02 Dec 2024 08:14:01 +0000
Date: Mon, 2 Dec 2024 16:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1268/1268] drivers/dax/.tmp_kmem.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202412021601.Wu04GQ8O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a736cbd663d2a0d3024657aef143d1defaceae0f
commit: be13c6c633412a576f1a666c07dbaae19331b0fc [1268/1268] Intel: device-dax: "Hotplug" persistent memory for use like normal RAM
config: x86_64-buildonly-randconfig-004-20241103 (https://download.01.org/0day-ci/archive/20241202/202412021601.Wu04GQ8O-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412021601.Wu04GQ8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412021601.Wu04GQ8O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dax/kmem.c:17:5: warning: no previous prototype for 'dev_dax_kmem_probe' [-Wmissing-prototypes]
      17 | int dev_dax_kmem_probe(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/dax/.tmp_kmem.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
