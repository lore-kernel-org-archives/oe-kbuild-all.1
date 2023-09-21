Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F31D199BE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 14:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695306681; x=1726842681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dmbTOduQ3ZT1/v2kr+SrBklHsMNnCIaWWftGoVb99oE=;
  b=YE1XKZ90SfQnM2+wDeARBMET5cURSgvDBgZOP6oc/EwqlZy6xbh1KYyK
   7ojFRE+GgxUcPm7UekkfHkKfPl8VzceGWt/FxG6hvUXN72ntsbisQCXF9
   2BMwGm24BrtrrmDxflGBcGZjSoqYNHH8CwasVaCBGqFUUecJ4wIi6vUA5
   papwrBca+d/nP4J0DCni/YAMQK7pFh+I/1ryUYxw0ZwHrfYfk5y2PGOne
   x3xOogz+XqIkpUOQiG4HFgtBeD7i7H35rlRa2K8sTP8Vk9Vz6wHVxPVsy
   m8MRY4aEqGa7u0G6YAnKqsD69xeoEUSyh3eQTqcqYeSQwwgJs5nnpdN0S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383288455"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="383288455"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 07:31:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="776456969"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="776456969"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Sep 2023 07:31:19 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjKi4-00002Z-3A;
	Thu, 21 Sep 2023 14:31:16 +0000
Date: Thu, 21 Sep 2023 22:30:29 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 53/56]
 drivers/leds/leds-turris-omnia.c:47:13: warning: unused variable 'ret'
Message-ID: <202309212215.Yl5VQaSm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   c015f343e07aa8ed701372b8acdb4bdc021eaeaa
commit: 5e5ec959d9d6143e95427d1cf562ab61b8d17ed4 [53/56] leds: turris-omnia: Do not use SMBUS calls
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230921/202309212215.Yl5VQaSm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309212215.Yl5VQaSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309212215.Yl5VQaSm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/leds-turris-omnia.c: In function 'omnia_cmd_write_u8':
>> drivers/leds/leds-turris-omnia.c:47:13: warning: unused variable 'ret' [-Wunused-variable]
      47 |         int ret;
         |             ^~~


vim +/ret +47 drivers/leds/leds-turris-omnia.c

    43	
    44	static int omnia_cmd_write_u8(const struct i2c_client *client, u8 cmd, u8 val)
    45	{
    46		u8 buf[2] = { cmd, val };
  > 47		int ret;
    48	
    49		return i2c_master_send(client, buf, sizeof(buf));
    50	}
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
