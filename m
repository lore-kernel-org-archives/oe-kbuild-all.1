Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20766A31
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 03:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674531277; x=1706067277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pg6S8/qVadBCgy48N2IXslz/b4ZYIMFp0ZCGLjNo26E=;
  b=no2xLzZ31CCejnFZifT0xuF6Ms/rPhoSOsyZhgSgEw/lKTi1J1Hfdp4w
   OFOgFpuC8+QDOjJGCRRqNLKkdp/cW1deOFRqFLT8b5RlMxtbLa9ptNuQx
   6MQhvKHNsaStRKzlIyor0LhKPs7eroY0QwgtwHjcwYHdIyOHYttLW9w1X
   Dsi8Bkbz/rSafZz7Rn+B9azKYfCF8zQxFasvGqkcwLLmG17CY70IpAIZZ
   AYaEXHxKcPfXK3nCBTc4uVupQA5HDx3vpQeYgLbkQJnYtWJtwKiuSHW1s
   82Iisl/bQNwY/3/oT5PNL54xwWjLSAStvtmYcn9lU6b1iRs5Pw+RV2CBr
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="323915402"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="323915402"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 19:34:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="663922109"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="663922109"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jan 2023 19:34:35 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKA4w-00065v-2Y;
	Tue, 24 Jan 2023 03:34:34 +0000
Date: Tue, 24 Jan 2023 11:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-filter-upstream 7/30]
 drivers/base/da_firmware.c:366:25: warning: variable 'ids' set but not used
Message-ID: <202301241157.kYB2KFLe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   2eb6cd239352583e1275ed7d6e772e7bbc0343b0
commit: cc83c3f87358a398c0eadb5a91a7d8e4b71f85d1 [7/30] driver core: Add command line option to update device authorization list
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230124/202301241157.kYB2KFLe-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/cc83c3f87358a398c0eadb5a91a7d8e4b71f85d1
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout cc83c3f87358a398c0eadb5a91a7d8e4b71f85d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/base/da_firmware.c:166:8: warning: no previous prototype for 'parse_firmware_devices' [-Wmissing-prototypes]
     166 | size_t parse_firmware_devices(struct da_bus_node *node, void *data)
         |        ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/da_firmware.c: In function 'parse_cmdline_data':
>> drivers/base/da_firmware.c:366:25: warning: variable 'ids' set but not used [-Wunused-but-set-variable]
     366 |         char *k, *bus, *ids;
         |                         ^~~


vim +/ids +366 drivers/base/da_firmware.c

   348	
   349	static int parse_cmdline_devices(struct da_bus_node *bnode, char *ids)
   350	{
   351		int count = get_cmdline_dev_count(ids);
   352	
   353		if (!count || !strcmp(ids, "ALL")) {
   354			bnode->dev_ids = NULL;
   355			return 0;
   356		}
   357	
   358		if (!strcmp(bnode->name, "pci"))
   359			return parse_pci_id(bnode, ids, count);
   360		else
   361			return parse_bus_id(bnode, ids, count);
   362	}
   363	static int __init parse_cmdline_data(char *p)
   364	{
   365		struct da_bus_node *bnode;
 > 366		char *k, *bus, *ids;
   367	
   368		while ((k = strsep(&p, ";")) != NULL) {
   369			bus = strsep(&k, ":");
   370			ids = k;
   371			bnode = alloc_bus_node(bus, 0);
   372			if (!bnode)
   373				goto out;
   374			list_add_tail(&bnode->list, &platform_da_cmdline_list);
   375			if (parse_cmdline_devices(bnode, k))
   376				goto out;
   377		}
   378	
   379		return 0;
   380	
   381	out:
   382		pr_err("Failed allow list command line parsing\n");
   383		free_da_list(&platform_da_cmdline_list);
   384		return -EIO;
   385	}
   386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
