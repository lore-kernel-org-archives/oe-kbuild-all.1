Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C305664C6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 14:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740408993; cv=none; b=QgaibMXnZxVh1B+7gwDVMO/0hKD2yhRwUiH4wG4GrWZ5NMqNl4WT7xa2QyLFy9OGC2hSwALMjJGTMenP1IlsfFyuFjrDfAeaHsiUyZGFgXU0KnX1BHWStg6oopRkhazyjqJ8OT17lKHRitBaqPpmqCAKFNFZA0gCcbiISnsT6JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740408993; c=relaxed/simple;
	bh=/TGppB07Js5qAkJVBln4P2jGYYYMYXUJW/kLI7oKHJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r8MrvTXmNT08CnYXx2BEH6uc6u7GU25ZnCJjrd7qga0YqyC3p5itwsX4+hgWAQIwf6yQ73GqZkITeJWy8eS3ftFGCirNXYzMyP/C9JuOBZZMeRtq4MW+FN91R4Cnsnia/IPk5U+ZY5EabJc9m2zct/RqIQXUKNR1z7b7MPuaIhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTecN3rh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTecN3rh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740408991; x=1771944991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/TGppB07Js5qAkJVBln4P2jGYYYMYXUJW/kLI7oKHJk=;
  b=HTecN3rhsN1V/n1jOrOWso5YWLw1/eNaRiHZHLRAcx0Crb+yHwYeufAw
   UskjDgSnQqPi4hX0L3jYz2afq/eNcVKMC2E08Ln8sHpE/dZ+sFAbwWjBL
   jsufvU0F9TogJDVzHaUE63pWvQEcMbYgAjc8iSzSQpJO5P5MlrPFsdzgA
   Wgh3kJHAo+hx6DWB/2l6y6dmHyoPPIs//v1mIG7fQ9hIL7KuKYp/WfJep
   xxciclAqU/gUDgWQFWpon3/Ft8c0j6J2W0dh5u0X7C2MEhIUtQpiZ4WX1
   oXtplCbtBy731LC8ATXAjhGsdQj8+C3o6DZeEXZLwfipr+wsZdE6FjVJO
   g==;
X-CSE-ConnectionGUID: E6UBNZluT7KPAyE0wcSMxQ==
X-CSE-MsgGUID: GG+HOmelTDebJFO12q4eYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41043848"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="41043848"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 06:56:31 -0800
X-CSE-ConnectionGUID: JTJ0IRGqQe2fq6/j/vmIDg==
X-CSE-MsgGUID: pgxyhxstQq2TvoYb7muAFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116706613"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Feb 2025 06:56:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmZsh-0008eb-1I;
	Mon, 24 Feb 2025 14:56:27 +0000
Date: Mon, 24 Feb 2025 22:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: Divya Prakash <divya1.prakash@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
	"Babu, Ramesh" <ramesh.babu@intel.com>
Subject: [intel-lts:pr/69 1/1] sound/hda/hdac_stream.c:369:28: warning:
 variable 'cruntime' set but not used
Message-ID: <202502242255.AyVr97Rg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/69
head:   f36ea6678b4077d9bbb4644e73977fb91d187ab7
commit: c419b592740df1e6b5943088447559e5389addf0 [1/1] ALSA: hda: Enhance HD audio framework to support compress streams
config: s390-randconfig-001-20250224 (https://download.01.org/0day-ci/archive/20250224/202502242255.AyVr97Rg-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502242255.AyVr97Rg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502242255.AyVr97Rg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/hda/hdac_stream.c: In function 'snd_hdac_stream_setup_periods':
>> sound/hda/hdac_stream.c:369:28: warning: variable 'cruntime' set but not used [-Wunused-but-set-variable]
     struct snd_compr_runtime *cruntime = NULL;
                               ^~~~~~~~


vim +/cruntime +369 sound/hda/hdac_stream.c

   355	
   356	/**
   357	 * snd_hdac_stream_setup_periods - set up BDL entries
   358	 * @azx_dev: HD-audio core stream to set up
   359	 *
   360	 * Set up the buffer descriptor table of the given stream based on the
   361	 * period and buffer sizes of the assigned PCM substream.
   362	 */
   363	int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
   364	{
   365		struct hdac_bus *bus = azx_dev->bus;
   366		struct snd_pcm_substream *substream = azx_dev->substream;
   367		struct snd_compr_stream *csubstream = azx_dev->stream;
   368		struct snd_pcm_runtime *runtime = NULL;
 > 369		struct snd_compr_runtime *cruntime = NULL;
   370		struct snd_dma_buffer *dma_buffer_p = NULL;
   371		__le32 *bdl;
   372		int i, ofs, periods, period_bytes;
   373		int pos_adj, pos_align;
   374	
   375		if (substream) {
   376			runtime = substream->runtime;
   377			dma_buffer_p = snd_pcm_get_dma_buf(substream);
   378		} else if (csubstream) {
   379			cruntime = csubstream->runtime;
   380			dma_buffer_p = csubstream->runtime->dma_buffer_p;
   381		}
   382	
   383		/* reset BDL address */
   384		snd_hdac_stream_writel(azx_dev, SD_BDLPL, 0);
   385		snd_hdac_stream_writel(azx_dev, SD_BDLPU, 0);
   386	
   387		period_bytes = azx_dev->period_bytes;
   388		periods = azx_dev->bufsize / period_bytes;
   389	
   390		/* program the initial BDL entries */
   391		bdl = (__le32 *)azx_dev->bdl.area;
   392		ofs = 0;
   393		azx_dev->frags = 0;
   394	
   395		pos_adj = bus->bdl_pos_adj;
   396		if (!azx_dev->no_period_wakeup && pos_adj > 0 && substream) {
   397			pos_align = pos_adj;
   398			pos_adj = (pos_adj * runtime->rate + 47999) / 48000;
   399			if (!pos_adj)
   400				pos_adj = pos_align;
   401			else
   402				pos_adj = ((pos_adj + pos_align - 1) / pos_align) *
   403					pos_align;
   404			pos_adj = frames_to_bytes(runtime, pos_adj);
   405			if (pos_adj >= period_bytes) {
   406				dev_warn(bus->dev, "Too big adjustment %d\n",
   407					 pos_adj);
   408				pos_adj = 0;
   409			} else {
   410				ofs = setup_bdle(bus, dma_buffer_p, azx_dev,
   411						 &bdl, ofs, pos_adj, true);
   412				if (ofs < 0)
   413					goto error;
   414			}
   415		} else
   416			pos_adj = 0;
   417	
   418		for (i = 0; i < periods; i++) {
   419			if (i == periods - 1 && pos_adj)
   420				ofs = setup_bdle(bus, dma_buffer_p, azx_dev,
   421						&bdl, ofs, period_bytes - pos_adj, 0);
   422			else
   423				ofs = setup_bdle(bus, dma_buffer_p, azx_dev,
   424						&bdl, ofs, period_bytes,
   425						!azx_dev->no_period_wakeup);
   426			if (ofs < 0)
   427				goto error;
   428		}
   429		return 0;
   430	
   431	 error:
   432		dev_err(bus->dev, "Too many BDL entries: buffer=%d, period=%d\n",
   433			azx_dev->bufsize, period_bytes);
   434		return -EINVAL;
   435	}
   436	EXPORT_SYMBOL_GPL(snd_hdac_stream_setup_periods);
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
