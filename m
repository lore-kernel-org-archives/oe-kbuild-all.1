Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1D1659
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 06:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677480268; x=1709016268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lA0blEtCpRMX2P0c6WfHOipLg7bVEKm5+EAo/NneQdY=;
  b=UV2fg5AWSXZ0lIzKQY4Cl8DIeSW36XspzFGrThbzklyBH8hfVlTkSzgA
   X6HmGNh2hOsiKJY/CBTO0/OrNnryZTNdGU+pnWRswHTXwq2r3B+4InEkl
   F571fIh4MLwHJfgKgFo6pkZHgq2arNNWaCSDNLpsG2mCGJXGvSc2QKjhv
   Jy3efWDgTvsTE4t9OgVGmxjbtd34pGURJwPz3TWzkdeCuRqsMnpOmyOzN
   2hp3W2tWU3vP1Zd291LR5SAE+TsdA/1gCZCkSVADe8LrguMXOTRI5+jQ5
   iD1tkVo1yLobSLLN8Abq0aXdkp0Q0iYIwqJt3olL2AkNZH4ZpMKRIazey
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="361347249"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="361347249"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 22:44:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="675698537"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="675698537"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 Feb 2023 22:44:27 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWXFK-0004A5-0d;
	Mon, 27 Feb 2023 06:44:26 +0000
Date: Mon, 27 Feb 2023 14:43:44 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: [asahilinux:bits/080-wifi 12/27]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:4334:42: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202302271450.OARJpCP7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   5513aa831fb7960fd6a3f9f360ae6fa7e73bc01d
commit: f8976c7976e2a1ecd16b0533b4c4387a7f18dbf3 [12/27] brcmfmac: cfg80211: Add support for PMKID_V3 operations
config: loongarch-randconfig-s031-20230226 (https://download.01.org/0day-ci/archive/20230227/202302271450.OARJpCP7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/AsahiLinux/linux/commit/f8976c7976e2a1ecd16b0533b4c4387a7f18dbf3
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/080-wifi
        git checkout f8976c7976e2a1ecd16b0533b4c4387a7f18dbf3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/net/wireless/broadcom/brcm80211/brcmfmac/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302271450.OARJpCP7-lkp@intel.com/

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
