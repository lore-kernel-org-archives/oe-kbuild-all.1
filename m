Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDF027718
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 18:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695147547; x=1726683547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3FR81ZkNHRdK+lOnUeVZcaHcl/uafUM0C3FgoIlRkag=;
  b=eEwN37URhJazXMyXHG7P3xtqnhoTt4g//e+Hk0MCMyYTq6uD4Ao0hOEe
   HDH3ttZt40pJjFrFqygu1lKGc/t9yHBHT41TY0IRBNmZsvSf8HoJGUU7u
   nbux+nl9hlZ1V4Kn8hmB+cZEBb43de1FS2vGBLvjRgu7efgK4skQMq+iq
   8m463CMMWmkULRFGYigVmMUmsMdXD3WFhWFz5me7QU+TsmiTXN5XN3+Ql
   QiFrj7UQ3AcrtAUw8ObO7GbBiJk+L7vgkSilacXF/cT6xqp0ZWkPrmzf0
   qmWvLbN1UQ360Ns/bjhPtmY+zt66Tj9IdkbTjZo6RNrBR+DgTzjfNNrsN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="378909638"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="378909638"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 11:19:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="722966010"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="722966010"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Sep 2023 11:19:03 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qifJN-0007n9-1e;
	Tue, 19 Sep 2023 18:19:01 +0000
Date: Wed, 20 Sep 2023 02:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/2] ALSA: hda: cs35l41: Support mute notifications
 for CS35L41 HDA
Message-ID: <202309200216.1V4V854z-lkp@intel.com>
References: <20230919142240.467682-2-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919142240.467682-2-sbinding@opensource.cirrus.com>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230919]
[cannot apply to tiwai-sound/for-next tiwai-sound/for-linus v6.6-rc2 v6.6-rc1 v6.5 linus/master v6.6-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Binding/ALSA-hda-cs35l41-Support-mute-notifications-for-CS35L41-HDA/20230920-005359
base:   next-20230919
patch link:    https://lore.kernel.org/r/20230919142240.467682-2-sbinding%40opensource.cirrus.com
patch subject: [PATCH v3 1/2] ALSA: hda: cs35l41: Support mute notifications for CS35L41 HDA
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309200216.1V4V854z-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200216.1V4V854z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200216.1V4V854z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/hda/patch_realtek.c: In function 'comp_acpi_device_notify':
   sound/pci/hda/patch_realtek.c:6718:52: error: implicit declaration of function 'acpi_device_handle'; did you mean 'acpi_fwnode_handle'? [-Werror=implicit-function-declaration]
    6718 |                         spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
         |                                                    ^~~~~~~~~~~~~~~~~~
         |                                                    acpi_fwnode_handle
   sound/pci/hda/patch_realtek.c:6718:52: warning: passing argument 1 of 'spec->comps[i].acpi_notify' makes pointer from integer without a cast [-Wint-conversion]
    6718 |                         spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                    |
         |                                                    int
   sound/pci/hda/patch_realtek.c:6718:52: note: expected 'acpi_handle' {aka 'void *'} but argument is of type 'int'
   sound/pci/hda/patch_realtek.c: At top level:
>> sound/pci/hda/patch_realtek.c:6708:13: warning: 'comp_acpi_device_notify' defined but not used [-Wunused-function]
    6708 | static void comp_acpi_device_notify(acpi_handle handle, u32 event, void *data)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/comp_acpi_device_notify +6708 sound/pci/hda/patch_realtek.c

  6707	
> 6708	static void comp_acpi_device_notify(acpi_handle handle, u32 event, void *data)
  6709	{
  6710		struct hda_codec *cdc = data;
  6711		struct alc_spec *spec = cdc->spec;
  6712		int i;
  6713	
  6714		codec_info(cdc, "ACPI Notification %d\n", event);
  6715	
  6716		for (i = 0; i < HDA_MAX_COMPONENTS; i++) {
  6717			if (spec->comps[i].dev && spec->comps[i].acpi_notify)
> 6718				spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
  6719							   spec->comps[i].dev);
  6720		}
  6721	}
  6722	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
