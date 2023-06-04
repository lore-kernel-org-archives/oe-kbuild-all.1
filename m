Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5615623C6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 13:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685884120; x=1717420120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vgjHGCedQ8gY+cpBGENz5B+0tUkuYgHxDdhYxQ6pNps=;
  b=NL29h7xshEj8T7hDc4Upn/4Ph5qp28UHgBnwlUuVcCxFkN9DRxdxZRua
   1J1gqtlDOWhZe7IZh/CXRVpvoP/94S8g5nZTlvz2+VgcUVDKD8qNcZZZ5
   Oz0xzaGcMKYVCj2smhEoBfRQPuzDP/u+XtnetucROvhQ3Gd1NP0s/goNn
   XP3+5plU6bejCF/UhGfg0v8BIpKoPoKJFhiD3cUw7TAjvHcemOIIOJhL7
   P5T0NGnrWey3ssbUlM+f2tVK6IKChVvChoDGS9v2uo/j0mqx/Ks5R5xOd
   fu5zOtZlxFqbN3U2ZItMzugA1AXqjtFhRGzY800BU3DFbPkDfXCT0gvMR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="353674947"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="353674947"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 06:08:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="738085480"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="738085480"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Jun 2023 06:08:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5nTJ-0002iV-1J;
	Sun, 04 Jun 2023 13:08:37 +0000
Date: Sun, 4 Jun 2023 21:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 54/55] drivers/soundwire/qcom.c:600 qcom_swrm_enumerate() warn: inconsistent
 indenting
Message-ID: <202306042016.fpNpKaiK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
head:   297b910637065761660eaae156585c0319676c58
commit: a7933a07f03a8ea2ada01bc3cb9919454b51f2b4 [54/55] DENUG: soundwire devices
config: x86_64-randconfig-m001-20230604 (https://download.01.org/0day-ci/archive/20230604/202306042016.fpNpKaiK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306042016.fpNpKaiK-lkp@intel.com/

smatch warnings:
drivers/soundwire/qcom.c:600 qcom_swrm_enumerate() warn: inconsistent indenting

vim +600 drivers/soundwire/qcom.c

   587	
   588	static int qcom_swrm_enumerate(struct sdw_bus *bus)
   589	{
   590		struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
   591		struct sdw_slave *slave, *_s;
   592		struct sdw_slave_id id;
   593		u32 val1, val2;
   594		bool found;
   595		u64 addr;
   596		int i;
   597		char *buf1 = (char *)&val1, *buf2 = (char *)&val2;
   598	
   599			/*SCP_Devid5 - Devid 4*/
 > 600			ctrl->reg_read(ctrl, SWRM_ENUMERATOR_SLAVE_DEV_ID_1(0), &val1);
   601	
   602			/*SCP_Devid3 - DevId 2 Devid 1 Devid 0*/
   603			ctrl->reg_read(ctrl, SWRM_ENUMERATOR_SLAVE_DEV_ID_2(0), &val2);
   604	
   605			dev_err(ctrl->dev, "DEV_ID_1[%d]= 0x%x\n", 0, val1);
   606			dev_err(ctrl->dev, "DEV_ID_2[%d]= 0x%x\n", 0, val2);
   607	
   608	
   609		for (i = 1; i <= SDW_MAX_DEVICES; i++) {
   610			/* do not continue if the status is Not Present  */
   611			if (!ctrl->status[i])
   612				continue;
   613	
   614			/*SCP_Devid5 - Devid 4*/
   615			ctrl->reg_read(ctrl, SWRM_ENUMERATOR_SLAVE_DEV_ID_1(i), &val1);
   616	
   617			/*SCP_Devid3 - DevId 2 Devid 1 Devid 0*/
   618			ctrl->reg_read(ctrl, SWRM_ENUMERATOR_SLAVE_DEV_ID_2(i), &val2);
   619	
   620			dev_err(ctrl->dev, "DEV_ID_1[%d]= 0x%x\n", i, val1);
   621			dev_err(ctrl->dev, "DEV_ID_2[%d]= 0x%x\n", i, val2);
   622	
   623			if (!val1 && !val2)
   624				break;
   625	
   626			addr = buf2[1] | (buf2[0] << 8) | (buf1[3] << 16) |
   627				((u64)buf1[2] << 24) | ((u64)buf1[1] << 32) |
   628				((u64)buf1[0] << 40);
   629			dev_err(ctrl->dev, "addr[%d]= 0x%llx\n", i, addr);
   630	
   631			sdw_extract_slave_id(bus, addr, &id);
   632			found = false;
   633			ctrl->clock_stop_not_supported = false;
   634			/* Now compare with entries */
   635			list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
   636				if (sdw_compare_devid(slave, id) == 0) {
   637					qcom_swrm_set_slave_dev_num(bus, slave, i);
   638					if (!slave->prop.simple_clk_stop_capable)
   639						ctrl->clock_stop_not_supported = true;
   640	
   641					found = true;
   642					break;
   643				}
   644			}
   645	
   646			if (!found) {
   647				qcom_swrm_set_slave_dev_num(bus, NULL, i);
   648				sdw_slave_add(bus, &id, NULL);
   649			}
   650		}
   651	
   652		complete(&ctrl->enumeration);
   653		return 0;
   654	}
   655	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
