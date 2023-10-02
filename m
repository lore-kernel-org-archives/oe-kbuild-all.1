Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FDF7E3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 04:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696220060; x=1727756060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+SbMEiP/nQq9jUEuPEvZs/+si7/UMTULLo1o542jqPM=;
  b=SuXsp2WDlBbra+ztgpAZFQd/LHke78h4wit3mq7dSGhLwN8cs4NzYblP
   waHfzaIlKK7f8FlCGvljRKKOZcJEV1WhcuHSbg5fYurTW7BBItAdpqilT
   Pl2pgre5/7w64wCfvRJae01mT46+JyOC/dfr4+YmPsJsxLbZjFsCY24wG
   hbYCn468xZyAcGPFfOUPtfXHKiIQ9j45RZGEgIXVJKnGsGP2JSEPhaWp4
   5iuZQukwEvM5pWCq4j/TuTZR99xsegleYYzIZtl5Aq7hiCmD18XaSd4aH
   mejLjifoXoI2zSk978KQ8M/L+j/8S0KR5kj41Qh1OdsxMnudeOhteKA/L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="381463406"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="381463406"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 21:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="1407423"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Oct 2023 21:13:37 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnAJy-0005ki-2q;
	Mon, 02 Oct 2023 04:14:14 +0000
Date: Mon, 2 Oct 2023 12:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Crescent CY Hsieh <crescentcy.hsieh@moxa.com>,
	gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Crescent CY Hsieh <crescentcy.hsieh@moxa.com>
Subject: Re: [PATCH 4/4] tty: serial: 8250: Add support for MOXA PCIe boards
 to switch interface between RS422/RS485
Message-ID: <202310021202.xDwDImQv-lkp@intel.com>
References: <20231002015702.30509-5-crescentcy.hsieh@moxa.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002015702.30509-5-crescentcy.hsieh@moxa.com>

Hi Crescent,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.6-rc4 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Crescent-CY-Hsieh/tty-serial-8250-Cleanup-MOXA-configurations-in-8250_pci-c/20231002-095945
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20231002015702.30509-5-crescentcy.hsieh%40moxa.com
patch subject: [PATCH 4/4] tty: serial: 8250: Add support for MOXA PCIe boards to switch interface between RS422/RS485
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20231002/202310021202.xDwDImQv-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310021202.xDwDImQv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310021202.xDwDImQv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/serial_core.c: In function 'uart_check_rs485_flags':
>> drivers/tty/serial/serial_core.c:1302:60: error: 'SER_RS422_ENALBED' undeclared (first use in this function); did you mean 'SER_RS422_ENABLED'?
    1302 |                                  SER_RS485_TERMINATE_BUS | SER_RS422_ENALBED)
         |                                                            ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:1309:19: note: in expansion of macro 'SER_RS485_LEGACY_FLAGS'
    1309 |         flags &= ~SER_RS485_LEGACY_FLAGS;
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:1302:60: note: each undeclared identifier is reported only once for each function it appears in
    1302 |                                  SER_RS485_TERMINATE_BUS | SER_RS422_ENALBED)
         |                                                            ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:1309:19: note: in expansion of macro 'SER_RS485_LEGACY_FLAGS'
    1309 |         flags &= ~SER_RS485_LEGACY_FLAGS;
         |                   ^~~~~~~~~~~~~~~~~~~~~~


vim +1302 drivers/tty/serial/serial_core.c

  1299	
  1300	#define SER_RS485_LEGACY_FLAGS	(SER_RS485_ENABLED | SER_RS485_RTS_ON_SEND | \
  1301					 SER_RS485_RTS_AFTER_SEND | SER_RS485_RX_DURING_TX | \
> 1302					 SER_RS485_TERMINATE_BUS | SER_RS422_ENALBED)
  1303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
