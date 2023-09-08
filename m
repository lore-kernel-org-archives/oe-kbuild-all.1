Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB056FA8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 23:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694217579; x=1725753579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FiHyLu75yNl144V+9hSX8YKPUaapuMHwmJ1bNrKJOeI=;
  b=fzH1Pn3zw4Dl7hGvodZsPP78Gxub61UgyNaGMK/TdqxnFmwabkg8igKw
   JFf4cdPGbaGk6rkiiMGS5MuZLMpRIf2wMqPAxJh3Fl7PV231MISGolGhG
   PwY0dD+X7cpKPIaHT2lmnuxjHjpbNUL1MWMulUbqjnBzXVGWqTPLPsKN1
   7eRCj+PpXSR/tbs9fGyKQYqwosLbluMvpbJAzBaMck42mt2TxCNWohqNZ
   T0Or5iV2Q3q9mV98aFIQyQe+e5srwd7voOaJfBaZLh/ZUNJxe44Q/T8Nc
   pJt6xumXL0iEH1Y6ql+zpdJJgeWDI1cuTRWSvSDvsw7vKxvbJjT+PiLrg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="376680962"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="376680962"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 16:59:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="742679705"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="742679705"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Sep 2023 16:59:37 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qelNu-0002kj-1z;
	Fri, 08 Sep 2023 23:59:34 +0000
Date: Sat, 9 Sep 2023 07:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: Dominik Behr <dbehr@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.14-rebase 7838/9999]
 drivers/virtio/virtio_wl.c:248:39: sparse: sparse: incorrect type in
 argument 2 (different base types)
Message-ID: <202309090726.7LkkBYQH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: 96df1fd4668697c7ba620d0dc832391544b8b4ea [7838/9999] BACKPORT: idr: Delete idr_find_ext function
config: i386-randconfig-062-20230908 (https://download.01.org/0day-ci/archive/20230909/202309090726.7LkkBYQH-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090726.7LkkBYQH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090726.7LkkBYQH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/virtio/virtio_wl.c:207:21: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:207:21: sparse:     expected unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:207:21: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:233:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_wl.c:233:19: sparse:     expected unsigned int [usertype] size
   drivers/virtio/virtio_wl.c:233:19: sparse:     got restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:234:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] pfn @@     got restricted __le64 [usertype] pfn @@
   drivers/virtio/virtio_wl.c:234:18: sparse:     expected unsigned long long [usertype] pfn
   drivers/virtio/virtio_wl.c:234:18: sparse:     got restricted __le64 [usertype] pfn
   drivers/virtio/virtio_wl.c:235:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] flags @@
   drivers/virtio/virtio_wl.c:235:20: sparse:     expected unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:235:20: sparse:     got restricted __le32 [usertype] flags
>> drivers/virtio/virtio_wl.c:248:39: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:248:39: sparse:     expected unsigned long id
   drivers/virtio/virtio_wl.c:248:39: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:282:42: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:282:42: sparse:     expected unsigned long id
   drivers/virtio/virtio_wl.c:282:42: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:310:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:310:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:310:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:487:24: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:492:26: sparse: sparse: cast from restricted __le32
   drivers/virtio/virtio_wl.c:494:46: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:518:58: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:523:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:561:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:567:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:605:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:605:30: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:605:30: sparse:     got int
   drivers/virtio/virtio_wl.c:606:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:606:28: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:606:28: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:744:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:744:29: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:744:29: sparse:     got int
   drivers/virtio/virtio_wl.c:745:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:745:27: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:745:27: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:746:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_count @@     got unsigned int [assigned] [usertype] vfd_count @@
   drivers/virtio/virtio_wl.c:746:30: sparse:     expected restricted __le32 [usertype] vfd_count
   drivers/virtio/virtio_wl.c:746:30: sparse:     got unsigned int [assigned] [usertype] vfd_count
   drivers/virtio/virtio_wl.c:766:45: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:766:45: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:766:45: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:793:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:793:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:793:36: sparse:     got int
   drivers/virtio/virtio_wl.c:794:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:794:34: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:794:34: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:795:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned int [usertype] flags @@
   drivers/virtio/virtio_wl.c:795:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:795:33: sparse:     got unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:963:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:963:26: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:963:26: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:966:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:966:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:966:36: sparse:     got int
   drivers/virtio/virtio_wl.c:967:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:967:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:967:33: sparse:     got int
   drivers/virtio/virtio_wl.c:970:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:970:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:970:36: sparse:     got int
   drivers/virtio/virtio_wl.c:971:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] size @@     got unsigned int @@
   drivers/virtio/virtio_wl.c:971:32: sparse:     expected restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:971:32: sparse:     got unsigned int
   drivers/virtio/virtio_wl.c:974:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:974:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:974:36: sparse:     got int
   drivers/virtio/virtio_wl.c:975:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:975:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:975:33: sparse:     got int
   drivers/virtio/virtio_wl.c:978:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:978:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:978:36: sparse:     got int
   drivers/virtio/virtio_wl.c:979:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:979:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:979:33: sparse:     got int
   drivers/virtio/virtio_wl.c:984:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:984:44: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:984:44: sparse:     got int
   drivers/virtio/virtio_wl.c:1006:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:1006:44: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:1006:44: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1010:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_wl.c:1010:19: sparse:     expected unsigned int [usertype] size
   drivers/virtio/virtio_wl.c:1010:19: sparse:     got restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:1011:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] pfn @@     got restricted __le64 [usertype] pfn @@
   drivers/virtio/virtio_wl.c:1011:18: sparse:     expected unsigned long long [usertype] pfn
   drivers/virtio/virtio_wl.c:1011:18: sparse:     got restricted __le64 [usertype] pfn
   drivers/virtio/virtio_wl.c:1012:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] flags @@
   drivers/virtio/virtio_wl.c:1012:20: sparse:     expected unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:1012:20: sparse:     got restricted __le32 [usertype] flags

