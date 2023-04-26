Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23810E9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 04:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682483734; x=1714019734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fV27SnUMJp9+d6TeVxS/JMbbSYQapEGjY34Kn6K4/Q4=;
  b=kBuzHm5giA1bpw3dyLOGXdTdMFFCoIgbN5/aESkjoC0EmUr5VNtYyL+M
   zqabMZmJyCXVLdXqqgraoYHgomry23YcDe6NOMQpZYYNzPnQES/UkpijT
   YOb/yjeSLflxcmdRdrTFpZWcG3MwqugsiapSVGS+dKuAIRBGbaKMW/T5Q
   TcrH+eWWWHsM3gNV0AlvEEIS20REdiI3PR4aoq5wLt/UD7SF3ZKdQrgAU
   NYw/kFB0pXLLiv6fh3BpbFs9IGKgBMhsWKZfoEjPbM8B6mj1dNy4JMLiY
   bmAXFaO+N9XvyQ4ZQ23eT/tlAiWyu3XlWVXeJvR0hjJnHiirxy/bq0IW6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="347015630"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="347015630"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 21:35:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="940045895"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="940045895"
Received: from lkp-server01.sh.intel.com (HELO 98ee5a99fc83) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Apr 2023 21:35:32 -0700
Received: from kbuild by 98ee5a99fc83 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prWsN-00007S-1n;
	Wed, 26 Apr 2023 04:35:31 +0000
Date: Wed, 26 Apr 2023 12:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: [asahilinux:bits/080-wifi 8/25]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:4334:42: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202304261254.uzAec9Wc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   8a96dfb06cc870730ecf78195187daec961f3e2c
commit: 289c1cd14c0f6ab6f2998b3548baa8de9a2be42d [8/25] brcmfmac: cfg80211: Add support for PMKID_V3 operations
config: nios2-randconfig-s031-20230423 (https://download.01.org/0day-ci/archive/20230426/202304261254.uzAec9Wc-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/AsahiLinux/linux/commit/289c1cd14c0f6ab6f2998b3548baa8de9a2be42d
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/080-wifi
        git checkout 289c1cd14c0f6ab6f2998b3548baa8de9a2be42d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/net/wireless/broadcom/brcm80211/brcmfmac/ drivers/video/fbdev/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304261254.uzAec9Wc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:4334:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] time_left @@     got unsigned int @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:4334:42: sparse:     expected restricted __le32 [usertype] time_left
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:4334:42: sparse:     got unsigned int

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
