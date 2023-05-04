Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82BA156C7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 21:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683234534; x=1714770534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ArRD3csKlTJ1eynGWltfoAeRjrRAAamLT15aOFks8eU=;
  b=YRMIKd3zO/ldP0mmFxCOLoNSiMbBU9btgBdHP2bR77ZxvhsI/O+svg2o
   B34H8Zpvv7SPIy3QcaSlal6vtbOWce40OCABBcB07KWJZBdaKFAttAfCj
   d/mDWR9RQ6Ilqq/uheFf0xZKcWEHAnNvWPcs4/EcV1zghqo/28JWSvoWh
   ubgP4RzvsdDHpn3MS3os1mRTAprGVsB8/dmuyJqgDuS6d8b+Aer6lKDqM
   RzT+v4KHj766q9QaWF9BvjDNLnJ06ppLSseW2yX+hZpXYWWMlyVufQEaV
   XvxIhzlIy8Gp5iFLV9m17I9jWCE2BmzvPsQinb4TcFeAWkfj+VgDJHnJg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="349098320"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="349098320"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 14:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="729977013"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="729977013"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 May 2023 14:08:52 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pugC3-00008m-2f;
	Thu, 04 May 2023 21:08:51 +0000
Date: Fri, 5 May 2023 05:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 9/28] drivers/cxl/port.c:148:22: error: implicit
 declaration of function 'acpi_table_parse_cdat'; did you mean
 'acpi_table_parse'?
Message-ID: <202305050449.MM2O1TzE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   c09d294a320a41a687ff2881bc080bf7d9ee5ce2
commit: fefcdcea03df25a0774005f0f804a3ae8b49b392 [9/28] cxl: Add callback to parse the DSMAS subtables from CDAT
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230505/202305050449.MM2O1TzE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=fefcdcea03df25a0774005f0f804a3ae8b49b392
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout fefcdcea03df25a0774005f0f804a3ae8b49b392
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050449.MM2O1TzE-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/cxl/cxl.h:10,
                    from drivers/cxl/cxlmem.h:8,
                    from drivers/cxl/pci.c:13:
   include/linux/acpi.h:1529:17: error: unknown type name 'acpi_tbl_entry_handler_arg'; did you mean 'acpi_gbl_event_handler'?
    1529 |                 acpi_tbl_entry_handler_arg handler, void *arg,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 acpi_gbl_event_handler
