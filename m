Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FD313DDAA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728898329; cv=none; b=Yg2yQAlR9le7zE78lQ4gq6BikJZDwgfj/gjc9tg/wzSrmS4QiHoFCTkYoRShlo7WZUM/FWLf5IIVEDVTJgOUwekjJxZvLwS8rT4gYsEC8ma1MgPj20D1WfB9UYYlP7LcRFkd4g8VKRmRCGTY9yFNNWAGhPrjDCMS1SjYabRjw2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728898329; c=relaxed/simple;
	bh=IlDfWywMkDy1/yps7ONr78oYawji6pl/sxY/6NJ20rg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y1y9CAnr1ZtVxfx5hz3KKrGnZvMcDJXf1iISAUKFM2PFQe4x54Elv5DNfSys+9lQzEp5YBCvUaiOo1QvqRtJg08Qq9sOSzQKjOcls96gWqPRjHCAiWUf60hde/6eSz6QoEcXL+w1Umwh2mJODda4TzpvyO9YjhdXXvYqWmTEdb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUjWTZZu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUjWTZZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728898327; x=1760434327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IlDfWywMkDy1/yps7ONr78oYawji6pl/sxY/6NJ20rg=;
  b=DUjWTZZu+shKuEcQVVB6Ts+0CAivNBzapYxV1HcH1B6P7HW/oOZuGuMz
   rf2gCCwJp0M8lUaKzdgru7ck1mZj/oO/x6phxSgjvoF5JJ4sl7oCrUWM1
   RWltuxIie5MmSyXSCaJiB6aTeo45V+yDjRdSHorv6X4vx/BJykLVoilQG
   SFtONtB5obE6FZyxGW795fGIccUWjwfIhMKXrurwPjG65Bso/SpEliQT3
   1Fyg6Iwnnna7n+BqS8wO7OqU3iINFhnZU2Bnds5hZ+8z8zhvRcPhRgVxc
   B7KZGgS8O2WxtLdLtNYUH4yQu5Fx0VWLwSIktDPBK2k6JDG5PxTITe5du
   g==;
X-CSE-ConnectionGUID: u3wyzXPORXWtH0zmgsOSng==
X-CSE-MsgGUID: f7eBRbH/R5u46K6Eo42tOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="27696091"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="27696091"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 02:31:58 -0700
X-CSE-ConnectionGUID: CwdgGs0gRrOD9okJXw9a0A==
X-CSE-MsgGUID: zgJJtuqtT+eHvjyWgOaWaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="81515024"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Oct 2024 02:31:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0HQh-000F8n-0E;
	Mon, 14 Oct 2024 09:31:55 +0000
Date: Mon, 14 Oct 2024 17:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:for-next 9/14] sound/pci/hda/hda_local.h:312:58: error:
 'const struct hda_quirk' has no member named 'name'
Message-ID: <202410141700.bF6I8r36-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   0ddf2784d6c29e59409a62b8f32dc5abe56135a4
commit: 1f55e3699fc9ced72400cdca39fe248bf2b288a2 [9/14] ALSA: hda/conexant: Use the new codec SSID matching
config: i386-buildonly-randconfig-006-20241014 (https://download.01.org/0day-ci/archive/20241014/202410141700.bF6I8r36-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410141700.bF6I8r36-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141700.bF6I8r36-lkp@intel.com/

Note: the tiwai-sound/for-next HEAD 0ddf2784d6c29e59409a62b8f32dc5abe56135a4 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from sound/pci/hda/patch_conexant.c:18:
>> sound/pci/hda/hda_local.h:312:58: error: 'const struct hda_quirk' has no member named 'name'
     312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
         |                                                          ^~~~
   sound/pci/hda/patch_conexant.c:1081:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
    1081 |         HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
         |         ^~~~~~~~~~~~~~~
>> sound/pci/hda/hda_local.h:312:65: warning: excess elements in struct initializer
     312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
         |                                                                 ^
   sound/pci/hda/patch_conexant.c:1081:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
    1081 |         HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
         |         ^~~~~~~~~~~~~~~
   sound/pci/hda/hda_local.h:312:65: note: (near initialization for 'cxt5066_fixups[47]')
     312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
         |                                                                 ^
   sound/pci/hda/patch_conexant.c:1081:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
    1081 |         HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
         |         ^~~~~~~~~~~~~~~
>> sound/pci/hda/hda_local.h:312:58: error: 'const struct hda_quirk' has no member named 'name'
     312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
         |                                                          ^~~~
   sound/pci/hda/patch_conexant.c:1082:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
    1082 |         HDA_CODEC_QUIRK(0x2782, 0x12c5, "Sirius Gen2", CXT_PINCFG_TOP_SPEAKER),
         |         ^~~~~~~~~~~~~~~
>> sound/pci/hda/hda_local.h:312:65: warning: excess elements in struct initializer
     312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
         |                                                                 ^
   sound/pci/hda/patch_conexant.c:1082:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
    1082 |         HDA_CODEC_QUIRK(0x2782, 0x12c5, "Sirius Gen2", CXT_PINCFG_TOP_SPEAKER),
         |         ^~~~~~~~~~~~~~~
   sound/pci/hda/hda_local.h:312:65: note: (near initialization for 'cxt5066_fixups[48]')
     312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
         |                                                                 ^
   sound/pci/hda/patch_conexant.c:1082:9: note: in expansion of macro 'HDA_CODEC_QUIRK'
    1082 |         HDA_CODEC_QUIRK(0x2782, 0x12c5, "Sirius Gen2", CXT_PINCFG_TOP_SPEAKER),
         |         ^~~~~~~~~~~~~~~


vim +312 sound/pci/hda/hda_local.h

5b1913a79c3e05 Takashi Iwai 2024-10-08  310  
5b1913a79c3e05 Takashi Iwai 2024-10-08  311  #define HDA_CODEC_QUIRK(vend, dev, xname, val) \
5b1913a79c3e05 Takashi Iwai 2024-10-08 @312  	{ _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
5b1913a79c3e05 Takashi Iwai 2024-10-08  313  			.match_codec_ssid = true }
5b1913a79c3e05 Takashi Iwai 2024-10-08  314  

:::::: The code at line 312 was first introduced by commit
:::::: 5b1913a79c3e0518d9c5db343fa9fc4edcea041f ALSA: hda: Use own quirk lookup helper

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
