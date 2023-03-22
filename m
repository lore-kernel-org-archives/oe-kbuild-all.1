Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9F415BA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 03:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679454383; x=1710990383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/F2jOciUTzFdl6jEbnDAnB+blDajS+hjZWW525dKv/0=;
  b=kITnqpfwZQbL06Zz3B1jELUdiH9FsAs4jg45xknNgmz4/hUERZKfyAes
   ZvXnlpVq8XXwiY3v90rTj7uuPg9gMHbBhKRR95gp+N7Oz4CcwoAyOkEBe
   LKfYhMOcsYoH071qm3AzPOuywrLNTUxpp0F1+j3ycGe0F/FUvgKYbh+qf
   MBd4FoUBNcvImFMfCCmirR1SYw7W1ejUrACAI+yrMuuIrlFN8GkSiBrTr
   uregmAMPOH8WcUz2h0egIqZAkO2wm1xNH7BHYn1kYiryGdhYTOfliuzDR
   PYOsJpoTrZmY7LWj58jp8j0IXTvVSADbMzWAJeFF975L1lNDvvHiBNXMq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339155647"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="339155647"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 20:06:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="712069548"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="712069548"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Mar 2023 20:06:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peoni-000CmA-38;
	Wed, 22 Mar 2023 03:06:10 +0000
Date: Wed, 22 Mar 2023 11:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: alikernel-developer@linux.alibaba.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alibaba-cloud:linux-next 6581/9999] mm/unevictable.c:489:1:
 warning: 'static' is not at beginning of declaration
Message-ID: <202303221130.kaGvqYG7-lkp@intel.com>
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
commit: 7d6cb94f148e9e9cce24d3ce5ccb65b49974b547 [6581/9999] alinux: mm: Pin code section of process in memory
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230322/202303221130.kaGvqYG7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/alibaba/cloud-kernel/commit/7d6cb94f148e9e9cce24d3ce5ccb65b49974b547
        git remote add alibaba-cloud https://github.com/alibaba/cloud-kernel.git
        git fetch --no-tags alibaba-cloud linux-next
        git checkout 7d6cb94f148e9e9cce24d3ce5ccb65b49974b547
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221130.kaGvqYG7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/unevictable.c:489:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     489 | const static struct file_operations add_proc_fops = {
         | ^~~~~
   mm/unevictable.c:495:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     495 | const static struct file_operations del_proc_fops = {
         | ^~~~~


vim +/static +489 mm/unevictable.c

   488	
 > 489	const static struct file_operations add_proc_fops = {
   490		.read  = proc_read_add_pid,
   491		.write = proc_write_add_pid,
   492		.owner = THIS_MODULE,
   493	};
   494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
