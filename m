Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0381BC952
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 15:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679412519; x=1710948519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=31jQi5pHEku43s4tVgNNd67v9cWobiPSA4VN2ZyYTtw=;
  b=Nx24iF1w1FyIpNfbEYEc6jF1AqpdBAFoMImq8a7w9X7F/JL0VAYlj5Qn
   iy7Er33ApDNxoBuel1JsgY6UfXKf7okLTA33zgsi2icnn4nkiB/tQFiZw
   xhqelYpcDUR2wxsYcmy6LU2u+fkc4vAzPpCZWGJLtqLjaCvSM551uhNrB
   rd6eame124JhXGld/QbVHgfZHMRUNEfFuTr+voMjGk721CpourfdvHggj
   KVEcIw7qTb5DZ8d1wLsAbg4+pc9pS1fGXJeNKLimG5qrUk62tqUuM95k3
   RxChZuBjjcbwDClhM4+GxkyRaQKic3dXGCH9P5G01Lt8bumECifhqKIKt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="336475043"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="336475043"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 08:28:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="681525346"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="681525346"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Mar 2023 08:28:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pedue-000C4g-0U;
	Tue, 21 Mar 2023 15:28:36 +0000
Date: Tue, 21 Mar 2023 23:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: alikernel-developer@linux.alibaba.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alibaba-cloud:linux-next 8099/9999] mm/unevictable.c:495:37:
 warning: 'del_proc_fops' defined but not used
Message-ID: <202303212347.c63YZJaV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alibaba/cloud-kernel.git linux-next
head:   d121e0c25d1a19485d7f293b67901462bb1a6552
commit: 59cec5300f4d8fe7498bf85ab53211b8bedf9b2c [8099/9999] alinux: mm: bring back unevictable.o in obj-y
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230321/202303212347.c63YZJaV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/alibaba/cloud-kernel/commit/59cec5300f4d8fe7498bf85ab53211b8bedf9b2c
        git remote add alibaba-cloud https://github.com/alibaba/cloud-kernel.git
        git fetch --no-tags alibaba-cloud linux-next
        git checkout 59cec5300f4d8fe7498bf85ab53211b8bedf9b2c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303212347.c63YZJaV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/unevictable.c:489:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     489 | const static struct file_operations add_proc_fops = {
         | ^~~~~
   mm/unevictable.c:495:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     495 | const static struct file_operations del_proc_fops = {
         | ^~~~~
>> mm/unevictable.c:495:37: warning: 'del_proc_fops' defined but not used [-Wunused-const-variable=]
     495 | const static struct file_operations del_proc_fops = {
         |                                     ^~~~~~~~~~~~~
>> mm/unevictable.c:489:37: warning: 'add_proc_fops' defined but not used [-Wunused-const-variable=]
     489 | const static struct file_operations add_proc_fops = {
         |                                     ^~~~~~~~~~~~~


vim +/del_proc_fops +495 mm/unevictable.c

7d6cb94f148e9e Xunlei Pang 2019-09-19  488  
7d6cb94f148e9e Xunlei Pang 2019-09-19 @489  const static struct file_operations add_proc_fops = {
7d6cb94f148e9e Xunlei Pang 2019-09-19  490  	.read  = proc_read_add_pid,
7d6cb94f148e9e Xunlei Pang 2019-09-19  491  	.write = proc_write_add_pid,
7d6cb94f148e9e Xunlei Pang 2019-09-19  492  	.owner = THIS_MODULE,
7d6cb94f148e9e Xunlei Pang 2019-09-19  493  };
7d6cb94f148e9e Xunlei Pang 2019-09-19  494  
7d6cb94f148e9e Xunlei Pang 2019-09-19 @495  const static struct file_operations del_proc_fops = {
7d6cb94f148e9e Xunlei Pang 2019-09-19  496  	.write = proc_write_del_pid,
7d6cb94f148e9e Xunlei Pang 2019-09-19  497  	.owner = THIS_MODULE,
7d6cb94f148e9e Xunlei Pang 2019-09-19  498  };
7d6cb94f148e9e Xunlei Pang 2019-09-19  499  

:::::: The code at line 495 was first introduced by commit
:::::: 7d6cb94f148e9e9cce24d3ce5ccb65b49974b547 alinux: mm: Pin code section of process in memory

:::::: TO: Xunlei Pang <xlpang@linux.alibaba.com>
:::::: CC: Xu Yu <xuyu@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
