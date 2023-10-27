Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27F653B7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 09:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAVEKwsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698397822; x=1729933822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qIHuhHWz9ol66WYZ+Sr2Acwu5Rt20Ci8LRus1iREHJo=;
  b=TAVEKwsMHuHSAdND3duuF/F9K/XR5TCHjEMedEnrYnxYmjTZiK6I3p+Q
   u+UWfE9b3pL/cozYJURs4n+Kq9+uDd0SOqGI7293gfErSe+cZhyNaq8JT
   ZLU/an0M8j8IOEj5CnCWmSBZxOQTf5bDapZb9bETvSjf9ii3D4rJTnGdZ
   tEVSaxSlPvtQL7yjJJHLaRMSDpnSIdgOqALrQE1E15qiZHQ2sSN9cXXLp
   Pxp4yn2wDhojmhVw+nk7+Rwma2JAFHUu0nOBf5zVYC2NTYfHl5iI2PGHp
   0kZxpGznmh3xXuRjVyQs4o+BbqV2JfK7QATS4nSWC/IHum8PIQaQahOab
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="367949330"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="367949330"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:10:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="903212004"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="903212004"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Oct 2023 02:07:52 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwIrC-000Afb-0l;
	Fri, 27 Oct 2023 09:10:18 +0000
Date: Fri, 27 Oct 2023 17:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Crescent CY Hsieh <crescentcy.hsieh@moxa.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Crescent CY Hsieh <crescentcy.hsieh@moxa.com>
Subject: Re: [PATCH 1/2] tty: serial: 8250: Fix MOXA RS422/RS485 PCIe boards
 not work by default
Message-ID: <202310271618.QBCWA4yo-lkp@intel.com>
References: <20231027062440.7749-2-crescentcy.hsieh@moxa.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027062440.7749-2-crescentcy.hsieh@moxa.com>

Hi Crescent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next next-20231026]
[cannot apply to tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.6-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Crescent-CY-Hsieh/tty-serial-8250-Fix-MOXA-RS422-RS485-PCIe-boards-not-work-by-default/20231027-142745
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20231027062440.7749-2-crescentcy.hsieh%40moxa.com
patch subject: [PATCH 1/2] tty: serial: 8250: Fix MOXA RS422/RS485 PCIe boards not work by default
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231027/202310271618.QBCWA4yo-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271618.QBCWA4yo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271618.QBCWA4yo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_pci.c:2001:5: warning: no previous prototype for 'pci_moxa_supported_rs' [-Wmissing-prototypes]
    2001 | u32 pci_moxa_supported_rs(struct pci_dev *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/pci_moxa_supported_rs +2001 drivers/tty/serial/8250/8250_pci.c

  2000	
> 2001	u32 pci_moxa_supported_rs(struct pci_dev *dev)
  2002	{
  2003		switch (dev->device & 0x0F00) {
  2004		case 0x0000:
  2005		case 0x0600:
  2006			return MOXA_SUPP_RS232;
  2007		case 0x0100:
  2008			return MOXA_SUPP_RS232 | MOXA_SUPP_RS422 | MOXA_SUPP_RS485;
  2009		case 0x0300:
  2010			return MOXA_SUPP_RS422 | MOXA_SUPP_RS485;
  2011		}
  2012		return 0;
  2013	}
  2014	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
