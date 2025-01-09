Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FEE1AAC9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 04:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736398409; cv=none; b=qPozzX+8CnTopbX1v6nivGIc5BnzsfFaJ3wh1+/K6g5bZ3i1/xH3UGtb5aX/roKStvH3Zt7S3vN5QP794eQVeBHfE6AD1MkNHqkfN64QNjVWuSyc7F5cJZAMQuX1cBwhfQ6dDXbtC0UJitJdiUNhZSa9YlSqnkKm46TFhxgQb/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736398409; c=relaxed/simple;
	bh=f6O4sI2usc2deNxHx9dEcvw0zHBq/Swr+zgF1vzuLDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eFHMvpHWQ1PixW63fbaPKvM4JTcDdDvNbZGkVDArFgrmDsHvoleT3RIYh+Q/LJ6X/AchidYXCEMpTd6qtJ7lZpn+CJpeUKbd6D9KZlcNJSnzb7oPLyJu2dREhX/Q5GbuIfX3zCVEk58twRtAT+akmlfkf2TpoGB1xwJhSw/AS6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LF9yILZI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LF9yILZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736398407; x=1767934407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f6O4sI2usc2deNxHx9dEcvw0zHBq/Swr+zgF1vzuLDs=;
  b=LF9yILZIEgwkBrG0YZss1mRg+pkeDFt/27/yHHfzkebODIZEL61yX8M+
   UBJ6UCH0nC17OCehdz6CRVeT5S1aGWDJw8MWmaldduRk+gY24NQQP3PRq
   2vnWmKvCMR+ADhQcgKEFcQqn4lIuYep086w95YfD5jYbBYAcF6hA3Q0Wo
   5KHUmGvdYnTiCyh3OMtTvl4FVyIJqjWT8ih2zeRVKX/kRuPYxXtP5EmSN
   ofo8+I80dbzwxNDhw1XqAAzKWrNt7IOruzmI18LU3jk4SR7L9jIjdX9Ui
   bsoHKhrwqBCTjcHBQQkX/zKrIMWZ2KAHipTXAul54byatYyqa09V+0Coc
   A==;
X-CSE-ConnectionGUID: bBT4zCbEQ5ag3QwRULyOHw==
X-CSE-MsgGUID: JkRyjzz4SZawqjAnh+94nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="59113476"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="59113476"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 20:53:27 -0800
X-CSE-ConnectionGUID: 7p5FtlpERpexyEwqLNWS8Q==
X-CSE-MsgGUID: Kgm/mLtKQi6QxMdjR3i4eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108402886"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Jan 2025 20:53:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVkXq-000H3r-33;
	Thu, 09 Jan 2025 04:53:22 +0000
Date: Thu, 9 Jan 2025 12:53:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zhenghao <zhangzhenghao9@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1799/1799]
 drivers/net/ethernet/huawei/hibifur/bifur_main.c:175:5: warning: no previous
 prototype for function 'bifur_enable_disable_vf_all'
Message-ID: <202501091220.UhgFHZVc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   89cbe2e2a9d5402e079b95f36d33d4669614e0dc
commit: a544f0ba62857476ae73fd4305dbe293b7ee7532 [1799/1799] Add Huawei Intelligent Network Card Driver:hibifur
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250109/202501091220.UhgFHZVc-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501091220.UhgFHZVc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501091220.UhgFHZVc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/huawei/hibifur/bifur_main.c:175:5: warning: no previous prototype for function 'bifur_enable_disable_vf_all' [-Wmissing-prototypes]
     175 | int bifur_enable_disable_vf_all(bool enable)
         |     ^
   drivers/net/ethernet/huawei/hibifur/bifur_main.c:175:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     175 | int bifur_enable_disable_vf_all(bool enable)
         | ^
         | static 
   1 warning generated.
