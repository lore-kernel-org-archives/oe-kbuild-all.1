Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2181612DD8E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 13:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714569263; cv=none; b=URN5b+1F6x40kGfyCqLKP2H+8zVaatlaebrFSZYDONwE7k+4BnjsZIwT4mlYmiCN9s29SzqTMQTBc1fXshq2nj7sC+Kfk4uGSz56GccUB+HgVIaS1IQ+wAY2WFoVaRReD2wcj9wM4Jx18dvUYOOLf35UMg877oxvBxh3my2gVCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714569263; c=relaxed/simple;
	bh=HfV4kgBvTku/Rf9UM+/VT/RrM7Gk/YlpY2iYFJtoBsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TOCQtOEUUAbT3vLQ1jyb1EMZDFPjyGQegFBSp4lDsjNCzJW2EiEgS91XGvSx4hdGNGlW0+d449bSPqQQLIvqBiWSHbo+RWQp+O+XwuezyUpQ7hfDdJOIOl7cwPoSrlPNmLaeSEY2y5SqjkLPGx7Hr/Nd0QgqDd+2uOttZaTpEuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ghm3lHPa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ghm3lHPa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714569261; x=1746105261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HfV4kgBvTku/Rf9UM+/VT/RrM7Gk/YlpY2iYFJtoBsA=;
  b=Ghm3lHPawBoJOKhr+IhoJBNnzVKyBIvZxgCIMUSkXOjuZ83uOGFpOMqH
   FyAiwsgJt+WpCGAzqPCcqW0PnV1DusAr21CaaaFehht5GRpInL7yWf7bm
   lS9NLNP2eKFs36le6HWWy9ps8W1DaJZyoio9P6A62BuiVhaJ5Sfkyu0tt
   tEMK0+lk0+SGLpEM7a+iMtKpgbNpPpZUcYs5zyXLxRojQHn+cZ3es3QgK
   fLg5ZKzoEexDsMOWfg+lrcym10YNwqARYjibYhoA031/ddJ9x9wP+ewkb
   A0ts9SNcIs/ImZbOFrWIaGetDObcxvOdrTFeoWSu8Ai5IjgVBmZA/QQjs
   Q==;
X-CSE-ConnectionGUID: mNwZzyhbQ2O/alagkubhbA==
X-CSE-MsgGUID: xMzRcqDKRnadR4cYfbbb/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="20842598"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="20842598"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 06:14:21 -0700
X-CSE-ConnectionGUID: HjObI1AhRnK4oI61MMKkyQ==
X-CSE-MsgGUID: g/E2ajAPQz+qPGqBYdpSew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="64265685"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 May 2024 06:14:19 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s29mq-0009Xo-2O;
	Wed, 01 May 2024 13:14:16 +0000
Date: Wed, 1 May 2024 21:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kailang Yang <kailang@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 9797/10134]
 sound/pci/hda/patch_realtek.c:7222:13: error: 'struct alc_spec' has no
 member named 'power_hook'
Message-ID: <202405012104.Dr7h318W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f68868ba718e30594165879cc3020607165b0761
commit: 1e707769df072757bdcafab158bb159ead73daa4 [9797/10134] ALSA: hda/realtek - Set GPIO3 to default at S4 state for Thinkpad with ALC1318
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240501/202405012104.Dr7h318W-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405012104.Dr7h318W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405012104.Dr7h318W-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/pci/hda/patch_realtek.c: In function 'alc287_fixup_lenovo_thinkpad_with_alc1318':
>> sound/pci/hda/patch_realtek.c:7222:13: error: 'struct alc_spec' has no member named 'power_hook'
    7222 |         spec->power_hook = alc287_s4_power_gpio3_default;
         |             ^~


vim +7222 sound/pci/hda/patch_realtek.c

  7214	
  7215	static void alc287_fixup_lenovo_thinkpad_with_alc1318(struct hda_codec *codec,
  7216				       const struct hda_fixup *fix, int action)
  7217	{
  7218		struct alc_spec *spec = codec->spec;
  7219	
  7220		if (action != HDA_FIXUP_ACT_PRE_PROBE)
  7221			return;
> 7222		spec->power_hook = alc287_s4_power_gpio3_default;
  7223		spec->gen.pcm_playback_hook = alc287_alc1318_playback_pcm_hook;
  7224	}
  7225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
