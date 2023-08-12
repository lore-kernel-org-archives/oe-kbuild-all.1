Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2162F50
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 15:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691854098; x=1723390098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kl8ySLkfiRzitzvglJJp1rA0wBIFjxS6eS+nDwpmYqk=;
  b=j685/gdj/reb7BAqPqqMCgEOgTQdIeB+3VtcXIKxJZtCEoAvRJu44nTR
   sRm+Glua2+2hO7fIYSa3HlnBej46qzBJj2jQGBi0INSuyvtIAmhdi5SEn
   0m596G9xOj3YQwd2hH7bBEcl2sESI5WP+NlZF/RV3d3HfOoMCFTa40aS8
   A1T0E+2ert3fr6oKeS/dwqGjn1Tw0MOi9KPgKRmlsY+8M62I5QYT0U9DX
   /Z1Li+sOMnq+ihpKdHvccWb7RbbTK0K0xF3qKEEKbS2mqAv8CbeSgKQ+p
   JWkZ5G4sQjMw0w3wXK2XTFflKaLfOYG4vjyUikG9mA8pASkiZtbvukjmf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="369305298"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="369305298"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 08:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="876477825"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2023 08:28:20 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUqXH-0008dg-3C;
	Sat, 12 Aug 2023 15:28:15 +0000
Date: Sat, 12 Aug 2023 23:27:39 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4 7972/8003]
 drivers/nvmem/layouts/adtran.c:110:1: warning: the frame size of 1080 bytes
 is larger than 1024 bytes
Message-ID: <202308122304.ncZiMYml-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4
head:   33ae06cdbe7cdded20d1ac549403343243272109
commit: cfdee1b77007e00f4a81c5acbe361ff0a43f34d1 [7972/8003] nvmem: add layout for Adtran devices
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230812/202308122304.ncZiMYml-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308122304.ncZiMYml-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308122304.ncZiMYml-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvmem/layouts/adtran.c: In function 'adtran_add_cells':
>> drivers/nvmem/layouts/adtran.c:110:1: warning: the frame size of 1080 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     110 | }
         | ^


vim +110 drivers/nvmem/layouts/adtran.c

    44	
    45	static int adtran_add_cells(struct device *dev, struct nvmem_device *nvmem,
    46				     struct nvmem_layout *layout)
    47	{
    48		struct nvmem_cell_info info;
    49		struct device_node *layout_np;
    50		char mfginfo[1024], *c, *t, *p;
    51		int ret = -EINVAL;
    52	
    53		ret = nvmem_device_read(nvmem, 0, sizeof(mfginfo), mfginfo);
    54		if (ret < 0)
    55			return ret;
    56		else if (ret != sizeof(mfginfo))
    57			return -EIO;
    58	
    59		layout_np = of_nvmem_layout_get_container(nvmem);
    60		if (!layout_np)
    61			return -ENOENT;
    62	
    63		c = mfginfo;
    64		while (*c != 0xff) {
    65			memset(&info, 0, sizeof(info));
    66			if (*c == '#')
    67				goto nextline;
    68	
    69			t = strchr(c, '=');
    70			if (!t)
    71				goto nextline;
    72	
    73			*t = '\0';
    74			++t;
    75			info.offset = t - mfginfo;
    76			if (!strcmp(c, "MFG_MAC"))
    77				info.read_post_process = adtran_mac_address_pp;
    78	
    79			/* process variable name: convert to lower-case, '_' -> '-' */
    80			p = c;
    81			do {
    82				*p = tolower(*p);
    83				if (*p == '_')
    84					*p = '-';
    85			} while (*++p);
    86			info.name = c;
    87			c = strchr(t, 0xa); /* find newline */
    88			if (!c)
    89				break;
    90	
    91			info.bytes = c - t;
    92			info.np = of_get_child_by_name(layout_np, info.name);
    93			ret = nvmem_add_one_cell(nvmem, &info);
    94			if (ret)
    95				break;
    96	
    97			++c;
    98			continue;
    99	
   100	nextline:
   101			c = strchr(c, 0xa); /* find newline */
   102			if (!c)
   103				break;
   104			++c;
   105		}
   106	
   107		of_node_put(layout_np);
   108	
   109		return ret;
 > 110	}
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
