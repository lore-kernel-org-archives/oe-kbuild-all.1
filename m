Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A6133E8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 11:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:subject:message-id:mime-version;
  bh=K6JzLh72k8stLdzGhkI5Wh9gYsHCdareD4x5xA1hys8=;
  b=bKL3wF2T0uDl7/xFLCizSUFLqmrxVQ6AH8efYtXnKnPEPSvv03VYzLG6
   sLVo8a5BhHZKWBzpLNuteSIsWHfsps0CxXJx1vr8RDDm2zhnhxqK/+JOP
   oS62Oe9mdpWtw5VmexDWvO8Aw4q9mthHCXeNAnZDHwqzlRhQ810K6MmNk
   4=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,236,1673910000"; 
   d="scan'208";a="49321069"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 12:17:00 +0100
Date: Mon, 6 Mar 2023 12:16:59 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Sasha Levin <sashal@kernel.org>, oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 334/429] drivers/phy/rockchip/phy-rockchip-typec.c:827:12-14:
 WARNING: Unsigned expression compared with zero: dp > 0 (fwd)
Message-ID: <d1432f8c-5781-b6aa-434-c29e7354eab1@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Testing a boolean with > 0 seems a little strange.

julia

---------- Forwarded message ----------
Date: Mon, 6 Mar 2023 19:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [sashal-stable:pending-5.15 334/429]
    drivers/phy/rockchip/phy-rockchip-typec.c:827:12-14: WARNING: Unsigned
    expression compared with zero: dp > 0

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   7306e5782e166a6d4168af6b32b5878186a69bd3
commit: 61b92bf5fe263c60494ed0e06e852cd397ed13e9 [334/429] phy: rockchip-typec: fix tcphy_get_mode error case
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arc-randconfig-c034-20230305 (https://download.01.org/0day-ci/archive/20230306/202303061912.eAtjkLUu-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303061912.eAtjkLUu-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/phy/rockchip/phy-rockchip-typec.c:827:12-14: WARNING: Unsigned expression compared with zero: dp > 0
>> drivers/phy/rockchip/phy-rockchip-typec.c:824:5-8: WARNING: Unsigned expression compared with zero: ufp > 0

vim +827 drivers/phy/rockchip/phy-rockchip-typec.c

e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  805
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  806  static int tcphy_get_mode(struct rockchip_typec_phy *tcphy)
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  807  {
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  808  	struct extcon_dev *edev = tcphy->extcon;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  809  	union extcon_property_value property;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  810  	unsigned int id;
5e39c6cf575f053 drivers/phy/rockchip/phy-rockchip-typec.c Shawn Lin              2017-08-03  811  	bool ufp, dp;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  812  	u8 mode;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  813  	int ret;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  814
ec1fcd7b7e6f50d drivers/phy/rockchip/phy-rockchip-typec.c Enric Balletbo i Serra 2018-03-01  815  	if (!edev)
ec1fcd7b7e6f50d drivers/phy/rockchip/phy-rockchip-typec.c Enric Balletbo i Serra 2018-03-01  816  		return MODE_DFP_USB;
ec1fcd7b7e6f50d drivers/phy/rockchip/phy-rockchip-typec.c Enric Balletbo i Serra 2018-03-01  817
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  818  	ufp = extcon_get_state(edev, EXTCON_USB);
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  819  	dp = extcon_get_state(edev, EXTCON_DISP_DP);
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  820
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  821  	mode = MODE_DFP_USB;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  822  	id = EXTCON_USB_HOST;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  823
61b92bf5fe263c6 drivers/phy/rockchip/phy-rockchip-typec.c Neill Kapron           2023-01-26 @824  	if (ufp > 0) {
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  825  		mode = MODE_UFP_USB;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  826  		id = EXTCON_USB;
61b92bf5fe263c6 drivers/phy/rockchip/phy-rockchip-typec.c Neill Kapron           2023-01-26 @827  	} else if (dp > 0) {
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  828  		mode = MODE_DFP_DP;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  829  		id = EXTCON_DISP_DP;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  830
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  831  		ret = extcon_get_property(edev, id, EXTCON_PROP_USB_SS,
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  832  					  &property);
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  833  		if (ret) {
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  834  			dev_err(tcphy->dev, "get superspeed property failed\n");
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  835  			return ret;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  836  		}
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  837
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  838  		if (property.intval)
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  839  			mode |= MODE_DFP_USB;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  840  	}
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  841
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  842  	ret = extcon_get_property(edev, id, EXTCON_PROP_USB_TYPEC_POLARITY,
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  843  				  &property);
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  844  	if (ret) {
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  845  		dev_err(tcphy->dev, "get polarity property failed\n");
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  846  		return ret;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  847  	}
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  848
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  849  	tcphy->flip = property.intval ? 1 : 0;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  850
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  851  	return mode;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  852  }
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  853

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
