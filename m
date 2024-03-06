Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7BCA50
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 01:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709687652; cv=none; b=T3GPnuvumV160hwzZiOPUMDrj4+g7sSgKWwViMV2BFs7/DazrLF68j8rerWyXaMB6o+WmfdmEBZ0xbVxZTFQ9ETN7vykdAvczPfDdgcuTEhooKsu1NVUHDrNQtQDXVNUMW9umkxNER4I5NqvHzNIEJbLPhSJMRpdauRqZNa7/Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709687652; c=relaxed/simple;
	bh=iv50xPHYu+Bi2xBsK3DbpmHKbsi/lHbqQRxJoz06YM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TR6fnE+UwMCS5PjchHDbk7fvvQj8Qx0pRDq1n4wScD7WHlwONHBlR/+EpSlGTlZ0Fp8Yezlqyxq7x3OWGB6qzS/bkVEI4p+lrjtMM9jTch76e4zROkQYTIvMxcyKLzjRelpJFSs5wxV2uaWolQr13k0fb+oAT1JdJR5vaqi41a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjLRZLOT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjLRZLOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709687650; x=1741223650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iv50xPHYu+Bi2xBsK3DbpmHKbsi/lHbqQRxJoz06YM4=;
  b=TjLRZLOTL2NmQ1EG4j6wSm6CPu5CTCs1uGkCu5Wx5AX018d+D/wTuZ6P
   bxMEILabRfIViTwDPcLiSlnuaHgEMWQ74ZW+k7SKLO/KLaGYX5f9ewT8V
   vtZbPkSrG2KKBRmOoN3O57iM1Un2/2NI5xtpaTTl0cD3oCebJeBPGcwK4
   P/X1KdnhscEL8ADdlbV0ZKnw4+jm/GtPaDwXBrh7PQst4j4KcLj5zlSxN
   ARvet4KnrxJEcUkPQmfTganyUEnYZfCLJkeOwKCUBklDK4iBwY9RekBZF
   XBqabWjE+NfbTbQz/ZbEg/eTySRVBcn1Np98SZ4gDvMVRGemOcc5bOtht
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="26736264"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="26736264"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 17:14:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="14229597"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Mar 2024 17:14:06 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhfr9-0003oZ-1C;
	Wed, 06 Mar 2024 01:14:03 +0000
Date: Wed, 6 Mar 2024 09:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 24954/27434]
 drivers/net/bonding/bond_main.c:4199:58: error: 'struct device' has no
 member named 'numa_node'
