Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C20B1F9F5A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 23:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737500682; cv=none; b=ndcUkKFu+c3x5taWwrOGBW9jixVCeydI7wvEkx1uZe+8KNFE+cID+ai6sq6EInmMWWba/f1JUYvRwVjBzqJYV2ki3qprF2vaWaUix60RPAVUWnMIRoutTC9howMEJb4VQwcgGjwe5nAy2xWHWpn/Y2s0gUGXmo91y4dXQRTaFbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737500682; c=relaxed/simple;
	bh=2UyTBHc1ACagArJ0u+9hj5AJ9xl0zrXzo8eZE51PHGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZEO/N7q5IgTFU4CvFQXS9Ir8516HgJL3Wppu0t6VGPJwCu0IRQJZnByzhMcZEyflWbS9ecI5NBp0c+yT42coZLiAUke9UX2Sq0pd7HrjUIdYmPJ9k6YtOncHoa2sWVEnL1hbR93YDRKw6CDkm8S0y5gcFuV+YkVbCUyiXoA6Cg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HmI7t1Ri; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HmI7t1Ri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737500680; x=1769036680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2UyTBHc1ACagArJ0u+9hj5AJ9xl0zrXzo8eZE51PHGM=;
  b=HmI7t1RiXc02T14iLS8j3kopAe5bgTwkWrdLijbWxu3RwJa2othGJuYw
   FZRSA6jBIWXD/jH/4do+B9ttjuBEcc2T5yKfhXHtv+23AdXzJ4Pi6RIgz
   uKKq2ux6A1sJ7RAt1CggucoLEhMUfgmL3BNZlRltqu5MctIUT0lE1I6yE
   1po5dROwGQYNX7emhPgOO2z1dRS1CASQkKOmlZBQGO6laegJRl4YAHXtz
   dDEMc8Iod1b5gW8ggbFYk1BEnBgoXj9r1WheBex28bMomeqsBbYpUpZnw
   5RguJUFPz6drdCvkdKSiv0HPcQlLdvw66a0EflIF6NUZt3POBT8Qn4oy2
   w==;
X-CSE-ConnectionGUID: +Ec1bgF5QFecxUQzoORE7w==
X-CSE-MsgGUID: 98QQBAKtSqKkfkgucyOptw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="41697406"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="41697406"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 15:04:39 -0800
X-CSE-ConnectionGUID: 9+qXgEdMQYKMctJn3rFPqQ==
X-CSE-MsgGUID: H5Dv8Te4SFmwpTlfDvP6Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107394968"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Jan 2025 15:04:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taNIR-000Z5w-33;
	Tue, 21 Jan 2025 23:04:35 +0000
Date: Wed, 22 Jan 2025 07:03:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1834/1834]
 drivers/crypto/montage/tsse/tsse_dev.h:84:6: warning: variable 'cpu' set but
 not used
