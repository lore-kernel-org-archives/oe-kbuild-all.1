Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF10195F0D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 15:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735831309; cv=none; b=lm62yaMDYW8pv+qo3uwcGNlJfz48M8teLPuPoQeWOjmbdW9b8zdRz2nMvLSUDzIt+UWCFfpLtf6/Wf7bBq4Hkq5s7WzGuF7o/j+uvLVKT1LcVkNYVTCZqzjmkrkOEAfZ0nllh7KDAbbTpSVNgE33hf/+6lT4tShnPosrgObHi4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735831309; c=relaxed/simple;
	bh=KXrRhYQrX0rBrzQaWeil0ZCoVwYrIMYpoL9w9JClmjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cpKNQn1f3zXEviLNz2uXQQ9GQ85mWsQcPoWCzQRUJeGVFvYjmDDwQ6PuUM4KkTjEc3N0apmokXmGsUwaCfT5coOYe2HvClKVHtxBl7jD4jHtUwZnko5UhR7YLBKkxJ6oWpJFzNii+2DrE+6BkytiS2Z5HrPMVlylO1VxTwAIGLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDS8Fr6J; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDS8Fr6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735831308; x=1767367308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KXrRhYQrX0rBrzQaWeil0ZCoVwYrIMYpoL9w9JClmjs=;
  b=HDS8Fr6JblZc+Q/aQiNhApUn1b5cjTncruxOm4SPY8fpNcVFuSTgUywE
   6S+LNuO6EeQLw9oz0CRjGjJmyLdXQ95f4ZJrlmgJI/SLO7xZu5GNP+zWv
   /m05cGGp3ItMbahXp/Lq9sVBPXz8kznYLgd24tPIaczszgXt1kY0fuuLC
   ew2vXpAgjf5CVVErSqISXyTJOmao4m7P+NdUedSksUvlc+dVRuwxRKyH6
   7fleKZEQhrzTxukCNWihj8OaYMaG8vAvUFAUDZ1KUba1rdHvM5W9IdM34
   tQvKS/aq+lyUxkiNwp6r1k2SOtFev3HVBOje+iUGeSgZ4PuSrnD7CQnLl
   Q==;
X-CSE-ConnectionGUID: 9BgviJY9SSuu3fMaygmhKg==
X-CSE-MsgGUID: cEL/RL2JR4SXdzjdUED9FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="23661814"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="23661814"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 07:21:47 -0800
X-CSE-ConnectionGUID: dWp9reJbQT+ak0UgXs08UQ==
X-CSE-MsgGUID: 3FtjcKx9R/2H5HfLTtXAsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="101320671"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jan 2025 07:21:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTN15-0008bV-2V;
	Thu, 02 Jan 2025 15:21:43 +0000
Date: Thu, 2 Jan 2025 23:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1364/1364] sound/usb/validate.c:113:26:
 sparse: sparse: restricted __le16 degrades to integer
Message-ID: <202501022347.2K2GsA8U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4c116febc8d53bc1f8f25a3d60db331f17ab8cd8
commit: c6a3607c78f8035db0efc67cb41374fe49e4709d [1364/1364] ALSA: usb-audio: More validations of descriptor units
config: x86_64-randconfig-123-20250102 (https://download.01.org/0day-ci/archive/20250102/202501022347.2K2GsA8U-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501022347.2K2GsA8U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501022347.2K2GsA8U-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/usb/validate.c:113:26: sparse: sparse: restricted __le16 degrades to integer
>> sound/usb/validate.c:113:26: sparse: sparse: restricted __le16 degrades to integer
   sound/usb/validate.c:128:26: sparse: sparse: restricted __le16 degrades to integer
   sound/usb/validate.c:128:26: sparse: sparse: restricted __le16 degrades to integer
   sound/usb/validate.c:145:26: sparse: sparse: restricted __le16 degrades to integer
   sound/usb/validate.c:145:26: sparse: sparse: restricted __le16 degrades to integer

vim +113 sound/usb/validate.c

    67	
    68	/* both for processing and extension units; covering all UACs */
    69	static bool validate_processing_unit(const void *p,
    70					     const struct usb_desc_validator *v)
    71	{
    72		const struct uac_processing_unit_descriptor *d = p;
    73		const unsigned char *hdr = p;
    74		size_t len, m;
    75	
    76		if (d->bLength < sizeof(*d))
    77			return false;
    78		len = d->bLength < sizeof(*d) + d->bNrInPins;
    79		if (d->bLength < len)
    80			return false;
    81		switch (v->protocol) {
    82		case UAC_VERSION_1:
    83		default:
    84			/* bNrChannels, wChannelConfig, iChannelNames, bControlSize */
    85			len += 1 + 2 + 1 + 1;
    86			if (d->bLength < len) /* bControlSize */
    87				return false;
    88			m = hdr[len];
    89			len += 1 + m + 1; /* bControlSize, bmControls, iProcessing */
    90			break;
    91		case UAC_VERSION_2:
    92			/* bNrChannels, bmChannelConfig, iChannelNames */
    93			len += 1 + 4 + 1;
    94			if (v->type == UAC2_PROCESSING_UNIT_V2)
    95				len += 2; /* bmControls -- 2 bytes for PU */
    96			else
    97				len += 1; /* bmControls -- 1 byte for EU */
    98			len += 1; /* iProcessing */
    99			break;
   100		case UAC_VERSION_3:
   101			/* wProcessingDescrStr, bmControls */
   102			len += 2 + 4;
   103			break;
   104		}
   105		if (d->bLength < len)
   106			return false;
   107	
   108		switch (v->protocol) {
   109		case UAC_VERSION_1:
   110		default:
   111			if (v->type == UAC1_EXTENSION_UNIT)
   112				return true; /* OK */
 > 113			switch (d->wProcessType) {
   114			case UAC_PROCESS_UP_DOWNMIX:
   115			case UAC_PROCESS_DOLBY_PROLOGIC:
   116				if (d->bLength < len + 1) /* bNrModes */
   117					return false;
   118				m = hdr[len];
   119				len += 1 + m * 2; /* bNrModes, waModes(n) */
   120				break;
   121			default:
   122				break;
   123			}
   124			break;
   125		case UAC_VERSION_2:
   126			if (v->type == UAC2_EXTENSION_UNIT_V2)
   127				return true; /* OK */
   128			switch (d->wProcessType) {
   129			case UAC2_PROCESS_UP_DOWNMIX:
   130			case UAC2_PROCESS_DOLBY_PROLOCIC: /* SiC! */
   131				if (d->bLength < len + 1) /* bNrModes */
   132					return false;
   133				m = hdr[len];
   134				len += 1 + m * 4; /* bNrModes, daModes(n) */
   135				break;
   136			default:
   137				break;
   138			}
   139			break;
   140		case UAC_VERSION_3:
   141			if (v->type == UAC3_EXTENSION_UNIT) {
   142				len += 2; /* wClusterDescrID */
   143				break;
   144			}
   145			switch (d->wProcessType) {
   146			case UAC3_PROCESS_UP_DOWNMIX:
   147				if (d->bLength < len + 1) /* bNrModes */
   148					return false;
   149				m = hdr[len];
   150				len += 1 + m * 2; /* bNrModes, waClusterDescrID(n) */
   151				break;
   152			case UAC3_PROCESS_MULTI_FUNCTION:
   153				len += 2 + 4; /* wClusterDescrID, bmAlgorighms */
   154				break;
   155			default:
   156				break;
   157			}
   158			break;
   159		}
   160		if (d->bLength < len)
   161			return false;
   162	
   163		return true;
   164	}
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
