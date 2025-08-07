Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7280A26656F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 17:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754587259; cv=none; b=LDX/GE6Ar5Ln7JZ3UoNsgBFb8YeQQQ2CrZL0kv10OKfWuAL0YX5zCzuQSTczqJpl9Gkt95acbeSkZeXmQ9uA00kApolwkg23iAgFUba3PRqX9QDYvzvPuJ7EHpWwoQlYd3mbAe6UrCSb+Jv2f7/xOQy1VTMR8NpR05WI/ctNIXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754587259; c=relaxed/simple;
	bh=h2RhC3X24bauyHkfhuw+QDN4TG/NflyhbHeEHJURAg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFW/OgiBsGSe1njkd1UpECv/nMACz8B+S7wJFId0cA2Z9UJsbwGds/p+SNNOz7qd9sM2Rvx03zvmRa/5bjSMKErCZ9a/mU4/wc9I/m2YNX2QKA9irAiOFcL1dqzHvCjkOjRn+z5n9tp1deYcZU1K0xLt5wQCsHuGOvp62cNwa1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mCLzXC5S; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mCLzXC5S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754587257; x=1786123257;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h2RhC3X24bauyHkfhuw+QDN4TG/NflyhbHeEHJURAg4=;
  b=mCLzXC5S3PMfg+bo42ZUAm30yFfjT6RVcdGqa6m0H2/xrNoM6xB9YXwl
   YZIP5yR2CiM6nq+42UcqLEL4yMN4qValc1ZP6+u7udvOxCoTOyHnB7qia
   SaLB+cCHuGh1f2Vmbd6Y1rqRDbYd8kVT44cuTsqGqoBVw/BLODRLO4fGD
   f854wxBZanDINNaXukeSbjaRZUAsJJICwWxr8UArB3doLXOc8OLXJK4/A
   0s9JZzhsxyjxuksbGUdbX4jF8rraxAr3h0THxRX8DIOD1LdMHhZG5csBW
   yv2RqTUhIAPt35F1lwFuxx09l8LMyCAEkjV2hujC39l/ejE+Fez2kM1fy
   g==;
X-CSE-ConnectionGUID: KS/DzHaeQk6DebV60MYL4Q==
X-CSE-MsgGUID: 1TU6TYurRHWtRNmry9hDzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67522444"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="67522444"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 10:20:56 -0700
X-CSE-ConnectionGUID: OVmvplHMQA+44uKqvBdK0w==
X-CSE-MsgGUID: o/OHDFBfQou3Iyowp2ClHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164634784"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2025 10:20:56 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk4IP-00032s-2z;
	Thu, 07 Aug 2025 17:20:53 +0000
Date: Fri, 8 Aug 2025 01:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandra Winter <wintera@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 16/17] net/dibs: Move data path to dibs layer
Message-ID: <202508080055.UMaN9R8j-lkp@intel.com>
References: <20250806154122.3413330-17-wintera@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806154122.3413330-17-wintera@linux.ibm.com>

Hi Alexandra,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandra-Winter/net-smc-Remove-__init-marker-from-smc_core_init/20250806-234621
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250806154122.3413330-17-wintera%40linux.ibm.com
patch subject: [RFC net-next 16/17] net/dibs: Move data path to dibs layer
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250808/202508080055.UMaN9R8j-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080055.UMaN9R8j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080055.UMaN9R8j-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/dibs/dibs_main.c: In function 'dibs_dev_release':
   net/dibs/dibs_main.c:129:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     129 |         kfree(dibs);
         |         ^~~~~
   net/dibs/dibs_main.c: In function 'dibs_dev_alloc':
   net/dibs/dibs_main.c:136:16: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
     136 |         dibs = kzalloc(sizeof(*dibs), GFP_KERNEL);
         |                ^~~~~~~
   net/dibs/dibs_main.c:136:14: error: assignment to 'struct dibs_dev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     136 |         dibs = kzalloc(sizeof(*dibs), GFP_KERNEL);
         |              ^
   net/dibs/dibs_main.c: In function 'dibs_dev_add':
>> net/dibs/dibs_main.c:188:32: error: assignment to 'u8 *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     188 |         dibs->dmb_clientid_arr = kzalloc(max_dmbs, GFP_KERNEL);
         |                                ^
--
   net/dibs/dibs_loopback.c: In function 'dibs_lo_register_dmb':
   net/dibs/dibs_loopback.c:64:20: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
      64 |         dmb_node = kzalloc(sizeof(*dmb_node), GFP_KERNEL);
         |                    ^~~~~~~