--
>> drivers/net/ethernet/huawei/hibifur/bifur_vf_mgr.c:88:6: warning: no previous prototype for function 'bifur_vf_info_hold' [-Wmissing-prototypes]
      88 | void bifur_vf_info_hold(struct bifur_vf_info *dev)
         |      ^
   drivers/net/ethernet/huawei/hibifur/bifur_vf_mgr.c:88:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      88 | void bifur_vf_info_hold(struct bifur_vf_info *dev)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_vf_mgr.c:93:6: warning: no previous prototype for function 'bifur_vf_info_put' [-Wmissing-prototypes]
      93 | void bifur_vf_info_put(struct bifur_vf_info *dev)
         |      ^
   drivers/net/ethernet/huawei/hibifur/bifur_vf_mgr.c:93:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      93 | void bifur_vf_info_put(struct bifur_vf_info *dev)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_vf_mgr.c:99:6: warning: no previous prototype for function 'bifur_dev_file_add' [-Wmissing-prototypes]
      99 | void bifur_dev_file_add(struct bifur_dev_file_t *dev_file)
         |      ^
   drivers/net/ethernet/huawei/hibifur/bifur_vf_mgr.c:99:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      99 | void bifur_dev_file_add(struct bifur_dev_file_t *dev_file)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_vf_mgr.c:106:6: warning: no previous prototype for function 'bifur_dev_file_del' [-Wmissing-prototypes]
     106 | void bifur_dev_file_del(struct bifur_dev_file_t *dev_file)
         |      ^
   drivers/net/ethernet/huawei/hibifur/bifur_vf_mgr.c:106:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     106 | void bifur_dev_file_del(struct bifur_dev_file_t *dev_file)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_vf_mgr.c:113:5: warning: no previous prototype for function 'bifur_proc_open' [-Wmissing-prototypes]
     113 | int bifur_proc_open(struct inode *inode, struct file *filp)
         |     ^
   drivers/net/ethernet/huawei/hibifur/bifur_vf_mgr.c:113:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     113 | int bifur_proc_open(struct inode *inode, struct file *filp)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_vf_mgr.c:133:5: warning: no previous prototype for function 'bifur_proc_close' [-Wmissing-prototypes]
     133 | int bifur_proc_close(struct inode *inode, struct file *filp)
         |     ^
   drivers/net/ethernet/huawei/hibifur/bifur_vf_mgr.c:133:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     133 | int bifur_proc_close(struct inode *inode, struct file *filp)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_vf_mgr.c:171:5: warning: no previous prototype for function 'bifur_dev_proc_build' [-Wmissing-prototypes]
     171 | int bifur_dev_proc_build(struct bifur_vf_info *dev)
         |     ^
   drivers/net/ethernet/huawei/hibifur/bifur_vf_mgr.c:171:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     171 | int bifur_dev_proc_build(struct bifur_vf_info *dev)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_vf_mgr.c:204:5: warning: no previous prototype for function 'bifur_dev_proc_destroy' [-Wmissing-prototypes]
     204 | int bifur_dev_proc_destroy(struct bifur_vf_info *dev)
         |     ^
   drivers/net/ethernet/huawei/hibifur/bifur_vf_mgr.c:204:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     204 | int bifur_dev_proc_destroy(struct bifur_vf_info *dev)
         | ^
         | static 
   8 warnings generated.
