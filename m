Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A4618FDDE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 02:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764296153; cv=none; b=tw9IbYnTT9QQxQJDsQMfnKCMsfurFccJa3hns/0pY7/lJ2WePcqiVcaU0gL8UkYuGw+c9cXHyi6XUD0QU9pWSDOq0t5SZbeEqVuWbN/eLT0tPffGZ2+lbN0dCzEs/AIhDFYiE4daqv/c7FmK5E7/rVHSfS8xSoqCenpbUFdAMLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764296153; c=relaxed/simple;
	bh=L5BSNhIg17OUJa6lDOPAyThbXYQh6R2XrUzu1w/LIMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m1+xFY1NWxVlHWWqW3waODOzRUYaUSFb8vLxGJyjRB0wCLE4xk922Y03XOZnS09kM9wQsyhrOyCwFjN7Jz1e3KLSCggO4wosmdUwlDdGZqjAWQH8v67aiAS/zXNPBWXDoQeQyW51eMeErZYpH+dKBeDdrgnAoNW7hCsMaJjTC1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=feLL6pyH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="feLL6pyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764296151; x=1795832151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L5BSNhIg17OUJa6lDOPAyThbXYQh6R2XrUzu1w/LIMU=;
  b=feLL6pyHIjfhhSnHsd52Dpxw/eLQzHFoFQJmbKTYx1WzLig6Muo4q/I5
   Rxa/j/cGgfO6p40MrIetr84YSy2c6YkyvzS/3FM0FF1dQyxTGH1xR+fTc
   My4i84E9MGRHY+nrRDTVpR9PsIU65GXE17t5bH5WN+ErLDNv2zKL40fKT
   Ua1gf5RTpo91OCWXVaDdhMt5J2KM63SiY55b5Ge0jT4GRERJqcjn/D6Ud
   kJ7SQp/jc02y3hpvtwLqJ3eW7QqfPcrdXtI/1WOia7fJoiz2Yhdl3y/tc
   Hqtj5IxUkuieEHXM9OhZ/hKHlpI/S2v3yldaSZQvhj3zfV5t92wr8dqYf
   A==;
X-CSE-ConnectionGUID: pN2DqKIqTHaYKAtYs1hLMQ==
X-CSE-MsgGUID: N/6PzGyuSLyLrptQBVwFug==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="76656684"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="76656684"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 18:15:50 -0800
X-CSE-ConnectionGUID: bCm8oUolRwew0ie0lLHp7g==
X-CSE-MsgGUID: mvCXBIOwRQmB3BF2/1D+fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="224051151"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 27 Nov 2025 18:15:49 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOo1S-000000001uH-2UZD;
	Fri, 28 Nov 2025 02:15:46 +0000
Date: Fri, 28 Nov 2025 03:15:24 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3406/3406] htmldocs:
 ./include/ub/ubus/ubus.h:387: warning: Function parameter or member
 'KABI_RESERVE(1' not described in 'ub_driver'
