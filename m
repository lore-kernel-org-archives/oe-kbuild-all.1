Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5971C9DDA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 14:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727792004; cv=none; b=Uncj24hwoIwjSXrUU41nAghrp6qofG+0CObgO5Vwg4VtMYa8HcPu+7xiMiHC+OndTQltnGOCXwhGCbZyR1bcJwsGYmlNIxf51/RRHacttZGereBnB+yme+ITDGpxeACpXwoZ+EyfugPNRbLNNx5RnJezAWYczEZ7qa8bkh9x9KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727792004; c=relaxed/simple;
	bh=QeeHK6lQRchaVLtKaq8XgcBOOtkOUOcGHVpMZcd2sA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BaO+ZW+Vn3YmEJGNua+qyxk2nJZRPbHRvCeOXNHqEbjHw2gl3DhTe9+8GuxHzUSvNrtwIo32RKpUqLrerLdIL57GE9GFS8sITSwyTQNrQJji3TyQg6Zrx43Bwe010RyvIbc5RXtbwqL7sSNFnAx90lKWzeGkDFXxJzEF1RFi9wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C082+5zQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C082+5zQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727792002; x=1759328002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QeeHK6lQRchaVLtKaq8XgcBOOtkOUOcGHVpMZcd2sA8=;
  b=C082+5zQ8SXbGxovJxfERQNk3ZKrlt9d7pEqtDKZNp1gRFnD50d6Nxwi
   41mOxS/9snyhjjOC/mOCksTpIQDU0AHd0plg2TpDsfCdJxA/3XqlTgvRw
   xwfbA0oFudFTDI5oreEbe/3Own/lKLNA0lIlnyWSdLdmRCG+l0Rkcxaan
   lAcAYz1lWNWBkAXh9SqxKdPV2212byP9Wp43aDVrieu2wXpVi4nHoar89
   /CufGABtrpFZPic/89XVzWRm/JFsiXppLNHi7FYiFsfU3637Q5Lg0YD2P
   HcZjnlZGHok4wcSVaa44pfFUhT+mZmNhaYVx2dW3eLaC7VQ9YKxM6q+8i
   A==;
X-CSE-ConnectionGUID: qBpYCaxOTnuY02qh8QbB1Q==
X-CSE-MsgGUID: /AEYcvA6RJeskcIl99f9UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26806250"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="26806250"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 07:13:21 -0700
X-CSE-ConnectionGUID: yBC7ZilASrSah6MHuca2Jg==
X-CSE-MsgGUID: /u3XKIncTm+yUhv//y+zFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73294570"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Oct 2024 07:13:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svdcr-000QlJ-1b;
	Tue, 01 Oct 2024 14:13:17 +0000
Date: Tue, 1 Oct 2024 22:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JangShui Yang <yangjiangshui@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26378/30000]
 drivers/ub/urma/ubcore/ubcore_cdev_file.c:690:5: warning: no previous
 prototype for 'ubcore_create_port_attr_files'
