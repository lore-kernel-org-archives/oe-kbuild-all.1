Received: from out198-24.us.a.mail.aliyun.com (out198-24.us.a.mail.aliyun.com [47.90.198.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD20A84FDA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 09:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717578213; cv=none; b=joAO28d0buTYYnuzW+jLeW76eO5bFy6Qr0Qr6QeAi/ZQFBrltFpssZIiXNNb+HqIHIvOuV9mMkNN/vB756wHPmLN1EFc8IYhUhix3uZR2qoPIj24je6/erhOj+uVIRiA/iHk6y64mwbuwsGrXIezPRHiT60waSDgi206Hh3JEMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717578213; c=relaxed/simple;
	bh=Kj3tX6uEDwnbU/51J0VQi0cd4wMUL+p1hliyjtEreYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E/udZ55KxygClE1ovcLGG42g/PnpFE09ref6MhcEEWNBVoaCX3IjbWZn9e0V6piYZ7OgYjVpDkorbXMbTK7ObQT6NFrO53bgHnDMeD86iay6zVxVgrGnJMhT+8bPYLVyLjPmq0xDqT92nGfAuBYxsCw+SttIIsN2a0KfKoNFSEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=47.90.198.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07797806|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.15769-0.000165544-0.842145;FP=0|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037088118;MF=wangshuaijie@awinic.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.XwcjJ2U_1717578183;
Received: from awinic..(mailfrom:wangshuaijie@awinic.com fp:SMTPD_---.XwcjJ2U_1717578183)
          by smtp.aliyun-inc.com;
          Wed, 05 Jun 2024 17:03:13 +0800
From: wangshuaijie@awinic.com
To: lkp@intel.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	jeff@labundy.com,
	kangjiajun@awinic.com,
	krzk+dt@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	oe-kbuild-all@lists.linux.dev,
	robh@kernel.org,
	wangshuaijie@awinic.com
Subject: Re: [PATCH V1 5/5] Add support for Awinic sar sensor.
Date: Wed,  5 Jun 2024 09:03:03 +0000
Message-ID: <20240605090303.157545-1-wangshuaijie@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <202405301244.1ZqAu1Pf-lkp@intel.com>
References: <202405301244.1ZqAu1Pf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 30 May 2024 12:27:32 +0800, lkp@intel.com wrote:
>Hi,
>
>kernel test robot noticed the following build warnings:
>
>[auto build test WARNING on e0cce98fe279b64f4a7d81b7f5c3a23d80b92fbc]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/wangshuaijie-awinic-com/dt-bindings-input-Add-YAML-to-Awinic-sar-sensor/20240529-211303
>base:   e0cce98fe279b64f4a7d81b7f5c3a23d80b92fbc
>patch link:    https://lore.kernel.org/r/20240529130608.783624-6-wangshuaijie%40awinic.com
>patch subject: [PATCH V1 5/5] Add support for Awinic sar sensor.
>config: xtensa-randconfig-r064-20240530 (https://download.01.org/0day-ci/archive/20240530/202405301244.1ZqAu1Pf-lkp@intel.com/config)
>compiler: xtensa-linux-gcc (GCC) 13.2.0
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301244.1ZqAu1Pf-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202405301244.1ZqAu1Pf-lkp@intel.com/
>
>All warnings (new ones prefixed by >>):
>
>>> drivers/input/misc/aw_sar/aw_sar.c:1992:34: warning: 'aw_sar_dt_match' defined but not used [-Wunused-const-variable=]
>    1992 | static const struct of_device_id aw_sar_dt_match[] = {
>         |                                  ^~~~~~~~~~~~~~~
>
>
>vim +/aw_sar_dt_match +1992 drivers/input/misc/aw_sar/aw_sar.c
>
>  1991	
>> 1992	static const struct of_device_id aw_sar_dt_match[] = {
>  1993		{ .compatible = "awinic,aw96103" },
>  1994		{ .compatible = "awinic,aw96105" },
>  1995		{ .compatible = "awinic,aw96303" },
>  1996		{ .compatible = "awinic,aw96305" },
>  1997		{ .compatible = "awinic,aw96308" },
>  1998	};
>  1999	
>

The patch for version v2 will fix this issue.

>-- 
>0-DAY CI Kernel Test Service

--
Thanks,

Wang Shuaijie