Message-ID: <202403060927.ri7lNiHF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: de86dfa67b19a260c504f7b5b7ca00ba85975b23 [24954/27434] bonding:add the ability to xmit through the local node slaves first
config: x86_64-randconfig-006-20240305 (https://download.01.org/0day-ci/archive/20240306/202403060927.ri7lNiHF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060927.ri7lNiHF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060927.ri7lNiHF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/bonding/bond_main.c: In function 'bond_update_slave_arr':
>> drivers/net/bonding/bond_main.c:4199:58: error: 'struct device' has no member named 'numa_node'
    4199 |                 nd = ((usable_slaves->arr[ct]->dev)->dev).numa_node;
         |                                                          ^


vim +4199 drivers/net/bonding/bond_main.c

  4128	
  4129		usable_slaves = kzalloc(struct_size(usable_slaves, arr,
  4130						    bond->slave_cnt), GFP_KERNEL);
  4131		if (!usable_slaves) {
  4132			ret = -ENOMEM;
  4133			goto out;
  4134		}
  4135		if (BOND_MODE(bond) == BOND_MODE_8023AD) {
  4136			struct ad_info ad_info;
  4137	
  4138			if (bond_3ad_get_active_agg_info(bond, &ad_info)) {
  4139				pr_debug("bond_3ad_get_active_agg_info failed\n");
  4140				kfree_rcu(usable_slaves, rcu);
  4141				/* No active aggragator means it's not safe to use
  4142				 * the previous array.
  4143				 */
  4144				old_usable_slaves = rtnl_dereference(bond->usable_slaves);
  4145				if (old_usable_slaves) {
  4146					RCU_INIT_POINTER(bond->usable_slaves, NULL);
  4147					kfree_rcu(old_usable_slaves, rcu);
  4148				}
  4149				goto out;
  4150			}
  4151			agg_id = ad_info.aggregator_id;
  4152		}
  4153		bond_for_each_slave(bond, slave, iter) {
  4154			if (BOND_MODE(bond) == BOND_MODE_8023AD) {
  4155				struct aggregator *agg;
  4156	
  4157				agg = SLAVE_AD_INFO(slave)->port.aggregator;
  4158				if (!agg || agg->aggregator_identifier != agg_id)
  4159					continue;
  4160			}
  4161			if (!bond_slave_can_tx(slave))
  4162				continue;
  4163			if (skipslave == slave)
  4164				continue;
  4165	
  4166			slave_dbg(bond->dev, slave->dev, "Adding slave to tx hash array[%d]\n",
  4167				  usable_slaves->count);
  4168	
  4169			usable_slaves->arr[usable_slaves->count++] = slave;
  4170		}
  4171	
  4172		old_usable_slaves = rtnl_dereference(bond->usable_slaves);
  4173		rcu_assign_pointer(bond->usable_slaves, usable_slaves);
  4174		if (old_usable_slaves)
  4175			kfree_rcu(old_usable_slaves, rcu);
  4176		/* support for select local slave first*/
  4177		bond_localnodefirst_support = false;
  4178		nt = num_online_nodes();
  4179		new_bynd = kzalloc(offsetof(struct bond_up_bynd, arr[nt]), GFP_KERNEL);
  4180		if (!new_bynd) {
  4181			ret = -ENOMEM;
  4182			pr_err("Failed to build slave-array by numanode.\n");
  4183			goto out;
  4184		}
  4185		for_each_online_node(nd) {
  4186			new_bynd->arr[nd] = kzalloc(offsetof(struct bond_up_slave,
  4187						arr[bond->slave_cnt]), GFP_KERNEL);
  4188			if (!new_bynd->arr[nd]) {
  4189				for (ct = 0; ct < nd; ct++)
  4190					kfree_rcu(new_bynd->arr[ct], rcu);
  4191				kfree_rcu(new_bynd, rcu);
  4192				ret = -ENOMEM;
  4193				pr_err("Failed to build slave-array by numanode.\n");
  4194				goto out;
  4195			}
  4196			new_bynd->arr[nd]->count = 0;
  4197		}
  4198		for (ct = 0; ct < usable_slaves->count; ct++) {
> 4199			nd = ((usable_slaves->arr[ct]->dev)->dev).numa_node;
  4200			tmp = new_bynd->arr[nd]->count;
  4201			new_bynd->arr[nd]->arr[tmp] = usable_slaves->arr[ct];
  4202			(new_bynd->arr[nd]->count)++;
  4203		}
  4204		old_bynd = rtnl_dereference(bond->slave_arr_bynd);
  4205		rcu_assign_pointer(bond->slave_arr_bynd, new_bynd);
  4206		if (old_bynd) {
  4207			for_each_online_node(nd)
  4208				if (old_bynd->arr[nd])
  4209					kfree_rcu(old_bynd->arr[nd], rcu);
  4210			kfree_rcu(old_bynd, rcu);
  4211		}
  4212		bond_localnodefirst_support = true;
  4213		netdev_info(bond->dev, "update slaves by numa node successfully.");
  4214	out:
  4215		if (ret != 0 && skipslave)
  4216			bond_skip_slave(rtnl_dereference(bond->usable_slaves),
  4217					skipslave);
  4218	
  4219		return ret;
  4220	}
  4221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
