Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE1EC12F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 18:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692038451; x=1723574451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZHD9JJ24R0hxJbm/qxHsjWyMbhldbQtivRmJvJBvFZk=;
  b=Be1+ong4TcObOuiaTLEZw+7W15cP8VPEginkzm14IM4qpQdLapoF3RLZ
   OErIFBVP4tjkBo2BccvCLQsPxKxD2YUJKs1I0l3Tw3gPXLYe6jMKyMXn9
   sXYGsD2RrQYnbofLcU0PvbK7l6BX/3XM3B82HGs0BQm/ZeBVcINIm9vdu
   4JgwHNA/PnU/t75M3tYjhISvGShHERibJB1hrI1O8AMjmNxgS07eXwYaz
   Idky2Xyt/Ge7pc7IJSN9hano3T1DUonUS74r1KB2Zg0msCqE6f+e4WQIR
   4xUnN2ReXgnoSr+ygUed38m7bghTOFEhmOkFWX6+zapgqmjtGiwnwrcZu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="352439106"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="352439106"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 11:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="877067528"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2023 11:40:43 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVcUY-0000Lr-24;
	Mon, 14 Aug 2023 18:40:38 +0000
Date: Tue, 15 Aug 2023 02:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:tls.v13 17/19] drivers/nvme/target/configfs.c:1881:33:
 error: implicit declaration of function 'key_lookup'; did you mean
 'vma_lookup'?
Message-ID: <202308150242.1sMZtxbl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git tls.v13
head:   ce525e34ae9d3f5ed12f23caea57c0aa2e8359ee
commit: 742a9e6a640d76c3d7cbb647d0da0887857e7d32 [17/19] nvmet-tcp: enable TLS handshake upcall
config: i386-randconfig-r005-20230814 (https://download.01.org/0day-ci/archive/20230815/202308150242.1sMZtxbl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150242.1sMZtxbl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150242.1sMZtxbl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/nvme/target/configfs.c: In function 'nvmet_ports_make':
>> drivers/nvme/target/configfs.c:1881:33: error: implicit declaration of function 'key_lookup'; did you mean 'vma_lookup'? [-Werror=implicit-function-declaration]
    1881 |                 port->keyring = key_lookup(nvme_keyring_id());
         |                                 ^~~~~~~~~~
         |                                 vma_lookup
>> drivers/nvme/target/configfs.c:1881:31: warning: assignment to 'struct key *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1881 |                 port->keyring = key_lookup(nvme_keyring_id());
         |                               ^
   cc1: some warnings being treated as errors


vim +1881 drivers/nvme/target/configfs.c

  1858	
  1859	static struct config_group *nvmet_ports_make(struct config_group *group,
  1860			const char *name)
  1861	{
  1862		struct nvmet_port *port;
  1863		u16 portid;
  1864		u32 i;
  1865	
  1866		if (kstrtou16(name, 0, &portid))
  1867			return ERR_PTR(-EINVAL);
  1868	
  1869		port = kzalloc(sizeof(*port), GFP_KERNEL);
  1870		if (!port)
  1871			return ERR_PTR(-ENOMEM);
  1872	
  1873		port->ana_state = kcalloc(NVMET_MAX_ANAGRPS + 1,
  1874				sizeof(*port->ana_state), GFP_KERNEL);
  1875		if (!port->ana_state) {
  1876			kfree(port);
  1877			return ERR_PTR(-ENOMEM);
  1878		}
  1879	
  1880		if (nvme_keyring_id()) {
> 1881			port->keyring = key_lookup(nvme_keyring_id());
  1882			if (IS_ERR(port->keyring)) {
  1883				pr_warn("NVMe keyring not available, disabling TLS\n");
  1884				port->keyring = NULL;
  1885			}
  1886		}
  1887	
  1888		for (i = 1; i <= NVMET_MAX_ANAGRPS; i++) {
  1889			if (i == NVMET_DEFAULT_ANA_GRPID)
  1890				port->ana_state[1] = NVME_ANA_OPTIMIZED;
  1891			else
  1892				port->ana_state[i] = NVME_ANA_INACCESSIBLE;
  1893		}
  1894	
  1895		list_add(&port->global_entry, &nvmet_ports_list);
  1896	
  1897		INIT_LIST_HEAD(&port->entry);
  1898		INIT_LIST_HEAD(&port->subsystems);
  1899		INIT_LIST_HEAD(&port->referrals);
  1900		port->inline_data_size = -1;	/* < 0 == let the transport choose */
  1901	
  1902		port->disc_addr.portid = cpu_to_le16(portid);
  1903		port->disc_addr.adrfam = NVMF_ADDR_FAMILY_MAX;
  1904		port->disc_addr.treq = NVMF_TREQ_DISABLE_SQFLOW;
  1905		config_group_init_type_name(&port->group, name, &nvmet_port_type);
  1906	
  1907		config_group_init_type_name(&port->subsys_group,
  1908				"subsystems", &nvmet_port_subsys_type);
  1909		configfs_add_default_group(&port->subsys_group, &port->group);
  1910	
  1911		config_group_init_type_name(&port->referrals_group,
  1912				"referrals", &nvmet_referrals_type);
  1913		configfs_add_default_group(&port->referrals_group, &port->group);
  1914	
  1915		config_group_init_type_name(&port->ana_groups_group,
  1916				"ana_groups", &nvmet_ana_groups_type);
  1917		configfs_add_default_group(&port->ana_groups_group, &port->group);
  1918	
  1919		port->ana_default_group.port = port;
  1920		port->ana_default_group.grpid = NVMET_DEFAULT_ANA_GRPID;
  1921		config_group_init_type_name(&port->ana_default_group.group,
  1922				__stringify(NVMET_DEFAULT_ANA_GRPID),
  1923				&nvmet_ana_group_type);
  1924		configfs_add_default_group(&port->ana_default_group.group,
  1925				&port->ana_groups_group);
  1926	
  1927		return &port->group;
  1928	}
  1929	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