vim +248 drivers/virtio/virtio_wl.c

99b354577a77ef Zach Reizner 2017-08-14  239  
99b354577a77ef Zach Reizner 2017-08-14  240  static bool vq_handle_recv(struct virtwl_info *vi,
99b354577a77ef Zach Reizner 2017-08-14  241  			   struct virtio_wl_ctrl_vfd_recv *recv,
99b354577a77ef Zach Reizner 2017-08-14  242  			   unsigned int len)
99b354577a77ef Zach Reizner 2017-08-14  243  {
99b354577a77ef Zach Reizner 2017-08-14  244  	struct virtwl_vfd *vfd;
99b354577a77ef Zach Reizner 2017-08-14  245  	struct virtwl_vfd_qentry *qentry;
99b354577a77ef Zach Reizner 2017-08-14  246  
99b354577a77ef Zach Reizner 2017-08-14  247  	mutex_lock(&vi->vfds_lock);
99b354577a77ef Zach Reizner 2017-08-14 @248  	vfd = idr_find(&vi->vfds, recv->vfd_id);
99b354577a77ef Zach Reizner 2017-08-14  249  	if (vfd)
99b354577a77ef Zach Reizner 2017-08-14  250  		mutex_lock(&vfd->lock);
99b354577a77ef Zach Reizner 2017-08-14  251  	mutex_unlock(&vi->vfds_lock);
99b354577a77ef Zach Reizner 2017-08-14  252  
99b354577a77ef Zach Reizner 2017-08-14  253  	if (!vfd) {
99b354577a77ef Zach Reizner 2017-08-14  254  		pr_warn("virtwl: recv for unknown vfd_id %u\n", recv->vfd_id);
99b354577a77ef Zach Reizner 2017-08-14  255  		return true; /* return the inbuf to vq */
99b354577a77ef Zach Reizner 2017-08-14  256  	}
99b354577a77ef Zach Reizner 2017-08-14  257  
99b354577a77ef Zach Reizner 2017-08-14  258  	qentry = kzalloc(sizeof(*qentry), GFP_KERNEL);
99b354577a77ef Zach Reizner 2017-08-14  259  	if (!qentry) {
99b354577a77ef Zach Reizner 2017-08-14  260  		mutex_unlock(&vfd->lock);
99b354577a77ef Zach Reizner 2017-08-14  261  		pr_warn("virtwl: failed to allocate qentry for vfd\n");
99b354577a77ef Zach Reizner 2017-08-14  262  		return true; /* return the inbuf to vq */
99b354577a77ef Zach Reizner 2017-08-14  263  	}
99b354577a77ef Zach Reizner 2017-08-14  264  
99b354577a77ef Zach Reizner 2017-08-14  265  	qentry->hdr = &recv->hdr;
99b354577a77ef Zach Reizner 2017-08-14  266  	qentry->len = len;
99b354577a77ef Zach Reizner 2017-08-14  267  
99b354577a77ef Zach Reizner 2017-08-14  268  	list_add_tail(&qentry->list, &vfd->in_queue);
86d20abce93414 Zach Reizner 2018-03-28  269  	wake_up_interruptible_all(&vfd->in_waitq);
99b354577a77ef Zach Reizner 2017-08-14  270  	mutex_unlock(&vfd->lock);
99b354577a77ef Zach Reizner 2017-08-14  271  
99b354577a77ef Zach Reizner 2017-08-14  272  	return false; /* no return the inbuf to vq */
99b354577a77ef Zach Reizner 2017-08-14  273  }
99b354577a77ef Zach Reizner 2017-08-14  274  

:::::: The code at line 248 was first introduced by commit
:::::: 99b354577a77efc7b59eb873477a13eca6ca1b05 CHROMIUM: virtwl: add virtwl driver

:::::: TO: Zach Reizner <zachr@google.com>
:::::: CC: chrome-bot <chrome-bot@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
