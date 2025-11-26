Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55FE2690C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 13:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764162677; cv=none; b=c4xEbYlUySnZ6Goz/sIz6ovQ1YY+He66PnbHsAcY6k/ZdBt2jPnLXsRTPcFMovluUSoNp8LIAtFEauceibn6+BefvmxOW9uvo0B+a//DHtewdKUBh0ahn20f2NcGZY7fJ25XvpBfv7+jtHQo8Dp6A4/mToPLOsXk0mvffEixW0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764162677; c=relaxed/simple;
	bh=VjzSQWegumIpkrb5jKqG8gLltN/8U5g4WxRJ/UWckP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBdMPnNkJcJHe1U86XhwlXDESo9Y9kLCHMv9sEZw36/Kn+Z8Pt3h+pYCFjzEY614JxLYweaHf05doo8Kx3sz7AZYlzFGVkkDYsy+92+qUBMIAcUseIJAitXERsSY5lxXPKc6Jv1OiVF1UJLLNTuzxNYW8EmMdbOg7hK4MPUxPDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNzQNZm3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNzQNZm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764162676; x=1795698676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VjzSQWegumIpkrb5jKqG8gLltN/8U5g4WxRJ/UWckP4=;
  b=XNzQNZm3Q1pUSh3kJjDw9SLGVYB6vPLQXhA56Ui0raPeBr6rwyE18KB3
   Z9V9KX3MHSqhGSW0MVGJPYsIiXnbBYCioS+AjCeeOOu7kpugGw+tlx+pS
   PnAmh0nLNSyHDnSw3imDPtLe06AcPU+2LiDS/mSyH4jQcT9uyFwlhuyrg
   /BR9ERCwgV3v76+F6Tk7Bv4S2Oka/txzj7lfFWVpSJzWJ2nN+n6BW8nuc
   vy6jlKzxMoIiuG2WMjRJHwEIFNUrjHA54gvZuMDLVJypR/eni1sewl/qI
   wCiCXzza/eY6g0lvNeK2QOIzOwlx3A9RzEO16JTpmtb+YfqhHJzx22s1s
   Q==;
X-CSE-ConnectionGUID: MDHytkiMR6WrFiwdjF2F4A==
X-CSE-MsgGUID: MuL3/z+sQ/+9GUZ8Txt+uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="83810159"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="83810159"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 05:11:15 -0800
X-CSE-ConnectionGUID: r8AoiQzQQN2XuVNr2AZnnw==
X-CSE-MsgGUID: sR3s5w8IS4W93Uui7FiHqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="193748357"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 26 Nov 2025 05:11:14 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOFIe-0000000018u-1S8j;
	Wed, 26 Nov 2025 13:11:12 +0000
Date: Wed, 26 Nov 2025 14:10:56 +0100
From: kernel test robot <lkp@intel.com>
To: Yushan Wang <wangyushan12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] Documentation: soc cache: Add documentation to
 HiSilicon SoC cache
Message-ID: <202511261420.otuMPDcN-lkp@intel.com>
References: <20251125080542.3721829-4-wangyushan12@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125080542.3721829-4-wangyushan12@huawei.com>

Hi Yushan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.18-rc7]
[cannot apply to next-20251126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yushan-Wang/soc-cache-L3-cache-driver-for-HiSilicon-SoC/20251125-160816
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20251125080542.3721829-4-wangyushan12%40huawei.com
patch subject: [RFC PATCH 3/3] Documentation: soc cache: Add documentation to HiSilicon SoC cache
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511261420.otuMPDcN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511261420.otuMPDcN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/counter.h
   WARNING: No kernel-doc for file ./include/linux/counter.h
   ERROR: Cannot find file ./include/linux/gpio/driver.h
   ERROR: Cannot find file ./include/linux/gpio/driver.h
   WARNING: No kernel-doc for file ./include/linux/gpio/driver.h
>> Documentation/driver-api/hisi-soc-cache.rst:6: WARNING: Title underline too short.


vim +6 Documentation/driver-api/hisi-soc-cache.rst

     4	
     5	Introduction
   > 6	===========
     7	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
