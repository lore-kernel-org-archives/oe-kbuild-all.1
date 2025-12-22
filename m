Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A96E10E3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 21:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766439973; cv=none; b=fgrXehicmXfU1dgPzwrxoHj/WOeJIysPOd8CgtGjWOgGCsvftBNrSe0nZ9D2hJ4oSfHM0bjq0TjJyl9r4wdqDIaVFw6pOYQyzqd5D6fJ7toD9m+SCgcHAu1xCEcOhsEAFkHSK+4NjIYAAptxSZ2zg50iBZQD+ztqxII9kmvkmMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766439973; c=relaxed/simple;
	bh=TAT00+Hzv3QSjJfBghVA7ChN6ex3G2LzXl/vRW0YrSs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JX77NoEIpr3xEdTf2hCjQmqs2UKuEAhv8cvQsEAlOVmB2KDA5dWunJ1vVPVCraJ/dKScZ/2D1XxXg8PjMveLoJd7JmaSl6c1OLekXHFfWOS7wUw42pPFED0UwkrmWe/WDPYlRK9L1Kv9bp0q/+f1yzmTTf/LZKC4akqyIGz8Mjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CK+lS039; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CK+lS039"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766439972; x=1797975972;
  h=date:from:to:cc:subject:message-id;
  bh=TAT00+Hzv3QSjJfBghVA7ChN6ex3G2LzXl/vRW0YrSs=;
  b=CK+lS039+ypXlO3weeze/Zz/83YUbLFq/Z8lf0JTtGKcSQgbFyOVw87v
   ZlPNOsihfcQrKOp2AKAcxO3SGQAKUW8+zkweZiiCrTNfmAM1kLjhj+l8N
   q3F2inYDuzq5bMWK04muRcjt8A0S8IWdlPRakTGDjwQOSlqCYV2GzI6mx
   GpUDQtGHjBpSi5YqmY6zNJ+rBKruTSAVRCLzqPUOdMbng6alP+zfn+9Nb
   1n65sAPxG4zT2hLB0GYM0GvmYq0bdYaWH3HP+mH4mQjk7SwtGcaxsVuL2
   ZWdMWdmmqsftnJBoMkaJs/FBxWbEC2Au+2HBSII3V5seyYbUdlhJ9VSt9
   g==;
X-CSE-ConnectionGUID: QtrUjxCIT3uJ5QVcH4+/CA==
X-CSE-MsgGUID: K0t/QMdBTkiysu8y9bUIfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="71927970"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="71927970"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 13:46:10 -0800
X-CSE-ConnectionGUID: 2pAOYFx9SaSGdNj2rtbaeQ==
X-CSE-MsgGUID: TwUVXmywRwiDns71guvEqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199650651"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2025 13:46:08 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXnj8-0000000019p-47od;
	Mon, 22 Dec 2025 21:46:03 +0000
Date: Tue, 23 Dec 2025 05:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thesofproject:topic/sof-dev 10/12]
 sound/soc/sof/intel/hda-stream.c:338:undefined reference to
 `snd_hdac_ext_stream_release'
Message-ID: <202512230505.SZOHdcz7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   e00fe1471431b89ac2b01eb02ba235375d8ff9e0
commit: 6b853091b657ec17abbe58365ce2ec26cbeeceef [10/12] ASoC: SOF: Intel: add hda_dsp_stream_pair_get/put helpers
config: x86_64-randconfig-161-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230505.SZOHdcz7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230505.SZOHdcz7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230505.SZOHdcz7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `_hda_dsp_stream_put':
>> sound/soc/sof/intel/hda-stream.c:338:(.text+0x3293a27): undefined reference to `snd_hdac_ext_stream_release'


vim +338 sound/soc/sof/intel/hda-stream.c

   285	
   286	/* free a stream */
   287	static int _hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag, bool pair)
   288	{
   289		const struct sof_intel_dsp_desc *chip_info =  get_chip_info(sdev->pdata);
   290		struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
   291		struct hdac_bus *bus = sof_to_bus(sdev);
   292		struct sof_intel_hda_stream *hda_stream;
   293		struct hdac_ext_stream *hext_stream;
   294		struct hdac_ext_stream *link_stream;
   295		struct hdac_stream *s;
   296		bool dmi_l1_enable = true;
   297		bool found = false;
   298	
   299		spin_lock_irq(&bus->reg_lock);
   300	
   301		/*
   302		 * close stream matching the stream tag and check if there are any open streams
   303		 * that are DMI L1 incompatible.
   304		 */
   305		list_for_each_entry(s, &bus->stream_list, list) {
   306			hext_stream = stream_to_hdac_ext_stream(s);
   307			hda_stream = container_of(hext_stream, struct sof_intel_hda_stream, hext_stream);
   308	
   309			if (!s->opened)
   310				continue;
   311	
   312			if (s->direction == direction && s->stream_tag == stream_tag) {
   313				s->opened = false;
   314				found = true;
   315				if (pair)
   316					link_stream = hext_stream;
   317			} else if (!(hda_stream->flags & SOF_HDA_STREAM_DMI_L1_COMPATIBLE)) {
   318				dmi_l1_enable = false;
   319			}
   320		}
   321	
   322		spin_unlock_irq(&bus->reg_lock);
   323	
   324		/* Enable DMI L1 if permitted */
   325		if (chip_info->hw_ip_version < SOF_INTEL_ACE_1_0 && dmi_l1_enable) {
   326			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, HDA_VS_INTEL_EM2,
   327						HDA_VS_INTEL_EM2_L1SEN, HDA_VS_INTEL_EM2_L1SEN);
   328			hda->l1_disabled = false;
   329		}
   330	
   331		if (!found) {
   332			dev_err(sdev->dev, "%s: stream_tag %d not opened!\n",
   333				__func__, stream_tag);
   334			return -ENODEV;
   335		}
   336	
   337		if (pair)
 > 338			snd_hdac_ext_stream_release(link_stream, HDAC_EXT_STREAM_TYPE_LINK);
   339	
   340		return 0;
   341	}
   342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
