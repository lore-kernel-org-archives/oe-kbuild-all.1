Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7152583
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 13:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680872507; x=1712408507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u8HnegPDF7TI8EKs5lExXehtVC85UnX4JvQAo88SgPM=;
  b=grTB5ulrJEIkrisRuG6XPQ1eC7acVYT+Gcwo4/E0ULujU+xeMc1Qr5Aq
   e4W/bL99QOK/qIETl5HpRuFHnIItRmehHg3+QqDNTLXprQ45QrKCl+hve
   r0k0b83373zUtuxctPzfJZ36SLZ0IQpE13ImK+8CP3+dyGhZlatRdHnV/
   jQ89LewlRTurvbQkln/dK5pdjJEzE8HYafGz94pXwQJJA0zEefy7PZWqi
   w1EZp881uHX0bndWKTJwAaQ65YLGWH4qWjjuHqmhlQVwE+DfLorUc9cDN
   bFKHNw5B/L3Qy8NKYHHZd12gJCDXBZONlJTb1F1zsMZeNMWxJ9tRm9Mzf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="408112977"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="408112977"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 06:01:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="681023377"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="681023377"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Apr 2023 06:01:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pklir-000SVb-0v;
	Fri, 07 Apr 2023 13:01:45 +0000
Date: Fri, 7 Apr 2023 21:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: Aswath Govindraju <a-govindraju@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-linux-5.10.y-cicd 14828/22025]
 drivers/usb/typec/tps6598x.c:441:13: warning: variable 'ret' set but not
 used
Message-ID: <202304072030.scFj65p5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Aswath,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   991c5ce91e43cb620f534dc9fe7b0ad21f4f4388
commit: f29b24e22ea9fd8b14b3c02f0bb6d40791fcd93b [14828/22025] usb: typec: tps6598x: Add support for polling interrupts status when interrupt line is not connected
config: x86_64-randconfig-r026-20230403 (https://download.01.org/0day-ci/archive/20230407/202304072030.scFj65p5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y-cicd
        git checkout f29b24e22ea9fd8b14b3c02f0bb6d40791fcd93b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/typec/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304072030.scFj65p5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/typec/tps6598x.c: In function 'tps6598x_interrupt':
>> drivers/usb/typec/tps6598x.c:441:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     441 |         int ret;
         |             ^~~


vim +/ret +441 drivers/usb/typec/tps6598x.c

   437	
   438	static irqreturn_t tps6598x_interrupt(int irq, void *data)
   439	{
   440		struct tps6598x *tps = data;
 > 441		int ret;
   442	
   443		ret = tps6598x_handle_interrupt_status(tps);
   444		return IRQ_HANDLED;
   445	}
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
