Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143114CB20
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 23:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708816461; cv=none; b=EmKMyIm2qF2JitsTAEBHz+4sSZHmfCtIpEa6kCCRGCH7IFqLeUJab+9seX0PtxwBw+m3kRMjU2z5yT8QhxMVhtf78hpP1Le/tJwEbXqhuexBeIEja01pXpK6NbwDKjrOzP9x5TFiN29phiTDYX0JLRtMCc9UWBydg+/KKxSKDXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708816461; c=relaxed/simple;
	bh=dU8+Lv38NuhTO5MSiUa18g7zX3OpzZnkmbvZAot9xMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DFaBPHmymDJ33TOLMRN6pcQYmlrA4F8K0h8Hzabl7OKcDNwLdBePqbT+Pa5shf2xc8GdR4U7H+ucsO9eJnroQKm6yifn7yL9Yg3YytkWq9eZQcytU0inc+p/ewX6cRtQ80eS3yfu7qxkgYVBsAVJZJPjItnhUuTMjCbUihI0iHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXiyhfKT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXiyhfKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708816459; x=1740352459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dU8+Lv38NuhTO5MSiUa18g7zX3OpzZnkmbvZAot9xMM=;
  b=aXiyhfKTFQXHCUDHkvSdU9wmd3NS/ny7+bytiLmnSu/+Z9X4tj4FGoQ2
   3rzPYB+1wZOP51roTGwKLYSkhLXZZ5BTJqLd1ILfeIsxhuIKKIijemJIp
   ltP+7x89YxhwRruixKTBv6zGopAgoZL9L7eY2qIHNWpHJhIFmrmGFQqqz
   SqkWGQOJ0t5ez1LOowNPR3DajZwsmVuqw2oefnWwwOGys7oRaLBIsmqFu
   ooqNQTt64o5lOHZSGE8I55LCpZ+J9GvO4rVLJItrOxRJl6mGodEzgxlQd
   H8dzBvNcAOLmqv1nM3msHtpEyJnTaqnY4t+rYL6FCJxZpbBp4SKbAX6Uy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="6079066"
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="6079066"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 15:14:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="6193167"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Feb 2024 15:14:17 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1re1Di-000900-2d;
	Sat, 24 Feb 2024 23:14:14 +0000
Date: Sun, 25 Feb 2024 07:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 10454/21632]
 sound/usb/validate.c:113:26: sparse: sparse: restricted __le16 degrades to
 integer
Message-ID: <202402250716.ZS5etOKl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b97b63500af297c36f80416fd1f1193d227cf51a
commit: c6a3607c78f8035db0efc67cb41374fe49e4709d [10454/21632] ALSA: usb-audio: More validations of descriptor units
config: x86_64-randconfig-121-20240224 (https://download.01.org/0day-ci/archive/20240225/202402250716.ZS5etOKl-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402250716.ZS5etOKl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402250716.ZS5etOKl-lkp@intel.com/

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
