Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8536A71EC6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 21:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709157378; cv=none; b=ljGQpHTWcB6bMwENRsBv5DYXKzgWdQdlvJkpNTrFXAOrJTx2DnA92XPTEF2LIDt1wsWkrFoCoFAVLBdvbNzMy5Sm/mq2gioUJe0uAKw28FrcBNzf9znzDByu0kK3SnOvrxBQ7aDno096vgbHdF5AoxTtZFxmAeZs3H0p/DhgCTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709157378; c=relaxed/simple;
	bh=TYLS547ujXzeK/0FkBEbPw54VhOWqz0+2RMD7yxQroI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aG+1d8kJj4S7x45SmTHTAbPkXM/bT0PkThBNz/cDRvhZxBW6IFtfgxhBSirNPyUMQjFHO8T2+2tBhdUn1RJvmooDzBXYsY+0MAdcUJY3JW+kwduz6qCIdol1StjtugzFUyUC0zWC29uLGqdloyyhYSxbEKP6A4JWN3CqGObOeCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YdL1k7dV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YdL1k7dV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709157377; x=1740693377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TYLS547ujXzeK/0FkBEbPw54VhOWqz0+2RMD7yxQroI=;
  b=YdL1k7dV43H4xabI9ard5Ao/sXOleA34OWRQHd7H2mGUcou+RzkSZwov
   KJUIkYCUeqtW87b4P/BasYpk2EnGy0fLXiv+f4aaSRMxznU1naK3ejMfK
   GlGetjWNKzscpycdlbXoDt0dEppsXKeFgYcOdqd97cGaSIiXbCxeJMhlK
   SBCBULmHL2aLhkMvgQL8TVWvjHxXpL7kPmH1CxULd3mRgcC56DDs38CEg
   nUtD13p5kSrIbPGJmehj3ORLktlkHTTRO3GKyCX+yxVC0xsB9Vja6dXlv
   QpVjP+8adM8Ik1YkoYAXESTsbMjwhzj+cizAbRz1w4MUUYCIUrwz4SqVe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3461426"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="3461426"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 13:56:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="30748678"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 28 Feb 2024 13:56:14 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfRuO-000CQR-1c;
	Wed, 28 Feb 2024 21:56:12 +0000
Date: Thu, 29 Feb 2024 05:55:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "Carrie.Cai" <carrie.cai@montage-tech.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3190/3426]
 drivers/crypto/montage/tsse/tsse_dev_mgr.c:107:5: warning: no previous
 prototype for function 'tsse_stop_dev'
Message-ID: <202402290504.Dzt3mHvf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   54465add6cb7660c781c0ae7b4d3e3d56185624e
commit: 811debd4ea52033d7393d4a7de2be11f71c70348 [3190/3426] add support for Mont-TSSE Driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240229/202402290504.Dzt3mHvf-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402290504.Dzt3mHvf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402290504.Dzt3mHvf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/montage/tsse/tsse_dev_mgr.c:107:5: warning: no previous prototype for function 'tsse_stop_dev' [-Wmissing-prototypes]
     107 | int tsse_stop_dev(struct tsse_dev *tdev, bool busy_exit)
         |     ^
   drivers/crypto/montage/tsse/tsse_dev_mgr.c:107:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     107 | int tsse_stop_dev(struct tsse_dev *tdev, bool busy_exit)
         | ^
         | static 