Message-ID: <202501220636.mvJm5Jtb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Carrie.Cai,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   75c81bcddd82381fbd4cef477a5b56eb2fe56697
commit: 811debd4ea52033d7393d4a7de2be11f71c70348 [1834/1834] add support for Mont-TSSE Driver
config: x86_64-randconfig-101-20250122 (https://download.01.org/0day-ci/archive/20250122/202501220636.mvJm5Jtb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501220636.mvJm5Jtb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501220636.mvJm5Jtb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/montage/tsse/tsse_dev_mgr.c:13:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/crypto/montage/tsse/tsse_dev_mgr.c:15:
>> drivers/crypto/montage/tsse/tsse_dev.h:84:6: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
      84 |         int cpu, node;
         |             ^
   drivers/crypto/montage/tsse/tsse_dev_mgr.c:107:5: warning: no previous prototype for function 'tsse_stop_dev' [-Wmissing-prototypes]
     107 | int tsse_stop_dev(struct tsse_dev *tdev, bool busy_exit)
         |     ^
   drivers/crypto/montage/tsse/tsse_dev_mgr.c:107:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     107 | int tsse_stop_dev(struct tsse_dev *tdev, bool busy_exit)
         | ^
         | static 
   drivers/crypto/montage/tsse/tsse_dev_mgr.c:220:2: warning: variable 'ptr' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
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
   5 warnings generated.
--
   In file included from drivers/crypto/montage/tsse/tsse_ipc.c:14:
   In file included from drivers/crypto/montage/tsse/tsse_dev.h:13:
   In file included from include/linux/pci.h:1629:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/crypto/montage/tsse/tsse_ipc.c:14:
>> drivers/crypto/montage/tsse/tsse_dev.h:84:6: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
      84 |         int cpu, node;
         |             ^
   drivers/crypto/montage/tsse/tsse_ipc.c:17:18: warning: no previous prototype for function 'get_msginf' [-Wmissing-prototypes]
      17 | struct tsse_msg *get_msginf(void __iomem *d2h)
         |                  ^
   drivers/crypto/montage/tsse/tsse_ipc.c:17:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      17 | struct tsse_msg *get_msginf(void __iomem *d2h)
         | ^
         | static 
   drivers/crypto/montage/tsse/tsse_ipc.c:41:6: warning: no previous prototype for function 'ipc_recieve_msg' [-Wmissing-prototypes]
      41 | void ipc_recieve_msg(struct tsse_ipc *tsseipc, struct ipc_msg *msg)
         |      ^
   drivers/crypto/montage/tsse/tsse_ipc.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | void ipc_recieve_msg(struct tsse_ipc *tsseipc, struct ipc_msg *msg)
         | ^
         | static 
   drivers/crypto/montage/tsse/tsse_ipc.c:53:5: warning: no previous prototype for function 'msg_rout' [-Wmissing-prototypes]
      53 | int msg_rout(struct tsse_ipc *tsseipc, struct tsse_msg *tssemsg)
         |     ^
   drivers/crypto/montage/tsse/tsse_ipc.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      53 | int msg_rout(struct tsse_ipc *tsseipc, struct tsse_msg *tssemsg)
         | ^
         | static 
   drivers/crypto/montage/tsse/tsse_ipc.c:103:6: warning: no previous prototype for function 'ipc_send_msg' [-Wmissing-prototypes]
     103 | void ipc_send_msg(struct tsse_ipc *tsseipc, struct ipc_data *msg)
         |      ^
   drivers/crypto/montage/tsse/tsse_ipc.c:103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     103 | void ipc_send_msg(struct tsse_ipc *tsseipc, struct ipc_data *msg)
         | ^
         | static 
   drivers/crypto/montage/tsse/tsse_ipc.c:115:6: warning: no previous prototype for function 'ipc_hw_init' [-Wmissing-prototypes]
     115 | void ipc_hw_init(struct tsse_ipc *hw_ipc)
         |      ^
   drivers/crypto/montage/tsse/tsse_ipc.c:115:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     115 | void ipc_hw_init(struct tsse_ipc *hw_ipc)
         | ^
         | static 
   drivers/crypto/montage/tsse/tsse_ipc.c:122:5: warning: no previous prototype for function 'ipc_init_msg' [-Wmissing-prototypes]
     122 | int ipc_init_msg(struct tsse_ipc *tsseipc)
         |     ^
   drivers/crypto/montage/tsse/tsse_ipc.c:122:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     122 | int ipc_init_msg(struct tsse_ipc *tsseipc)
         | ^
         | static 
   8 warnings generated.
--
   In file included from drivers/crypto/montage/tsse/tsse_fw_service.c:15:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/crypto/montage/tsse/tsse_fw_service.c:20:
>> drivers/crypto/montage/tsse/tsse_dev.h:84:6: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
      84 |         int cpu, node;
         |             ^
   drivers/crypto/montage/tsse/tsse_fw_service.c:26:5: warning: no previous prototype for function 'fw_send_msg' [-Wmissing-prototypes]
      26 | int fw_send_msg(struct tsse_ipc *tsseipc, struct ipc_msg *msg)
         |     ^
   drivers/crypto/montage/tsse/tsse_fw_service.c:26:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      26 | int fw_send_msg(struct tsse_ipc *tsseipc, struct ipc_msg *msg)
         | ^
         | static 
   drivers/crypto/montage/tsse/tsse_fw_service.c:51:6: warning: no previous prototype for function 'fw_free' [-Wmissing-prototypes]
      51 | void fw_free(void *msg_t)
         |      ^
   drivers/crypto/montage/tsse/tsse_fw_service.c:51:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      51 | void fw_free(void *msg_t)
         | ^
         | static 
   4 warnings generated.
--
   In file included from drivers/crypto/montage/tsse/tsse_irq.c:10:
   In file included from drivers/crypto/montage/tsse/tsse_dev.h:13:
   In file included from include/linux/pci.h:1629:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/crypto/montage/tsse/tsse_irq.c:10:
>> drivers/crypto/montage/tsse/tsse_dev.h:84:6: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
      84 |         int cpu, node;
         |             ^
   2 warnings generated.
--
   In file included from drivers/crypto/montage/tsse/tsse_vuart.c:15:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/crypto/montage/tsse/tsse_vuart.c:25:
>> drivers/crypto/montage/tsse/tsse_dev.h:84:6: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
      84 |         int cpu, node;
         |             ^
   drivers/crypto/montage/tsse/tsse_vuart.c:77:13: warning: unused function 'vuart_wait_for_xmitr' [-Wunused-function]
      77 | static void vuart_wait_for_xmitr(struct uart_port *port)
         |             ^~~~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +/cpu +84 drivers/crypto/montage/tsse/tsse_dev.h

  > 13	#include <linux/pci.h>
    14	#include <linux/pci-ats.h>
    15	#include <linux/serial_core.h>
    16	#include <linux/firmware.h>
    17	#include "tsse_ipc.h"
    18	
    19	#define TSSE_PCI_MAX_BARS 4
    20	#define TSSE_FW_VERSION_LEN 32
    21	struct tsse_bar {
    22		void __iomem *virt_addr;
    23		resource_size_t addr;
    24		resource_size_t size;
    25	};
    26	struct tsse_dev_pci {
    27		struct pci_dev *pci_dev;
    28		struct tsse_bar bars[TSSE_PCI_MAX_BARS];
    29		u8 revid;
    30	};
    31	enum tsse_dev_status_bit {
    32		TSSE_DEV_STATUS_STARTING = 0,
    33		TSSE_DEV_STATUS_STARTED = 1
    34	
    35	};
    36	struct tsse_qpairs_bank {
    37		struct tsse_dev *tsse_dev;
    38		void __iomem *reg_base;
    39	
    40		u32 num_qparis;
    41		u32 irq_vec;
    42	};
    43	struct tsse_dev {
    44		struct module *owner;
    45		struct dentry *debugfs_dir;
    46		unsigned long status;
    47		struct list_head list;
    48		struct tsse_dev_pci tsse_pci_dev;
    49		struct tsse_qpairs_bank qpairs_bank;
    50		atomic_t ref_count;
    51		bool is_vf;
    52		int id;
    53		u32 num_irqs;
    54		u32 num_vfs;
    55		struct uart_port *port;
    56		struct tsse_ipc *ipc;
    57		void *adi;
    58		void *mbx_hw;
    59		const struct firmware *fw;
    60		char fw_version[TSSE_FW_VERSION_LEN];
    61	};
    62	#define TSSEDEV_TO_DEV(tssedev) (&((tssedev)->tsse_pci_dev.pci_dev->dev))
    63	#define TSSE_DEV_BARS(tssedev) ((tssedev)->tsse_pci_dev.bars)
    64	
    65	#include "tsse_log.h"
    66	
    67	struct list_head *tsse_devmgr_get_head(void);
    68	
    69	int tsse_dev_get(struct tsse_dev *tsse_dev);
    70	void tsse_dev_put(struct tsse_dev *tsse_dev);
    71	int tsse_devmgr_add_dev(struct tsse_dev *tsse_dev);
    72	void tsse_devmgr_rm_dev(struct tsse_dev *tdev);
    73	int tsse_prepare_restart_dev(struct tsse_dev *tdev);
    74	int tsse_start_dev(struct tsse_dev *tdev);
    75	struct tsse_dev *get_tssedev(int id);
    76	
    77	static inline struct tsse_dev *pci_to_tsse_dev(struct pci_dev *pci_dev)
    78	{
    79		return (struct tsse_dev *)pci_get_drvdata(pci_dev);
    80	}
    81	
    82	static inline int tsse_get_cur_node(void)
    83	{
  > 84		int cpu, node;
    85	
    86		cpu = get_cpu();
    87		node = topology_physical_package_id(cpu);
    88		put_cpu();
    89	
    90		return node;
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
