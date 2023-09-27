Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8558F79FD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 20:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695848375; x=1727384375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G7VPodXYdowt4In3HIrR5vUz5WkTjUn67Tb/g7qTa1U=;
  b=F2dTtiuSgUcEtbAdlLw889szPfLXXxHfzG5fcd5P/KlZ8607OJoKx9uo
   9oMdANYsLFjWwfoQett4rm3KshntsbCvuv28Z6V2JEKivu1LepgoQPTgM
   oZMPqUmxoZLIir3iXRjLSVk4ziE/Fbj+yG+RqeMrcrzzQFcDOMEJgfWV3
   ndM9jSM1/b0ZEkVq/KPFljz0j6YvU9y5xvh8QueL8JeOt69alzbPuwDp1
   sXvNq72hhMJi6NaoY8hvocBATDgw1a+ms5ZkHYxb6XhhqSP+YaDvjSOGm
   LVu0QqY/d9UpBlfHYGna3RncizBcFryja0wQgv1hsAmrG9OjP0GJfPRWi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="379198924"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="379198924"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 13:59:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="699025227"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="699025227"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 27 Sep 2023 13:59:32 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlbd4-0000fZ-0L;
	Wed, 27 Sep 2023 20:59:30 +0000
Date: Thu, 28 Sep 2023 04:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: Benson Leung <bleung@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Prashant Malani <pmalani@chromium.org>
Subject: drivers/platform/chrome/cros_ec_typec.c:900:39: sparse: sparse: cast
 to restricted __le16
Message-ID: <202309280431.VyAxysqB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   633b47cb009d09dc8f4ba9cdb3a0ca138809c7c7
commit: 3b3dd1f0dbfe92781c60f36ea5c22b26360f9909 platform/chrome: cros_ec_typec: Report SOP' PD revision from status
date:   2 years, 8 months ago
config: x86_64-randconfig-121-20230928 (https://download.01.org/0day-ci/archive/20230928/202309280431.VyAxysqB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309280431.VyAxysqB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280431.VyAxysqB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/chrome/cros_ec_typec.c:900:39: sparse: sparse: cast to restricted __le16

vim +900 drivers/platform/chrome/cros_ec_typec.c

   870	
   871	static void cros_typec_handle_status(struct cros_typec_data *typec, int port_num)
   872	{
   873		struct ec_response_typec_status resp;
   874		struct ec_params_typec_status req = {
   875			.port = port_num,
   876		};
   877		int ret;
   878	
   879		ret = cros_typec_ec_command(typec, 0, EC_CMD_TYPEC_STATUS, &req, sizeof(req),
   880					    &resp, sizeof(resp));
   881		if (ret < 0) {
   882			dev_warn(typec->dev, "EC_CMD_TYPEC_STATUS failed for port: %d\n", port_num);
   883			return;
   884		}
   885	
   886		/* Handle any events appropriately. */
   887		if (resp.events & PD_STATUS_EVENT_SOP_DISC_DONE && !typec->ports[port_num]->sop_disc_done) {
   888			ret = cros_typec_handle_sop_disc(typec, port_num);
   889			if (ret < 0)
   890				dev_err(typec->dev, "Couldn't parse SOP Disc data, port: %d\n", port_num);
   891			else
   892				typec->ports[port_num]->sop_disc_done = true;
   893		}
   894	
   895		if (resp.events & PD_STATUS_EVENT_SOP_PRIME_DISC_DONE &&
   896		    !typec->ports[port_num]->sop_prime_disc_done) {
   897			u16 sop_prime_revision;
   898	
   899			/* Convert BCD to the format preferred by the TypeC framework */
 > 900			sop_prime_revision = (le16_to_cpu(resp.sop_prime_revision) & 0xff00) >> 4;
   901			ret = cros_typec_handle_sop_prime_disc(typec, port_num, sop_prime_revision);
   902			if (ret < 0)
   903				dev_err(typec->dev, "Couldn't parse SOP' Disc data, port: %d\n", port_num);
   904			else
   905				typec->ports[port_num]->sop_prime_disc_done = true;
   906		}
   907	}
   908	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
