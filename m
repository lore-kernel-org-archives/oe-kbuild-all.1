Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7713DF9CF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 08:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727599343; cv=none; b=eIoLMkV2hojueRyFFGf8uzdUBq1inVHNjHE/W0LPPjcmbJKUEHLSvCp4yxpeTu1JeSNeW0KzdOWw90FZFbXP3Uvb4FgkfXQ1KpslVsNnruxZeMUmt25G3S3VaYzUFX5HoKTEYP6KhdeYUIXG3RW7hNicwHy2aoaGSSGEsuCpmgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727599343; c=relaxed/simple;
	bh=Y02YcV6KOnpL0voWWUHN2uVDH8RlsraO1mEc9ryaBQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J3AfJjo7WsGVkkkSd4iDRcbxjZa943ckwEj2BBGKCHBr0JLdUlcxIT0CxeXTC+BAgJQ6F1CBP1tHF0Prz/ipRzQkzX35zBEqZZkhIY03NGmzPccAJNPXpaghUc5jlr9W9eB6/jah7H3XJsmIS5IMxTas4GXaBgS0RIk8nXxgyKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X27th6E6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X27th6E6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727599341; x=1759135341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y02YcV6KOnpL0voWWUHN2uVDH8RlsraO1mEc9ryaBQE=;
  b=X27th6E6qJtbclwCHZlZTc8BdalLq0Cgr7/hqnSnnqeOEc7GARpfLUUn
   HZUlosfJJ9zHG1uVRT0NQnZsLT+FCSUqNVeA1zycG0nEAyIqGh7i/zhak
   E+7OCxAAVKVJqoFWjbcqiBsjxb8nk1ZiW6SaFiEG/z2ZBcyoeEjOBWw3q
   O+GpvKdzqTfb8AXdFaq4qoRn1fPz7kaKn7gKCxz6SzycJRpqoqnmcsyTF
   GjoezQtvvvgbO5JJtjZqpJgZk8NF5iQAqP2h+jQYVPYa106W7Kz4XEaDK
   33Eob/Vg5h0FCNGzzHGbvZHmQyZrNdv0GVL4lljebLZw4q4EtX1vaC1M6
   w==;
X-CSE-ConnectionGUID: VPXI8cr7Q3OYGnTwrWTxXw==
X-CSE-MsgGUID: sp4Qmi2YTJWrd5tyW7Y25w==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26648484"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26648484"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 01:42:21 -0700
X-CSE-ConnectionGUID: HSDnPKcxSM6zccVq4go8cQ==
X-CSE-MsgGUID: QPLTwnLQQPGHC9B3zKY5Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72559577"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 01:42:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1supVR-000O6z-30;
	Sun, 29 Sep 2024 08:42:17 +0000
Date: Sun, 29 Sep 2024 16:42:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 2768/16788]
 drivers/mailbox/imx-mailbox.c:141:10: warning: no previous prototype for
 'get_mu_buf'
Message-ID: <202409291607.FjsVxwzC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 49e0afc879aa92d4c9ff99b7b92a6ee5d4ba127b [2768/16788] LF-6580-1: drivers: imx-mailbox: MU Buffer
config: i386-buildonly-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409291607.FjsVxwzC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291607.FjsVxwzC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291607.FjsVxwzC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/imx-mailbox.c:141:10: warning: no previous prototype for 'get_mu_buf' [-Wmissing-prototypes]
     141 | uint8_t *get_mu_buf(struct mbox_chan *chan)
         |          ^~~~~~~~~~


vim +/get_mu_buf +141 drivers/mailbox/imx-mailbox.c

   140	
 > 141	uint8_t *get_mu_buf(struct mbox_chan *chan)
   142	{
   143		uint8_t *addr;
   144		struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
   145	
   146		addr = priv->base + priv->dcfg->xBUF;
   147		return addr;
   148	}
   149	EXPORT_SYMBOL(get_mu_buf);
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