>> drivers/cxl/cxl.h:803:30: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
     803 | int cdat_dsmas_handler(union acpi_subtable_headers *header, void *arg,
         |                              ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/cxl/cxl.h:10,
                    from drivers/cxl/cxlmem.h:8,
                    from drivers/cxl/port.c:7:
   include/linux/acpi.h:1529:17: error: unknown type name 'acpi_tbl_entry_handler_arg'; did you mean 'acpi_gbl_event_handler'?
    1529 |                 acpi_tbl_entry_handler_arg handler, void *arg,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 acpi_gbl_event_handler
>> drivers/cxl/cxl.h:803:30: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
     803 | int cdat_dsmas_handler(union acpi_subtable_headers *header, void *arg,
         |                              ^~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/port.c: In function 'cxl_endpoint_port_probe':
>> drivers/cxl/port.c:148:22: error: implicit declaration of function 'acpi_table_parse_cdat'; did you mean 'acpi_table_parse'? [-Werror=implicit-function-declaration]
     148 |                 rc = acpi_table_parse_cdat(ACPI_CDAT_TYPE_DSMAS, cdat_dsmas_handler,
         |                      ^~~~~~~~~~~~~~~~~~~~~
         |                      acpi_table_parse
   cc1: some warnings being treated as errors
--
   In file included from drivers/cxl/cxl.h:10,
                    from drivers/cxl/cxlpci.h:6,
                    from drivers/cxl/core/cdat.c:3:
   include/linux/acpi.h:1529:17: error: unknown type name 'acpi_tbl_entry_handler_arg'; did you mean 'acpi_gbl_event_handler'?
    1529 |                 acpi_tbl_entry_handler_arg handler, void *arg,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 acpi_gbl_event_handler
>> drivers/cxl/cxl.h:803:30: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
     803 | int cdat_dsmas_handler(union acpi_subtable_headers *header, void *arg,
         |                              ^~~~~~~~~~~~~~~~~~~~~
>> drivers/cxl/core/cdat.c:6:30: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
       6 | int cdat_dsmas_handler(union acpi_subtable_headers *header, void *arg,
         |                              ^~~~~~~~~~~~~~~~~~~~~
>> drivers/cxl/core/cdat.c:6:5: error: conflicting types for 'cdat_dsmas_handler'; have 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
       6 | int cdat_dsmas_handler(union acpi_subtable_headers *header, void *arg,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/cxl/cxl.h:803:5: note: previous declaration of 'cdat_dsmas_handler' with type 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
     803 | int cdat_dsmas_handler(union acpi_subtable_headers *header, void *arg,
         |     ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:17,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/pci.h:35,
                    from drivers/cxl/cxlpci.h:5:
   drivers/cxl/core/cdat.c:33:22: error: conflicting types for 'cdat_dsmas_handler'; have 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
      33 | EXPORT_SYMBOL_NS_GPL(cdat_dsmas_handler, CXL);
         |                      ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:87:28: note: in definition of macro '___EXPORT_SYMBOL'
      87 |         extern typeof(sym) sym;                                                 \
         |                            ^~~
   include/linux/export.h:153:41: note: in expansion of macro '__EXPORT_SYMBOL'
     153 | #define EXPORT_SYMBOL_NS_GPL(sym, ns)   __EXPORT_SYMBOL(sym, "_gpl", __stringify(ns))
         |                                         ^~~~~~~~~~~~~~~
   drivers/cxl/core/cdat.c:33:1: note: in expansion of macro 'EXPORT_SYMBOL_NS_GPL'
      33 | EXPORT_SYMBOL_NS_GPL(cdat_dsmas_handler, CXL);
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/cxl/cxl.h:803:5: note: previous declaration of 'cdat_dsmas_handler' with type 'int(union acpi_subtable_headers *, void *, const long unsigned int)'
     803 | int cdat_dsmas_handler(union acpi_subtable_headers *header, void *arg,
         |     ^~~~~~~~~~~~~~~~~~


vim +148 drivers/cxl/port.c

     6	
   > 7	#include "cxlmem.h"
     8	#include "cxlpci.h"
     9	
    10	/**
    11	 * DOC: cxl port
    12	 *
    13	 * The port driver enumerates dport via PCI and scans for HDM
    14	 * (Host-managed-Device-Memory) decoder resources via the
    15	 * @component_reg_phys value passed in by the agent that registered the
    16	 * port. All descendant ports of a CXL root port (described by platform
    17	 * firmware) are managed in this drivers context. Each driver instance
    18	 * is responsible for tearing down the driver context of immediate
    19	 * descendant ports. The locking for this is validated by
    20	 * CONFIG_PROVE_CXL_LOCKING.
    21	 *
    22	 * The primary service this driver provides is presenting APIs to other
    23	 * drivers to utilize the decoders, and indicating to userspace (via bind
    24	 * status) the connectivity of the CXL.mem protocol throughout the
    25	 * PCIe topology.
    26	 */
    27	
    28	static void schedule_detach(void *cxlmd)
    29	{
    30		schedule_cxl_memdev_detach(cxlmd);
    31	}
    32	
    33	static int discover_region(struct device *dev, void *root)
    34	{
    35		struct cxl_endpoint_decoder *cxled;
    36		int rc;
    37	
    38		if (!is_endpoint_decoder(dev))
    39			return 0;
    40	
    41		cxled = to_cxl_endpoint_decoder(dev);
    42		if ((cxled->cxld.flags & CXL_DECODER_F_ENABLE) == 0)
    43			return 0;
    44	
    45		if (cxled->state != CXL_DECODER_STATE_AUTO)
    46			return 0;
    47	
    48		/*
    49		 * Region enumeration is opportunistic, if this add-event fails,
    50		 * continue to the next endpoint decoder.
    51		 */
    52		rc = cxl_add_to_region(root, cxled);
    53		if (rc)
    54			dev_dbg(dev, "failed to add to region: %#llx-%#llx\n",
    55				cxled->cxld.hpa_range.start, cxled->cxld.hpa_range.end);
    56	
    57		return 0;
    58	}
    59	
    60	static void dsmas_list_destroy(struct list_head *dsmas_list)
    61	{
    62		struct dsmas_entry *dentry, *n;
    63	
    64		list_for_each_entry_safe(dentry, n, dsmas_list, list) {
    65			list_del(&dentry->list);
    66			kfree(dentry);
    67		}
    68	}
    69	
    70	static int cxl_switch_port_probe(struct cxl_port *port)
    71	{
    72		struct cxl_hdm *cxlhdm;
    73		int rc;
    74	
    75		/* Cache the data early to ensure is_visible() works */
    76		read_cdat_data(port);
    77	
    78		rc = devm_cxl_port_enumerate_dports(port);
    79		if (rc < 0)
    80			return rc;
    81	
    82		if (rc == 1)
    83			return devm_cxl_add_passthrough_decoder(port);
    84	
    85		cxlhdm = devm_cxl_setup_hdm(port, NULL);
    86		if (IS_ERR(cxlhdm))
    87			return PTR_ERR(cxlhdm);
    88	
    89		return devm_cxl_enumerate_decoders(cxlhdm, NULL);
    90	}
    91	
    92	static int cxl_endpoint_port_probe(struct cxl_port *port)
    93	{
    94		struct cxl_endpoint_dvsec_info info = { .port = port };
    95		struct cxl_memdev *cxlmd = to_cxl_memdev(port->uport);
    96		struct cxl_dev_state *cxlds = cxlmd->cxlds;
    97		struct cxl_hdm *cxlhdm;
    98		struct cxl_port *root;
    99		int rc;
   100	
   101		rc = cxl_dvsec_rr_decode(cxlds->dev, cxlds->cxl_dvsec, &info);
   102		if (rc < 0)
   103			return rc;
   104	
   105		cxlhdm = devm_cxl_setup_hdm(port, &info);
   106		if (IS_ERR(cxlhdm))
   107			return PTR_ERR(cxlhdm);
   108	
   109		/* Cache the data early to ensure is_visible() works */
   110		read_cdat_data(port);
   111	
   112		get_device(&cxlmd->dev);
   113		rc = devm_add_action_or_reset(&port->dev, schedule_detach, cxlmd);
   114		if (rc)
   115			return rc;
   116	
   117		rc = cxl_hdm_decode_init(cxlds, cxlhdm, &info);
   118		if (rc)
   119			return rc;
   120	
   121		rc = cxl_await_media_ready(cxlds);
   122		if (rc) {
   123			dev_err(&port->dev, "Media not active (%d)\n", rc);
   124			return rc;
   125		}
   126	
   127		rc = devm_cxl_enumerate_decoders(cxlhdm, &info);
   128		if (rc)
   129			return rc;
   130	
   131		/*
   132		 * This can't fail in practice as CXL root exit unregisters all
   133		 * descendant ports and that in turn synchronizes with cxl_port_probe()
   134		 */
   135		root = find_cxl_root(port);
   136	
   137		/*
   138		 * Now that all endpoint decoders are successfully enumerated, try to
   139		 * assemble regions from committed decoders
   140		 */
   141		device_for_each_child(&port->dev, root, discover_region);
   142		put_device(&root->dev);
   143	
   144		if (port->cdat.table) {
   145			LIST_HEAD(dsmas_list);
   146	
   147			/* DSMAS processing */
 > 148			rc = acpi_table_parse_cdat(ACPI_CDAT_TYPE_DSMAS, cdat_dsmas_handler,
   149						   &dsmas_list, port->cdat.table);
   150			if (rc < 0)
   151				dev_warn(&port->dev, "Failed to parse DSMAS: %d\n", rc);
   152	
   153			/* DSLBIS processing */
   154	
   155			dsmas_list_destroy(&dsmas_list);
   156		}
   157	
   158		return 0;
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
