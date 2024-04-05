Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2631C6A8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 22:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712354594; cv=none; b=RzI35c9qwF868RjfOz57lWLU+5Td65g0Rlxub1jKsKjhttC9agjVX/ASSGyOvF4ARjK4wQUjdEYGgiDY/n50tMy/c+D07eM83do1EkPi54d7CnFcml5XPokjgAjZrMUrpLEUJKKPndb9teMzrh6wTnBDpL+4R2sr46GoV8kJgHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712354594; c=relaxed/simple;
	bh=OzoGEumDeOWvSjZwBGP2qzEbtqBzQOBiopbNPwz0ALY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ui3ds/lIICzFMZgkKw3bxR1ytRSYauxxn1dvvM1bv5Tyh/BzAgZ8m0t2lUIC4MTODfigt/0g1uNo6WfHlPW+a+z/tzOfUsuofF8eq35CFt7Y1EZk7u9xWB0ov+NlIolmtwqqjSTPHIOXSo/klnS7tjqqutx+qYMo88FGrjkkiw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=al9h50Vw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="al9h50Vw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712354593; x=1743890593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OzoGEumDeOWvSjZwBGP2qzEbtqBzQOBiopbNPwz0ALY=;
  b=al9h50VwCMaO4V3VfzRDHYK7R2bifoJzCSt72UrroSmGEyVPDChfoUJR
   uSJPemqCpOs4AiDGSYvtw2D0T5iR/RxoRTvZ3CVePwJfvUplSmOuOj6ux
   kzqY8c6RXVYsV9h1hZZAIUXigGCAkSj50rkEY67U8b1kG50NMjbeam5xK
   sWrZ23D1p7KryV6dni75qOV8dB/CuE4EPG7gMNqZUT5cEvfOR7K9tLjMU
   /sBOZVNkAEolr0jrrDHLreMGV8M7+OsslEVZXNmr/QsLI01+UtR6QBpTS
   2xO6tCbjqYcj34j/gNFqMx5SQY1XK8NIBLw2e8UCmVlOMGDUXJgYkbA1u
   g==;
X-CSE-ConnectionGUID: E0wDYS/cSXKHuLuhonDO/g==
X-CSE-MsgGUID: vD670/03Q4ufrAdkY+66FQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7606357"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7606357"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 15:01:05 -0700
X-CSE-ConnectionGUID: fBfh+eFARXmlaEqzgUi63A==
X-CSE-MsgGUID: mqqS0tO1RsSKzlDrS+agJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="56774152"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Apr 2024 15:01:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsrcL-0002l0-1t;
	Fri, 05 Apr 2024 22:01:01 +0000
