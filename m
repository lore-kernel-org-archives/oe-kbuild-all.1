Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A0BFBFD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Aug 2023 18:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691434513; x=1722970513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nOI5frD7aIiKToXDzxssoiEowrEps8BCLRWroJ9k+fg=;
  b=hytlQW6iSaGqplyQ9Fvn6l3pz0U/NpDHWBTd4mEbLOoaNrOhlgQI7ksa
   NMgANOaqdxD0gs4dWao5qUJu2Y7QeInLWHo0S5LPBbPoNtQUtYfytWY1V
   CHWogcI25Ks5QpuLOjIk+vHC+IYj+R4vJcwmzawZDfPEMKqdG3qgBTWuR
   zOWCJhEvoo8Wjl/XBqehEOD3lONwlOGw2zPhI1SAJtr7bLjWzX9wZOWbM
   1F+/QtAJ8QRGIVdLpsGtkdQg6KQUK0zJs98FLrKdSt6uAYFtG0zNszOGw
   Cx3UFOExievHkW9iU+s/ml2AiCMRpwFB7HvSPlEoIVpJVLuIelQ+pUnFa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="370618295"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="370618295"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 11:55:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="734189417"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="734189417"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Aug 2023 11:55:09 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qT5Nj-0004oz-2Z;
	Mon, 07 Aug 2023 18:55:07 +0000
Date: Tue, 8 Aug 2023 02:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/030-misc 12/25] drivers/of/property.c:1155:28:
 warning: 'parse_backlight' defined but not used
Message-ID: <202308080257.em18i4Lj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   843ecdb79e6589c39f5b6e2c7374b47ecda1c875
commit: 9a63406a9d26211f442fa9b236c9335ee4f82d5a [12/25] of: HACK: disable backlight supplier binding if not needed
config: i386-randconfig-r036-20230807 (https://download.01.org/0day-ci/archive/20230808/202308080257.em18i4Lj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308080257.em18i4Lj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308080257.em18i4Lj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/property.c:1155:28: warning: 'parse_backlight' defined but not used [-Wunused-function]
    1155 | static struct device_node *parse_##fname(struct device_node *np,          \
         |                            ^~~~~~
   drivers/of/property.c:1268:1: note: in expansion of macro 'DEFINE_SIMPLE_PROP'
    1268 | DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
         | ^~~~~~~~~~~~~~~~~~


vim +/parse_backlight +1155 drivers/of/property.c

a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1153  
a436ef4aba1f01 Saravana Kannan 2019-11-04  1154  #define DEFINE_SIMPLE_PROP(fname, name, cells)				  \
a436ef4aba1f01 Saravana Kannan 2019-11-04 @1155  static struct device_node *parse_##fname(struct device_node *np,	  \
a436ef4aba1f01 Saravana Kannan 2019-11-04  1156  					const char *prop_name, int index) \
a436ef4aba1f01 Saravana Kannan 2019-11-04  1157  {									  \
a436ef4aba1f01 Saravana Kannan 2019-11-04  1158  	return parse_prop_cells(np, prop_name, index, name, cells);	  \
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1159  }
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1160  

:::::: The code at line 1155 was first introduced by commit
:::::: a436ef4aba1f011fa25f35fe7922d577ecde6c7c of: property: Make it easy to add device links from DT properties

:::::: TO: Saravana Kannan <saravanak@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
