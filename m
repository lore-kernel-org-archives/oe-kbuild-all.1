Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD33C747F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678286451; x=1709822451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=16a+Y0sbXvtxdT0kTJPvbMmQ3EAUjC6gq0EE4q9EFPw=;
  b=SZ2to3Kfs0inn8qIyf/H/Tw/PqBacOi0ucgmn2MxhyTs1Io3MUW1QZ2u
   +1vr/kjjHQd6kgNWokYRLuvjMDX+rjFlLOQptY2QpfU+MFKsJEAFU++t1
   XnfmGYG0/sfJBNwDd4cytgmg3kgywmWiO1TpvMLcV61LnKVsJLrSimXO6
   L5S4f3SBptIOHlGsrMQie9epWDYKXcIWFOPndR2BTeX6znOuJh1bPcnpl
   H+QUCzX3ahibuwviI+rQcl4fb3+CenMpW1v9HRGTs87ljhEzxwgi9eJJ6
   B6NmUvWs0x4d718MpCzYpUJupS5CN7IwbQtgv90jTsGsiWVP9GfKMu54x
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337685042"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="337685042"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 06:40:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676994115"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="676994115"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Mar 2023 06:40:47 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZuyE-0002BP-2T;
	Wed, 08 Mar 2023 14:40:46 +0000
Date: Wed, 8 Mar 2023 22:40:30 +0800
From: kernel test robot <lkp@intel.com>
To: Grzegorz Jaszczyk <jaz@semihalf.com>, linux-kernel@vger.kernel.org,
	alex.williamson@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, dmy@semihalf.com, tn@semihalf.com,
	dbehr@google.com, upstream@semihalf.com, dtor@google.com,
	jgg@ziepe.ca, kevin.tian@intel.com, cohuck@redhat.com,
	abhsahu@nvidia.com, yishaih@nvidia.com, yi.l.liu@intel.com,
	kvm@vger.kernel.org, Dominik Behr <dbehr@chromium.org>,
	Grzegorz Jaszczyk <jaz@semihalf.com>
Subject: Re: [PATCH] vfio/pci: Propagate ACPI notifications to the user-space
Message-ID: <202303082215.ido9E51S-lkp@intel.com>
References: <20230307220553.631069-1-jaz@semihalf.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307220553.631069-1-jaz@semihalf.com>

