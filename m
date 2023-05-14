Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFCF15A1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 May 2023 03:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684036645; x=1715572645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4e+eTkX6QQ7/DwktghEaXacXuE2slFt58kW1et9hB10=;
  b=cYyKs5m54U+kflYgP4rBbsLV3kXWLBftlnosGxFNLMfWRL9OFVQBfs3F
   +181CmRESX4P9d1v386frg+TS7kuWe5oJdfi/T2EdvBC9j4nBkKX/dwrm
   5fzEQT6JslMVBkh6eghD2YX9RsXhoLhaQqHG4NbSEpwUlltipTuOO/2DB
   9e2zqS3wZo9t1HYtC+yNJm3QvjvFOqx3NE9NYwEEuoXePkRyr8CQj+rx9
   +aItMzwe+OpiZsHKMFofHT2qpwKYpGXuC6TppcTfyu7ku6JcaMnKWs++Q
   /MQ4v3OoBs0loiwQPsmtE01PD7NcJ+QTDrB9LPv26J2bHkmMuTcUrtZcD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="330624350"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="330624350"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 20:57:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="874792605"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="874792605"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 May 2023 20:57:20 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1py2rH-0005oU-2x;
	Sun, 14 May 2023 03:57:19 +0000
Date: Sun, 14 May 2023 11:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [djiang:cxl-qtg 19/30] drivers/cxl/core/cdat.c:154:25: sparse:
 sparse: cast to restricted __le16
Message-ID: <202305141141.W5v7sdDE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   39202ea9232fbee1624395c38cadcc5749b2319e
commit: 018ce702a716927ed99e697823d3205058f75acf [19/30] cxl: Add callback to parse the SSLBIS subtable from CDAT
config: loongarch-randconfig-s042-20230514 (https://download.01.org/0day-ci/archive/20230514/202305141141.W5v7sdDE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=018ce702a716927ed99e697823d3205058f75acf
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 018ce702a716927ed99e697823d3205058f75acf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/cxl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305141141.W5v7sdDE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/cdat.c:154:25: sparse: sparse: cast to restricted __le16
   drivers/cxl/core/cdat.c:155:25: sparse: sparse: cast to restricted __le16
>> drivers/cxl/core/cdat.c:183:21: sparse: sparse: cast to restricted __le64
   drivers/cxl/core/cdat.c:183:21: sparse: sparse: cast to restricted __le16

vim +154 drivers/cxl/core/cdat.c

   127	
   128	static int cdat_sslbis_handler(union acpi_subtable_headers *header, void *arg,
   129				       const unsigned long end)
   130	{
   131		struct acpi_cdat_sslbis *sslbis = (struct acpi_cdat_sslbis *)header;
   132		struct acpi_cdat_sslbe *entry;
   133		struct cxl_port *port = arg;
   134		struct device *dev = &port->dev;
   135		int remain, entries, i;
   136		u16 len;
   137	
   138		len = le16_to_cpu((__force __le16)sslbis->header.length);
   139		remain = len - sizeof(*sslbis);
   140		if (!remain || remain % sizeof(*entry) ||
   141		    (unsigned long)header + len > end) {
   142			dev_warn(dev, "Malformed SSLBIS table length: (%u)\n", len);
   143			return -EINVAL;
   144		}
   145	
   146		/* Unrecognized data type, we can skip */
   147		if (sslbis->data_type > ACPI_HMAT_WRITE_BANDWIDTH)
   148			return 0;
   149	
   150		entries = remain / sizeof(*entry);
   151		entry = (struct acpi_cdat_sslbe *)((unsigned long)header + sizeof(*sslbis));
   152	
   153		for (i = 0; i < entries; i++) {
 > 154			u16 x = le16_to_cpu(entry->portx_id);
   155			u16 y = le16_to_cpu(entry->porty_id);
   156			struct cxl_dport *dport;
   157			unsigned long index;
   158			u16 dsp_id;
   159			u64 val;
   160	
   161			switch (x) {
   162			case ACPI_CDAT_SSLBIS_US_PORT:
   163				dsp_id = y;
   164				break;
   165			case ACPI_CDAT_SSLBIS_ANY_PORT:
   166				switch (y) {
   167				case ACPI_CDAT_SSLBIS_US_PORT:
   168					dsp_id = x;
   169					break;
   170				case ACPI_CDAT_SSLBIS_ANY_PORT:
   171					dsp_id = ACPI_CDAT_SSLBIS_ANY_PORT;
   172					break;
   173				default:
   174					dsp_id = y;
   175					break;
   176				}
   177				break;
   178			default:
   179				dsp_id = x;
   180				break;
   181			}
   182	
 > 183			if (check_mul_overflow(le64_to_cpu(sslbis->entry_base_unit),
   184					       le16_to_cpu(entry->latency_or_bandwidth),
   185					       &val))
   186				dev_warn(dev, "SSLBIS value overflowed!\n");
   187	
   188			xa_for_each(&port->dports, index, dport) {
   189				if (dsp_id == ACPI_CDAT_SSLBIS_ANY_PORT ||
   190				    dsp_id == dport->port_id)
   191					cxl_access_coordinate_set(&dport->coord,
   192								  sslbis->data_type,
   193								  val);
   194			}
   195	
   196			entry++;
   197		}
   198	
   199		return 0;
   200	}
   201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
