Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093783D3492
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Sep 2026 23:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788995802; cv=none; b=LVip/1hWr0hZEHU+6PnX7wukirCbOCYLfojaHMcJvqV5bG0jgkcL/xEtp+yrOOtUvOsyeeihpTvkSTY6C2uiRgoHUnZepQwQ3XWxwonHRQgbhZA8QKyD3ykvR7cDotD5gg3QiHOAsg3dQs45p6RMtWJiJnNe54cWMXLR3AYUcTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788995802; c=relaxed/simple;
	bh=np9l8+9uO9b87dJJHyBBwz/IzSKen2TYDEDEO/F47j0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IPXIe+BonWywrA1D08tubz8uMuqKHxSDnjuoOuR8xDbf8yZZQM+DtAfXcohk8KLuS8eVaItKPljOoYT/99TT8slpVV6cVBIBBxOJGv7Jgfp8nXg26hH/Q+n4PKhN6uBYdiDKXzg040qntCE/Uf3xkrZaKLbezGHJiO16Q0iUHfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+FBfRo7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+FBfRo7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788995799; x=1820531799;
  h=date:from:to:cc:subject:message-id;
  bh=np9l8+9uO9b87dJJHyBBwz/IzSKen2TYDEDEO/F47j0=;
  b=b+FBfRo7yL3FBqshlI5mU19/UdGNh8kF2PMW18m9AaFN1G5IaJeG1zA0
   j3RXzMaQRi9x4WHy2cqdhfJTwRykJ/7KD0G2XZxa9zoIObAEZfpecpzZs
   oXvAD2+FbbM5UYUdRfkNiZvPsEYgphj4bFMH/abqhY6WQdPbbupcIdNog
   Jzz/YYSckNlgiblWBPTuFtot81u6VAahUIebNFVUJGy1IhcPson6Yyrcv
   Hhrba2zVySJfwZuZzctIGdBlmI/SBUqNTfeogUae+O5MauG4CWOybToLj
   Sv1d37vKWNt9XSQ1OaDhQ/wAft+1tn189ksuzqtKE92pAmHNJDRNne/Co
   Q==;
X-CSE-ConnectionGUID: z/32LTF6RQmb080B55rrWg==
X-CSE-MsgGUID: er8PlAczR3K2mVE+HzkrYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100031883"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="100031883"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 16:16:38 -0700
X-CSE-ConnectionGUID: fsa2HTVIT++wqsFH5jagnQ==
X-CSE-MsgGUID: uSz3YSyGTdyEw/N2+4N5Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="270111488"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Sep 2026 16:16:37 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4RWs-0000000013A-3N03;
	Wed, 09 Sep 2026 23:16:34 +0000
Date: Thu, 10 Sep 2026 07:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, Niklas Cassel <cassel@kernel.org>
Subject: [libata:for-next 7/7]
 drivers/ata/pata_parport/pata_parport.c:707:13: warning: conflicting types
 for 'pi_remove_one'; have 'void(struct device *)'
Message-ID: <202609100732.jcpwPdM6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git for-next
head:   d82c5cf658c306979c786a6702487cf9fbc2b5de
commit: d82c5cf658c306979c786a6702487cf9fbc2b5de [7/7] ata: pata_parport: unregister devices on protocol unregister
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609100732.jcpwPdM6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100732.jcpwPdM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609100732.jcpwPdM6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ata/pata_parport/pata_parport.c: In function 'pi_remove_by_proto':
   drivers/ata/pata_parport/pata_parport.c:621:17: error: implicit declaration of function 'pi_remove_one' [-Wimplicit-function-declaration]
     621 |                 pi_remove_one(dev);
         |                 ^~~~~~~~~~~~~
   drivers/ata/pata_parport/pata_parport.c: At top level:
>> drivers/ata/pata_parport/pata_parport.c:707:13: warning: conflicting types for 'pi_remove_one'; have 'void(struct device *)'
     707 | static void pi_remove_one(struct device *dev)
         |             ^~~~~~~~~~~~~
   drivers/ata/pata_parport/pata_parport.c:707:13: error: static declaration of 'pi_remove_one' follows non-static declaration
   drivers/ata/pata_parport/pata_parport.c:621:17: note: previous implicit declaration of 'pi_remove_one' with type 'void(struct device *)'
     621 |                 pi_remove_one(dev);
         |                 ^~~~~~~~~~~~~


vim +707 drivers/ata/pata_parport/pata_parport.c

246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  706  
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23 @707  static void pi_remove_one(struct device *dev)
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  708  {
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  709  	struct ata_host *host = dev_get_drvdata(dev);
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  710  	struct pi_adapter *pi = host->private_data;
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  711  
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  712  	ata_host_detach(host);
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  713  	pi_disconnect(pi);
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  714  	pi_release(pi);
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  715  	device_unregister(dev);
5bc9e2d43f8610 drivers/ata/pata_parport/pata_parport.c Ondrej Zary 2023-03-14  716  	/* pata_parport_dev_release will do ida_free(dev->id) and kfree(pi) */
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  717  }
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  718  

:::::: The code at line 707 was first introduced by commit
:::::: 246a1c4c6b7ffba88a2553d2b88f7b6280f253a2 ata: pata_parport: add driver (PARIDE replacement)

:::::: TO: Ondrej Zary <linux@zary.sk>
:::::: CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
