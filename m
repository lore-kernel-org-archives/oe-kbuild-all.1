Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E525E348896
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 02:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790733674; cv=none; b=RSDNeV5SOdCBlkiONsVdI8/q+j9qVvlTx4xb0UREpvH6Qjbkgn8sjgpdsSvnvjg4uQWKCbS5BOtI556V3wmvk/+/MM5yu71u/8cIC1ufHofcBh1rI6UtgFuhE+MzYKTbq9qVXnOSS2pPZrqNdwNkcemdiku3k3e3YuAWZDeNK+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790733674; c=relaxed/simple;
	bh=9ujrNiVij8HFQGVid++jHvJMNlBWNiK+i7D8pQbl9Mc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iBR3m5fwDCVJKtq7Cv3QVr8zQYMrDIQQxLcdFIxi2eGgMFNI683sKOKk+pUXwTJl5Xt336BXWmQI5XzmUQUeRAUNhqOXOMqpop4INe/N7+IG34nfgnZNvlq9jXfYI1Ov5ql27EVx7HLPANVCKeS83bfomj5HHhmqmLYQ2LYz/4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRam/r0P; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRam/r0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790733672; x=1822269672;
  h=date:from:to:cc:subject:message-id;
  bh=9ujrNiVij8HFQGVid++jHvJMNlBWNiK+i7D8pQbl9Mc=;
  b=VRam/r0PFF2BaqenbR564+B4WUSj5+i6Hx/rI8oXZcuT8gOzaDa1JVG1
   LizXm8deE0izdSv+igWASO0rL+uFnG/Ik3UVOjtQuedtzlsYdCG0AtkaL
   fPXh4MfIA/9KZsCyhsTbtOnpclwa39iqhkW2FZ+cfjeOec1+ly4Ukn0uF
   LXAcUp+K5cQjyI7X1YSqZJN827YDwtm2GANI7QYWCpOQzF9V2cmCcgTBu
   5MF/U3xbAKe6eZLXO/JG1WuyCRgeHWDLd/Fm1+c45SaRKs4g/xL5jTLNf
   bBXN2mxdIrt11s567LZQyIbtSzAMMxcyuP6KQAkCBxKAO/XI+fHWfcRp7
   A==;
X-CSE-ConnectionGUID: yppsc5nnSE66NlBbIxKVag==
X-CSE-MsgGUID: Vvt7kcwUSrSdQ0ijZ0RRpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91562040"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="91562040"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 19:01:11 -0700
X-CSE-ConnectionGUID: E6woXdj+Q5qcFguEYijWuA==
X-CSE-MsgGUID: UngMuO8qRyyoyeWPHoS9/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="274660672"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 29 Sep 2026 19:01:10 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBjd6-000000001fR-0MwV;
	Wed, 30 Sep 2026 02:01:08 +0000
Date: Wed, 30 Sep 2026 04:00:54 +0200
From: kernel test robot <lkp@intel.com>
To: "Abd-Alrhman Masalkhi" <abd.masalkhi@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/md/md-ctl.c:47:26: error: implicit declaration of
 function 'isdigit'
Message-ID: <202609300325.mOMyyh4S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Abd-Alrhman-Masalkhi/md-make-mddev-lookup-and-ioctl-helpers-non-static/20260928-201223
head:   6b0c58a68cb9e72a888a76dac60d49a88d347118
commit: 6b0c58a68cb9e72a888a76dac60d49a88d347118 md: add a control device for array management
date:   30 hours ago
config: arc-randconfig-r2101-20260930 (https://download.01.org/0day-ci/archive/20260930/202609300325.mOMyyh4S-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300325.mOMyyh4S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300325.mOMyyh4S-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/md/md-ctl.c: In function 'get_mddev_name':
>> drivers/md/md-ctl.c:47:26: error: implicit declaration of function 'isdigit' [-Werror=implicit-function-declaration]
     if (name[2] != '_' && (!isdigit(name[2]) ||
                             ^~~~~~~
   drivers/md/md-ctl.c: In function 'md_ctl_ioctl':
>> drivers/md/md-ctl.c:520:8: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     arg = (void __user *)md_ctl.arg;
           ^
   cc1: some warnings being treated as errors


vim +/isdigit +47 drivers/md/md-ctl.c

    38	
    39	static struct mddev *get_mddev_name(const char *name)
    40	{
    41		unsigned long minor;
    42		struct mddev *mddev, *ret = NULL;
    43	
    44		if (strncmp(name, "md", 2))
    45			return ERR_PTR(-EINVAL);
    46	
  > 47		if (name[2] != '_' && (!isdigit(name[2]) ||
    48				       kstrtoul(&name[2], 10, &minor) ||
    49				       minor > MINORMASK))
    50			return ERR_PTR(-EINVAL);
    51	
    52		spin_lock(&all_mddevs_lock);
    53		list_for_each_entry(mddev, &all_mddevs, all_mddevs) {
    54			if (mddev->gendisk &&
    55			    strcmp(mddev->gendisk->disk_name, name) == 0) {
    56				ret = mddev_get(mddev);
    57				break;
    58			}
    59		}
    60		spin_unlock(&all_mddevs_lock);
    61	
    62		return ret ? ret : ERR_PTR(-ENODEV);
    63	}
    64	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
