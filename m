Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C9FA4E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 02:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691115181; x=1722651181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QHHWOusLcAy3Spu88mO3SvyXyJKSmimF6imW3yP1B5s=;
  b=BQCvmnYmPldMWAtbezRxpBT8r7eltRWHRFQTSQJB6ufHKcDUiWV3uM6X
   gApT9J42J22XaTWgUsRQvZmeSiShytwdpAhd7sNxaJkbZhSbk9lT9lyk4
   ps/Vg6oyhUWB3SNJPDnv4sScfW1Qt7hb9RWoLgADWT87kImJgwRQ0y04j
   KwPMi3+nx9VIrKQ2DPqlnDrXXpPDzMbQEem2lhOmJN6aGhw5I72yBonsl
   NdcLiIwJfQbo5xjip0WafhlNOhX3SJb6dqV8o0CfkixDvEnAbXSEsiZDY
   9b8ZXbMbgkLMo5gpjhYLHHcvcQidYUtaC4zyEc0F3MU6fwn7qpqDp0DUL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="400999493"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="400999493"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 19:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="843863666"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="843863666"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2023 19:13:00 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRkJH-0002Xf-1G;
	Fri, 04 Aug 2023 02:12:59 +0000
Date: Fri, 4 Aug 2023 10:12:33 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:tls.v8 13/15] drivers/nvme/target/configfs.c:1897:33:
 error: implicit declaration of function 'key_lookup'; did you mean
 'vma_lookup'?
Message-ID: <202308041019.lPkqxndu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git tls.v8
head:   fe5c5678d10ec3d17d9a29641bd64a4304f8abb7
commit: c136b8bc8b5f94652367c187b25e9870b74374fc [13/15] nvmet-tcp: enable TLS handshake upcall
config: arc-randconfig-r043-20230802 (https://download.01.org/0day-ci/archive/20230804/202308041019.lPkqxndu-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041019.lPkqxndu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308041019.lPkqxndu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/nvme/target/configfs.c: In function 'nvmet_ports_make':
>> drivers/nvme/target/configfs.c:1897:33: error: implicit declaration of function 'key_lookup'; did you mean 'vma_lookup'? [-Werror=implicit-function-declaration]
    1897 |                 port->keyring = key_lookup(nvme_keyring_id());
         |                                 ^~~~~~~~~~
         |                                 vma_lookup
>> drivers/nvme/target/configfs.c:1897:31: warning: assignment to 'struct key *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1897 |                 port->keyring = key_lookup(nvme_keyring_id());
         |                               ^
   cc1: some warnings being treated as errors


vim +1897 drivers/nvme/target/configfs.c

  1874	
  1875	static struct config_group *nvmet_ports_make(struct config_group *group,
  1876			const char *name)
  1877	{
  1878		struct nvmet_port *port;
  1879		u16 portid;
  1880		u32 i;
  1881	
  1882		if (kstrtou16(name, 0, &portid))
  1883			return ERR_PTR(-EINVAL);
  1884	
  1885		port = kzalloc(sizeof(*port), GFP_KERNEL);
  1886		if (!port)
  1887			return ERR_PTR(-ENOMEM);
  1888	
  1889		port->ana_state = kcalloc(NVMET_MAX_ANAGRPS + 1,
  1890				sizeof(*port->ana_state), GFP_KERNEL);
  1891		if (!port->ana_state) {
  1892			kfree(port);
  1893			return ERR_PTR(-ENOMEM);
  1894		}
  1895	
  1896		if (nvme_keyring_id()) {
> 1897			port->keyring = key_lookup(nvme_keyring_id());
  1898			if (IS_ERR(port->keyring)) {
  1899				pr_warn("NVMe keyring not available, disabling TLS\n");
  1900				port->keyring = NULL;
  1901			}
  1902		}
  1903	
  1904		for (i = 1; i <= NVMET_MAX_ANAGRPS; i++) {
  1905			if (i == NVMET_DEFAULT_ANA_GRPID)
  1906				port->ana_state[1] = NVME_ANA_OPTIMIZED;
  1907			else
  1908				port->ana_state[i] = NVME_ANA_INACCESSIBLE;
  1909		}
  1910	
  1911		list_add(&port->global_entry, &nvmet_ports_list);
  1912	
  1913		INIT_LIST_HEAD(&port->entry);
  1914		INIT_LIST_HEAD(&port->subsystems);
  1915		INIT_LIST_HEAD(&port->referrals);
  1916		port->inline_data_size = -1;	/* < 0 == let the transport choose */
  1917	
  1918		port->disc_addr.portid = cpu_to_le16(portid);
  1919		port->disc_addr.adrfam = NVMF_ADDR_FAMILY_MAX;
  1920		port->disc_addr.treq = NVMF_TREQ_DISABLE_SQFLOW;
  1921		config_group_init_type_name(&port->group, name, &nvmet_port_type);
  1922	
  1923		config_group_init_type_name(&port->subsys_group,
  1924				"subsystems", &nvmet_port_subsys_type);
  1925		configfs_add_default_group(&port->subsys_group, &port->group);
  1926	
  1927		config_group_init_type_name(&port->referrals_group,
  1928				"referrals", &nvmet_referrals_type);
  1929		configfs_add_default_group(&port->referrals_group, &port->group);
  1930	
  1931		config_group_init_type_name(&port->ana_groups_group,
  1932				"ana_groups", &nvmet_ana_groups_type);
  1933		configfs_add_default_group(&port->ana_groups_group, &port->group);
  1934	
  1935		port->ana_default_group.port = port;
  1936		port->ana_default_group.grpid = NVMET_DEFAULT_ANA_GRPID;
  1937		config_group_init_type_name(&port->ana_default_group.group,
  1938				__stringify(NVMET_DEFAULT_ANA_GRPID),
  1939				&nvmet_ana_group_type);
  1940		configfs_add_default_group(&port->ana_default_group.group,
  1941				&port->ana_groups_group);
  1942	
  1943		return &port->group;
  1944	}
  1945	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
