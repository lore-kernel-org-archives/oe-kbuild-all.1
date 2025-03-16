Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89294134CF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Mar 2025 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742126967; cv=none; b=DBZFwD0IvyJm9K4cw4UkU4jKXBpk6WD3huULxfKhO8miLpSHip583+KdvCN8dUacVrHnGSmhpRpNNbCjketewymF78TLQ2bS1IyUb9uFTpa9AtZTr2l1wvAk0mKR6u/J1HJem7JqoyF/DXrzjlOvhMrlO4ZyLboO/vP7KP61+aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742126967; c=relaxed/simple;
	bh=iQUZylo3RLLbdNRMhj6BW8pgDt6NzPhzRjcpU3mquVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cnsyun46jSWZyjjQgPH7PmNBBSI37ajKcrs/t2sdkscYhSBksYLFH9DmpEDUBbstDwC6xqTW9CAZc1lvKir09Tg8/KbHA4dO1O2NyBRZSIrLYz2Bk+nnAvfFkA6v9cIKdm1OjnxK6re5NuwBtuQVOu3Mj5RtQv0LXiDLWrNJCbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAteiE8H; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAteiE8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742126965; x=1773662965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iQUZylo3RLLbdNRMhj6BW8pgDt6NzPhzRjcpU3mquVo=;
  b=mAteiE8HbABpAzSYmEzuyTdyCFppVF3MoP2mpAXNg1h4ddeWYnH29Ivo
   nQo55N983QrcSCZqmxvZPw5gqxc9hqOw7FO9JrjsW0bd8TETSbOqY7JpN
   GTG27hcFrNxCZIP8irNS9L3CJtr6lkmRjIQjMEyH490aH4FPJ4RgsqnmI
   Qnq6PUoc414QHXGqL3NHJ2iiUyPKlUe+rNxzJWSBzDD3WjLver/DUJhey
   +eZ03TiyL3fafSVSTNdapBcRZBNbIRjKfl+y2VpTIt46A7a7F28xdfMKB
   d7Lkc/edzSF+pUmaqdmW+oarz30z7ZGgFYyxpXRdL9QGYjAdl7Nq8plNE
   w==;
X-CSE-ConnectionGUID: nIugLMlXSVexHLFeqF/K9Q==
X-CSE-MsgGUID: ELchSRZDSDWJFvCzm/+WbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="42475368"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="42475368"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 05:09:25 -0700
X-CSE-ConnectionGUID: jdYfqb7zQKyeCOHoj62/wQ==
X-CSE-MsgGUID: 6Xj5lEVrRq6nbvqrk6AfkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="121885479"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 16 Mar 2025 05:09:23 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttmnw-000BzF-38;
	Sun, 16 Mar 2025 12:09:20 +0000
Date: Sun, 16 Mar 2025 20:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [linux-next:master 8846/11207] sound/soc/sof/intel/hda-sdw-bpt.c:83:
 undefined reference to `snd_hdac_ext_bus_link_clear_stream_id'
Message-ID: <202503162042.2cNgaBmC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   da920b7df701770e006928053672147075587fb2
commit: 5d5cb86fb46ea1c7efd3b894f63fe364e5847043 [8846/11207] ASoC: SOF: Intel: hda-sdw-bpt: add helpers for SoundWire BPT DMA
config: x86_64-randconfig-073-20250316 (https://download.01.org/0day-ci/archive/20250316/202503162042.2cNgaBmC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503162042.2cNgaBmC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503162042.2cNgaBmC-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `hda_sdw_bpt_dma_prepare':
   sound/soc/sof/intel/hda-sdw-bpt.c:57: undefined reference to `snd_hdac_ext_bus_link_set_stream_id'
   ld: vmlinux.o: in function `hda_sdw_bpt_dma_deprepare':
>> sound/soc/sof/intel/hda-sdw-bpt.c:83: undefined reference to `snd_hdac_ext_bus_link_clear_stream_id'


vim +83 sound/soc/sof/intel/hda-sdw-bpt.c

    61	
    62	static int hda_sdw_bpt_dma_deprepare(struct device *dev, struct hdac_ext_stream *sdw_bpt_stream,
    63					     struct snd_dma_buffer *dmab_bdl)
    64	{
    65		struct snd_sof_dev *sdev = dev_get_drvdata(dev);
    66		int ret;
    67	
    68		ret = hda_cl_cleanup(sdev->dev, dmab_bdl, true, sdw_bpt_stream);
    69		if (ret < 0) {
    70			dev_err(sdev->dev, "%s: SDW BPT DMA cleanup failed\n",
    71				__func__);
    72			return ret;
    73		}
    74	
    75		if (hdac_stream(sdw_bpt_stream)->direction == SNDRV_PCM_STREAM_PLAYBACK) {
    76			struct hdac_bus *bus = sof_to_bus(sdev);
    77			struct hdac_ext_link *hlink;
    78			int stream_tag;
    79	
    80			stream_tag = hdac_stream(sdw_bpt_stream)->stream_tag;
    81			hlink = hdac_bus_eml_sdw_get_hlink(bus);
    82	
  > 83			snd_hdac_ext_bus_link_clear_stream_id(hlink, stream_tag);
    84		}
    85	
    86		return 0;
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
