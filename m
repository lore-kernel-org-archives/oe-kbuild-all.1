Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952862FAE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 17:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676224251; x=1707760251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QxTsD9TAe2guo2TtXS9tKr1XoRzQnvZsHb4Lk0nzywM=;
  b=fZN9t316xUgM4VRXv4SMu2lC61YZ1w9Ims86ZnrtxFl8Vgy0CEsVYtWU
   /xdan05Yv3bVzjc5DBnTYPhQYZou6ZGGNIFhikx6KVXiBeWysSlX10gte
   dt+0QXAi4kYTnMJ6CUabWABegR6Rjh/Ol/TUPBXsUhJO9QYBatSV+WnNy
   6Jmpsr+ztMbkc1CxesfxpXLOTv+Zg1DhVzoB+Vv4o4M7qTC1Wu4lvOX7U
   LVEoUmZgi5qeYRzv+Hq45TEW5WaxA0Cm496BSXECd2sQ2SkIinEEdo2IA
   KnvCJZw7C/EGYZ+t1Xml7Djor1rbwUjFfNeBklG+CXzEvE2F5YSu2s5LT
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="358146200"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="358146200"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 09:50:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="701013141"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="701013141"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Feb 2023 09:50:49 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRGUy-0007Kv-29;
	Sun, 12 Feb 2023 17:50:48 +0000
Date: Mon, 13 Feb 2023 01:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [povik:asahi-6.2-rc3-7_dp-altmode-wip 5/6]
 drivers/usb/typec/tipd/displayport.c:213:37: warning: unused variable
 'partner'
Message-ID: <202302130148.QE3hp9Rz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/povik/linux asahi-6.2-rc3-7_dp-altmode-wip
head:   72e7196879b629343123a0459d858ef161061600
commit: 040e50c16296093a0a739743387b95e51beedf55 [5/6] WIP: typec/tipd/altmode/displayport: debugging
config: i386-randconfig-a012 (https://download.01.org/0day-ci/archive/20230213/202302130148.QE3hp9Rz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/povik/linux/commit/040e50c16296093a0a739743387b95e51beedf55
        git remote add povik https://github.com/povik/linux
        git fetch --no-tags povik asahi-6.2-rc3-7_dp-altmode-wip
        git checkout 040e50c16296093a0a739743387b95e51beedf55
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/usb/typec/tipd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302130148.QE3hp9Rz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/typec/tipd/displayport.c:210:5: warning: no previous prototype for 'tps6598x_displayport_notify' [-Wmissing-prototypes]
     210 | int tps6598x_displayport_notify(struct typec_altmode *alt, unsigned long conf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/displayport.c: In function 'tps6598x_displayport_notify':
>> drivers/usb/typec/tipd/displayport.c:213:37: warning: unused variable 'partner' [-Wunused-variable]
     213 |         const struct typec_altmode *partner = typec_altmode_get_partner(alt);
         |                                     ^~~~~~~


vim +/partner +213 drivers/usb/typec/tipd/displayport.c

   209	
   210	int tps6598x_displayport_notify(struct typec_altmode *alt, unsigned long conf,
   211					void *data)
   212	{
 > 213		const struct typec_altmode *partner = typec_altmode_get_partner(alt);
   214		struct tps6598x *tps = typec_altmode_get_drvdata(alt);
   215	
   216		if (!tps->cd321x)
   217			return 0;
   218	
   219		/*
   220		 * On Apple Silicon platforms we have to switch to USB_ROLE_NONE before
   221		 * setting up the alternate mode to shut down dwc3 and prevent it from
   222		 * locking up.
   223		 */
   224		usb_role_switch_set_role(tps->role_sw, USB_ROLE_NONE);
   225		usb_role_switch_set_role(tps->role_sw, USB_ROLE_HOST);
   226	
   227		return 0;
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
