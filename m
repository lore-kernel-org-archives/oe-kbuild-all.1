Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2955C941
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 21:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678397506; x=1709933506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xqEU/xpQmG3XBT8UvsTkfueNh2v0rzg7v9y9ON6CO28=;
  b=lVqkV5OGX8/qe8Erenx72v3NHjjqV1yh3JaBztkX4KK+urEIC6aYrMaW
   t9dygzkeAzTOjkpA3NYFuLyP+ZrWzxpX+iLN7Cx9fV9I5qhiF1/3oxFxs
   3n2u+ivMYNEOfIAzpW+dyvZK0RPZmFSi5h4XPfu4nhCHpvZyj2+hPHG+a
   Qn59/AXeIeNBXz+4YlcBr6FMY8+/yx/ImaEYQRFiIHMaOfyimFfFCHGeo
   1A1PNZT1kjxxUhyizXo0Zx65YbiO87GquFw0BnUxffSmC2aC5x2ORVExM
   tsLFl3UsBrYhlvMdMtrf2drO1KvxrVU6i99IxOqF9eq/rMk8W/i3qq66Y
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="324924277"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="324924277"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 13:31:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="746474015"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="746474015"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2023 13:31:41 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paNrQ-0003ER-0D;
	Thu, 09 Mar 2023 21:31:40 +0000
Date: Fri, 10 Mar 2023 05:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Lindgren <tony@atomide.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Johan Hovold <johan@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-omap@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
Message-ID: <202303100516.22vtkWv4-lkp@intel.com>
References: <20230309085713.57700-1-tony@atomide.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309085713.57700-1-tony@atomide.com>

Hi Tony,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus rafael-pm/linux-next usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.3-rc1 next-20230309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Lindgren/serial-core-Start-managing-serial-controllers-to-enable-runtime-PM/20230309-170149
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20230309085713.57700-1-tony%40atomide.com
patch subject: [PATCH v6 1/1] serial: core: Start managing serial controllers to enable runtime PM
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230310/202303100516.22vtkWv4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/08f76f28e32bcd3c093e4af349b0e1b60328395e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tony-Lindgren/serial-core-Start-managing-serial-controllers-to-enable-runtime-PM/20230309-170149
        git checkout 08f76f28e32bcd3c093e4af349b0e1b60328395e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303100516.22vtkWv4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:25,
                    from include/linux/pm_runtime.h:11,
                    from drivers/tty/serial/serial_ctrl.c:12:
>> drivers/tty/serial/serial_ctrl.c:17:34: warning: 'serial_ctrl_pm' defined but not used [-Wunused-const-variable=]
      17 | static DEFINE_RUNTIME_DEV_PM_OPS(serial_ctrl_pm, NULL, NULL, NULL);
         |                                  ^~~~~~~~~~~~~~
   include/linux/pm.h:372:25: note: in definition of macro '_DEFINE_DEV_PM_OPS'
     372 | const struct dev_pm_ops name = { \
         |                         ^~~~
   drivers/tty/serial/serial_ctrl.c:17:8: note: in expansion of macro 'DEFINE_RUNTIME_DEV_PM_OPS'
      17 | static DEFINE_RUNTIME_DEV_PM_OPS(serial_ctrl_pm, NULL, NULL, NULL);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/serial_ctrl_pm +17 drivers/tty/serial/serial_ctrl.c

     2	
     3	/*
     4	 * Serial core controller driver
     5	 *
     6	 * This driver manages the serial core controller struct device instances.
     7	 * The serial core controller devices are children of the physical serial
     8	 * port device.
     9	 */
    10	
    11	#include <linux/module.h>
  > 12	#include <linux/pm_runtime.h>
    13	#include <linux/serial_core.h>
    14	
    15	#include "serial_base.h"
    16	
  > 17	static DEFINE_RUNTIME_DEV_PM_OPS(serial_ctrl_pm, NULL, NULL, NULL);
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
