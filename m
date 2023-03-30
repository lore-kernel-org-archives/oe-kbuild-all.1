Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3556E1857
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 05:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680153459; x=1711689459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R9BU17l4r10NEBMXe65VhUMabV9btnt5pV2wZp4FC8o=;
  b=gHcVpRceARi6a2jxffwkz/bgIZlkgGUNXSFxOuLe3tZQbY5KMjvL3cT9
   EFxYaxhcbfixkNYSxQZvmZxq+vFyyv6yfKhWYqv96d5ceiH32VheKJzFl
   hC3DbIPEanrJT8v/nhZH2JmMVvanpa1lFUmLfIr9svyLwluzwurAMFpcq
   6S9orXXq6MSC1aYBNJMgVXB6VbqmMBh2s/Bo3vlf9Ws9Ydj+LfQZck737
   djU1V6+yIV8HzIR97nEFkhylIpx8Wut6slJJrRDJaK+HuHcoNDZE9iAWk
   3GWAlrWGbMid9f8nbCHL4E07BpBfCTWxvM3Q6iU/aSuN2S4sNqyB7njzw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="427347987"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="427347987"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 22:17:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="753855119"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="753855119"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Mar 2023 22:17:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phkfD-000KOY-2h;
	Thu, 30 Mar 2023 05:17:31 +0000
Date: Thu, 30 Mar 2023 13:17:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-gs-raviole-5.10-s-v2-beta-3
 1454/9999] drivers/firmware/arm_scmi/voltage.c:159:42: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202303301346.1dQ87CkG-lkp@intel.com>
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
commit: fb2b659b60bd79ee04a042ab6f89eb25481127a8 [1454/9999] UPSTREAM: firmware: arm_scmi: Add voltage domain management protocol support
config: arm-randconfig-s033-20230326 (https://download.01.org/0day-ci/archive/20230330/202303301346.1dQ87CkG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/fb2b659b60bd79ee04a042ab6f89eb25481127a8
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-gs-raviole-5.10-s-v2-beta-3
        git checkout fb2b659b60bd79ee04a042ab6f89eb25481127a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash drivers/firmware/arm_scmi/ fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301346.1dQ87CkG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/voltage.c:159:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] level_index @@     got unsigned int [usertype] desc_index @@
   drivers/firmware/arm_scmi/voltage.c:159:42: sparse:     expected restricted __le32 [usertype] level_index
   drivers/firmware/arm_scmi/voltage.c:159:42: sparse:     got unsigned int [usertype] desc_index

vim +159 drivers/firmware/arm_scmi/voltage.c

   111	
   112	static int scmi_voltage_descriptors_get(const struct scmi_handle *handle,
   113						struct voltage_info *vinfo)
   114	{
   115		int ret, dom;
   116		struct scmi_xfer *td, *tl;
   117		struct device *dev = handle->dev;
   118		struct scmi_msg_resp_domain_attributes *resp_dom;
   119		struct scmi_msg_resp_describe_levels *resp_levels;
   120	
   121		ret = scmi_xfer_get_init(handle, VOLTAGE_DOMAIN_ATTRIBUTES,
   122					 SCMI_PROTOCOL_VOLTAGE, sizeof(__le32),
   123					 sizeof(*resp_dom), &td);
   124		if (ret)
   125			return ret;
   126		resp_dom = td->rx.buf;
   127	
   128		ret = scmi_xfer_get_init(handle, VOLTAGE_DESCRIBE_LEVELS,
   129					 SCMI_PROTOCOL_VOLTAGE, sizeof(__le64), 0, &tl);
   130		if (ret)
   131			goto outd;
   132		resp_levels = tl->rx.buf;
   133	
   134		for (dom = 0; dom < vinfo->num_domains; dom++) {
   135			u32 desc_index = 0;
   136			u16 num_returned = 0, num_remaining = 0;
   137			struct scmi_msg_cmd_describe_levels *cmd;
   138			struct scmi_voltage_info *v;
   139	
   140			/* Retrieve domain attributes at first ... */
   141			put_unaligned_le32(dom, td->tx.buf);
   142			ret = scmi_do_xfer(handle, td);
   143			/* Skip domain on comms error */
   144			if (ret)
   145				continue;
   146	
   147			v = vinfo->domains + dom;
   148			v->id = dom;
   149			v->attributes = le32_to_cpu(resp_dom->attr);
   150			strlcpy(v->name, resp_dom->name, SCMI_MAX_STR_SIZE);
   151	
   152			cmd = tl->tx.buf;
   153			/* ...then retrieve domain levels descriptions */
   154			do {
   155				u32 flags;
   156				int cnt;
   157	
   158				cmd->domain_id = cpu_to_le32(v->id);
 > 159				cmd->level_index = desc_index;
   160				ret = scmi_do_xfer(handle, tl);
   161				if (ret)
   162					break;
   163	
   164				flags = le32_to_cpu(resp_levels->flags);
   165				num_returned = NUM_RETURNED_LEVELS(flags);
   166				num_remaining = NUM_REMAINING_LEVELS(flags);
   167	
   168				/* Allocate space for num_levels if not already done */
   169				if (!v->num_levels) {
   170					ret = scmi_init_voltage_levels(dev, v,
   171								       num_returned,
   172								       num_remaining,
   173						      SUPPORTS_SEGMENTED_LEVELS(flags));
   174					if (ret)
   175						break;
   176				}
   177	
   178				if (desc_index + num_returned > v->num_levels) {
   179					dev_err(handle->dev,
   180						"No. of voltage levels can't exceed %d\n",
   181						v->num_levels);
   182					ret = -EINVAL;
   183					break;
   184				}
   185	
   186				for (cnt = 0; cnt < num_returned; cnt++) {
   187					s32 val;
   188	
   189					val =
   190					    (s32)le32_to_cpu(resp_levels->voltage[cnt]);
   191					v->levels_uv[desc_index + cnt] = val;
   192					if (val < 0)
   193						v->negative_volts_allowed = true;
   194				}
   195	
   196				desc_index += num_returned;
   197	
   198				scmi_reset_rx_to_maxsz(handle, tl);
   199				/* check both to avoid infinite loop due to buggy fw */
   200			} while (num_returned && num_remaining);
   201	
   202			if (ret) {
   203				v->num_levels = 0;
   204				devm_kfree(dev, v->levels_uv);
   205			}
   206	
   207			scmi_reset_rx_to_maxsz(handle, td);
   208		}
   209	
   210		scmi_xfer_put(handle, tl);
   211	outd:
   212		scmi_xfer_put(handle, td);
   213	
   214		return ret;
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