>> drivers/crypto/montage/tsse/tsse_dev_mgr.c:220:2: warning: variable 'ptr' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
     220 |         list_for_each(itr, &tsse_dev_table) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:687:27: note: expanded from macro 'list_for_each'
     687 |         for (pos = (head)->next; !list_is_head(pos, (head)); pos = pos->next)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/montage/tsse/tsse_dev_mgr.c:227:9: note: uninitialized use occurs here
     227 |         return ptr;
         |                ^~~
   drivers/crypto/montage/tsse/tsse_dev_mgr.c:220:2: note: remove the condition if it is always true
     220 |         list_for_each(itr, &tsse_dev_table) {
         |         ^
   include/linux/list.h:687:27: note: expanded from macro 'list_for_each'
     687 |         for (pos = (head)->next; !list_is_head(pos, (head)); pos = pos->next)
         |                                  ^
   drivers/crypto/montage/tsse/tsse_dev_mgr.c:216:22: note: initialize the variable 'ptr' to silence this warning
     216 |         struct tsse_dev *ptr;
         |                             ^
         |                              = NULL
   drivers/crypto/montage/tsse/tsse_dev_mgr.c:37:20: warning: unused function 'tsse_list_add_tail' [-Wunused-function]
      37 | static inline void tsse_list_add_tail(struct list_head *new,
         |                    ^~~~~~~~~~~~~~~~~~
   3 warnings generated.
--
>> drivers/crypto/montage/tsse/tsse_ipc.c:17:18: warning: no previous prototype for function 'get_msginf' [-Wmissing-prototypes]
      17 | struct tsse_msg *get_msginf(void __iomem *d2h)
         |                  ^
   drivers/crypto/montage/tsse/tsse_ipc.c:17:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      17 | struct tsse_msg *get_msginf(void __iomem *d2h)
         | ^
         | static 
>> drivers/crypto/montage/tsse/tsse_ipc.c:41:6: warning: no previous prototype for function 'ipc_recieve_msg' [-Wmissing-prototypes]
      41 | void ipc_recieve_msg(struct tsse_ipc *tsseipc, struct ipc_msg *msg)
         |      ^
   drivers/crypto/montage/tsse/tsse_ipc.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | void ipc_recieve_msg(struct tsse_ipc *tsseipc, struct ipc_msg *msg)
         | ^
         | static 
>> drivers/crypto/montage/tsse/tsse_ipc.c:53:5: warning: no previous prototype for function 'msg_rout' [-Wmissing-prototypes]
      53 | int msg_rout(struct tsse_ipc *tsseipc, struct tsse_msg *tssemsg)
         |     ^
   drivers/crypto/montage/tsse/tsse_ipc.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      53 | int msg_rout(struct tsse_ipc *tsseipc, struct tsse_msg *tssemsg)
         | ^
         | static 
>> drivers/crypto/montage/tsse/tsse_ipc.c:103:6: warning: no previous prototype for function 'ipc_send_msg' [-Wmissing-prototypes]
     103 | void ipc_send_msg(struct tsse_ipc *tsseipc, struct ipc_data *msg)
         |      ^
   drivers/crypto/montage/tsse/tsse_ipc.c:103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     103 | void ipc_send_msg(struct tsse_ipc *tsseipc, struct ipc_data *msg)
         | ^
         | static 
>> drivers/crypto/montage/tsse/tsse_ipc.c:115:6: warning: no previous prototype for function 'ipc_hw_init' [-Wmissing-prototypes]
     115 | void ipc_hw_init(struct tsse_ipc *hw_ipc)
         |      ^
   drivers/crypto/montage/tsse/tsse_ipc.c:115:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     115 | void ipc_hw_init(struct tsse_ipc *hw_ipc)
         | ^
         | static 
>> drivers/crypto/montage/tsse/tsse_ipc.c:122:5: warning: no previous prototype for function 'ipc_init_msg' [-Wmissing-prototypes]
     122 | int ipc_init_msg(struct tsse_ipc *tsseipc)
         |     ^
   drivers/crypto/montage/tsse/tsse_ipc.c:122:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     122 | int ipc_init_msg(struct tsse_ipc *tsseipc)
         | ^
         | static 
   6 warnings generated.
--
>> drivers/crypto/montage/tsse/tsse_fw_service.c:26:5: warning: no previous prototype for function 'fw_send_msg' [-Wmissing-prototypes]
      26 | int fw_send_msg(struct tsse_ipc *tsseipc, struct ipc_msg *msg)
         |     ^
   drivers/crypto/montage/tsse/tsse_fw_service.c:26:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      26 | int fw_send_msg(struct tsse_ipc *tsseipc, struct ipc_msg *msg)
         | ^
         | static 
>> drivers/crypto/montage/tsse/tsse_fw_service.c:51:6: warning: no previous prototype for function 'fw_free' [-Wmissing-prototypes]
      51 | void fw_free(void *msg_t)
         |      ^
   drivers/crypto/montage/tsse/tsse_fw_service.c:51:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      51 | void fw_free(void *msg_t)
         | ^
         | static 
   2 warnings generated.
--
>> drivers/crypto/montage/tsse/tsse_service.c:15:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      15 |         int ret;
         |             ^
>> drivers/crypto/montage/tsse/tsse_service.c:11:5: warning: no previous prototype for function 'service_rout' [-Wmissing-prototypes]
      11 | int service_rout(struct tsse_ipc *tsseipc, struct ipc_msg *msg)
         |     ^
   drivers/crypto/montage/tsse/tsse_service.c:11:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      11 | int service_rout(struct tsse_ipc *tsseipc, struct ipc_msg *msg)
         | ^
         | static 
   2 warnings generated.


vim +/tsse_stop_dev +107 drivers/crypto/montage/tsse/tsse_dev_mgr.c

   106	
 > 107	int tsse_stop_dev(struct tsse_dev *tdev, bool busy_exit)
   108	{
   109		int times, max_retry = 150;
   110	
   111		clear_bit(TSSE_DEV_STATUS_STARTING, &tdev->status);
   112		clear_bit(TSSE_DEV_STATUS_STARTED, &tdev->status);
   113	
   114		for (times = 0; times < max_retry; times++) {
   115			if (!tsse_dev_in_use(tdev))
   116				break;
   117			msleep(100);
   118		}
   119	
   120		if (times >= max_retry) {
   121			tsse_dev_err(tdev, "Failed to stop busy device\n");
   122			if (busy_exit)
   123				return -EBUSY;
   124		}
   125		if (tdev->qpairs_bank.num_qparis != 0) {
   126			mutex_lock(&tsse_dev_table_lock);
   127			tsse_list_del(&tdev->list);
   128			mutex_unlock(&tsse_dev_table_lock);
   129			tsse_dev_info(tdev, "removed from active dev table list\n");
   130		}
   131	
   132		tsse_dev_info(tdev, "device stopped\n");
   133	
   134		return 0;
   135	}
   136	
   137	int tsse_start_dev(struct tsse_dev *tdev)
   138	{
   139		struct tsse_dev *tmp_dev;
   140		struct list_head *prev_node = &tsse_dev_table;
   141		int ret = 0;
   142	
   143		if (tdev->qpairs_bank.num_qparis == 0) {
   144			set_bit(TSSE_DEV_STATUS_STARTED, &tdev->status);
   145			tsse_dev_info(tdev, "device started\n");
   146			return 0;
   147		}
   148	
   149		set_bit(TSSE_DEV_STATUS_STARTING, &tdev->status);
   150	
   151		mutex_lock(&tsse_dev_table_lock);
   152	
   153		list_for_each_entry(tmp_dev, &tsse_dev_table, list) {
   154			if (tmp_dev == tdev) {
   155				ret = -EEXIST;
   156				tsse_dev_err(tdev,
   157					     "The device cannot be added repeatedly\n");
   158				goto clear_status;
   159			}
   160		}
   161	
   162		set_bit(TSSE_DEV_STATUS_STARTED, &tdev->status);
   163		tsse_list_add(&tdev->list, prev_node, prev_node->next);
   164	
   165		tsse_dev_info(tdev, "device started\n");
   166		mutex_unlock(&tsse_dev_table_lock);
   167	
   168		return 0;
   169	clear_status:
   170		mutex_unlock(&tsse_dev_table_lock);
   171		clear_bit(TSSE_DEV_STATUS_STARTING, &tdev->status);
   172		clear_bit(TSSE_DEV_STATUS_STARTED, &tdev->status);
   173		return ret;
   174	}
   175	EXPORT_SYMBOL_GPL(tsse_start_dev);
   176	
   177	int tsse_prepare_restart_dev(struct tsse_dev *tdev)
   178	{
   179		return tsse_stop_dev(tdev, false);
   180	}
   181	EXPORT_SYMBOL_GPL(tsse_prepare_restart_dev);
   182	
   183	void tsse_devmgr_rm_dev(struct tsse_dev *tdev)
   184	{
   185		tsse_stop_dev(tdev, false);
   186		tsse_dev_free_irq_vectors(tdev);
   187		msleep(300);
   188	}
   189	EXPORT_SYMBOL_GPL(tsse_devmgr_rm_dev);
   190	
   191	int tsse_devmgr_add_dev(struct tsse_dev *tdev)
   192	{
   193		int ret;
   194	
   195		ret = tsse_dev_alloc_irq_vectors(tdev);
   196		if (ret == 0) {
   197			atomic_set(&tdev->ref_count, 0);
   198			tdev->status = 0;
   199			ret = tsse_start_dev(tdev);
   200	
   201			if (ret != 0)
   202				tsse_dev_free_irq_vectors(tdev);
   203		}
   204		return ret;
   205	}
   206	EXPORT_SYMBOL_GPL(tsse_devmgr_add_dev);
   207	
   208	struct list_head *tsse_devmgr_get_head(void)
   209	{
   210		return &tsse_dev_table;
   211	}
   212	
   213	struct tsse_dev *get_tssedev(int id)
   214	{
   215		struct list_head *itr;
   216		struct tsse_dev *ptr;
   217	
   218		mutex_lock(&tsse_dev_table_lock);
   219	
 > 220		list_for_each(itr, &tsse_dev_table) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
