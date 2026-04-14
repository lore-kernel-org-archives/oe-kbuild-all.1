Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845B23E5EF4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 12:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776168547; cv=none; b=hrFvw5WNm5IXfzymqfnhNKL7Fl0HUv6ytzLdkdLJJKvGf8wRBrktTPbZhN0qzF7RjZ7R0sVtc78H+tkb/FO0Zd9zo3fDXycnLrxPm+advZrz74TBkoPygWLcqiduohF1tHl44BF31iYkZQ9GFZdTI4LlYpZvdxaXW4IdAbjudns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776168547; c=relaxed/simple;
	bh=WI+UEVOqD6uyrnKVoLIVC6ncL+ShtJx5SqTyYc2JLyQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g88xd2Av/qVmq0E5JJqumFLFil+cPcs8wohkVRFVRVc6BrxjFj22tLjA1pd5+NR9ive8szDTHetOaBTVf3H+L68la+M7bYmkOUNI231jLwwJEM3CjKf1McsDnJK6Wj7GDLZcIVSL58Mb1vWaMldIWl2DeL1TWBYoYh6E7heVAUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kpPTIdRZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kpPTIdRZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776168546; x=1807704546;
  h=date:from:to:cc:subject:message-id;
  bh=WI+UEVOqD6uyrnKVoLIVC6ncL+ShtJx5SqTyYc2JLyQ=;
  b=kpPTIdRZAEBcTy44CBwK46EqH3tqIKJ11wGG5R1ci13siUpIGgQT+Yef
   CMUz4EkwVyVBhXg7SE3dOmS2SCTiC2jT5AMiIvFrrd1zD7HcMkjEPMsJc
   7yzSWRYo4JnREWMQjd/vPRJWhYoiE//sz+AXfEIjrIpGkc9GEuHEjXF8/
   1u8eR5GOuWBrOJkq5pZC3qGvIlhXvY92zd9pwa1rrTzU2zKJDYJXZwONs
   b+Ox3xagDH78c2BgqoSFX0HLhBBjk4U+8slTRGxmtDiBAnoDL7oU/kyQJ
   R7e0T7e225fD9y7xhEF3yTwvfnsxa7YbaLDTasze1QkMc5ikHuOOuvRaK
   w==;
X-CSE-ConnectionGUID: 5GmUbS2aS1aOYwDIzpKLQg==
X-CSE-MsgGUID: oF17JhO8Tn6c4D7YIu4Z5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77194611"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77194611"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:09:03 -0700
X-CSE-ConnectionGUID: fPyzB3KWSg+wU14IR9Y11A==
X-CSE-MsgGUID: DpjxCjdTQIKaeXsFh5bbdQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 14 Apr 2026 05:09:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCcZf-000000000P3-0XQG;
	Tue, 14 Apr 2026 12:08:59 +0000
