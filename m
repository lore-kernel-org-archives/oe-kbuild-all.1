Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872E11B143E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 19:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718910623; cv=none; b=Q54CGEkbW9Y1rkzMM68oTmqgSTYv/V5OpS2IKE2z1a/6gat8M/16sYhMhYN6QqN9d5WSCOAu160pYKPTejoSbQDEaC5i1n8YSdnmzfyTZKoJ+Ib9OJ5WjbRGtq/Sfvh+rsAsPDnCBz4eBQ7ADXsPPP94jv+zlC1bkhcVHK80FH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718910623; c=relaxed/simple;
	bh=nsiAro+XfkBJNZ2EERxONuDImugxiBGO2+gZtb5YmNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMZZRm0YXpd0KnDlZcg0ISWskjabEbI6VB3lpkRsGgmUhWu9dWAxjqaOWuV5dNwtOMz9DtlYYqyED3CutVS8fqbYHG/bcqbQnfoY0Rp+aAO4qIII0s8HSi0Sfbrt8GZrLa/TMaA7vgPDMmC9FZPWkobNunWFc+TS1Vm0wTq48PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBLjtMng; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBLjtMng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718910621; x=1750446621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nsiAro+XfkBJNZ2EERxONuDImugxiBGO2+gZtb5YmNI=;
  b=QBLjtMngO8+VL9s6NXSl8SAqa9EZKFtd06lVQop/s34Nb9xd7/UkbqoH
   C9JLpqcL+Gp02U8toMnr63jp2DwxBbMyv3gklzOnM1qG9XWPnE4XwxZPV
   N/JeJTu0NbPhi55r4ZKYUM8HhfHD6Kd6MQHB7K/ytjMx4GCjWtL7m8jk/
   kew7FQZigroxKh2AWqQdCSB4kTMzaCEZtKQD83A9rvvh+vEQUO/uL8BuJ
   zzEAJ+PV+YkdihfLP+p2gUFU1BL7peCqLhbhktUqQcHp79/2vEKFWBWUI
   cu6ofPv+TexxxffIJHEvC0dcUeMXDYq7oWKAMfiH1Yx7xRRS9ppLkBJnM
   Q==;
X-CSE-ConnectionGUID: I23MhtcfTCGtO1tjzVPbnQ==
X-CSE-MsgGUID: Vxw67bvGRPCMjYjh19ZRIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16063725"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="16063725"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 12:10:20 -0700
X-CSE-ConnectionGUID: k37ejxC7SQWivIj3nv7kHA==
X-CSE-MsgGUID: 2oMm/pfYSUWqApjD78bdQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="73552734"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Jun 2024 12:10:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKNAm-0007rI-11;
	Thu, 20 Jun 2024 19:10:16 +0000
Date: Fri, 21 Jun 2024 03:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ALSA: hda: cs35l56: Select SERIAL_MULTI_INSTANTIATE
Message-ID: <202406210255.gseBZ33b-lkp@intel.com>
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
[also build test WARNING on linus/master v6.10-rc4]
[cannot apply to tiwai-sound/for-linus next-20240620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Simon-Trimmer/ALSA-hda-cs35l56-Select-SERIAL_MULTI_INSTANTIATE/20240620-001810
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20240619161602.117452-1-simont%40opensource.cirrus.com
patch subject: [PATCH] ALSA: hda: cs35l56: Select SERIAL_MULTI_INSTANTIATE
config: alpha-kismet-CONFIG_SERIAL_MULTI_INSTANTIATE-CONFIG_SND_HDA_SCODEC_CS35L56_SPI-0-0 (https://download.01.org/0day-ci/archive/20240621/202406210255.gseBZ33b-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240621/202406210255.gseBZ33b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210255.gseBZ33b-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SERIAL_MULTI_INSTANTIATE when selected by SND_HDA_SCODEC_CS35L56_SPI
   WARNING: unmet direct dependencies detected for SERIAL_MULTI_INSTANTIATE
     Depends on [n]: X86_PLATFORM_DEVICES [=n] && I2C [=n] && SPI [=y] && ACPI
     Selected by [y]:
     - SND_HDA_SCODEC_CS35L56_SPI [=y] && SOUND [=y] && SND [=y] && SND_HDA [=y] && SPI_MASTER [=y] && (ACPI || COMPILE_TEST [=y]) && SND_SOC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
