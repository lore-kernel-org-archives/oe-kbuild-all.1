Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B058F57
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 21:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693518492; x=1725054492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fyKHqNX+S6iP8eJGiKl0nPLQVuYd6Rt+T7dYwQh+bq8=;
  b=OCzV4auupZg2n7jfWdAfKMWEONaD8iSkJPSpjE/RX/CAIKzpP3gmBAgb
   RBNCyje+4usY6IlYyX97FyaoQD68LDGkqlWfqgyVsjEID8azzlREE9vP6
   VTT8Cu6E+UOlx5qFR8rggfXhNHiX+IwI6HnGtD0RkwGsGJYMYjkUer2/H
   qEGfpoNeivZJW3PiK9uBrr4dI2zvjwBzXG/Deq9cd1r+d3AkFR394lfRV
   Fs16uSMUm7W/LEEKsOejnjA/zXtd8VMQwAjxS5KnxRG2eI006xECjpi3e
   PTIz/yBmvtccUFFwQvCAL8K7qtX95/njOYzi4lWXcD1EICi8Vb7dO15c4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355571491"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="355571491"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 14:48:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805191163"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="805191163"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Aug 2023 14:48:09 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbpWJ-0000ZX-0L;
	Thu, 31 Aug 2023 21:48:07 +0000
Date: Fri, 1 Sep 2023 05:47:46 +0800
From: kernel test robot <lkp@intel.com>
To: Koba Ko <koba.ko@canonical.com>, Damien Le Moal <dlemoal@kernel.org>,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ata: libata: add workaround to flip LPM during
 suspend/resume
Message-ID: <202309010504.kO8lW46F-lkp@intel.com>
References: <20230831190828.1171119-1-koba.ko@canonical.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831190828.1171119-1-koba.ko@canonical.com>

Hi Koba,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5 next-20230831]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Koba-Ko/ata-libata-add-workaround-to-flip-LPM-during-suspend-resume/20230901-030957
base:   linus/master
patch link:    https://lore.kernel.org/r/20230831190828.1171119-1-koba.ko%40canonical.com
patch subject: [PATCH] ata: libata: add workaround to flip LPM during suspend/resume
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230901/202309010504.kO8lW46F-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010504.kO8lW46F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010504.kO8lW46F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ata/ahci.c:98:12: warning: 'ahci_intel_port_suspend' declared 'static' but never defined [-Wunused-function]
      98 | static int ahci_intel_port_suspend(struct ata_port *ap, pm_message_t mesg);
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ata/ahci.c:99:12: warning: 'ahci_intel_port_resume' declared 'static' but never defined [-Wunused-function]
      99 | static int ahci_intel_port_resume(struct ata_port *ap);
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +98 drivers/ata/ahci.c

    82	
    83	static int ahci_init_one(struct pci_dev *pdev, const struct pci_device_id *ent);
    84	static void ahci_remove_one(struct pci_dev *dev);
    85	static void ahci_shutdown_one(struct pci_dev *dev);
    86	static void ahci_intel_pcs_quirk(struct pci_dev *pdev, struct ahci_host_priv *hpriv);
    87	static int ahci_vt8251_hardreset(struct ata_link *link, unsigned int *class,
    88					 unsigned long deadline);
    89	static int ahci_avn_hardreset(struct ata_link *link, unsigned int *class,
    90				      unsigned long deadline);
    91	static void ahci_mcp89_apple_enable(struct pci_dev *pdev);
    92	static bool is_mcp89_apple(struct pci_dev *pdev);
    93	static int ahci_p5wdh_hardreset(struct ata_link *link, unsigned int *class,
    94					unsigned long deadline);
    95	#ifdef CONFIG_PM
    96	static int ahci_pci_device_runtime_suspend(struct device *dev);
    97	static int ahci_pci_device_runtime_resume(struct device *dev);
  > 98	static int ahci_intel_port_suspend(struct ata_port *ap, pm_message_t mesg);
  > 99	static int ahci_intel_port_resume(struct ata_port *ap);
   100	#ifdef CONFIG_PM_SLEEP
   101	static int ahci_pci_device_suspend(struct device *dev);
   102	static int ahci_pci_device_resume(struct device *dev);
   103	#endif
   104	#endif /* CONFIG_PM */
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
