Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAD21C3C18
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 21:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733518943; cv=none; b=qL57YCOOo/aaM+yg9hazIYZsvMt+xdEBZrDsGVXCU/VjDOxccWjwKhSNeabMtaBWBjVbXxdUaFiTOCSrzUMLOcvGnGFvkEbv3YWPN4bljQNE1s00CH9een+P5Qwr/odnidJxAiEqC22CQwXMQU/u4qsfPVLuVe/FAd2woUvQt/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733518943; c=relaxed/simple;
	bh=33q/gaB958eElAyWHRQAHfkY5pRfqLUEZy7XNq0cQUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgEUjnrNhcNXLrQuuPrFpH3wM0dG5CzeYBoOxcEjMn5L7DZANXPoB3G00KA5TWh/zWjNgs9aI6b22fUYIKhQNAWZbg5uHl9mCNr5vFbbnKrp8zF15UkNdGcpcrNG+TBTVLXWurBVA97VpUIsrlWHnLfdF3ez/EOXa+udHZJZmGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaPXjS5u; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaPXjS5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733518941; x=1765054941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=33q/gaB958eElAyWHRQAHfkY5pRfqLUEZy7XNq0cQUI=;
  b=kaPXjS5usLdQ64XlIb6sq0fYX3kzQdkOkWejdo0PGrBzfcM2c/0DhtKp
   5imkifFHnjo7Y/Az64yuS4qegKQ5CzpZISJjXlfmBwO27yY+pzZ6f9e8S
   V0B2uTCXdxTScjRM/V7tufeEKnzhJ6yZf9SWENeFgBPAsPZvEET2H/Zna
   UkOmJaEnrlJU/xU3wkrwQXqLwaCY4PjPr01tZsLL6q/7Si7YtjJTNqt2x
   Qay+zPEB9vuACsDVh0AFZywkBM3qVG6PHF8RJ93H+htTG+uxU0OB4kO9q
   j70MS9n7aps9bJ9IFChxkUxQfpJgXR4wfRD6x1x2q/zSyE2q2kSxg3Jgc
   Q==;
X-CSE-ConnectionGUID: 0HHclisQSomtx+MsBDeSAg==
X-CSE-MsgGUID: NbuTwTIpSC23wHmjxh6LDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33618918"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="33618918"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 13:02:21 -0800
X-CSE-ConnectionGUID: xCcpt17wTLyW2wKr1+DrUA==
X-CSE-MsgGUID: dCj6Rt+FQ8Sxbi9ejto3SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="94874270"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Dec 2024 13:02:19 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJfSq-0002Fp-2C;
	Fri, 06 Dec 2024 21:02:16 +0000
Date: Sat, 7 Dec 2024 05:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Zekun <zhangzekun11@huawei.com>, xuwei5@hisilicon.com,
	lihuisong@huawei.com, Jonathan.Cameron@huawei.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	liuyongqiang13@huawei.com, zhangzekun11@huawei.com
Subject: Re: [PATCH 2/2] soc: hisilicon: kunpeng_hbmcache: Add support for
 online and offline the hbm cache
Message-ID: <202412070443.dYzNQNfY-lkp@intel.com>
References: <20241206112812.32618-3-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206112812.32618-3-zhangzekun11@huawei.com>

Hi Zhang,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13-rc1 next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Zekun/soc-hisilicon-kunpeng_hbmdev-Add-support-for-controling-the-power-of-hbm-memory/20241206-193643
base:   linus/master
patch link:    https://lore.kernel.org/r/20241206112812.32618-3-zhangzekun11%40huawei.com
patch subject: [PATCH 2/2] soc: hisilicon: kunpeng_hbmcache: Add support for online and offline the hbm cache
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241207/202412070443.dYzNQNfY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070443.dYzNQNfY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070443.dYzNQNfY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/hisilicon/kunpeng_hbmcache.c: In function 'state_store':
>> drivers/soc/hisilicon/kunpeng_hbmcache.c:28:24: error: implicit declaration of function 'restart_syscall'; did you mean 'do_no_restart_syscall'? [-Werror=implicit-function-declaration]
      28 |                 return restart_syscall();
         |                        ^~~~~~~~~~~~~~~
         |                        do_no_restart_syscall
   cc1: some warnings being treated as errors


vim +28 drivers/soc/hisilicon/kunpeng_hbmcache.c

    18	
    19	static ssize_t state_store(struct device *d, struct device_attribute *attr,
    20				   const char *buf, size_t count)
    21	{
    22		struct acpi_device *adev = ACPI_COMPANION(d);
    23		const int type = online_type_from_str(buf);
    24		acpi_handle handle = adev->handle;
    25		acpi_status status = AE_OK;
    26	
    27		if (!mutex_trylock(&cache_lock))
  > 28			return restart_syscall();
    29	
    30		switch (type) {
    31		case STATE_ONLINE:
    32			status = acpi_evaluate_object(handle, "_ON", NULL, NULL);
    33			break;
    34		case STATE_OFFLINE:
    35			status = acpi_evaluate_object(handle, "_OFF", NULL, NULL);
    36			break;
    37		default:
    38			break;
    39		}
    40		mutex_unlock(&cache_lock);
    41	
    42		if (ACPI_FAILURE(status))
    43			return -ENODEV;
    44	
    45		return count;
    46	}
    47	static DEVICE_ATTR_WO(state);
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
