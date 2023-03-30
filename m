Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79180C2DC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 06:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680158377; x=1711694377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+XX2wa5up+QX/32nkcHTXd3dU6jy3weLPBe2nnkYJS8=;
  b=mSt6Y4aXavhIfmErvcq4N8gdBN1FIhBOkv2/cHS7zBf/WeYjh4BsEH0B
   fTf0F+/8056awoA9/Zg2y02SJjgAx9074MOxS/Pasv676mzLINh17PnaU
   DwapKJjdLy+wB196IakKPkfa492TqECpsG5FdvrfJDmbuC00mh8KLZa1W
   k49Fg+H3cyhsPGZM7KD1q6vkFEWm4o1tKa8Hof50+IETjhClW89/x4cMP
   2IH+vO90lNZ0ACWtEIfItBxTpANEAOvEzxI5wwq1LFS6LT63ou51QklnB
   rIjIDffMYKDRZ8lSYM9ljEHBNEpDaPGE3ooTgeQfMj5R9Iw3gugrHZaif
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="343533688"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="343533688"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 23:39:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="828184239"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="828184239"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2023 23:39:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phlwc-000KSi-2w;
	Thu, 30 Mar 2023 06:39:34 +0000
Date: Thu, 30 Mar 2023 14:38:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-gs-raviole-5.10-s-v2-beta-3
 1458/9999] drivers/firmware/arm_scmi/sensors.c:614:28: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202303301414.1lEL2Mon-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-gs-raviole-5.10-s-v2-beta-3
head:   51e133b6e4eb00703d3b3fe71cc2447ebd9fb4a8
commit: ac18ef8d266d19126d544393120ef3da7f51c684 [1458/9999] UPSTREAM: firmware: arm_scmi: Add SCMI v3.0 sensor configuration support
config: arm-randconfig-s033-20230326 (https://download.01.org/0day-ci/archive/20230330/202303301414.1lEL2Mon-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/ac18ef8d266d19126d544393120ef3da7f51c684
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-gs-raviole-5.10-s-v2-beta-3
        git checkout ac18ef8d266d19126d544393120ef3da7f51c684
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash drivers/firmware/arm_scmi/ fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301414.1lEL2Mon-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/sensors.c:614:28: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/firmware/arm_scmi/sensors.c:614:28: sparse:     expected unsigned int [usertype] val
   drivers/firmware/arm_scmi/sensors.c:614:28: sparse:     got restricted __le32 [usertype]

vim +614 drivers/firmware/arm_scmi/sensors.c

   601	
   602	static int scmi_sensor_config_get(const struct scmi_handle *handle,
   603					  u32 sensor_id, u32 *sensor_config)
   604	{
   605		int ret;
   606		struct scmi_xfer *t;
   607	
   608		ret = scmi_xfer_get_init(handle, SENSOR_CONFIG_GET,
   609					 SCMI_PROTOCOL_SENSOR, sizeof(__le32),
   610					 sizeof(__le32), &t);
   611		if (ret)
   612			return ret;
   613	
 > 614		put_unaligned_le32(cpu_to_le32(sensor_id), t->tx.buf);
   615		ret = scmi_do_xfer(handle, t);
   616		if (!ret) {
   617			struct sensors_info *si = handle->sensor_priv;
   618			struct scmi_sensor_info *s = si->sensors + sensor_id;
   619	
   620			*sensor_config = get_unaligned_le64(t->rx.buf);
   621			s->sensor_config = *sensor_config;
   622		}
   623	
   624		scmi_xfer_put(handle, t);
   625		return ret;
   626	}
   627	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
