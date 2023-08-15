Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB0415AD7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 21:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692136636; x=1723672636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ADvwf2HGuekaNoBBQq81m4JoPS9Dwg8yO0uDkBF2xI=;
  b=SWbKGYTbHkKee2zTvsmHIGyyztrCl7CWUCVmbLJeH/VNdNYooRg0noik
   7/X5SUAN9rCfYKMQ08nxwgslBY0ySCVrGgz6jL9NI/vZ7vOfLoredQJZb
   fOFfBy/crGc+ZUtJ9SwJILJkaG6wjNsBRWIMsGSnAOLyaoFkRoZ03IDPB
   hLHdV1X7rjntRorLo/Eo5RarPRuemQewv78bsuFblb3KdIMsFoJhlc7eU
   /8QH20ET0eFo6z0d3snunM8Hoc0cToEn7nIXfU0NKvgNDWjZBEoSBknNr
   Y47B7hFXbfEy16aj6I37izuRJKTNSEd8KRusfRIiVJD6jFYbx2JTf0+KK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403365267"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="403365267"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 14:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="768969299"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="768969299"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Aug 2023 14:57:14 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW22L-0001GB-1z;
	Tue, 15 Aug 2023 21:57:13 +0000
Date: Wed, 16 Aug 2023 05:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 28/28]
 sound/pci/hda/cs35l41_hda_property.c:64:59: warning: ordered comparison of
 pointer with integer zero
Message-ID: <202308160506.8lCEeFDG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   ef4ba63f12b03532378395a8611f2f6e22ece67b
commit: ef4ba63f12b03532378395a8611f2f6e22ece67b [28/28] ALSA: hda: cs35l41: Support systems with missing _DSD properties
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230816/202308160506.8lCEeFDG-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160506.8lCEeFDG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308160506.8lCEeFDG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/hda/cs35l41_hda_property.c: In function 'cs35l41_add_dsd_properties':
>> sound/pci/hda/cs35l41_hda_property.c:64:59: warning: ordered comparison of pointer with integer zero [-Wextra]
      64 |         for (model = cs35l41_prop_model_table; model->hid > 0; model++) {
         |                                                           ^


vim +64 sound/pci/hda/cs35l41_hda_property.c

    58	
    59	int cs35l41_add_dsd_properties(struct cs35l41_hda *cs35l41, struct device *physdev, int id,
    60				       const char *hid)
    61	{
    62		const struct cs35l41_prop_model *model;
    63	
  > 64		for (model = cs35l41_prop_model_table; model->hid > 0; model++) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
