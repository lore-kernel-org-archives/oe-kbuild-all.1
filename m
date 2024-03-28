Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FA312D1FC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 22:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711663767; cv=none; b=VK+4Y3q3SinO4cvgTJd/9MC9SGfOHgiiYjsE4U4epgct5jpcYl1vF9bB8elgj3yYx1oEPOckMc5XiDD9u7re6VIpWnSuExbreD5/UW+vRkhH/HLRCvhr0YrZ0RTM4qasUsjf09xmUo1tIJ48V5sM6HRwwAzGo9ZxHiYvJ5JpA8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711663767; c=relaxed/simple;
	bh=UZFEo1jkAn4TkmA857pmQF5IUCZeMpnowal6PjGuav0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=njU303eDS/oxTQaNuahNJUwjyPk1UPFe1HGeXfWqDmUd7yQID/qi2kd5wViQG7tRV68XopGjZ3b4FQjfbu8LU0QkNIZEwGuwflW3qZ7bBAC4qS4e+heqFArVNTvINY8R+A8bJjOtEq9uwrGSgnEMv1FDhUcqEGB9eI+aPclzTC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bssDM41z; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bssDM41z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711663765; x=1743199765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UZFEo1jkAn4TkmA857pmQF5IUCZeMpnowal6PjGuav0=;
  b=bssDM41zG7zsJ3M62N9i3uVKZ/4BXyxIozZAzpSNG7a+Iq4tABrX6LlT
   4FtLQT2moNvD+5Eu0IqtwVVI55/byKDlc8wWaN+7/YRY7acS+VJBY93gs
   z9DVNfs7PQw3XeF7Y2DYs2L34iDsOc5JHFyOlFyOZQxaVr322ci7jJA8w
   c7FwXF3PKk0R+eVa+dJfMkTQl7nywN0oqh/Ccm40LvTlQJXkkJAyGwijS
   Oj7N3AFe+x19+HJ7QWNWWhet4uiYtBZ68KEDTmWBtR6EUzlnpCCZbfTXb
   iXvTv9S933WXJhTd8fkvgU7X082eRrUSSjqAPjl0BvkmbU6Nxw/Cl2A4d
   A==;
X-CSE-ConnectionGUID: 6v6yV0UDSbSK/I+drXCygw==
X-CSE-MsgGUID: fcTAM2gFTneh5MbOBlm37w==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="17995995"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="17995995"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 15:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="21439336"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Mar 2024 15:09:24 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpxw1-0002Yc-0A;
	Thu, 28 Mar 2024 22:09:21 +0000
Date: Fri, 29 Mar 2024 06:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2676/7000] ld:
 include/linux/resctrl.h:291:undefined reference to `lockdep_is_cpus_held'
Message-ID: <202403290645.zX0Lyrpo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   704605877ce9913071214d2515a4c2b9077f5078
commit: c054efea286659a6504fdeafc0a611c6a3b124cc [2676/7000] x86/resctrl: Claim get_domain_from_cpu() for resctrl
config: x86_64-randconfig-013-20240328 (https://download.01.org/0day-ci/archive/20240329/202403290645.zX0Lyrpo-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403290645.zX0Lyrpo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290645.zX0Lyrpo-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `resctrl_get_domain_from_cpu':
   include/linux/resctrl.h:291:(.text+0xec75a): undefined reference to `lockdep_is_cpus_held'
>> ld: include/linux/resctrl.h:291:(.text+0xff9aa): undefined reference to `lockdep_is_cpus_held'
   ld: include/linux/resctrl.h:291:(.text+0x100423): undefined reference to `lockdep_is_cpus_held'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
