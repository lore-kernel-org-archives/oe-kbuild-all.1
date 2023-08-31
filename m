Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FBA13AD3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 16:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693500181; x=1725036181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jcYBv2CjmoEGdT8aCKS1ZHGYRQNfiZLxmDbb1tD1ZUE=;
  b=AULE0CWywDzhUNVKNm9ettKsqi59ozH6Lc/NHS6xSMxib8IXAE21dHeg
   LtFTJvfpF/p8hCW9KxjnIG0c+s2UE6drDr3/Jkb+8NLOyI7Iob5eLAFM8
   /9rHratKX7IwqjbhYZ/W40KMLZ58Bb1759Ux9wveQKOczqrOmUW+Tg2Wi
   uX1SSSYubFRdpdJTYezJz6Y5JDf/nBkfTwlvxkd9zq6EdkjcXb44D+Pfm
   zXEELJnjJ7E1ikljP7Z9B6CXVUamR+GWsQezAshnrAgqpkCEEgMxk4Gyq
   oAclXfXLh7QaUyuZb7KemmJQKDr4+IUGop+ru0gsTyBIiIM0febUl5lDO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="373402184"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="373402184"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 09:43:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="809711756"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="809711756"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Aug 2023 09:42:59 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbkky-0000Mn-2l;
	Thu, 31 Aug 2023 16:42:56 +0000
Date: Fri, 1 Sep 2023 00:42:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 17396/24604]
 drivers/mailbox/imx-mailbox.c:132:10: warning: no previous prototype for
 function 'get_mu_buf'
Message-ID: <202309010033.JkSO09XI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vabhav,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: e7f19219a4920854744c970b43522cb6d17e0262 [17396/24604] LF-6580-1: drivers: imx-mailbox: MU Buffer
config: riscv-randconfig-r016-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010033.JkSO09XI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010033.JkSO09XI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010033.JkSO09XI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/imx-mailbox.c:132:10: warning: no previous prototype for function 'get_mu_buf' [-Wmissing-prototypes]
     132 | uint8_t *get_mu_buf(struct mbox_chan *chan)
         |          ^
   drivers/mailbox/imx-mailbox.c:132:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     132 | uint8_t *get_mu_buf(struct mbox_chan *chan)
         | ^
         | static 
   drivers/mailbox/imx-mailbox.c:900:10: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     900 |         .rxdb   = imx_mu_generic_rxdb,
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/mailbox/imx-mailbox.c:898:10: note: previous initialization is here
     898 |         .rxdb   = imx_mu_generic_rxdb,
         |                   ^~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/get_mu_buf +132 drivers/mailbox/imx-mailbox.c

   131	
 > 132	uint8_t *get_mu_buf(struct mbox_chan *chan)
   133	{
   134		uint8_t *addr;
   135		struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
   136	
   137		addr = priv->base + priv->dcfg->xBUF;
   138		return addr;
   139	}
   140	EXPORT_SYMBOL(get_mu_buf);
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
