Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE26257B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 09:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685784930; x=1717320930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r8cWREIo2GmTCf0FWCl+3Smrq8LqBaHOq12itg56p7M=;
  b=J0EkU/B1CwH8ac64q0oaC99e5kTBIR3QnQdzjN4sZEmK53wMKQ573sqt
   QYS7JXkqa27vVv5HuaAEKYOBspIRhBaQIf19HZLuByLCr0ieRk3f/k2tn
   ysL4DA1TS5WH6qW/6pxRLuegXFEMKd/8zI00Y3YbsqfsIE+P+IV/KJnJS
   yjVGbiF51MSVSFtDdzsXWKtV0pdvUMGKhtTU+JcIWIxbIxi0Bfs48ssMS
   zZntOe7bGGGl/5xvFry7oVTVkfqWWhS0pwoQSp3cMC//CG9mAgiwO1E0V
   asVu0IMIIgC7e5kuuIuPKBdbcoWXb+AndbLUnA+ek9UEETrFPbs3jpZBu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="419592603"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="419592603"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 02:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="737814704"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="737814704"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Jun 2023 02:35:28 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5NfU-0001UT-0q;
	Sat, 03 Jun 2023 09:35:28 +0000
Date: Sat, 3 Jun 2023 17:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: [asahilinux:bits/080-wifi 8/25]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:4334:42: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202306031747.3BgNEqoz-lkp@intel.com>
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
config: x86_64-randconfig-s023-20230531 (https://download.01.org/0day-ci/archive/20230603/202306031747.3BgNEqoz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/AsahiLinux/linux/commit/289c1cd14c0f6ab6f2998b3548baa8de9a2be42d
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/080-wifi
        git checkout 289c1cd14c0f6ab6f2998b3548baa8de9a2be42d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/wireless/broadcom/brcm80211/brcmfmac/ kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306031747.3BgNEqoz-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
