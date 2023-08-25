Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD19D523
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 13:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692970207; x=1724506207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SE0GPPGuGVla4ffFlLmr2AKmEA+L7zTsjzfS23WMDOI=;
  b=MNL/ovOV0p1nDcIG1Ei082WPNxuYRz+JWy8aUIOP+4bxxo2NR2dNosa8
   HsYTbXwYPPuHp1ZkQ+HK1bhSgLhCLozkP3ffomSU8/5QS/g+5h/4QqirW
   xTjE3TzjiI0Vnb7Wq73SB53LI+gLqo74Y1aTZQdm4TxMM2UV+bVPfL9D4
   wy0LSiKThhMmYag0HojgISCfv07GgRaQ1GtvZlHP6rnAjem4N4Bhnb4YA
   /5wxDjHYbISDoIJyt8WCNDej3UwVjBttYINxzXg5atn/3Cue9XFK2UJWC
   9HE5+IjiAbNlWXgzWucpITfXNBGNQ9YCvngcaOcxUSv3M/1cYCrnLCXRE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="359711313"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="359711313"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 06:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="766955947"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="766955947"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Aug 2023 06:29:53 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZWsq-0003cI-1g;
	Fri, 25 Aug 2023 13:29:52 +0000
Date: Fri, 25 Aug 2023 21:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1] ALSA: hda: cs35l41: Support mute notifications for
 CS35L41 HDA
Message-ID: <202308252129.LN14FqG9-lkp@intel.com>
References: <20230825120525.1337417-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825120525.1337417-1-sbinding@opensource.cirrus.com>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on next-20230825]
[cannot apply to tiwai-sound/for-linus linus/master v6.5-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Binding/ALSA-hda-cs35l41-Support-mute-notifications-for-CS35L41-HDA/20230825-200835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230825120525.1337417-1-sbinding%40opensource.cirrus.com
patch subject: [PATCH v1] ALSA: hda: cs35l41: Support mute notifications for CS35L41 HDA
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230825/202308252129.LN14FqG9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308252129.LN14FqG9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308252129.LN14FqG9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/hda/patch_realtek.c: In function 'comp_acpi_device_notify':
   sound/pci/hda/patch_realtek.c:6717:52: error: implicit declaration of function 'acpi_device_handle'; did you mean 'acpi_fwnode_handle'? [-Werror=implicit-function-declaration]
    6717 |                         spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
         |                                                    ^~~~~~~~~~~~~~~~~~
         |                                                    acpi_fwnode_handle
>> sound/pci/hda/patch_realtek.c:6717:52: warning: passing argument 1 of 'spec->comps[i].acpi_notify' makes pointer from integer without a cast [-Wint-conversion]
    6717 |                         spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                    |
         |                                                    int
   sound/pci/hda/patch_realtek.c:6717:52: note: expected 'acpi_handle' {aka 'void *'} but argument is of type 'int'
   sound/pci/hda/patch_realtek.c: In function 'comp_bind':
   sound/pci/hda/patch_realtek.c:6737:47: error: invalid use of undefined type 'struct acpi_device'
    6737 |         ret = acpi_install_notify_handler(adev->handle, ACPI_DEVICE_NOTIFY,
         |                                               ^~
   sound/pci/hda/patch_realtek.c: In function 'comp_unbind':
   sound/pci/hda/patch_realtek.c:6760:46: error: invalid use of undefined type 'struct acpi_device'
    6760 |         ret = acpi_remove_notify_handler(adev->handle, ACPI_DEVICE_NOTIFY,
         |                                              ^~
   cc1: some warnings being treated as errors


vim +6717 sound/pci/hda/patch_realtek.c

  6706	
  6707	static void comp_acpi_device_notify(acpi_handle handle, u32 event, void *data)
  6708	{
  6709		struct hda_codec *cdc = data;
  6710		struct alc_spec *spec = cdc->spec;
  6711		int i;
  6712	
  6713		codec_info(cdc, "ACPI Notification %d\n", event);
  6714	
  6715		for (i = 0; i < HDA_MAX_COMPONENTS; i++) {
  6716			if (spec->comps[i].dev && spec->comps[i].acpi_notify)
> 6717				spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
  6718							   spec->comps[i].dev);
  6719		}
  6720	}
  6721	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