Date: Sat, 6 Apr 2024 06:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 17/40] sound/soc/intel/avs/pcm.c:806:36:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202404060558.7sKdEb5e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   025d6230e73400e8c46ec29a297b9bca08f36f6f
commit: 05f15eff60a663c24903bdfdb5ccb3faa4712ad9 [17/40] sound: convert drivers to read/write iterators
config: i386-randconfig-061-20240405 (https://download.01.org/0day-ci/archive/20240406/202404060558.7sKdEb5e-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060558.7sKdEb5e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060558.7sKdEb5e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/intel/avs/pcm.c:806:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   sound/soc/intel/avs/pcm.c:806:36: sparse:     expected void const [noderef] __user *from
   sound/soc/intel/avs/pcm.c:806:36: sparse:     got char *
--
>> sound/soc/intel/avs/debugfs.c:63:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[assigned] buf @@
   sound/soc/intel/avs/debugfs.c:63:35: sparse:     expected void const [noderef] __user *from
   sound/soc/intel/avs/debugfs.c:63:35: sparse:     got char *[assigned] buf
   sound/soc/intel/avs/debugfs.c:88:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[assigned] buf @@
   sound/soc/intel/avs/debugfs.c:88:35: sparse:     expected void const [noderef] __user *from
   sound/soc/intel/avs/debugfs.c:88:35: sparse:     got char *[assigned] buf
   sound/soc/intel/avs/debugfs.c:130:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[assigned] buf @@
   sound/soc/intel/avs/debugfs.c:130:35: sparse:     expected void const [noderef] __user *from
   sound/soc/intel/avs/debugfs.c:130:35: sparse:     got char *[assigned] buf
>> sound/soc/intel/avs/debugfs.c:364:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   sound/soc/intel/avs/debugfs.c:364:36: sparse:     expected void const [noderef] __user *from
   sound/soc/intel/avs/debugfs.c:364:36: sparse:     got char *
--
>> sound/soc/sof/ipc4-mtrace.c:325:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[assigned] buf @@
   sound/soc/sof/ipc4-mtrace.c:325:35: sparse:     expected void const [noderef] __user *from
   sound/soc/sof/ipc4-mtrace.c:325:35: sparse:     got char *[assigned] buf
--
>> sound/soc/sof/sof-client-probes.c:236:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[assigned] buf @@
   sound/soc/sof/sof-client-probes.c:236:35: sparse:     expected void const [noderef] __user *from
   sound/soc/sof/sof-client-probes.c:236:35: sparse:     got char *[assigned] buf
--
>> sound/core/jack.c:172:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   sound/core/jack.c:172:36: sparse:     expected void const [noderef] __user *from
   sound/core/jack.c:172:36: sparse:     got char *
   sound/core/jack.c:229:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   sound/core/jack.c:229:36: sparse:     expected void const [noderef] __user *from
   sound/core/jack.c:229:36: sparse:     got char *
   sound/core/jack.c:264:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   sound/core/jack.c:264:36: sparse:     expected void const [noderef] __user *from
   sound/core/jack.c:264:36: sparse:     got char *
   sound/core/jack.c:275:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   sound/core/jack.c:275:36: sparse:     expected void const [noderef] __user *from
   sound/core/jack.c:275:36: sparse:     got char *
   sound/core/jack.c:286:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   sound/core/jack.c:286:36: sparse:     expected void const [noderef] __user *from
   sound/core/jack.c:286:36: sparse:     got char *
--
>> sound/soc/soc-dapm.c:2156:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[assigned] buf @@
   sound/soc/soc-dapm.c:2156:35: sparse:     expected void const [noderef] __user *from
   sound/soc/soc-dapm.c:2156:35: sparse:     got char *[assigned] buf
>> sound/soc/soc-dapm.c:2191:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[assigned] level @@
   sound/soc/soc-dapm.c:2191:36: sparse:     expected void const [noderef] __user *from
   sound/soc/soc-dapm.c:2191:36: sparse:     got char *[assigned] level
--
>> sound/soc/soc-pcm.c:192:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[assigned] buf @@
   sound/soc/soc-pcm.c:192:35: sparse:     expected void const [noderef] __user *from
   sound/soc/soc-pcm.c:192:35: sparse:     got char *[assigned] buf
--
>> sound/soc/fsl/imx-audmux.c:121:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[assigned] buf @@
   sound/soc/fsl/imx-audmux.c:121:35: sparse:     expected void const [noderef] __user *from
   sound/soc/fsl/imx-audmux.c:121:35: sparse:     got char *[assigned] buf
--
>> sound/soc/intel/skylake/skl-debug.c:151:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[assigned] buf @@
   sound/soc/intel/skylake/skl-debug.c:151:35: sparse:     expected void const [noderef] __user *from
   sound/soc/intel/skylake/skl-debug.c:151:35: sparse:     got char *[assigned] buf
>> sound/soc/intel/skylake/skl-debug.c:204:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[assigned] tmp @@
   sound/soc/intel/skylake/skl-debug.c:204:35: sparse:     expected void const [noderef] __user *from
   sound/soc/intel/skylake/skl-debug.c:204:35: sparse:     got char *[assigned] tmp

vim +806 sound/soc/intel/avs/pcm.c

   794	
   795	static ssize_t topology_name_read(struct kiocb *iocb, struct iov_iter *to)
   796	{
   797		struct snd_soc_component *component = iocb->ki_filp->private_data;
   798		struct snd_soc_card *card = component->card;
   799		struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
   800		char buf[64];
   801		size_t len;
   802	
   803		len = scnprintf(buf, sizeof(buf), "%s/%s\n", component->driver->topology_name_prefix,
   804				mach->tplg_filename);
   805	
 > 806		return simple_copy_to_iter(buf, &iocb->ki_pos, len, to);
   807	}
   808	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
