Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB451208A8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 02:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709952435; cv=none; b=fAI4JXujkv31TmDqguR0RP03QfqU/mLVaL4rsjvvXfKCPwFiHGfYv1xcM4oJgzCifOiAcvb9oFAMWFlY9cci9uCEqcN9azH/4IVP/Qlqcu3zWf047K9oQmKl4QjcHSeHozpKc/1wcP4R3qgtJNX494fa+qtYSCdTIFU3LLclySM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709952435; c=relaxed/simple;
	bh=xOQCtm0eH0aIv8Lfs1tlQ2dha7Y6hcRo8QWNAglv0SM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iw4xSqlAVqPYDXto0lmSOMfsRyk/s/Mk7E5EwWRODNPu7i0HlC8nr7vnjpJDj0f0A1GYEjvpDjSdUlX6DQ542MiqT0s3hBCdztkpzhD8uBRmsorozSkQrRsCXX017dM8Mrm8Xf3T+MtsB+v1QR0PMhQP8fSQt4gjDEZrlHe4kE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bfba2esj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bfba2esj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709952432; x=1741488432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xOQCtm0eH0aIv8Lfs1tlQ2dha7Y6hcRo8QWNAglv0SM=;
  b=Bfba2esj/44liXAC4MAWnUSwogykfCCLBBdofvXcy8GZkHOl3IU9w8l1
   6QVw8Wg/D7dSUsj78j7cL6c//7A/vfze0dbvl6hRpnRarLpqYO9kI7fAl
   FIxTMxQM4Jba3xgb+HX4D+XuOP4jH09+cN/yl9kMATuFS0B+WBHouoMUM
   E0oCfNtgBhPFP1OtbohhCIxKe8nLc482lI12Dt7TdCue40rj39Kun0s5D
   gEz3NEFTxIGiFfdyh+se64aruF6hJWNglxgWS39Y+LHK16iIta0JuLHdH
   aY2FBeXZqfRG7TBFP9xSrMUvQGu3EgehhjIuRLy8T5JpaAA13+B0mJesM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="15418854"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="15418854"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 18:47:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="11198100"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Mar 2024 18:47:12 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rimjs-0006ud-1E;
	Sat, 09 Mar 2024 02:47:08 +0000
Date: Sat, 9 Mar 2024 10:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 10291/12944] drivers/gpio/gpio-nomadik.c:462:20:
 error: static declaration of 'nmk_gpio_dbg_show_one' follows non-static
 declaration
Message-ID: <202403091024.OZ4KCPBL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
commit: 966942ae493650210b9514f3d4bfc95f78ef0129 [10291/12944] gpio: nomadik: extract GPIO platform driver from drivers/pinctrl/nomadik/
config: sh-randconfig-r081-20240309 (https://download.01.org/0day-ci/archive/20240309/202403091024.OZ4KCPBL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403091024.OZ4KCPBL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403091024.OZ4KCPBL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-nomadik.c:462:20: error: static declaration of 'nmk_gpio_dbg_show_one' follows non-static declaration
     462 | static inline void nmk_gpio_dbg_show_one(struct seq_file *s,
         |                    ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpio/gpio-nomadik.c:28:
   include/linux/gpio/gpio-nomadik.h:258:6: note: previous declaration of 'nmk_gpio_dbg_show_one' with type 'void(struct seq_file *, struct pinctrl_dev *, struct gpio_chip *, unsigned int,  unsigned int)'
     258 | void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/nmk_gpio_dbg_show_one +462 drivers/gpio/gpio-nomadik.c

   461	
 > 462	static inline void nmk_gpio_dbg_show_one(struct seq_file *s,
   463						 struct pinctrl_dev *pctldev,
   464						 struct gpio_chip *chip,
   465						 unsigned int offset,
   466						 unsigned int gpio)
   467	{
   468	}
   469	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
