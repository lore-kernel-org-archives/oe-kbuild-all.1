Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B738A927
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Apr 2025 03:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744516540; cv=none; b=i8wmDZImorNB3wlFiy2kt3gEispie5ES+oJWypqkS0WmRlGL70LNpwK7rok8TL/rm9eHntPNJxG4YWlXx3o8G0xAMDo4F4DdRaYu5ujy3muX2RJ2rMe+9S/apVxqvPkKQ2rM/13ft2w5HL/6YZCqtihfbaFqMtHFjTyLe5CnXcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744516540; c=relaxed/simple;
	bh=ltkYFDyadT3Ne0/olO5AwxO/pA5D8c29XpzEIFHhtXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TEkcEJvkVtBlGwaI9Yw/ZYkkdVgBj1sFTQBPlefVLTS80+mYzEBxnEgnYtyUueU6f1ARWQSRea4WCxsT/BLYmbWFQCIX5lLV4mddFfHtXdrZV9eqzUYyrbGUJ1Kqdm00g6JSADKjfp9uK/BrsLNFeshyjjFpLgPJ6HIYOv0x+mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3Y31UmJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3Y31UmJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744516538; x=1776052538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ltkYFDyadT3Ne0/olO5AwxO/pA5D8c29XpzEIFHhtXw=;
  b=Y3Y31UmJ5fzeWATvw5x0/7bTQZ6MnG+7yazkayxKknWvDIl2v8DgNm5x
   at7tzAycApf0bFN1tLnulhLmCCyXcA+UjZCQEoTcCe70iWrFKzSaZIxHh
   Z9nscTXaVDHuiFU9UrUEDCUL1RVjBgnzCqRdgF3FHaXHi8RYu1IoAWZu4
   8gto25dBOw45c9vzzKWCP+6svsHoyi4boPudOzf29/ShapaHfuKgP2Pq5
   xST5deF2O6kPg0icc00B8BpEOweGhqml4KJ6aacdodQaTLKxN8PJAXbqx
   KtT8qJKJ/tssTuu92QfUYXtHimEwKD+YI+6cvj83z1EIIJBTh2AZL3Z1n
   g==;
X-CSE-ConnectionGUID: 99ZteWBbRqKCqTzH2qKFjw==
X-CSE-MsgGUID: 7vX/cuO+Tg+GD1HqiY3vbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="63561600"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="63561600"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 20:55:38 -0700
X-CSE-ConnectionGUID: Y7MPQ8u/Q9yOuEKQL1XIWw==
X-CSE-MsgGUID: GG2yo+csQSaixZCmp/mZXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="134284157"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Apr 2025 20:55:37 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3oRS-000CMb-2o;
	Sun, 13 Apr 2025 03:55:34 +0000
Date: Sun, 13 Apr 2025 11:55:24 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-next-wip 6643/6651]
 drivers/nvmem/layouts/adtran.c:102:1: warning: the frame size of 1076 bytes
 is larger than 1024 bytes
Message-ID: <202504131105.935r7DH0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.14-next-wip
head:   c47e22e7e204c4e69cb6eeeb8588809af178bc8c
commit: b25b864617cae33765e53cc53fbbc72faa5f3570 [6643/6651] nvmem: add layout for Adtran devices
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250413/202504131105.935r7DH0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504131105.935r7DH0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504131105.935r7DH0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvmem/layouts/adtran.c: In function 'adtran_add_cells':
>> drivers/nvmem/layouts/adtran.c:102:1: warning: the frame size of 1076 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     102 | }
         | ^


vim +102 drivers/nvmem/layouts/adtran.c

    33	
    34	static int adtran_add_cells(struct nvmem_layout *layout)
    35	{
    36		struct nvmem_device *nvmem = layout->nvmem;
    37		struct nvmem_cell_info info;
    38		struct device_node *layout_np;
    39		char mfginfo[1024], *c, *t, *p;
    40		int ret = -EINVAL;
    41	
    42		ret = nvmem_device_read(nvmem, 0, sizeof(mfginfo), mfginfo);
    43		if (ret < 0)
    44			return ret;
    45		else if (ret != ARRAY_SIZE(mfginfo))
    46			return -EIO;
    47	
    48		layout_np = of_nvmem_layout_get_container(nvmem);
    49		if (!layout_np)
    50			return -ENOENT;
    51	
    52		c = mfginfo;
    53		while (*c != 0xff) {
    54			memset(&info, 0, sizeof(info));
    55			if (*c == '#')
    56				goto nextline;
    57	
    58			t = strchr(c, '=');
    59			if (!t)
    60				goto nextline;
    61	
    62			*t = '\0';
    63			++t;
    64			info.offset = t - mfginfo;
    65			/* process variable name: convert to lower-case, '_' -> '-' */
    66			p = c;
    67			do {
    68				*p = tolower(*p);
    69				if (*p == '_')
    70					*p = '-';
    71			} while (*++p);
    72			info.name = c;
    73			c = strchr(t, 0xa); /* find newline */
    74			if (!c)
    75				break;
    76	
    77			info.bytes = c - t;
    78			if (!strcmp(info.name, "mfg-mac")) {
    79				info.raw_len = info.bytes;
    80				info.bytes = ETH_ALEN;
    81				info.read_post_process = adtran_mac_address_pp;
    82			}
    83	
    84			info.np = of_get_child_by_name(layout_np, info.name);
    85			ret = nvmem_add_one_cell(nvmem, &info);
    86			if (ret)
    87				break;
    88	
    89			++c;
    90			continue;
    91	
    92	nextline:
    93			c = strchr(c, 0xa); /* find newline */
    94			if (!c)
    95				break;
    96			++c;
    97		}
    98	
    99		of_node_put(layout_np);
   100	
   101		return ret;
 > 102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
