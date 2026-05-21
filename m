Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C068364EAA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 02:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779330218; cv=none; b=BTRyzr/5JI5tVA5pkvqJzmVbm5dgdIUab0bdDbLI0fG37DEb1Gtz7U/WJFVYWdv8GNVMmslPc75yNtSIYEgcdCrWQrV7zGbc2fATS5KZ1g8rr8pViFylGj/uY4XG7T7eSqdF34q4UHOocQDGhXbfHE7yBrHBYSAphz5qs5DaeZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779330218; c=relaxed/simple;
	bh=QY8td3YcQLWk5q7hECVjvlC2Mfr3wo/x/D/+0qQ8mA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/ydM7f0xdFW77x/ZaPIls+LDK/+MClQ2Pi9boV1PzFZ8aKzj5KpRuSPSy9F1whytcabXLniL+NJpfXeCbVnCM2y8kSZ2/ZUfFnYfWyM8APnfnv1bZmXheyiCm6kGESCOkZK7H7Cm33934L3FMEVBAR+PU6SjtCw0zBmnL+ShnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5L6C6gS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5L6C6gS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779330214; x=1810866214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QY8td3YcQLWk5q7hECVjvlC2Mfr3wo/x/D/+0qQ8mA8=;
  b=F5L6C6gSs7H4DlWblPBkZw4bH7xSQOhdy3JDA7yaKearnoNNXezMkVAR
   bHV257GhTksjuoivPZ5XAK58H8X8Aoou+8q9WyicFiqmigayE0Qqw3kO4
   ShIR4Kw6REMt6uSmjj5KGU0IIVbWkSPFLOOuoVHo7mNXZTMpe3zAW7aZI
   atjiI7WdKD4xzZoq+LvEoU6+ciF6MfyBEP1zTye4P5/8CFMtTFxrk35Cn
   6IktTwtDIl7cnutXz/WXVOqFbWDFsJso5NmST7FdAYPKO+5RQ1rUAY6tp
   K9dUm+ZJOsXObaA/PBZaB7WZAZBD79ztUhVRpSMvhwI8BKUHmzRCz1qN9
   A==;
X-CSE-ConnectionGUID: 8vSFQd8cSm2YyQykza/k1g==
X-CSE-MsgGUID: FRymFP9wT5m7hdHFrBStfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97813204"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="97813204"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 19:23:30 -0700
X-CSE-ConnectionGUID: VRnRNF5SQcKoDdWsilWeNg==
X-CSE-MsgGUID: xWay2sQbTXy0lVMKX4fchA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="237785791"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 May 2026 19:23:26 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPt3W-000000004DV-283m;
	Thu, 21 May 2026 02:22:52 +0000
Date: Thu, 21 May 2026 10:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>,
	Chris Snook <chris.snook@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Tobias Regnery <tobias.regnery@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH] net: alx: fix possible buffer overflow
Message-ID: <202605211017.m1y6JlIV-lkp@intel.com>
References: <20260520180140.538826-1-grandmaster@al2klimov.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520180140.538826-1-grandmaster@al2klimov.de>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on net/main linus/master v7.1-rc4 next-20260520]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-A-Klimov/net-alx-fix-possible-buffer-overflow/20260521-022058
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260520180140.538826-1-grandmaster%40al2klimov.de
patch subject: [PATCH] net: alx: fix possible buffer overflow
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260521/202605211017.m1y6JlIV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211017.m1y6JlIV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211017.m1y6JlIV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/atheros/alx/main.c: In function 'alx_request_msix':
>> drivers/net/ethernet/atheros/alx/main.c:874:77: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     874 |                         snprintf(np->irq_lbl, sizeof(np->irq_lbl), "%s-rx-%u",
         |                                                                             ^
   drivers/net/ethernet/atheros/alx/main.c:874:25: note: 'snprintf' output between 6 and 25 bytes into a destination of size 24
     874 |                         snprintf(np->irq_lbl, sizeof(np->irq_lbl), "%s-rx-%u",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     875 |                                  netdev->name, np->rxq->queue_idx);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/atheros/alx/main.c:871:77: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     871 |                         snprintf(np->irq_lbl, sizeof(np->irq_lbl), "%s-tx-%u",
         |                                                                             ^
   drivers/net/ethernet/atheros/alx/main.c:871:25: note: 'snprintf' output between 6 and 25 bytes into a destination of size 24
     871 |                         snprintf(np->irq_lbl, sizeof(np->irq_lbl), "%s-tx-%u",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     872 |                                  netdev->name, np->txq->queue_idx);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/atheros/alx/main.c:868:77: warning: '%u' directive output may be truncated writing between 1 and 5 bytes into a region of size between 3 and 18 [-Wformat-truncation=]
     868 |                         snprintf(np->irq_lbl, sizeof(np->irq_lbl), "%s-TxRx-%u",
         |                                                                             ^~
   drivers/net/ethernet/atheros/alx/main.c:868:68: note: directive argument in the range [0, 65535]
     868 |                         snprintf(np->irq_lbl, sizeof(np->irq_lbl), "%s-TxRx-%u",
         |                                                                    ^~~~~~~~~~~~
   drivers/net/ethernet/atheros/alx/main.c:868:25: note: 'snprintf' output between 8 and 27 bytes into a destination of size 24
     868 |                         snprintf(np->irq_lbl, sizeof(np->irq_lbl), "%s-TxRx-%u",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     869 |                                  netdev->name, np->txq->queue_idx);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +874 drivers/net/ethernet/atheros/alx/main.c

   851	
   852	static int alx_request_msix(struct alx_priv *alx)
   853	{
   854		struct net_device *netdev = alx->dev;
   855		int i, err, vector = 0, free_vector = 0;
   856	
   857		err = request_irq(pci_irq_vector(alx->hw.pdev, 0), alx_intr_msix_misc,
   858				  0, netdev->name, alx);
   859		if (err)
   860			goto out_err;
   861	
   862		for (i = 0; i < alx->num_napi; i++) {
   863			struct alx_napi *np = alx->qnapi[i];
   864	
   865			vector++;
   866	
   867			if (np->txq && np->rxq)
 > 868				snprintf(np->irq_lbl, sizeof(np->irq_lbl), "%s-TxRx-%u",
   869					 netdev->name, np->txq->queue_idx);
   870			else if (np->txq)
   871				snprintf(np->irq_lbl, sizeof(np->irq_lbl), "%s-tx-%u",
   872					 netdev->name, np->txq->queue_idx);
   873			else if (np->rxq)
 > 874				snprintf(np->irq_lbl, sizeof(np->irq_lbl), "%s-rx-%u",
   875					 netdev->name, np->rxq->queue_idx);
   876			else
   877				snprintf(np->irq_lbl, sizeof(np->irq_lbl), "%s-unused",
   878					 netdev->name);
   879	
   880			np->vec_idx = vector;
   881			err = request_irq(pci_irq_vector(alx->hw.pdev, vector),
   882					  alx_intr_msix_ring, 0, np->irq_lbl, np);
   883			if (err)
   884				goto out_free;
   885		}
   886		return 0;
   887	
   888	out_free:
   889		free_irq(pci_irq_vector(alx->hw.pdev, free_vector++), alx);
   890	
   891		vector--;
   892		for (i = 0; i < vector; i++)
   893			free_irq(pci_irq_vector(alx->hw.pdev,free_vector++),
   894				 alx->qnapi[i]);
   895	
   896	out_err:
   897		return err;
   898	}
   899	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
