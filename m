Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14FC220F36;
	Tue,  1 Jul 2025 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367799; cv=none; b=EDBZSLaBOU7SK6xWxFxQ3f0JWVxDFS4toDRjFETPPhujJf6aRMsFqlD3aWrv2UruwubbfQEw2tJB7yZw8CotRunvLoJacFSSZciJez4URnu+S/TeD/ZGzX9XbG3RH3mor9jIvV8qJ0WaVDER/4kDt+EIs3tlnnveSi8UG5rM0lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367799; c=relaxed/simple;
	bh=6kNKJ2mFTxTcmBjI382PaBWELeHf7O/jzRNGF2VoYfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMfbisrBrqnZzO6QhTZVfHpxNoyQxoKxNwK79Y2vxU+Gd/01uo5revyF7ExTPDxB7A3o0nS78vI749EnCCzgpxz4qNCPFn4g4akgGHOqqnlAWpF5Hg0TC7JPKdKy0ZJ0NQMpqIeHIwrKuz9wGL/jPuhz6RA8s/DATlfb8UBc6uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbAYtmfM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbAYtmfM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751367797; x=1782903797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6kNKJ2mFTxTcmBjI382PaBWELeHf7O/jzRNGF2VoYfc=;
  b=EbAYtmfMA28hnMRh+T/NSLZy/AXML7AaCqsEKfFdKE8zC0gYxp39YiZ/
   AjAqxKdRAZD8XZIkMwvgocpYdFLq8XYzcHznlKg+GDZWkXC/Lb27h9rsA
   5Tzs1MMpsjW7Xp2lLZc8O6oMFtqO6vf/aQbZPqHYaltlpFwHMLa4jX6Zc
   7dHxmREbJ94EtIzfp7K1ZeBvM3JjAETArmLFv4im4m0r7z8BPFcHUHncU
   2JdLlYoUkM2zV6k46I6A78Q2VbehesJjW6pvYghdKDtlbhAaCmC0p+wNX
   hdvA0OdE/cwyscpQ2ew1GdGICokXsS7JmFkxofA9JfHN1y2S/fN/pykNi
   A==;
X-CSE-ConnectionGUID: TTPzch3WS96MF3ok9foN+A==
X-CSE-MsgGUID: /8IfWV8SRCmu9k+3dKG2jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="71189318"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="71189318"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 04:03:16 -0700
X-CSE-ConnectionGUID: 5cI7/pJ0QSqlP2QGqmcjTg==
X-CSE-MsgGUID: 4KTUbD3rTP6h/BIVcGBvwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153352936"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Jul 2025 04:03:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWYlb-000a2s-35;
	Tue, 01 Jul 2025 11:03:11 +0000
Date: Tue, 1 Jul 2025 19:02:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chung <seokwoo.chung130@gmail.com>, hao.wu@intel.com,
	trix@redhat.com, mdf@kernel.org, yilun.xu@intel.com
Cc: oe-kbuild-all@lists.linux.dev, linux-fpga@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ryan Chung <seokwoo.chung130@gmail.com>
Subject: Re: [PATCH] fpga: dfl: Replace scnprintf() with sysfs_emit()
Message-ID: <202507011805.BSIqVlhe-lkp@intel.com>
References: <20250630125018.48417-1-seokwoo.chung130@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630125018.48417-1-seokwoo.chung130@gmail.com>

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc4 next-20250630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chung/fpga-dfl-Replace-scnprintf-with-sysfs_emit/20250630-205221
base:   linus/master
patch link:    https://lore.kernel.org/r/20250630125018.48417-1-seokwoo.chung130%40gmail.com
patch subject: [PATCH] fpga: dfl: Replace scnprintf() with sysfs_emit()
config: sparc-randconfig-r112-20250701 (https://download.01.org/0day-ci/archive/20250701/202507011805.BSIqVlhe-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250701/202507011805.BSIqVlhe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011805.BSIqVlhe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/fpga/dfl-afu-main.c:159:32: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected char const *fmt @@     got unsigned long @@
   drivers/fpga/dfl-afu-main.c:159:32: sparse:     expected char const *fmt
   drivers/fpga/dfl-afu-main.c:159:32: sparse:     got unsigned long
   drivers/fpga/dfl-afu-main.c:478:32: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected char const *fmt @@     got unsigned long @@
   drivers/fpga/dfl-afu-main.c:478:32: sparse:     expected char const *fmt
   drivers/fpga/dfl-afu-main.c:478:32: sparse:     got unsigned long

vim +159 drivers/fpga/dfl-afu-main.c

   152	
   153	static ssize_t
   154	id_show(struct device *dev, struct device_attribute *attr, char *buf)
   155	{
   156		struct dfl_feature_dev_data *fdata = to_dfl_feature_dev_data(dev);
   157		int id = port_get_id(fdata);
   158	
 > 159		return sysfs_emit(buf, PAGE_SIZE, "%d\n", id);
   160	}
   161	static DEVICE_ATTR_RO(id);
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