Message-ID: <202410012222.QwUgBNys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   084a6771cfb3ef307b750af8b7c35a07a725fc4c
commit: f1753f8b17480bdb750cbd33fbaa358aef5dbb23 [26378/30000] urma: upload kernel patch for 20240219_Spring
config: arm64-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20241001/202410012222.QwUgBNys-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410012222.QwUgBNys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410012222.QwUgBNys-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_cdev_file.c:690:5: warning: no previous prototype for 'ubcore_create_port_attr_files' [-Wmissing-prototypes]
     690 | int ubcore_create_port_attr_files(struct ubcore_logic_device *ldev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:785:5: warning: no previous prototype for 'ubcore_create_eid_attr_files' [-Wmissing-prototypes]
     785 | int ubcore_create_eid_attr_files(struct ubcore_logic_device *ldev, uint32_t eid_num)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_cdev_file.c:797:5: warning: no previous prototype for 'ubcore_create_dev_attr_files' [-Wmissing-prototypes]
     797 | int ubcore_create_dev_attr_files(struct ubcore_logic_device *ldev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_cdev_file.c:810:6: warning: no previous prototype for 'ubcore_remove_port_attr_files' [-Wmissing-prototypes]
     810 | void ubcore_remove_port_attr_files(struct ubcore_logic_device *ldev, uint8_t port_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:815:6: warning: no previous prototype for 'ubcore_remove_eid_attr_files' [-Wmissing-prototypes]
     815 | void ubcore_remove_eid_attr_files(struct ubcore_logic_device *ldev, uint32_t eid_num)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_cdev_file.c:820:6: warning: no previous prototype for 'ubcore_remove_dev_attr_files' [-Wmissing-prototypes]
     820 | void ubcore_remove_dev_attr_files(struct ubcore_logic_device *ldev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/ub/urma/ubcore/ubcore_device.c:352:6: warning: no previous prototype for 'ubcore_destroy_upi_list' [-Wmissing-prototypes]
     352 | void ubcore_destroy_upi_list(struct ubcore_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:440:23: warning: no previous prototype for 'ubcore_find_tpf_device_legacy' [-Wmissing-prototypes]
     440 | struct ubcore_device *ubcore_find_tpf_device_legacy(void)
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_device.c:1329:5: warning: no previous prototype for 'ubcore_dispatch_event' [-Wmissing-prototypes]
    1329 | int ubcore_dispatch_event(struct ubcore_event *event)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1454:6: warning: no previous prototype for 'ubcore_dev_accessible' [-Wmissing-prototypes]
    1454 | bool ubcore_dev_accessible(struct ubcore_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_device.c:2015:6: warning: no previous prototype for 'ubcore_net_exit' [-Wmissing-prototypes]
    2015 | void ubcore_net_exit(struct net *net)
         |      ^~~~~~~~~~~~~~~


vim +/ubcore_create_port_attr_files +690 drivers/ub/urma/ubcore/ubcore_cdev_file.c

   689	
 > 690	int ubcore_create_port_attr_files(struct ubcore_logic_device *ldev,
   691		struct ubcore_device *dev, uint8_t port_id)
   692	{
   693		struct ubcore_port_kobj *p;
   694	
   695		p = &ldev->port[port_id];
   696		p->dev = dev;
   697		p->port_id = port_id;
   698	
   699		return kobject_init_and_add(&p->kobj, &ubcore_port_type, &ldev->dev->kobj,
   700			"port%hhu", port_id);
   701	}
   702	
   703	static ssize_t ubcore_show_eid_attr(struct ubcore_eid_kobj *eid, struct ubcore_eid_attribute *attr,
   704		char *buf, ubcore_show_eid_attr_cb show_cb)
   705	{
   706		struct ubcore_logic_device *ldev = eid->ldev;
   707		struct ubcore_device *dev = get_ubcore_device(ldev);
   708	
   709		if (!ldev || !dev) {
   710			ubcore_log_err("Invalid argument in show_fe_attr.\n");
   711			return -EINVAL;
   712		}
   713	
   714		return show_cb(dev, buf, eid->eid_idx, read_pnet(&ldev->net));
   715	}
   716	
   717	static ssize_t show_eid_cb(struct ubcore_device *dev, char *buf, uint16_t idx, struct net *net)
   718	{
   719		union ubcore_eid eid;
   720	
   721		if (net_eq(dev->eid_table.eid_entries[idx].net, net)) {
   722			return snprintf(buf, (UBCORE_EID_STR_LEN + 1) + 1, EID_FMT"\n",
   723				EID_ARGS(dev->eid_table.eid_entries[idx].eid));
   724		} else {
   725			memset(&eid, 0, sizeof(union ubcore_eid));
   726			return snprintf(buf, (UBCORE_EID_STR_LEN + 1) + 1, EID_FMT"\n",
   727				EID_ARGS(eid));
   728		}
   729	}
   730	
   731	static ssize_t eid_show(struct ubcore_eid_kobj *eid, struct ubcore_eid_attribute *attr, char *buf)
   732	{
   733		return ubcore_show_eid_attr(eid, attr, buf, show_eid_cb);
   734	}
   735	
   736	static EID_ATTR_RO(eid);
   737	
   738	static struct attribute *ubcore_eid_attrs[] = {
   739		&eid_attr_eid.attr,
   740		NULL,
   741	};
   742	
   743	static ssize_t ubcore_eid_attr_show(struct kobject *kobj, struct attribute *attr, char *buf)
   744	{
   745		struct ubcore_eid_attribute *eid_attr =
   746			container_of(attr, struct ubcore_eid_attribute, attr);
   747		struct ubcore_eid_kobj *eid = container_of(kobj, struct ubcore_eid_kobj, kobj);
   748	
   749		if (!eid_attr->show)
   750			return -EIO;
   751	
   752		return eid_attr->show(eid, eid_attr, buf);
   753	}
   754	
   755	static ssize_t ubcore_eid_attr_store(struct kobject *kobj, struct attribute *attr,
   756		const char *buf, size_t count)
   757	{
   758		struct ubcore_eid_attribute *eid_attr =
   759			container_of(attr, struct ubcore_eid_attribute, attr);
   760		struct ubcore_eid_kobj *eid = container_of(kobj, struct ubcore_eid_kobj, kobj);
   761	
   762		if (!eid_attr->store)
   763			return -EIO;
   764		return eid_attr->store(eid, eid_attr, buf, count);
   765	}
   766	
   767	static const struct sysfs_ops ubcore_eid_sysfs_ops = {
   768		.show	= ubcore_eid_attr_show,
   769		.store	= ubcore_eid_attr_store
   770	};
   771	
   772	static void ubcore_eid_release(struct kobject *kobj)
   773	{
   774	}
   775	
   776	// ATTRIBUTE_GROUPS defined in 3.11, but must be consistent with kobj_type->default_groups
   777	ATTRIBUTE_GROUPS(ubcore_eid);
   778	
   779	static struct kobj_type ubcore_eid_type = {
   780		.release       = ubcore_eid_release,
   781		.sysfs_ops     = &ubcore_eid_sysfs_ops,
   782		.default_groups = ubcore_eid_groups
   783	};
   784	
   785	int ubcore_create_eid_attr_files(struct ubcore_logic_device *ldev, uint32_t eid_num)
   786	{
   787		struct ubcore_eid_kobj *eid;
   788	
   789		eid = &ldev->eid[eid_num];
   790		eid->ldev = ldev;
   791		eid->eid_idx = eid_num;
   792	
   793		return kobject_init_and_add(&eid->kobj, &ubcore_eid_type, &ldev->dev->kobj,
   794			"eid%u", eid_num);
   795	}
   796	
 > 797	int ubcore_create_dev_attr_files(struct ubcore_logic_device *ldev)
   798	{
   799		int ret;
   800	
   801		ret = sysfs_create_group(&ldev->dev->kobj, &ubcore_dev_attr_group);
   802		if (ret != 0) {
   803			ubcore_log_err("sysfs create group failed, ret:%d.\n", ret);
   804			return -1;
   805		}
   806	
   807		return 0;
   808	}
   809	
 > 810	void ubcore_remove_port_attr_files(struct ubcore_logic_device *ldev, uint8_t port_id)
   811	{
   812		kobject_put(&ldev->port[port_id].kobj);
   813	}
   814	
   815	void ubcore_remove_eid_attr_files(struct ubcore_logic_device *ldev, uint32_t eid_num)
   816	{
   817		kobject_put(&ldev->eid[eid_num].kobj);
   818	}
   819	
 > 820	void ubcore_remove_dev_attr_files(struct ubcore_logic_device *ldev)
   821	{
   822		sysfs_remove_group(&ldev->dev->kobj, &ubcore_dev_attr_group);
   823	}
   824	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