Message-ID: <202511280356.zz3MdyMr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c246f2d81b5390b10c50870d9ef40337e9a5cb86
commit: e40360b68c42fb79a086799873391e728c29c0de [3406/3406] ub:ubus: Add ubus and ubfi opensource document
reproduce: (https://download.01.org/0day-ci/archive/20251128/202511280356.zz3MdyMr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280356.zz3MdyMr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'ctp_resp_vl_offset' not described in 'ubase_adev_qos'
   ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'ctp_req_vl' not described in 'ubase_adev_qos'
   ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'dscp_vl' not described in 'ubase_adev_qos'
   ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'ue_max_vl_id' not described in 'ubase_adev_qos'
   ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'ue_sl_vl' not described in 'ubase_adev_qos'
>> ./include/ub/ubus/ubus.h:387: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'ub_driver'
   ./drivers/usb/dwc3/core.h:1370: warning: Function parameter or member 'gfladj_refclk_lpm_sel' not described in 'dwc3'
   Error: Cannot open file ./include/linux/usb/gadget.h
   Error: Cannot open file ./include/linux/usb/gadget.h
   Error: Cannot open file ./include/linux/usb/composite.h
   Error: Cannot open file ./include/linux/usb/composite.h
--
   Error: Cannot open file ./include/linux/energy_model.h
   Error: Cannot open file ./include/linux/energy_model.h
   Error: Cannot open file ./include/linux/fprobe.h
   Error: Cannot open file ./include/linux/mutex.h
   Error: Cannot open file ./include/linux/mutex.h
>> ./drivers/ub/ubfi/ubc.h:91: warning: Function parameter or member 'reserved' not described in 'ubrt_ubc_table'
>> ./drivers/ub/ubfi/ubc.h:91: warning: Function parameter or member 'ubcs' not described in 'ubrt_ubc_table'
>> ./drivers/ub/ubfi/ubc.h:60: warning: Function parameter or member 'reserved' not described in 'ubc_node'
>> ./drivers/ub/ubfi/ubc.h:60: warning: Function parameter or member 'reserved2' not described in 'ubc_node'
>> ./drivers/ub/ubfi/ubc.h:60: warning: Function parameter or member 'ubc_guid_low' not described in 'ubc_node'
>> ./drivers/ub/ubfi/ubc.h:60: warning: Function parameter or member 'ubc_guid_high' not described in 'ubc_node'
>> ./include/ub/ubus/ubus.h:387: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'ub_driver'
   Error: Cannot open file ./include/linux/mod_devicetable.h
   Error: Cannot open file ./include/linux/fwctl.h
   ./include/uapi/linux/iommufd.h:615: warning: Enum value 'IOMMU_HW_CAP_PCI_PASID_EXEC' not described in enum 'iommufd_hw_capabilities'
   ./include/uapi/linux/iommufd.h:615: warning: Enum value 'IOMMU_HW_CAP_PCI_PASID_PRIV' not described in enum 'iommufd_hw_capabilities'
   ./include/uapi/linux/iommufd.h:615: warning: Excess enum value 'IOMMU_HW_CAP_PASID_EXEC' description in 'iommufd_hw_capabilities'
--
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function tty_port_operations ./include/linux/tty_port.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function tty_kref_get ./include/linux/tty.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function TTY Struct Flags ./include/linux/tty.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function tty_struct ./include/linux/tty.h' failed with return code 1
   Documentation/driver-api/ub/index.rst:3: ERROR: Undefined substitution referenced: "copy". [docutils]
>> Documentation/driver-api/ub/ubus:6: ./include/ub/ubus/ubus.h:317: WARNING: Inline emphasis start-string without end-string. [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/usb/gadget.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/usb/composite.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function typec_altmode_driver -function typec_altmode_ops ./include/linux/usb/typec_altmode.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function typec_altmode_register_driver -function typec_altmode_unregister_driver ./include/linux/usb/typec_altmode.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/usb.h' failed with return code 2
--
   Documentation/ub/ubase/ubase.rst:185: ERROR: Unexpected indentation. [docutils]
   Documentation/ub/ubase/ubase.rst:204: ERROR: Unexpected indentation. [docutils]
   Documentation/ub/ubase/ubase.rst:246: ERROR: Unexpected indentation. [docutils]
   Documentation/ub/ubus/ubus:112: ./include/ub/ubus/ubus.h:3: WARNING: Duplicate C declaration, also defined at driver-api/ub/ubus:3.
   Declaration is '.. c:struct:: ub_driver'. [duplicate_declaration.c]
>> Documentation/ub/ubus/ubus:112: ./include/ub/ubus/ubus.h:317: WARNING: Inline emphasis start-string without end-string. [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function ub_device_id ./include/linux/mod_devicetable.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/fwctl.h' failed with return code 1
   Documentation/arch/x86/hygon-secure-virtualization.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/misc-devices/zcopy.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/mm/dynamic_hugetlb.rst: WARNING: document isn't included in any toctree [toc.not_included]


vim +387 ./include/ub/ubus/ubus.h

e42bc00975898c Junlong Zheng 2025-09-18  308  
e42bc00975898c Junlong Zheng 2025-09-18  309  /**
e42bc00975898c Junlong Zheng 2025-09-18  310   * struct ub_driver - UB driver structure
e42bc00975898c Junlong Zheng 2025-09-18  311   * @node:	List of driver structures.
e42bc00975898c Junlong Zheng 2025-09-18  312   * @name:	Driver name.
e42bc00975898c Junlong Zheng 2025-09-18  313   * @id_table:	Pointer to table of device IDs the driver is
e42bc00975898c Junlong Zheng 2025-09-18  314   *		interested in.  Most drivers should export this
e42bc00975898c Junlong Zheng 2025-09-18  315   *		table using MODULE_DEVICE_TABLE(ub,...).
e42bc00975898c Junlong Zheng 2025-09-18  316   * @probe:	This probing function gets called (during execution
e42bc00975898c Junlong Zheng 2025-09-18  317   *		of ub_register_driver() for already existing
e42bc00975898c Junlong Zheng 2025-09-18  318   *		entities or later if a new entity gets inserted) for
e42bc00975898c Junlong Zheng 2025-09-18  319   *		all UB entities which match the ID table and are not
e42bc00975898c Junlong Zheng 2025-09-18  320   *		"owned" by the other drivers yet. This function gets
e42bc00975898c Junlong Zheng 2025-09-18  321   *		passed a "struct ub_entity *" for each entity whose
e42bc00975898c Junlong Zheng 2025-09-18  322   *		entry in the ID table matches the entity. The probe
e42bc00975898c Junlong Zheng 2025-09-18  323   *		function returns zero when the driver chooses to
e42bc00975898c Junlong Zheng 2025-09-18  324   *		take "ownership" of the entity or an error code
e42bc00975898c Junlong Zheng 2025-09-18  325   *		(negative number) otherwise.
e42bc00975898c Junlong Zheng 2025-09-18  326   *		The probe function always gets called from process
e42bc00975898c Junlong Zheng 2025-09-18  327   *		context, so it can sleep.
e42bc00975898c Junlong Zheng 2025-09-18  328   * @remove:	The remove() function gets called whenever an entity
e42bc00975898c Junlong Zheng 2025-09-18  329   *		being handled by this driver is removed (either during
e42bc00975898c Junlong Zheng 2025-09-18  330   *		deregistration of the driver or when it's manually
e42bc00975898c Junlong Zheng 2025-09-18  331   *		removed from a hot-pluggable slot).
e42bc00975898c Junlong Zheng 2025-09-18  332   *		The remove function always gets called from process
e42bc00975898c Junlong Zheng 2025-09-18  333   *		context, so it can sleep.
e42bc00975898c Junlong Zheng 2025-09-18  334   * @shutdown:	Hook into reboot_notifier_list (kernel/sys.c).
e42bc00975898c Junlong Zheng 2025-09-18  335   *		Intended to stop any idling operations.
9039065cf6d07a Junlong Zheng 2025-09-20  336   * @virt_configure: Optional driver callback to allow configuration of
59de5029039dc2 Yahui Liu     2025-11-14  337   *		UEs. This function is called to enable or disable UEs.
9039065cf6d07a Junlong Zheng 2025-09-20  338   * @virt_notify: Optional driver callback to notify the driver about
59de5029039dc2 Yahui Liu     2025-11-14  339   *		changes in UE status. This function is called
59de5029039dc2 Yahui Liu     2025-11-14  340   *		when the status of a UE changes.
ce21d74812eca9 Junlong Zheng 2025-09-20  341   * @activate:	Activate a specific entity. This function is called to
ce21d74812eca9 Junlong Zheng 2025-09-20  342   *		activate an entity by its index.
ce21d74812eca9 Junlong Zheng 2025-09-20  343   * @deactivate:	Deactivate a specific entity. This function is called to
ce21d74812eca9 Junlong Zheng 2025-09-20  344   *		deactivate an entity by its index.
0f0c155e2bb76b Yahui Liu     2025-10-13  345   * @err_handler: Error handling callbacks.
41aa93731e2382 Junlong Zheng 2025-09-18  346   * @groups:	Sysfs attribute groups.
41aa93731e2382 Junlong Zheng 2025-09-18  347   * @dev_groups: Attributes attached to the device that will be
41aa93731e2382 Junlong Zheng 2025-09-18  348   *		created once it is bound to the driver.
e42bc00975898c Junlong Zheng 2025-09-18  349   * @driver:	Driver model structure.
41aa93731e2382 Junlong Zheng 2025-09-18  350   * @dynids:	List of dynamically added device IDs.
fae045218cb429 Junlong Zheng 2025-09-19  351   * @driver_managed_dma: Device driver doesn't use kernel DMA API for DMA.
fae045218cb429 Junlong Zheng 2025-09-19  352   *		For most device drivers, no need to care about this flag
fae045218cb429 Junlong Zheng 2025-09-19  353   *		as long as all DMAs are handled through the kernel DMA API.
fae045218cb429 Junlong Zheng 2025-09-19  354   *		For some special ones, for example VFIO drivers, they know
fae045218cb429 Junlong Zheng 2025-09-19  355   *		how to manage the DMA themselves and set this flag so that
fae045218cb429 Junlong Zheng 2025-09-19  356   *		the IOMMU layer will allow them to setup and manage their
fae045218cb429 Junlong Zheng 2025-09-19  357   *		own I/O address space.
e42bc00975898c Junlong Zheng 2025-09-18  358   */
e42bc00975898c Junlong Zheng 2025-09-18  359  struct ub_driver {
e42bc00975898c Junlong Zheng 2025-09-18  360  	struct list_head node;
e42bc00975898c Junlong Zheng 2025-09-18  361  	const char *name;
e42bc00975898c Junlong Zheng 2025-09-18  362  	const struct ub_device_id *id_table; /* Must be non-NULL for probe to be called */
e42bc00975898c Junlong Zheng 2025-09-18  363  	/* New entity inserted */
e42bc00975898c Junlong Zheng 2025-09-18  364  	int (*probe)(struct ub_entity *uent, const struct ub_device_id *id);
e42bc00975898c Junlong Zheng 2025-09-18  365  	/* entity removed (NULL if not a hot-plug capable driver) */
e42bc00975898c Junlong Zheng 2025-09-18  366  	void (*remove)(struct ub_entity *uent);
e42bc00975898c Junlong Zheng 2025-09-18  367  	void (*shutdown)(struct ub_entity *uent);
9039065cf6d07a Junlong Zheng 2025-09-20  368  	int (*virt_configure)(struct ub_entity *uent, int entity_idx, bool is_en);
9039065cf6d07a Junlong Zheng 2025-09-20  369  	int (*virt_notify)(struct ub_entity *uent, int entity_idx, bool is_en);
ce21d74812eca9 Junlong Zheng 2025-09-20  370  	int (*activate)(struct ub_entity *uent, u32 entity_idx);
ce21d74812eca9 Junlong Zheng 2025-09-20  371  	int (*deactivate)(struct ub_entity *uent, u32 entity_idx);
0f0c155e2bb76b Yahui Liu     2025-10-13  372  	const struct ub_error_handlers *err_handler;
41aa93731e2382 Junlong Zheng 2025-09-18  373  	const struct attribute_group **groups;
41aa93731e2382 Junlong Zheng 2025-09-18  374  	const struct attribute_group **dev_groups;
e42bc00975898c Junlong Zheng 2025-09-18  375  	struct device_driver driver;
41aa93731e2382 Junlong Zheng 2025-09-18  376  	struct ub_dynids dynids;
fae045218cb429 Junlong Zheng 2025-09-19  377  	bool driver_managed_dma;
f1ef7b8acf16ea Junlong Zheng 2025-09-25  378  
f1ef7b8acf16ea Junlong Zheng 2025-09-25  379  	KABI_RESERVE(1)
f1ef7b8acf16ea Junlong Zheng 2025-09-25  380  	KABI_RESERVE(2)
f1ef7b8acf16ea Junlong Zheng 2025-09-25  381  	KABI_RESERVE(3)
f1ef7b8acf16ea Junlong Zheng 2025-09-25  382  	KABI_RESERVE(4)
f1ef7b8acf16ea Junlong Zheng 2025-09-25  383  	KABI_RESERVE(5)
f1ef7b8acf16ea Junlong Zheng 2025-09-25  384  	KABI_RESERVE(6)
f1ef7b8acf16ea Junlong Zheng 2025-09-25  385  	KABI_RESERVE(7)
f1ef7b8acf16ea Junlong Zheng 2025-09-25  386  	KABI_RESERVE(8)
e42bc00975898c Junlong Zheng 2025-09-18 @387  };
e42bc00975898c Junlong Zheng 2025-09-18  388  

:::::: The code at line 387 was first introduced by commit
:::::: e42bc00975898c42b4b9f1dc88fbb3f0748de8a5 ub:ubus: Support for ub bus driver framework

:::::: TO: Junlong Zheng <zhengjunlong@huawei.com>
:::::: CC: Jianquan Lin <linjianquan2@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
