Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D9330E0D5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 03:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011502; cv=none; b=fnoRtJVSloIPVORx2QpmqQwhba3eK8vaPlBj4+SfCi3XSDVkvB68htbv+jZaT2T+RHMIeh/hDCsY3Aqqr/qR7PKAIHkWTseSyUCNc4zLtZ4yVmn7RiEwplsPHRkk6ZGxbK3wn1hX7oYmM5n+qBo5l1JROkpCKTep/jlgt+khhsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011502; c=relaxed/simple;
	bh=0sPxEeuZgkVxoeyly4tFTbTYAM1j1DyX+W/JZZ3CTRI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fuaPyergVJMsMCRwYsKuY22UjlMEnCKTaa6mroZdAV2o6RDrMOewbT06mEXDTYHpzHaBkbFF3EdEcxEUW3Lz/Fy10+hRLSTvKCmATqs5BlTMWFKjQLaX38NbvRVrOVg7r7Sgj/sXvkaWJg0oXJECzzQ/PwWAtFpAy8EJ53jf4oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HuqL3N6j; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HuqL3N6j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789011500; x=1820547500;
  h=date:from:to:cc:subject:message-id;
  bh=0sPxEeuZgkVxoeyly4tFTbTYAM1j1DyX+W/JZZ3CTRI=;
  b=HuqL3N6j3QJds+MoU+ke33AAwJcbBJfsEK3MiMoyFLWj2ZDH1/Y6ckgl
   p4KIv1h0Q+OFXaLeNc8QJefsHvHVEWH5fDV27hzN4Nq57g9HC7jYvVE8j
   vM4p7y2zln3/nH/8E6KgBRepHY5jgsMGsJGjilaDCd70WgbNs6t30U+Jm
   ae2nIQ5gguYrHUVNr3GitNPybMkFSqeJv6LGHACsOpVHhjogG0pQ51w/q
   Rpmwi6fqTArS/43e8FgIr7RHVKHwyxkNL/sPnoHCKNeHLbFWBAKOWE6/e
   jbxzVb1CSHigo0ZuqutrQsPM9f62RCgB2McHJ6FMRaANl9AM3GNIlGqiG
   w==;
X-CSE-ConnectionGUID: JkEl/esrQhC1mKhiF28E6w==
X-CSE-MsgGUID: YUXBsZljQ+eq0XJ/MlnAmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89483508"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="89483508"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 20:38:20 -0700
X-CSE-ConnectionGUID: wtrocUwuSCCOCvQF71ONtg==
X-CSE-MsgGUID: 4LwUEWr7QW28uohRzNksPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="301409228"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Sep 2026 20:38:19 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4Vc8-000000001K4-2KMg;
	Thu, 10 Sep 2026 03:38:16 +0000
Date: Thu, 10 Sep 2026 11:38:14 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, Niklas Cassel <cassel@kernel.org>
Subject: [libata:for-next 7/7]
 drivers/ata/pata_parport/pata_parport.c:707:13: warning: conflicting types
 for 'pi_remove_one'
Message-ID: <202609101101.O1RRh9RK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git for-next
head:   d82c5cf658c306979c786a6702487cf9fbc2b5de
commit: d82c5cf658c306979c786a6702487cf9fbc2b5de [7/7] ata: pata_parport: unregister devices on protocol unregister
config: powerpc64-randconfig-r134-20260910 (https://download.01.org/0day-ci/archive/20260910/202609101101.O1RRh9RK-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101101.O1RRh9RK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101101.O1RRh9RK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ata/pata_parport/pata_parport.c: In function 'pi_remove_by_proto':
   drivers/ata/pata_parport/pata_parport.c:621:3: error: implicit declaration of function 'pi_remove_one'; did you mean 'ata_pci_remove_one'? [-Werror=implicit-function-declaration]
      pi_remove_one(dev);
      ^~~~~~~~~~~~~
      ata_pci_remove_one
   drivers/ata/pata_parport/pata_parport.c: At top level:
>> drivers/ata/pata_parport/pata_parport.c:707:13: warning: conflicting types for 'pi_remove_one'
    static void pi_remove_one(struct device *dev)
                ^~~~~~~~~~~~~
   drivers/ata/pata_parport/pata_parport.c:707:13: error: static declaration of 'pi_remove_one' follows non-static declaration
   drivers/ata/pata_parport/pata_parport.c:621:3: note: previous implicit declaration of 'pi_remove_one' was here
      pi_remove_one(dev);
      ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/pi_remove_one +707 drivers/ata/pata_parport/pata_parport.c

246a1c4c6b7ffba drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  706  
246a1c4c6b7ffba drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23 @707  static void pi_remove_one(struct device *dev)
246a1c4c6b7ffba drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  708  {
246a1c4c6b7ffba drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  709  	struct ata_host *host = dev_get_drvdata(dev);
246a1c4c6b7ffba drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  710  	struct pi_adapter *pi = host->private_data;
246a1c4c6b7ffba drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  711  
246a1c4c6b7ffba drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  712  	ata_host_detach(host);
246a1c4c6b7ffba drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  713  	pi_disconnect(pi);
246a1c4c6b7ffba drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  714  	pi_release(pi);
246a1c4c6b7ffba drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  715  	device_unregister(dev);
5bc9e2d43f86105 drivers/ata/pata_parport/pata_parport.c Ondrej Zary 2023-03-14  716  	/* pata_parport_dev_release will do ida_free(dev->id) and kfree(pi) */
246a1c4c6b7ffba drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  717  }
246a1c4c6b7ffba drivers/ata/pata_parport.c              Ondrej Zary 2023-01-23  718  

:::::: The code at line 707 was first introduced by commit
:::::: 246a1c4c6b7ffba88a2553d2b88f7b6280f253a2 ata: pata_parport: add driver (PARIDE replacement)

:::::: TO: Ondrej Zary <linux@zary.sk>
:::::: CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
