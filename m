Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD3122157D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 14:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740664857; cv=none; b=sqTJjA1p1IMCCxKIa4YadZoHZvj4Xpf7FKeC+wQso1FafgnkKCf82Wrk/bOqZQyKS3ReJQlFkqi6xz5DV21h1IBpNDSSqoE5bhIHbab1TGqf35bYWWmrK1Unn06ke8eapn1dtefgMnvyU7Ej3yQ3XR5UndXH9mA7r2EiC5YTgDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740664857; c=relaxed/simple;
	bh=aTJLLJdm6UwJ27+p+vuuj6DyutWD3bMFwLF2OQRevjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4seDoyAqtSXOwyjTc7y7o8ulNf9leatGEtyKnE05u9VZOqabGadaeLaP6jgzzTrwTz8mPC6EwqORf3969RtMq08sJhdvz2OtiQDm//gM4rJRs7I5o95TQpjdLgjFC3Qdka/NwNndmD9kyCMZFO842WAVCzRRfmdNA4nH5aMwFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NVrXdVjM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NVrXdVjM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740664856; x=1772200856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aTJLLJdm6UwJ27+p+vuuj6DyutWD3bMFwLF2OQRevjA=;
  b=NVrXdVjMb6JFzdRCO1ruHV43RSYCxv+ZsYhrO5Od/DnFmnlxpH/hoPuN
   j7/mHULQMY6Vb6zcd104EUkj2OYplNHcs3nGch57gnQLbiQXE+UZTMf1l
   hyIsjTUJfuH3Y6FQbuOR5bd8y7NICadndFsd5fpgVcFA5jogGSjMom30d
   XS6ujqkzVR5rLXlTSITOF6Z9mkZQN4Z9lbUEZNpFlg7HaCYWQpLzuoMn4
   oN0TVXmbmoJnRpIt6F5yJ5Z1JLg1F4pNVSmWMIUt0Lkzu68UVkpRG1Nxx
   RleVpkxJL1COVb0+ZJXVdFKtI03zx9voa8pmlVo7gkt7jF34tQdAE77+g
   g==;
X-CSE-ConnectionGUID: glV2V/QtTDCV4wOqRjr9ag==
X-CSE-MsgGUID: amZGx7pOSNipJ8yr2mmzAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40793042"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="40793042"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 06:00:53 -0800
X-CSE-ConnectionGUID: dbRhm6LDRJO53/6aGMVrSQ==
X-CSE-MsgGUID: STO1TeoJRq+arBfoq4pWOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="121976535"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Feb 2025 06:00:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tneRU-000DRu-2p;
	Thu, 27 Feb 2025 14:00:48 +0000
Date: Thu, 27 Feb 2025 22:00:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rengarajan S <rengarajan.s@microchip.com>, unglinuxdriver@microchip.com,
	broonie@kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, rengarajan.s@microchip.com
Subject: Re: [PATCH v1 for-next] spi: mchp-pci1xxxx: Updated memcpy
 implementation for x64 and bcm2711 processors
Message-ID: <202502272153.zJWKuv3R-lkp@intel.com>
References: <20250224125153.13728-1-rengarajan.s@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224125153.13728-1-rengarajan.s@microchip.com>

Hi Rengarajan,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-spi/for-next]
[also build test ERROR on linus/master v6.14-rc4 next-20250227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rengarajan-S/spi-mchp-pci1xxxx-Updated-memcpy-implementation-for-x64-and-bcm2711-processors/20250224-205745
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20250224125153.13728-1-rengarajan.s%40microchip.com
patch subject: [PATCH v1 for-next] spi: mchp-pci1xxxx: Updated memcpy implementation for x64 and bcm2711 processors
config: sparc-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250227/202502272153.zJWKuv3R-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272153.zJWKuv3R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272153.zJWKuv3R-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-pci1xxxx.c: In function 'pci1xxxx_spi_write_to_io':
>> drivers/spi/spi-pci1xxxx.c:417:25: error: implicit declaration of function '__raw_writeq'; did you mean '__raw_writel'? [-Wimplicit-function-declaration]
     417 |                         __raw_writeq(*(u64 *)from, to);
         |                         ^~~~~~~~~~~~
         |                         __raw_writel
   drivers/spi/spi-pci1xxxx.c: In function 'pci1xxxx_spi_read_from_io':
>> drivers/spi/spi-pci1xxxx.c:448:38: error: implicit declaration of function '__raw_readq'; did you mean '__raw_readl'? [-Wimplicit-function-declaration]
     448 |                         *(u64 *)to = __raw_readq(from);
         |                                      ^~~~~~~~~~~
         |                                      __raw_readl


vim +417 drivers/spi/spi-pci1xxxx.c

   410	
   411	static void pci1xxxx_spi_write_to_io(void __iomem *to, const void *from,
   412					     size_t count, size_t size)
   413	{
   414		while (count) {
   415			if (size == 8 && (IS_ALIGNED((unsigned long)to, 8)) &&
   416			    count >= 8) {
 > 417				__raw_writeq(*(u64 *)from, to);
   418				from += 8;
   419				to += 8;
   420				count -= 8;
   421			} else if (size >= 4 && (IS_ALIGNED((unsigned long)to, 4)) &&
   422				   count >= 4) {
   423				__raw_writel(*(u32 *)from, to);
   424				from += 4;
   425				to += 4;
   426				count -= 4;
   427			} else if (size >= 2 && (IS_ALIGNED((unsigned long)to, 2)) &&
   428				   count >= 2) {
   429				__raw_writew(*(u16 *)from, to);
   430				from += 2;
   431				to += 2;
   432				count -= 2;
   433			} else {
   434				__raw_writeb(*(u8 *)from, to);
   435				from += 1;
   436				to += 1;
   437				count -= 1;
   438			}
   439		}
   440	}
   441	
   442	static void pci1xxxx_spi_read_from_io(void *to, const void __iomem *from,
   443					      size_t count, size_t size)
   444	{
   445		while (count) {
   446			if (size == 8 && (IS_ALIGNED((unsigned long)from, 8)) &&
   447			    count >= 8) {
 > 448				*(u64 *)to = __raw_readq(from);
   449				from += 8;
   450				to += 8;
   451				count -= 8;
   452			} else if (size >= 4 && (IS_ALIGNED((unsigned long)from, 4)) &&
   453				   count >= 4) {
   454				*(u32 *)to = __raw_readl(from);
   455				from += 4;
   456				to += 4;
   457				count -= 4;
   458			} else if (size >= 2 && (IS_ALIGNED((unsigned long)from, 2)) &&
   459				   count >= 2) {
   460				*(u16 *)to = __raw_readw(from);
   461				from += 2;
   462				to += 2;
   463				count -= 2;
   464			} else {
   465				*(u8 *)to = __raw_readb(from);
   466				from += 1;
   467				to += 1;
   468				count -= 1;
   469			}
   470		}
   471	}
   472	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
