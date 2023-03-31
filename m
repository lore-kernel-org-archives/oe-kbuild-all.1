Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2771FB1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 07:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680248979; x=1711784979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F+LTW+lF4Yqlq0a/G6cQe2ofsUzIGGjbkd6VHS9N6a4=;
  b=LBCUbkzolgLDL0Tp75dPAuLMEnZkjlHPWHdoUfqwZFZ0TDWlJwMbT/4U
   CxzBfJXc7zFztbcNwH0pqUKwqRWeElamAHw3frAEB8foOd6r/BfUQeXN2
   OvYFHAI/vv0v4pLggGwAjLrGLiKXjq5KhkqbEYrkW/EznXKVv3u0u+Jcr
   8ja1GhsyRAf9piU2PvqjHVYGph+zAsxVCFiF0BonjmA6CkbuqeIwXZQPA
   EobDnloaSPff9Fwj6knW7a0jG2eDFDS1Ncivo0K0MW6UoVCSCB6U23Hb7
   Kk+CVlZqm0u2tYGMYxzdm34jjM2OVMmo+FjukKE7Uw+JKfhOVNlvA3YJF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="338888875"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="338888875"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 00:49:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="931044120"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="931044120"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 Mar 2023 00:49:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi9Vo-000Las-01;
	Fri, 31 Mar 2023 07:49:28 +0000
Date: Fri, 31 Mar 2023 15:48:33 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: [asahilinux:bits/080-wifi 8/24]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:4334:42: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202303311530.W5vkqYjg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   0b3246356951e9fc86070cbddedbef60a8fc3566
commit: ad6851f68007f8f12ed5d11c0e05450a7f380d76 [8/24] brcmfmac: cfg80211: Add support for PMKID_V3 operations
config: nios2-randconfig-s052-20230329 (https://download.01.org/0day-ci/archive/20230331/202303311530.W5vkqYjg-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/AsahiLinux/linux/commit/ad6851f68007f8f12ed5d11c0e05450a7f380d76
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/080-wifi
        git checkout ad6851f68007f8f12ed5d11c0e05450a7f380d76
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/net/wireless/broadcom/brcm80211/brcmfmac/ drivers/net/wireless/broadcom/brcm80211/brcmsmac/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303311530.W5vkqYjg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:4334:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] time_left @@     got unsigned int @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:4334:42: sparse:     expected restricted __le32 [usertype] time_left
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:4334:42: sparse:     got unsigned int
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c: note: in included file (through include/uapi/linux/swab.h, include/linux/swab.h, include/uapi/linux/byteorder/little_endian.h, ...):
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini

vim +4334 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

  4312	
  4313	static s32
  4314	brcmf_pmksa_v3_op(struct brcmf_if *ifp, struct cfg80211_pmksa *pmksa,
  4315			  bool alive)
  4316	{
  4317		struct brcmf_pmk_op_v3_le *pmk_op;
  4318		int length = offsetof(struct brcmf_pmk_op_v3_le, pmk);
  4319		int ret;
  4320	
  4321		pmk_op = kzalloc(sizeof(*pmk_op), GFP_KERNEL);
  4322		pmk_op->version = cpu_to_le16(BRCMF_PMKSA_VER_3);
  4323	
  4324		if (!pmksa) {
  4325			/* Flush operation, operate on entire list */
  4326			pmk_op->count = cpu_to_le16(0);
  4327		} else {
  4328			/* Single PMK operation */
  4329			pmk_op->count = cpu_to_le16(1);
  4330			length += sizeof(struct brcmf_pmksa_v3);
  4331			memcpy(pmk_op->pmk[0].bssid, pmksa->bssid, ETH_ALEN);
  4332			memcpy(pmk_op->pmk[0].pmkid, pmksa->pmkid, WLAN_PMKID_LEN);
  4333			pmk_op->pmk[0].pmkid_len = WLAN_PMKID_LEN;
> 4334			pmk_op->pmk[0].time_left = alive ? BRCMF_PMKSA_NO_EXPIRY : 0;
  4335		}
  4336	
  4337		pmk_op->length = cpu_to_le16(length);
  4338	
  4339		ret = brcmf_fil_iovar_data_set(ifp, "pmkid_info", pmk_op, sizeof(*pmk_op));
  4340		kfree(pmk_op);
  4341		return ret;
  4342	}
  4343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
