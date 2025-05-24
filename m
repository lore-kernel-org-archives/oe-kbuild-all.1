Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D16023774
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 19:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748115513; cv=none; b=FzywWND83VrItocc4kO1Za3luuesvKBdjeSZBYpBoetdm8SqaQqQfap4JMy9xxhecjhjw3mA5e1lrbmQMa3OTV1azbdn9OzwR/0zQdZ3QEWPPDwqXcHSlyukA+rvMJSperTqX0mgQWdAAq8hAwthS5wc5AYPL8UpFj3p8GkKSWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748115513; c=relaxed/simple;
	bh=z/7zp/fQMV7+jKLyw5B2f55jI/SFjCS7xSA2R9+3oSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G26XzUPdxVIgSm0lg9ePySjoOfLbDXtYG6uO9qEqtLGv1u7HLy6ns+frSiQNQ1HbqONeSLSot2UfDSZvfwx5CQIXZPDvShiPasDAjNAb8faHOgRGPMyqruEAKS6LrhLkEL6aRrB90APDKvvNV/KaZrwxyP8rYBdJjtzYbt3x5AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnxw+w7c; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnxw+w7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748115511; x=1779651511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z/7zp/fQMV7+jKLyw5B2f55jI/SFjCS7xSA2R9+3oSQ=;
  b=gnxw+w7ccq4RPn7kNkz12Nml3RZTcKNsz5Re9d59P0IPI5+hfAqhRiEi
   4JjeXrtrmT0P1OzO4Ngk6a3xvcpb5zlmysOh8LDCT+Pg8gt3u0NUcpEnS
   vDXL1KoJWvy/TWko+7MJMS0fHxLm4jYka9Hp9wcPT5u9tz8n8976mBYTx
   hxJzbaKb1uJPzjlfokuUfN+uj+DydTKosSHAKWOM8k9dSi4CldN0/Qy09
   SGKoLD0+iwBxj3H6eIaQ0iorjP4h1zqUAHiBsMEaH0sVFhOGViuLI+0cM
   SFrERe2ylFoL2b43jeL/J3ihO/QWCHD9XgOQ9Adbv+YVAaM/HOLHcSKhh
   Q==;
X-CSE-ConnectionGUID: vD+KtDC1QuKh+PHYyDYLAA==
X-CSE-MsgGUID: 7g/RQd5sSeWp90kUmHX7Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="60394873"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="60394873"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 12:38:30 -0700
X-CSE-ConnectionGUID: /qCD8JwkSB+efjE7mCSYMw==
X-CSE-MsgGUID: pOhnjkJYSz2n21fqqzN5BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="145599405"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 May 2025 12:38:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIuhP-000RQg-0w;
	Sat, 24 May 2025 19:38:27 +0000
Date: Sun, 25 May 2025 03:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1648/1648] drivers/dax/kmem.o: warning:
 objtool: missing symbol for section .exit.text
Message-ID: <202505250310.6ik504yZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1330b01bfe2848940261b9b533d2d59d0148f8ab
commit: be13c6c633412a576f1a666c07dbaae19331b0fc [1648/1648] Intel: device-dax: "Hotplug" persistent memory for use like normal RAM
config: x86_64-buildonly-randconfig-003-20250522 (https://download.01.org/0day-ci/archive/20250525/202505250310.6ik504yZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505250310.6ik504yZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505250310.6ik504yZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dax/kmem.c:17:5: warning: no previous prototype for 'dev_dax_kmem_probe' [-Wmissing-prototypes]
      17 | int dev_dax_kmem_probe(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/dax/kmem.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
