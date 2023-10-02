Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905FC17F4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 07:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696233514; x=1727769514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Odf9UBpubM9Y3rdl/egb93yahkK3GGrygo3ho/mAm9Y=;
  b=YlDDPl8U4R+H9wvyp2djMUaNogSeaJJT25n47+3L7Zk198smqqsi6Hi8
   fdzhw8jIugyZsV18hSX2kSYanFdyGKVWtlICizLrWp4sRowtjB979XGGU
   g/S6zZIC+9rJYmAfBHILx/y5DbyS+InpV+pMDXm51nhZHcSAiR5QAHksG
   iuoKHXjpzX52nA8w+1Hlt+zoWQF/q2/M4FrQwXUqXBKyqSU2YNN53Wlg+
   uOOj3DMcAJA4P/FN5hyE710kXG8BFFKmmL4BVp/ixqWl/F/qeXCvQ4Lbn
   FXbZ4G7acB6Wdzq8awKZFonRFsdBM0gDpksYsfkAZHfSfVCOyzVLfecEL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="449088453"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="449088453"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 00:58:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="820818555"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="820818555"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 02 Oct 2023 00:58:31 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnDp0-0005rx-0o;
	Mon, 02 Oct 2023 07:58:30 +0000
Date: Mon, 2 Oct 2023 15:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 4/9] ACPI: tables: change section_type of generic
 error data as guid_t
Message-ID: <202310021521.rrsLtm9l-lkp@intel.com>
References: <20230925074426.97856-5-xueshuai@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925074426.97856-5-xueshuai@linux.alibaba.com>

Hi Shuai,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/pstore]
[also build test ERROR on kees/for-next/kspp rafael-pm/linux-next tip/x86/core efi/next linus/master v6.6-rc3 next-20230929]
[cannot apply to aegl/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuai-Xue/pstore-move-pstore-creator-id-section-type-and-record-struct-to-common-header/20230925-154609
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/pstore
patch link:    https://lore.kernel.org/r/20230925074426.97856-5-xueshuai%40linux.alibaba.com
patch subject: [RFC PATCH v2 4/9] ACPI: tables: change section_type of generic error data as guid_t
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231002/202310021521.rrsLtm9l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310021521.rrsLtm9l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310021521.rrsLtm9l-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/pcie-hisi-error.c: In function 'hisi_pcie_notify_error':
>> drivers/pci/controller/pcie-hisi-error.c:260:41: error: incompatible type for argument 2 of 'import_guid'
     260 |         import_guid(&err_sec_guid, gdata->section_type);
         |                                    ~~~~~^~~~~~~~~~~~~~
         |                                         |
         |                                         guid_t
   In file included from include/linux/mod_devicetable.h:14,
                    from include/linux/acpi.h:15,
                    from drivers/pci/controller/pcie-hisi-error.c:9:
   include/linux/uuid.h:56:57: note: expected 'const __u8 *' {aka 'const unsigned char *'} but argument is of type 'guid_t'
      56 | static inline void import_guid(guid_t *dst, const __u8 *src)
         |                                             ~~~~~~~~~~~~^~~


vim +/import_guid +260 drivers/pci/controller/pcie-hisi-error.c

acb52897cc842f Yicong Yang 2020-09-03  248  
acb52897cc842f Yicong Yang 2020-09-03  249  static int hisi_pcie_notify_error(struct notifier_block *nb,
acb52897cc842f Yicong Yang 2020-09-03  250  				  unsigned long event, void *data)
acb52897cc842f Yicong Yang 2020-09-03  251  {
acb52897cc842f Yicong Yang 2020-09-03  252  	struct acpi_hest_generic_data *gdata = data;
acb52897cc842f Yicong Yang 2020-09-03  253  	const struct hisi_pcie_error_data *error_data = acpi_hest_get_payload(gdata);
acb52897cc842f Yicong Yang 2020-09-03  254  	struct hisi_pcie_error_private *priv;
acb52897cc842f Yicong Yang 2020-09-03  255  	struct device *dev;
acb52897cc842f Yicong Yang 2020-09-03  256  	struct platform_device *pdev;
acb52897cc842f Yicong Yang 2020-09-03  257  	guid_t err_sec_guid;
acb52897cc842f Yicong Yang 2020-09-03  258  	u8 socket;
acb52897cc842f Yicong Yang 2020-09-03  259  
acb52897cc842f Yicong Yang 2020-09-03 @260  	import_guid(&err_sec_guid, gdata->section_type);
acb52897cc842f Yicong Yang 2020-09-03  261  	if (!guid_equal(&err_sec_guid, &hisi_pcie_sec_guid))
acb52897cc842f Yicong Yang 2020-09-03  262  		return NOTIFY_DONE;
acb52897cc842f Yicong Yang 2020-09-03  263  
acb52897cc842f Yicong Yang 2020-09-03  264  	priv = container_of(nb, struct hisi_pcie_error_private, nb);
acb52897cc842f Yicong Yang 2020-09-03  265  	dev = priv->dev;
acb52897cc842f Yicong Yang 2020-09-03  266  
acb52897cc842f Yicong Yang 2020-09-03  267  	if (device_property_read_u8(dev, "socket", &socket))
acb52897cc842f Yicong Yang 2020-09-03  268  		return NOTIFY_DONE;
acb52897cc842f Yicong Yang 2020-09-03  269  
acb52897cc842f Yicong Yang 2020-09-03  270  	if (error_data->socket_id != socket)
acb52897cc842f Yicong Yang 2020-09-03  271  		return NOTIFY_DONE;
acb52897cc842f Yicong Yang 2020-09-03  272  
acb52897cc842f Yicong Yang 2020-09-03  273  	pdev = container_of(dev, struct platform_device, dev);
acb52897cc842f Yicong Yang 2020-09-03  274  	hisi_pcie_handle_error(pdev, error_data);
acb52897cc842f Yicong Yang 2020-09-03  275  
acb52897cc842f Yicong Yang 2020-09-03  276  	return NOTIFY_OK;
acb52897cc842f Yicong Yang 2020-09-03  277  }
acb52897cc842f Yicong Yang 2020-09-03  278  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
