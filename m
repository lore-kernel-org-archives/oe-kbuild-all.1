Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBEC17E1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 06:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mtaqxfnt"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53e3b8f906fso2815293a12.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 02 Nov 2023 23:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698991297; x=1699596097; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ukb8C5mDZsObaz53quLRVItiO2EF/GZE516uqejG/ko=;
        b=Mtaqxfnt/+aeEFXqOVpBIUotSFRRhXv3wOM+7+IguiOTYsPcXF50pzV22NZ/c5YlUU
         8S0bbqQ5drvNjzt4DgkqYj/9NUHTajw9evCYrhyQbn4iM7lO5WkIdQ8tsmAWXwwGTBnk
         lwRHif6tf6RP1sINOKw/H8MSkqbOsPzTKTD44yAKOhDT8m+WOhSc9g8K+lBWCpvu1fa1
         9P0VzTxkDTUCYaIMrY2gu88tmKip4NxdiDayp+94QurPuDHcAyLWuceimelqBkW449O4
         QTavA2GuwZIzT48P54PasgXu4cAOnlOmrmLCIbNjiIwr6QM8ibZa/2Ntjlt0LVi5t48/
         t8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698991297; x=1699596097;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ukb8C5mDZsObaz53quLRVItiO2EF/GZE516uqejG/ko=;
        b=koEr7U4R9nYj/ReQ4qzz/lPxptVyFBVt7CRG0O+SGELg20Dt2mCo+q12fl+3Sd5jcC
         5cIS56YB1RjzpZayd5jUn3INvMthQk9Z058y3i6P9kBBlAl0P1PooOvaPMg77aFREjos
         0RzrnPNx8ryjktGF7fs1BlvSb0aG68/7VUjc4iEXQ4erc8F5708kqxshDs063v6YTM4s
         OpkkoAX4TgyjXNPn8t2aGGbWLD2q/7Y/AbDgWtboXUWpUgKh6Y+mEapKeVevDOLjhQIW
         dTRmdSYYMzV2Uv8QkolPr76WKww4OxUrFT7yD9+RbLxs5jUp8r9oogiuVyh2zog0Nw8Y
         5xiQ==
X-Gm-Message-State: AOJu0Yzu9W1VJ4WUEgwfaANJJtFkc4uaX04Z9sVZa5FV5JSkMXYDimqn
	VrdQomRWKuG2KipNzvJS8VJZ2g==
X-Google-Smtp-Source: AGHT+IG/ottftTOCLDvRabQSmO51TPU5plBCAZTFoa9mzIMz0bWPwX8u081urBBrSA0HCRk5BA8v3g==
X-Received: by 2002:aa7:c90f:0:b0:53e:34c5:fc14 with SMTP id b15-20020aa7c90f000000b0053e34c5fc14mr16474627edt.23.1698991297468;
        Thu, 02 Nov 2023 23:01:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i14-20020aa7c9ce000000b0053fa13e27dcsm563137edt.48.2023.11.02.23.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 23:01:37 -0700 (PDT)
Date: Fri, 3 Nov 2023 09:01:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/thunderbolt/tmu.c:617 tb_switch_tmu_change_mode() warn:
 missing unwind goto?
