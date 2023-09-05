Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CAB375
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 00:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693874258; x=1725410258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RRjOLfPZiOEGn65DJliLG1wYKvlTBzUZf63hFLBxp2Y=;
  b=Lkie9HHGDsUn7kMZyMYomH0/SlnOC5/ydbStYt//7D173bTig/sYNiZe
   8psNl+TxkPMLTdogZO1VG+BzstmSAbwhHteAfN+WDxw+1oMDb8Dx9JOcC
   xIIkveC2AzMLylUBaN/vlvVR6hjymJIxnsjlOrNCzlM29RasFXXl4Gxl8
   BV++HaB1bRfSTjt8R7MQTOd3HoKo8biiw6eCAVeFpE02peErj7rhD5RyB
   U5Th22Ch5iIcdmnFVscF1OX22RwrEn2ahoFc6ypw8YQP6IzSyrTauq0Hq
   k1acLXeTfnq7ltCQelYhu6bfkDBSq8gjtwWdkNc9nILWI551BLAzv+JyD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="375563576"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="375563576"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 17:37:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="831038376"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="831038376"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Sep 2023 17:37:35 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdK4S-00010r-1i;
	Tue, 05 Sep 2023 00:37:32 +0000
Date: Tue, 5 Sep 2023 08:37:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC,drm-misc-next v4 1/9] PCI/VGA: Allowing the user to select
 the primary video adapter at boot time
Message-ID: <202309050810.hh5H13St-lkp@intel.com>
References: <20230904195724.633404-2-sui.jingfeng@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230904195724.633404-2-sui.jingfeng@linux.dev>

Hi Sui,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm/drm-next]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next-fixes pci/next pci/for-linus awilliam-vfio/next awilliam-vfio/for-linus linus/master v6.5 next-20230831]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/PCI-VGA-Allowing-the-user-to-select-the-primary-video-adapter-at-boot-time/20230905-040012
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20230904195724.633404-2-sui.jingfeng%40linux.dev
patch subject: [RFC,drm-misc-next v4 1/9] PCI/VGA: Allowing the user to select the primary video adapter at boot time
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230905/202309050810.hh5H13St-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309050810.hh5H13St-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309050810.hh5H13St-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/vgaarb.c:981: warning: Function parameter or member 'be_primary' not described in 'vga_client_register'


vim +981 drivers/pci/vgaarb.c

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  949  
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  950  /**
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  951   * vga_client_register - register or unregister a VGA arbitration client
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  952   * @pdev: pci device of the VGA client
bf44e8cecc03c9 drivers/gpu/vga/vgaarb.c Christoph Hellwig      2021-07-16  953   * @set_decode: vga decode change callback
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  954   *
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  955   * Clients have two callback mechanisms they can use.
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  956   *
bf44e8cecc03c9 drivers/gpu/vga/vgaarb.c Christoph Hellwig      2021-07-16  957   * @set_decode callback: If a client can disable its GPU VGA resource, it
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  958   * will get a callback from this to set the encode/decode state.
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  959   *
d10181c6f0aab4 drivers/pci/vgaarb.c     Sui Jingfeng           2023-09-05  960   * @be_primary callback: Callback to the device driver, query if a device
d10181c6f0aab4 drivers/pci/vgaarb.c     Sui Jingfeng           2023-09-05  961   * want to be the primary display. This callback is optional, device drivers
d10181c6f0aab4 drivers/pci/vgaarb.c     Sui Jingfeng           2023-09-05  962   * who have no special needs can simply pass a NULL.
d10181c6f0aab4 drivers/pci/vgaarb.c     Sui Jingfeng           2023-09-05  963   *
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  964   * Rationale: we cannot disable VGA decode resources unconditionally some single
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  965   * GPU laptops seem to require ACPI or BIOS access to the VGA registers to
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  966   * control things like backlights etc.  Hopefully newer multi-GPU laptops do
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  967   * something saner, and desktops won't have any special ACPI for this. The
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  968   * driver will get a callback when VGA arbitration is first used by userspace
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  969   * since some older X servers have issues.
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  970   *
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  971   * This function does not check whether a client for @pdev has been registered
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  972   * already.
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  973   *
b8779475869a26 drivers/gpu/vga/vgaarb.c Christoph Hellwig      2021-07-16  974   * To unregister just call vga_client_unregister().
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  975   *
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  976   * Returns: 0 on success, -1 on failure
b754b35b089ddf drivers/gpu/vga/vgaarb.c Daniel Vetter          2016-08-12  977   */
bf44e8cecc03c9 drivers/gpu/vga/vgaarb.c Christoph Hellwig      2021-07-16  978  int vga_client_register(struct pci_dev *pdev,
d10181c6f0aab4 drivers/pci/vgaarb.c     Sui Jingfeng           2023-09-05  979  		unsigned int (*set_decode)(struct pci_dev *pdev, bool decode),
d10181c6f0aab4 drivers/pci/vgaarb.c     Sui Jingfeng           2023-09-05  980  		bool (*be_primary)(struct pci_dev *pdev))
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 @981  {
934f992c763ae1 drivers/gpu/vga/vgaarb.c Chris Wilson           2011-01-20  982  	int ret = -ENODEV;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  983  	struct vga_device *vgadev;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  984  	unsigned long flags;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  985  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  986  	spin_lock_irqsave(&vga_lock, flags);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  987  	vgadev = vgadev_find(pdev);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  988  	if (!vgadev)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  989  		goto bail;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  990  
bf44e8cecc03c9 drivers/gpu/vga/vgaarb.c Christoph Hellwig      2021-07-16  991  	vgadev->set_decode = set_decode;
d10181c6f0aab4 drivers/pci/vgaarb.c     Sui Jingfeng           2023-09-05  992  	vgadev->be_primary = be_primary;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  993  	ret = 0;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  994  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  995  bail:
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  996  	spin_unlock_irqrestore(&vga_lock, flags);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  997  	return ret;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  998  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
