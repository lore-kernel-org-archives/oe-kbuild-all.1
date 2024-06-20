Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC9819B3E1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718894478; cv=none; b=V+EI0cozsTb6yXk9GCoTmOsm5gYyZSw1HyrhZYy4uYai2Sqm9zO+WofdWklF0i566BxALwNvHv5mYGjZAjqq6goh4Hne6Fu6A+sSuIBAmLf9ogZ53mxlHBs5YHSTiYQY+IICvuEAZB297tOERy4xXEY6FqYU3Erw72Y+RZ14JMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718894478; c=relaxed/simple;
	bh=9bF5It9L4J0VxL24bUoTqc10k5zgNBiR19C7GGgoMqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPp7Zc6ycAINDNfC4bg9I/9HUny2GvAqb4fYuayABphzICqpYZRC06d/3FwsnxS8SgPChti6Xu3fY49YiUcxx/U7ATlY4HE98deccKypxFHK016LsO2gd+U+XN+OwmOtfWUnNPm2ZBQV5NmypsdYlb29uTEglWNs8SshRWxCPeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UrDJqTQO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UrDJqTQO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718894477; x=1750430477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9bF5It9L4J0VxL24bUoTqc10k5zgNBiR19C7GGgoMqc=;
  b=UrDJqTQOgCD9WYhYd/sOOYyQTXKXcz119bUkqPcHDg240inxA+ynDevl
   bj4TBjRYtDbBLNM1jIFo9pc8tsuN74F+4eYxr3FYM2WO5DWyHmUoVkXnW
   YGBrv6RsnrYpiiUeJbcbD+tvQm63Yk9TgPxexoh66AdSw9KwQkd1uJNJC
   7i4m+9nrPatOFFPpuS0crk9aYGn2RfG+eTZdmLZvqZwEpOYd2P3ioCttG
   +Rw5rC6Kz3aZj8666Lls1vg+xfcK5QqGnjsTeAKlnVuIzX+H9JxAD9guq
   wNUWr8KIUOc80CSkzFPF8qJDwgPQx3ZIqPsO9UdZEJOzjXLhF1z8JfmRr
   A==;
X-CSE-ConnectionGUID: 07byaDAhTmSByGoYOwjOrA==
X-CSE-MsgGUID: AfDBMYBSQjagcLjNP79p6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="33415603"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="33415603"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 07:41:08 -0700
X-CSE-ConnectionGUID: SOcn+1I1SXyUKitmhiwDFQ==
X-CSE-MsgGUID: gRvdNzCZRNSMBH7PcSXwVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="73000406"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jun 2024 07:41:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKIyG-0007gI-2g;
	Thu, 20 Jun 2024 14:41:04 +0000
Date: Thu, 20 Jun 2024 22:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ALSA: hda: cs35l56: Select SERIAL_MULTI_INSTANTIATE
Message-ID: <202406202013.xtDInLgd-lkp@intel.com>
References: <20240619161602.117452-1-simont@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619161602.117452-1-simont@opensource.cirrus.com>

Hi Simon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on linus/master v6.10-rc4 next-20240619]
[cannot apply to tiwai-sound/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Simon-Trimmer/ALSA-hda-cs35l56-Select-SERIAL_MULTI_INSTANTIATE/20240620-001810
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20240619161602.117452-1-simont%40opensource.cirrus.com
patch subject: [PATCH] ALSA: hda: cs35l56: Select SERIAL_MULTI_INSTANTIATE
config: alpha-kismet-CONFIG_SERIAL_MULTI_INSTANTIATE-CONFIG_SND_HDA_SCODEC_CS35L56_I2C-0-0 (https://download.01.org/0day-ci/archive/20240620/202406202013.xtDInLgd-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240620/202406202013.xtDInLgd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406202013.xtDInLgd-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SERIAL_MULTI_INSTANTIATE when selected by SND_HDA_SCODEC_CS35L56_I2C
   WARNING: unmet direct dependencies detected for SERIAL_MULTI_INSTANTIATE
     Depends on [n]: X86_PLATFORM_DEVICES [=n] && I2C [=y] && SPI [=y] && ACPI
     Selected by [y]:
     - SND_HDA_SCODEC_CS35L56_I2C [=y] && SOUND [=y] && SND [=y] && SND_HDA [=y] && I2C [=y] && (ACPI || COMPILE_TEST [=y]) && SND_SOC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
