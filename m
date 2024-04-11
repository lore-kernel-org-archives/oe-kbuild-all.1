Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6985613BADE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 03:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712806809; cv=none; b=i93PTcdofLdepQdFy+JGceThUTu+RXHIaVYxcIo5xEcMSHOGE5tegN8SvrcyqAM0jTItXcxkYDNsrrtvQ6TTcRSIJ36IU759BSlT4IXLQTJKSbqF9wMvEpnYz2JRLfI8iBn8t370WMVLCH3kxSWefW3w0YX9QLfwcRpltvsifC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712806809; c=relaxed/simple;
	bh=2vVOJkm9dcqmIFTabw4YgBLSFIUdPWkH3GowrVie1xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVnI/Dc9Wfj+rrrFsEaHrUi0eBbxPhdgfC0chtcFZxGt8jlufbTyPmK2CZFOUgDtbweaZ4bNG7xejnMm4Yv7QkW1IeZGfEqRC6+t0a3zf9YtDXH8so61BP1i5V2Cl7x6b17O7RuM1snVc7X5xcUpXLG3PgCj4qigbz27v6+B1dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmJCtE+S; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmJCtE+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712806807; x=1744342807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2vVOJkm9dcqmIFTabw4YgBLSFIUdPWkH3GowrVie1xo=;
  b=SmJCtE+SmF1g9fv2SGFeFMDMm6xnNGkKKBH74S8zCf407l98QF2zIana
   //d82Q7Lg7SD/vPl2DUVjas3+wjrtPLd/L2N41J/tJD6Fi/BpkQnoteVt
   JLnf48QGwEYCzbDw29G/MJYfJUVov8YcTNgWqvkGQhXyd3Em3cpICtqNM
   +dtD6McwjnxPSEEbKgWs9F3oSxiIzgwBPnuAO4flwAhL3V3IZzqpZ6jq5
   SUluufQv4FA/Csymdl6YnNWHO8svaXmbXjM3CGa50YbdRi/3oCEDH73AF
   RMWLvho5fxAPvf8oDIEBt/d4DpYbtkLH+/3c9BCY7Kjd1Jz35gXW2+sOf
   g==;
X-CSE-ConnectionGUID: O+V5ttpyRAeHR8+i5ZoNLg==
X-CSE-MsgGUID: 4oSNBxNYS7qoYQkXmftjjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8375825"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8375825"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 20:40:05 -0700
X-CSE-ConnectionGUID: JzFuyIHkS1mooMbLng2hCQ==
X-CSE-MsgGUID: SpoaNdRSSfCRG/krM6/zWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="20805023"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2024 20:40:03 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rulI9-0008As-01;
	Thu, 11 Apr 2024 03:40:01 +0000
Date: Thu, 11 Apr 2024 11:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	Stefan Binding <sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1 1/7] ALSA: hda: cs35l41: Set the max PCM Gain using
 tuning setting
Message-ID: <202404111107.rM73jRGt-lkp@intel.com>
References: <20240410155223.7164-2-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410155223.7164-2-sbinding@opensource.cirrus.com>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.9-rc3 next-20240410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Binding/ALSA-hda-cs35l41-Set-the-max-PCM-Gain-using-tuning-setting/20240410-235446
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20240410155223.7164-2-sbinding%40opensource.cirrus.com
patch subject: [PATCH v1 1/7] ALSA: hda: cs35l41: Set the max PCM Gain using tuning setting
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20240411/202404111107.rM73jRGt-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111107.rM73jRGt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111107.rM73jRGt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:566,
                    from include/asm-generic/bug.h:22,
                    from arch/loongarch/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/loongarch/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from sound/pci/hda/cs35l41_hda.c:9:
   sound/pci/hda/cs35l41_hda.c: In function 'cs35l41_load_tuning_params':
>> sound/pci/hda/cs35l41_hda.c:565:39: warning: '%s' directive argument is null [-Wformat-overflow=]
     565 |                 dev_dbg(cs35l41->dev, "Missing Tuning Param File: %s: %d\n",
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   sound/pci/hda/cs35l41_hda.c:565:17: note: in expansion of macro 'dev_dbg'
     565 |                 dev_dbg(cs35l41->dev, "Missing Tuning Param File: %s: %d\n",
         |                 ^~~~~~~
   sound/pci/hda/cs35l41_hda.c:565:67: note: format string is defined here
     565 |                 dev_dbg(cs35l41->dev, "Missing Tuning Param File: %s: %d\n",
         |                                                                   ^~


vim +565 sound/pci/hda/cs35l41_hda.c

   555	
   556	static int cs35l41_load_tuning_params(struct cs35l41_hda *cs35l41, char *tuning_filename)
   557	{
   558		const struct firmware *tuning_param_file = NULL;
   559		char *tuning_param_filename = NULL;
   560		int ret;
   561	
   562		ret = cs35l41_request_tuning_param_file(cs35l41, tuning_filename, &tuning_param_file,
   563							&tuning_param_filename, cs35l41->acpi_subsystem_id);
   564		if (ret) {
 > 565			dev_dbg(cs35l41->dev, "Missing Tuning Param File: %s: %d\n",
   566				tuning_param_filename, ret);
   567			return 0;
   568		}
   569	
   570		ret = cs35l41_read_tuning_params(cs35l41, tuning_param_file);
   571		if (ret) {
   572			dev_err(cs35l41->dev, "Error reading Tuning Params from file: %s: %d\n",
   573				tuning_param_filename, ret);
   574			/* Reset to default Tuning Parameters */
   575			cs35l41_set_default_tuning_params(cs35l41);
   576		}
   577	
   578		release_firmware(tuning_param_file);
   579		kfree(tuning_param_filename);
   580	
   581		return ret;
   582	}
   583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