--
>> drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:43:6: warning: no previous prototype for function 'bifur_global_file_del' [-Wmissing-prototypes]
      43 | void bifur_global_file_del(struct bifur_proc_file_t *proc_file)
         |      ^
   drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:43:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      43 | void bifur_global_file_del(struct bifur_proc_file_t *proc_file)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:50:5: warning: no previous prototype for function 'bifur_global_dev_close' [-Wmissing-prototypes]
      50 | int bifur_global_dev_close(struct inode *inode, struct file *filp)
         |     ^
   drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:50:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      50 | int bifur_global_dev_close(struct inode *inode, struct file *filp)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:62:5: warning: no previous prototype for function 'bifur_global_file_add' [-Wmissing-prototypes]
      62 | int bifur_global_file_add(struct bifur_proc_file_t *add_proc_file)
         |     ^
   drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:62:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      62 | int bifur_global_file_add(struct bifur_proc_file_t *add_proc_file)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:83:27: warning: no previous prototype for function 'bifur_alloc_proc_file' [-Wmissing-prototypes]
      83 | struct bifur_proc_file_t *bifur_alloc_proc_file(void)
         |                           ^
   drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:83:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      83 | struct bifur_proc_file_t *bifur_alloc_proc_file(void)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:95:5: warning: no previous prototype for function 'bifur_global_dev_open' [-Wmissing-prototypes]
      95 | int bifur_global_dev_open(struct inode *inode, struct file *filp)
         |     ^
   drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      95 | int bifur_global_dev_open(struct inode *inode, struct file *filp)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:370:5: warning: no previous prototype for function 'bifur_cmd_exec' [-Wmissing-prototypes]
     370 | int bifur_cmd_exec(struct file *file, struct bifur_msg *msg)
         |     ^
   drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:370:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     370 | int bifur_cmd_exec(struct file *file, struct bifur_msg *msg)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:383:5: warning: no previous prototype for function 'bifur_msg_copy_from_usr' [-Wmissing-prototypes]
     383 | int bifur_msg_copy_from_usr(const char __user *ubuf, size_t size, struct bifur_msg *usr,
         |     ^
   drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:383:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     383 | int bifur_msg_copy_from_usr(const char __user *ubuf, size_t size, struct bifur_msg *usr,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:431:6: warning: no previous prototype for function 'bifur_free_knl_msg_buf' [-Wmissing-prototypes]
     431 | void bifur_free_knl_msg_buf(struct bifur_msg *msg)
         |      ^
   drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:431:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     431 | void bifur_free_knl_msg_buf(struct bifur_msg *msg)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:437:5: warning: no previous prototype for function 'bifur_msg_copy_to_usr' [-Wmissing-prototypes]
     437 | int bifur_msg_copy_to_usr(struct bifur_msg *usr, struct bifur_msg *knl)
         |     ^
   drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:437:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     437 | int bifur_msg_copy_to_usr(struct bifur_msg *usr, struct bifur_msg *knl)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:457:9: warning: no previous prototype for function 'bifur_file_write' [-Wmissing-prototypes]
     457 | ssize_t bifur_file_write(struct file *file, const char __user *ubuf, size_t size, loff_t *pos)
         |         ^
   drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:457:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     457 | ssize_t bifur_file_write(struct file *file, const char __user *ubuf, size_t size, loff_t *pos)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:488:9: warning: no previous prototype for function 'bifur_proc_write' [-Wmissing-prototypes]
     488 | ssize_t bifur_proc_write(struct file *file, const char __user *ubuf, size_t size, loff_t *pos)
         |         ^
   drivers/net/ethernet/huawei/hibifur/bifur_pfile.c:488:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     488 | ssize_t bifur_proc_write(struct file *file, const char __user *ubuf, size_t size, loff_t *pos)
         | ^
         | static 
   11 warnings generated.
--
>> drivers/net/ethernet/huawei/hibifur/bifur_event.c:257:6: warning: no previous prototype for function 'bifur_notify_vf_link_status' [-Wmissing-prototypes]
     257 | void bifur_notify_vf_link_status(struct hinic3_lld_dev *lld_dev, u8 port_id, u16 vf_id,
         |      ^
   drivers/net/ethernet/huawei/hibifur/bifur_event.c:257:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     257 | void bifur_notify_vf_link_status(struct hinic3_lld_dev *lld_dev, u8 port_id, u16 vf_id,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_event.c:282:6: warning: no previous prototype for function 'bifur_notify_all_vfs_link_changed' [-Wmissing-prototypes]
     282 | void bifur_notify_all_vfs_link_changed(struct hinic3_lld_dev *lld_dev, u32 dbdf, u8 link_status)
         |      ^
   drivers/net/ethernet/huawei/hibifur/bifur_event.c:282:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     282 | void bifur_notify_all_vfs_link_changed(struct hinic3_lld_dev *lld_dev, u32 dbdf, u8 link_status)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hibifur/bifur_event.c:341:5: warning: no previous prototype for function 'bifur_net_event_callback' [-Wmissing-prototypes]
     341 | int bifur_net_event_callback(struct notifier_block *nb, unsigned long event, void *ptr)
         |     ^
   drivers/net/ethernet/huawei/hibifur/bifur_event.c:341:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     341 | int bifur_net_event_callback(struct notifier_block *nb, unsigned long event, void *ptr)
         | ^
         | static 
   3 warnings generated.


vim +/bifur_enable_disable_vf_all +175 drivers/net/ethernet/huawei/hibifur/bifur_main.c

   174	
 > 175	int bifur_enable_disable_vf_all(bool enable)
   176	{
   177		int err = 0;
   178		int num_vfs = enable ? BIFUR_VF_NUM : 0;
   179		struct bifur_lld_dev *bifur_dev = NULL;
   180		struct bifur_lld_dev *tmp_dev = NULL;
   181		struct bifur_adapter *adp = bifur_get_adp();
   182		struct list_head *head = &adp->lld_dev_head;
   183	
   184		list_for_each_entry_safe(bifur_dev, tmp_dev, head, list) {
   185			if (bifur_dev->pf_type != BIFUR_RESOURCE_PF)
   186				continue;
   187	
   188			bifur_dev_hold(bifur_dev);
   189			err = bifur_enable_disable_vfs(bifur_dev, num_vfs);
   190			bifur_dev_put(bifur_dev);
   191			if (err)
   192				return err;
   193		}
   194	
   195		return 0;
   196	}
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
