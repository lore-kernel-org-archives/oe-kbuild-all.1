Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488678F47
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 09:50:26 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 5E84E100004;
	Mon, 11 Sep 2023 12:40:47 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 5E84E100004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1694425247;
	bh=kg4nQ90g1gglh5dPxSRwQgWcpxn+rzzAfGHtlkSqtOg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=swTA4RB7YA0h8p4mPMx5H+1sjgG73myiiSTYSjNJgVQQtaD0uqScCx19GS4V5XBFm
	 o2xDyk2Ez2u5lhEZAU2DYngZIUju0+qshpzHAzHuXPAb1g52HJMgArhpMY/vk/s83b
	 U9fof1YFdcNSAVwd/v3PoSJ+OoiTI3IKJuJ//SqCLQxCiELw+eSnKXxgWPnwJzi7ex
	 NdD/q9DijIJv59nUwPHS4+ub/qs61OkHiC1IC9358gdyXi8o8Yj/5oeTT9aYVyfSO0
	 7EZMPaSFx5sVFF71fFa7wPYOtUEVMPBvfnqRS5nO4AvNS74+FIchCVf+3dtw61KR5t
	 F3xcoCdjZsjEQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 11 Sep 2023 12:40:47 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 11 Sep
 2023 12:40:46 +0300
Date: Mon, 11 Sep 2023 12:40:46 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: kernel test robot <lkp@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>
CC: George Stark <GNStark@sberdevices.ru>, <oe-kbuild-all@lists.linux.dev>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>
Subject: Re: [amlogic:v6.7/arm64-dt 28/35] Error:
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi:228.21-22 syntax error
Message-ID: <20230911094046.bhv5pj4pglfdi3k3@CAB-WSD-L081021>
References: <202309090349.edkQ35JZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202309090349.edkQ35JZ-lkp@intel.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179765 [Sep 11 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 530 530 ecb1547b3f72d1df4c71c0b60e67ba6b4aea5432, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;git.kernel.org:7.1.1;sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;github.com:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;download.01.org:7.1.1;100.64.160.123:7.1.2, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/09/11 07:49:00
X-KSMG-LinksScanning: Clean, bases: 2023/09/11 07:49:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/09/11 06:02:00 #21866861
X-KSMG-AntiVirus-Status: Clean, skipped

Hello Neil,

On Sat, Sep 09, 2023 at 03:09:43AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git v6.7/arm64-dt
> head:   1e728f46085667071fdf0f2d6f68c51c844d46c2
> commit: 2aee4cd48c56062c37ade35f1bc3c0b5b8db14c8 [28/35] arm64: dts: meson: a1: add saradc definition
> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230909/202309090349.edkQ35JZ-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090349.edkQ35JZ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309090349.edkQ35JZ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> Error: arch/arm64/boot/dts/amlogic/meson-a1.dtsi:228.21-22 syntax error
> >> FATAL ERROR: Unable to parse input tree
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

The above problem is caused by the absence of the following patch
series, in which you merge all clock headers into the public part:

https://lore.kernel.org/all/20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org/

The clock binding for SARADC_SEL was originally located in the private
part, but in your patch series, you are moving it to the public part. We
have already merged your patch series into our branch, and it is working
fine on our side.

So, do you plan to incorporate these changes for version 6.7, or should
I send a spot fix that moves SARADC_SEL from the private header to the
public one?"

-- 
Thank you,
Dmitry