>> net/dibs/dibs_loopback.c:64:18: error: assignment to 'struct dibs_lo_dmb_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      64 |         dmb_node = kzalloc(sizeof(*dmb_node), GFP_KERNEL);
         |                  ^
>> net/dibs/dibs_loopback.c:72:28: error: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      72 |         dmb_node->cpu_addr = kzalloc(dmb_node->len, GFP_KERNEL |
         |                            ^
   net/dibs/dibs_loopback.c:109:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     109 |         kfree(dmb_node);
         |         ^~~~~
   net/dibs/dibs_loopback.c: In function '__dibs_lo_unregister_dmb':
>> net/dibs/dibs_loopback.c:124:9: error: implicit declaration of function 'kvfree' [-Wimplicit-function-declaration]
     124 |         kvfree(dmb_node->cpu_addr);
         |         ^~~~~~
   net/dibs/dibs_loopback.c: In function 'dibs_lo_dev_probe':
   net/dibs/dibs_loopback.c:300:14: error: assignment to 'struct dibs_lo_dev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     300 |         ldev = kzalloc(sizeof(*ldev), GFP_KERNEL);
         |              ^


vim +188 net/dibs/dibs_main.c

   131	
   132	struct dibs_dev *dibs_dev_alloc(void)
   133	{
   134		struct dibs_dev *dibs;
   135	
 > 136		dibs = kzalloc(sizeof(*dibs), GFP_KERNEL);
   137		if (!dibs)
   138			return dibs;
   139		dibs->dev.release = dibs_dev_release;
   140		dibs->dev.class = dibs_class;
   141		device_initialize(&dibs->dev);
   142	
   143		return dibs;
   144	}
   145	EXPORT_SYMBOL_GPL(dibs_dev_alloc);
   146	
   147	static ssize_t gid_show(struct device *dev, struct device_attribute *attr,
   148				char *buf)
   149	{
   150		struct dibs_dev *dibs;
   151	
   152		dibs = container_of(dev, struct dibs_dev, dev);
   153	
   154		return sysfs_emit(buf, "%pUb\n", &dibs->gid);
   155	}
   156	static DEVICE_ATTR_RO(gid);
   157	
   158	static ssize_t fabric_id_show(struct device *dev, struct device_attribute *attr,
   159				      char *buf)
   160	{
   161		struct dibs_dev *dibs;
   162		u16 fabric_id;
   163	
   164		dibs = container_of(dev, struct dibs_dev, dev);
   165		fabric_id = dibs->ops->get_fabric_id(dibs);
   166	
   167		return sysfs_emit(buf, "0x%04x\n", fabric_id);
   168	}
   169	static DEVICE_ATTR_RO(fabric_id);
   170	
   171	static struct attribute *dibs_dev_attrs[] = {
   172		&dev_attr_gid.attr,
   173		&dev_attr_fabric_id.attr,
   174		NULL,
   175	};
   176	
   177	static const struct attribute_group dibs_dev_attr_group = {
   178		.attrs = dibs_dev_attrs,
   179	};
   180	
   181	int dibs_dev_add(struct dibs_dev *dibs)
   182	{
   183		int max_dmbs;
   184		int i, ret;
   185	
   186		max_dmbs = dibs->ops->max_dmbs();
   187		spin_lock_init(&dibs->lock);
 > 188		dibs->dmb_clientid_arr = kzalloc(max_dmbs, GFP_KERNEL);
   189		if (!dibs->dmb_clientid_arr)
   190			return -ENOMEM;
   191		memset(dibs->dmb_clientid_arr, NO_DIBS_CLIENT, max_dmbs);
   192	
   193		ret = device_add(&dibs->dev);
   194		if (ret)
   195			goto free_client_arr;
   196	
   197		ret = sysfs_create_group(&dibs->dev.kobj, &dibs_dev_attr_group);
   198		if (ret) {
   199			dev_err(&dibs->dev, "sysfs_create_group failed for dibs_dev\n");
   200			goto err_device_del;
   201		}
   202		mutex_lock(&dibs_dev_list.mutex);
   203		mutex_lock(&clients_lock);
   204		for (i = 0; i < max_client; ++i) {
   205			if (clients[i]) {
   206				clients[i]->ops->add_dev(dibs);
   207				dibs_setup_forwarding(clients[i], dibs);
   208			}
   209		}
   210		mutex_unlock(&clients_lock);
   211		list_add(&dibs->list, &dibs_dev_list.list);
   212		mutex_unlock(&dibs_dev_list.mutex);
   213	
   214		return 0;
   215	
   216	err_device_del:
   217		device_del(&dibs->dev);
   218	free_client_arr:
   219		kfree(dibs->dmb_clientid_arr);
   220		return ret;
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