Hi Grzegorz,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on awilliam-vfio/for-linus]
[also build test ERROR on linus/master v6.3-rc1 next-20230308]
[cannot apply to awilliam-vfio/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Grzegorz-Jaszczyk/vfio-pci-Propagate-ACPI-notifications-to-the-user-space/20230308-060849
base:   https://github.com/awilliam/linux-vfio.git for-linus
patch link:    https://lore.kernel.org/r/20230307220553.631069-1-jaz%40semihalf.com
patch subject: [PATCH] vfio/pci: Propagate ACPI notifications to the user-space
config: openrisc-randconfig-r004-20230305 (https://download.01.org/0day-ci/archive/20230308/202303082215.ido9E51S-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1f21a10b45b22629acc63ecf2d4c2e4573c44283
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Grzegorz-Jaszczyk/vfio-pci-Propagate-ACPI-notifications-to-the-user-space/20230308-060849
        git checkout 1f21a10b45b22629acc63ecf2d4c2e4573c44283
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/vfio/pci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303082215.ido9E51S-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/pci/vfio_pci_core.c: In function 'vfio_pci_core_acpi_notify':
>> drivers/vfio/pci/vfio_pci_core.c:2128:9: error: implicit declaration of function 'acpi_bus_generate_netlink_event' [-Werror=implicit-function-declaration]
    2128 |         acpi_bus_generate_netlink_event("vfio_pci", dev_name(dev), event, 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c: In function 'vfio_pci_core_register_device':
>> drivers/vfio/pci/vfio_pci_core.c:2220:50: error: invalid use of undefined type 'struct acpi_device'
    2220 |         status = acpi_install_notify_handler(adev->handle, ACPI_DEVICE_NOTIFY,
         |                                                  ^~
   drivers/vfio/pci/vfio_pci_core.c: In function 'vfio_pci_core_unregister_device':
   drivers/vfio/pci/vfio_pci_core.c:2248:48: error: invalid use of undefined type 'struct acpi_device'
    2248 |                 acpi_remove_notify_handler(adev->handle, ACPI_DEVICE_NOTIFY,
         |                                                ^~
   cc1: some warnings being treated as errors


vim +/acpi_bus_generate_netlink_event +2128 drivers/vfio/pci/vfio_pci_core.c

  2122	
  2123	static void vfio_pci_core_acpi_notify(acpi_handle handle, u32 event, void *data)
  2124	{
  2125		struct vfio_pci_core_device *vdev = (struct vfio_pci_core_device *)data;
  2126		struct device *dev = &vdev->pdev->dev;
  2127	
> 2128		acpi_bus_generate_netlink_event("vfio_pci", dev_name(dev), event, 0);
  2129	}
  2130	
  2131	int vfio_pci_core_register_device(struct vfio_pci_core_device *vdev)
  2132	{
  2133		acpi_status status;
  2134		struct pci_dev *pdev = vdev->pdev;
  2135		struct device *dev = &pdev->dev;
  2136		struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
  2137		int ret;
  2138	
  2139		/* Drivers must set the vfio_pci_core_device to their drvdata */
  2140		if (WARN_ON(vdev != dev_get_drvdata(dev)))
  2141			return -EINVAL;
  2142	
  2143		if (pdev->hdr_type != PCI_HEADER_TYPE_NORMAL)
  2144			return -EINVAL;
  2145	
  2146		if (vdev->vdev.mig_ops) {
  2147			if (!(vdev->vdev.mig_ops->migration_get_state &&
  2148			      vdev->vdev.mig_ops->migration_set_state &&
  2149			      vdev->vdev.mig_ops->migration_get_data_size) ||
  2150			    !(vdev->vdev.migration_flags & VFIO_MIGRATION_STOP_COPY))
  2151				return -EINVAL;
  2152		}
  2153	
  2154		if (vdev->vdev.log_ops && !(vdev->vdev.log_ops->log_start &&
  2155		    vdev->vdev.log_ops->log_stop &&
  2156		    vdev->vdev.log_ops->log_read_and_clear))
  2157			return -EINVAL;
  2158	
  2159		/*
  2160		 * Prevent binding to PFs with VFs enabled, the VFs might be in use
  2161		 * by the host or other users.  We cannot capture the VFs if they
  2162		 * already exist, nor can we track VF users.  Disabling SR-IOV here
  2163		 * would initiate removing the VFs, which would unbind the driver,
  2164		 * which is prone to blocking if that VF is also in use by vfio-pci.
  2165		 * Just reject these PFs and let the user sort it out.
  2166		 */
  2167		if (pci_num_vf(pdev)) {
  2168			pci_warn(pdev, "Cannot bind to PF with SR-IOV enabled\n");
  2169			return -EBUSY;
  2170		}
  2171	
  2172		if (pci_is_root_bus(pdev->bus)) {
  2173			ret = vfio_assign_device_set(&vdev->vdev, vdev);
  2174		} else if (!pci_probe_reset_slot(pdev->slot)) {
  2175			ret = vfio_assign_device_set(&vdev->vdev, pdev->slot);
  2176		} else {
  2177			/*
  2178			 * If there is no slot reset support for this device, the whole
  2179			 * bus needs to be grouped together to support bus-wide resets.
  2180			 */
  2181			ret = vfio_assign_device_set(&vdev->vdev, pdev->bus);
  2182		}
  2183	
  2184		if (ret)
  2185			return ret;
  2186		ret = vfio_pci_vf_init(vdev);
  2187		if (ret)
  2188			return ret;
  2189		ret = vfio_pci_vga_init(vdev);
  2190		if (ret)
  2191			goto out_vf;
  2192	
  2193		vfio_pci_probe_power_state(vdev);
  2194	
  2195		/*
  2196		 * pci-core sets the device power state to an unknown value at
  2197		 * bootup and after being removed from a driver.  The only
  2198		 * transition it allows from this unknown state is to D0, which
  2199		 * typically happens when a driver calls pci_enable_device().
  2200		 * We're not ready to enable the device yet, but we do want to
  2201		 * be able to get to D3.  Therefore first do a D0 transition
  2202		 * before enabling runtime PM.
  2203		 */
  2204		vfio_pci_set_power_state(vdev, PCI_D0);
  2205	
  2206		dev->driver->pm = &vfio_pci_core_pm_ops;
  2207		pm_runtime_allow(dev);
  2208		if (!disable_idle_d3)
  2209			pm_runtime_put(dev);
  2210	
  2211		ret = vfio_register_group_dev(&vdev->vdev);
  2212		if (ret)
  2213			goto out_power;
  2214	
  2215		if (!adev) {
  2216			pci_info(pdev, "No ACPI companion");
  2217			return 0;
  2218		}
  2219	
> 2220		status = acpi_install_notify_handler(adev->handle, ACPI_DEVICE_NOTIFY,
  2221						vfio_pci_core_acpi_notify, (void *)vdev);
  2222	
  2223		if (ACPI_FAILURE(status)) {
  2224			pci_err(pdev, "Failed to install notify handler");
  2225			goto out_group_register;
  2226		}
  2227	
  2228		return 0;
  2229	
  2230	out_group_register:
  2231		vfio_unregister_group_dev(&vdev->vdev);
  2232	out_power:
  2233		if (!disable_idle_d3)
  2234			pm_runtime_get_noresume(dev);
  2235	
  2236		pm_runtime_forbid(dev);
  2237	out_vf:
  2238		vfio_pci_vf_uninit(vdev);
  2239		return ret;
  2240	}
  2241	EXPORT_SYMBOL_GPL(vfio_pci_core_register_device);
  2242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