Message-ID: <9a426df0-2ad2-48e7-aa6a-21e5c40ec839@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mika,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4652b8e4f3ffa48c706ec334f048c217a7d9750d
commit: c437dcb18310f296eb9db58a361f309f7817014d thunderbolt: Fix a couple of style issues in TMU code
config: i386-randconfig-141-20231102 (https://download.01.org/0day-ci/archive/20231103/202311030814.AXtCk7PO-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311030814.AXtCk7PO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202311030814.AXtCk7PO-lkp@intel.com/

smatch warnings:
drivers/thunderbolt/tmu.c:617 tb_switch_tmu_change_mode() warn: missing unwind goto?

vim +617 drivers/thunderbolt/tmu.c

c437dcb18310f2 Mika Westerberg 2022-10-07  596  static int tb_switch_tmu_change_mode(struct tb_switch *sw)
b017a46d486cd4 Gil Fine        2022-05-26  597  {
b017a46d486cd4 Gil Fine        2022-05-26  598  	struct tb_port *up, *down;
b017a46d486cd4 Gil Fine        2022-05-26  599  	int ret;
b017a46d486cd4 Gil Fine        2022-05-26  600  
b017a46d486cd4 Gil Fine        2022-05-26  601  	up = tb_upstream_port(sw);
7ce542219b6323 Gil Fine        2022-09-23  602  	down = tb_switch_downstream_port(sw);
b017a46d486cd4 Gil Fine        2022-05-26  603  	ret = tb_port_tmu_set_unidirectional(down, sw->tmu.unidirectional_request);
b017a46d486cd4 Gil Fine        2022-05-26  604  	if (ret)
b017a46d486cd4 Gil Fine        2022-05-26  605  		goto out;
b017a46d486cd4 Gil Fine        2022-05-26  606  
b017a46d486cd4 Gil Fine        2022-05-26  607  	if (sw->tmu.unidirectional_request)
7ce542219b6323 Gil Fine        2022-09-23  608  		ret = tb_switch_tmu_rate_write(tb_switch_parent(sw),
7ce542219b6323 Gil Fine        2022-09-23  609  					       sw->tmu.rate_request);
b017a46d486cd4 Gil Fine        2022-05-26  610  	else
b017a46d486cd4 Gil Fine        2022-05-26  611  		ret = tb_switch_tmu_rate_write(sw, sw->tmu.rate_request);
b017a46d486cd4 Gil Fine        2022-05-26  612  	if (ret)
b017a46d486cd4 Gil Fine        2022-05-26  613  		return ret;

These error paths should be goto out;

b017a46d486cd4 Gil Fine        2022-05-26  614  
b017a46d486cd4 Gil Fine        2022-05-26  615  	ret = tb_switch_set_tmu_mode_params(sw, sw->tmu.rate_request);
b017a46d486cd4 Gil Fine        2022-05-26  616  	if (ret)
b017a46d486cd4 Gil Fine        2022-05-26 @617  		return ret;

Same.  (I guess before goto out was a do-nothing goto so it didn't
matter).

b017a46d486cd4 Gil Fine        2022-05-26  618  
b017a46d486cd4 Gil Fine        2022-05-26  619  	ret = tb_port_tmu_set_unidirectional(up, sw->tmu.unidirectional_request);
b017a46d486cd4 Gil Fine        2022-05-26  620  	if (ret)
b017a46d486cd4 Gil Fine        2022-05-26  621  		goto out;
b017a46d486cd4 Gil Fine        2022-05-26  622  
b017a46d486cd4 Gil Fine        2022-05-26  623  	ret = tb_port_tmu_time_sync_enable(down);
b017a46d486cd4 Gil Fine        2022-05-26  624  	if (ret)
b017a46d486cd4 Gil Fine        2022-05-26  625  		goto out;
b017a46d486cd4 Gil Fine        2022-05-26  626  
b017a46d486cd4 Gil Fine        2022-05-26  627  	ret = tb_port_tmu_time_sync_enable(up);
b017a46d486cd4 Gil Fine        2022-05-26  628  	if (ret)
b017a46d486cd4 Gil Fine        2022-05-26  629  		goto out;
b017a46d486cd4 Gil Fine        2022-05-26  630  
b017a46d486cd4 Gil Fine        2022-05-26  631  	return 0;
b017a46d486cd4 Gil Fine        2022-05-26  632  
b017a46d486cd4 Gil Fine        2022-05-26  633  out:
c437dcb18310f2 Mika Westerberg 2022-10-07  634  	tb_switch_tmu_change_mode_prev(sw);
b017a46d486cd4 Gil Fine        2022-05-26  635  	return ret;
b017a46d486cd4 Gil Fine        2022-05-26  636  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

