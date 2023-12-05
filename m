Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F7C6E58E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 21:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lod8UfxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701812156; x=1733348156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NVTEi0xQy+3/V4ZhmZDOqyaynz26at0iHc609karX6U=;
  b=Lod8UfxUl/5j5OE1ffrMgLMSDb7oPjLL9gtCvtIZlCMd0QafNsaqw7am
   OMGE6Rx8m6vKmEdWU5CMtVYsEjAgQXbxi3JPH4p4Y1gfDu+P8LzMfoNUW
   Id5Hmi912D348jhvq7HiXi6yZPjzWyijbhtm/adx17wukM96NrwzfY8iB
   CiaQQHXB04RdDM5kA65YpJ6TcX5Eg9c2mUB1jFGh4/bu55DM7d6GFZ80F
   83QirvaVD0LtMojPIx/Vee5DDMt4hmy6fDM3XgO6/Eo/jaiWBzh0UOSo8
   9g1JtRHiK1DOGBkZSQhYVfJPVPf2uBKitM4FOk44qzWHuRzOnzqJAFvQD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="391128795"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="391128795"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 13:35:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="837084267"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="837084267"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 05 Dec 2023 13:35:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAd55-0009lG-0v;
	Tue, 05 Dec 2023 21:35:51 +0000
Date: Wed, 6 Dec 2023 05:35:26 +0800
From: kernel test robot <lkp@intel.com>
To: Crescent CY Hsieh <crescentcy.hsieh@moxa.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Crescent CY Hsieh <crescentcy.hsieh@moxa.com>
Subject: Re: [RESEND PATCH] tty: serial: 8250: Fix MOXA RS422/RS485 PCIe
 boards not work by default
Message-ID: <202312060523.Kmstf65q-lkp@intel.com>
References: <20231201074055.259207-1-crescentcy.hsieh@moxa.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201074055.259207-1-crescentcy.hsieh@moxa.com>

Hi Crescent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Crescent-CY-Hsieh/tty-serial-8250-Fix-MOXA-RS422-RS485-PCIe-boards-not-work-by-default/20231201-154322
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20231201074055.259207-1-crescentcy.hsieh%40moxa.com
patch subject: [RESEND PATCH] tty: serial: 8250: Fix MOXA RS422/RS485 PCIe boards not work by default
config: x86_64-randconfig-122-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060523.Kmstf65q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060523.Kmstf65q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060523.Kmstf65q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/serial/8250/8250_pci.c:2001:5: sparse: sparse: symbol 'pci_moxa_supported_rs' was not declared. Should it be static?

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