Date: Tue, 14 Apr 2026 14:08:17 +0200
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thermal:thermal/cooling-device-with-id 24/25]
 include/linux/thermal.h:245: multiple definition of
 `devm_thermal_of_cooling_device_register';
 drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245:
 first defined here
Message-ID: <202604141419.a4vuNBN7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/cooling-device-with-id
head:   4fea531ae8a1095b1fc1122441fc173a33b93005
commit: 1da9dad287e0abae276c2f8cacd7ad105b78293b [24/25] thermal/of: Pass the of_index and add a function to register with an index
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260414/202604141419.a4vuNBN7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604141419.a4vuNBN7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604141419.a4vuNBN7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/acpi/processor.h:11,
                    from drivers/idle/intel_idle.c:1720:
>> include/linux/thermal.h:242:1: warning: no previous prototype for 'devm_thermal_of_cooling_device_register' [-Wmissing-prototypes]
     242 | devm_thermal_of_cooling_device_register(struct device *dev, int of_index,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/chelsio/cxgb4/cxgb4.h:56,
                    from drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:72:
>> include/linux/thermal.h:242:1: warning: no previous prototype for 'devm_thermal_of_cooling_device_register' [-Wmissing-prototypes]
     242 | devm_thermal_of_cooling_device_register(struct device *dev, int of_index,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c: In function 'setup_sge_queues':
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:1074:48: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 8 and 23 [-Wformat-truncation=]
    1074 |                                          "%s-Rx%d", dev->name, j);
         |                                                ^~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:1074:42: note: directive argument in the range [-2147483641, 254]
    1074 |                                          "%s-Rx%d", dev->name, j);
         |                                          ^~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:1072:33: note: 'snprintf' output between 5 and 30 bytes into a destination of size 26
    1072 |                                 snprintf(adap->msix_info[msix].desc,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1073 |                                          sizeof(adap->msix_info[msix].desc),
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1074 |                                          "%s-Rx%d", dev->name, j);
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c: In function 'cxgb4_port_mirror_alloc_queues':
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:1356:47: warning: '%d' directive output may be truncated writing between 1 and 5 bytes into a region of size between 1 and 16 [-Wformat-truncation=]
    1356 |                                  "%s-mirrorrxq%d", dev->name, i);
         |                                               ^~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:1356:34: note: directive argument in the range [0, 65534]
    1356 |                                  "%s-mirrorrxq%d", dev->name, i);
         |                                  ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:1354:25: note: 'snprintf' output between 12 and 31 bytes into a destination of size 26
    1354 |                         snprintf(mirror_rxq->msix->desc,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1355 |                                  sizeof(mirror_rxq->msix->desc),
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1356 |                                  "%s-mirrorrxq%d", dev->name, i);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/chelsio/cxgb4/cxgb4.h:56,
                    from drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c:9:
>> include/linux/thermal.h:242:1: warning: no previous prototype for 'devm_thermal_of_cooling_device_register' [-Wmissing-prototypes]
     242 | devm_thermal_of_cooling_device_register(struct device *dev, int of_index,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c: In function 'get_drvinfo':
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c:209:52: warning: '%u' directive output may be truncated writing between 1 and 3 bytes into a region of size between 0 and 14 [-Wformat-truncation=]
     209 |                          "%u.%u.%u.%u, TP %u.%u.%u.%u",
         |                                                    ^~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c:209:26: note: directive argument in the range [0, 255]
     209 |                          "%u.%u.%u.%u, TP %u.%u.%u.%u",
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c:208:17: note: 'snprintf' output between 20 and 36 bytes into a destination of size 32
     208 |                 snprintf(info->fw_version, sizeof(info->fw_version),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     209 |                          "%u.%u.%u.%u, TP %u.%u.%u.%u",
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     210 |                          FW_HDR_FW_VER_MAJOR_G(adapter->params.fw_vers),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     211 |                          FW_HDR_FW_VER_MINOR_G(adapter->params.fw_vers),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     212 |                          FW_HDR_FW_VER_MICRO_G(adapter->params.fw_vers),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     213 |                          FW_HDR_FW_VER_BUILD_G(adapter->params.fw_vers),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     214 |                          FW_HDR_FW_VER_MAJOR_G(adapter->params.tp_vers),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     215 |                          FW_HDR_FW_VER_MINOR_G(adapter->params.tp_vers),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     216 |                          FW_HDR_FW_VER_MICRO_G(adapter->params.tp_vers),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     217 |                          FW_HDR_FW_VER_BUILD_G(adapter->params.tp_vers));
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/chelsio/cxgb4/cxgb4.h:56,
                    from drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c:48:
>> include/linux/thermal.h:242:1: warning: no previous prototype for 'devm_thermal_of_cooling_device_register' [-Wmissing-prototypes]
     242 | devm_thermal_of_cooling_device_register(struct device *dev, int of_index,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c: In function 'alloc_uld_rxqs':
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c:141:38: warning: '%s' directive output may be truncated writing up to 15 bytes into a region of size between 10 and 25 [-Wformat-truncation=]
     141 |                                  "%s-%s%d",
         |                                      ^~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c:141:34: note: directive argument in the range [0, 131069]
     141 |                                  "%s-%s%d",
         |                                  ^~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c:139:25: note: 'snprintf' output between 3 and 38 bytes into a destination of size 26
     139 |                         snprintf(adap->msix_info[msi_idx].desc,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     140 |                                  sizeof(adap->msix_info[msi_idx].desc),
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     141 |                                  "%s-%s%d",
         |                                  ~~~~~~~~~~
     142 |                                  adap->port[0]->name, rxq_info->name, i);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   ld: drivers/net/wireless/intel/iwlwifi/mvm/mac80211.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/nvm.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/ops.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/phy-ctxt.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/utils.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/rx.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/rxmq.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/tx.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/binding.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/quota.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/sta.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/sf.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/scan.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/time-event.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/rs.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/rs-fw.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/power.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/coex.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/tt.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/offloading.o: in function `devm_thermal_of_cooling_device_register':
   include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/tdls.o: in function `devm_thermal_of_cooling_device_register':
   include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/ftm-responder.o: in function `devm_thermal_of_cooling_device_register':
   include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.o: in function `devm_thermal_of_cooling_device_register':
   include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/rfi.o: in function `devm_thermal_of_cooling_device_register':
   include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/mld-key.o: in function `devm_thermal_of_cooling_device_register':
   include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/mld-mac.o: in function `devm_thermal_of_cooling_device_register':
   include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/link.o: in function `devm_thermal_of_cooling_device_register':
   include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.o: in function `devm_thermal_of_cooling_device_register':
   include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.o: in function `devm_thermal_of_cooling_device_register':
   include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/ptp.o: in function `devm_thermal_of_cooling_device_register':
   include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/time-sync.o: in function `devm_thermal_of_cooling_device_register':
   include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/led.o: in function `devm_thermal_of_cooling_device_register':
   include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/wireless/intel/iwlwifi/mvm/d3.o: in function `devm_thermal_of_cooling_device_register':
   include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/wireless/intel/iwlwifi/mvm/fw.o:include/linux/thermal.h:245: first defined here


vim +245 include/linux/thermal.h

1da9dad287e0ab Daniel Lezcano 2026-04-09  240  
1da9dad287e0ab Daniel Lezcano 2026-04-09  241  struct thermal_cooling_device *
1da9dad287e0ab Daniel Lezcano 2026-04-09 @242  devm_thermal_of_cooling_device_register(struct device *dev, int of_index,
1da9dad287e0ab Daniel Lezcano 2026-04-09  243  					const char *type, void *devdata,
1da9dad287e0ab Daniel Lezcano 2026-04-09  244  					const struct thermal_cooling_device_ops *ops)
7a2cdcd2cf3066 Daniel Lezcano 2026-04-08 @245  {
7a2cdcd2cf3066 Daniel Lezcano 2026-04-08  246  	return ERR_PTR(-ENODEV);
7a2cdcd2cf3066 Daniel Lezcano 2026-04-08  247  }
7a2cdcd2cf3066 Daniel Lezcano 2026-04-08  248  

:::::: The code at line 245 was first introduced by commit
:::::: 7a2cdcd2cf30669aa2c538071edc8c5d27a29895 thermal/core: Move OF functions def in the CONFIG_OF section in thermal.h

:::::: TO: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
:::::: CC: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
