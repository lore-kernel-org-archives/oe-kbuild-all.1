Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9060F800
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 00:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779063431; cv=none; b=tR15YjxMwRdjvfz94Grku2DjEs8H6z+ns/fVOYy6v3rlA6kON9otOrFy64as5a9IFIHFZPJsDsrYaCwb7vNjlSo/1aZTKE0WSJQJ12SVksMs0vXZig5FE792LfYbPmIsd+tx843kjdtWIhSg0BwgQAEG7hWyv9JhHDYMPoYaNS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779063431; c=relaxed/simple;
	bh=8yAw1U58L4AuAg24Du1Y64ZJQN73cgOY6UKX6CqMhYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLUHYCJc0v1Ps6qbqOc+qEhAZKp4nBNX+E7TfQOkCVnvckXzdIZX2X6/JUMBExFhQ8U7dEt4c7w3zHtcNnz5u56lReg8S7EoPPTrezxXYdGTY8sH2Sv6RBy89Ggj033GFPZldh0PZIakG+eSJ39beadnAIoXT+XBu7SJ7tZoJR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOvapXev; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOvapXev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779063429; x=1810599429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8yAw1U58L4AuAg24Du1Y64ZJQN73cgOY6UKX6CqMhYY=;
  b=SOvapXevkXLY02eqw+Ek7AL53S/QPUB1BRITXEoNGmAvwgs7zVEuzZ9j
   pkmu3TEZwu2ng2uuRxRTDriTz4y5y1rL6qFk4PaFMj8sSbZpPt6iCAAMS
   AzdyARm2T7MzXZU7FDWsg5oCGBdh+BBDLzppPXIwLwWuoSHHQVEMt3/U0
   YN7z0csB8cl/3TC6+q1r81G42fHsloZBGkA5xNXw6RggIqg0vvaN1VRnA
   ZxEnP1qutVTW7t+3CnlrpMELfVeGTYqgJGntUkTFYj0LlI00DriltsOUE
   hj/gf1lOMTT2fiw6JW+CfTKg/4xd+eh/MUzdIOUkSpQkVKO0mFGOtU57g
   A==;
X-CSE-ConnectionGUID: DIB57pMSSAWmM4IpcOw55Q==
X-CSE-MsgGUID: CpXZtSVqQxuc8yssxrWUaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="91306265"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="91306265"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 17:17:09 -0700
X-CSE-ConnectionGUID: TIn2eElcQWKhuDnHoDk6+A==
X-CSE-MsgGUID: IGFJWgncTguAEq4bFPb9PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="236236106"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 May 2026 17:17:05 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOlfJ-0000000026w-3eaF;
	Mon, 18 May 2026 00:17:01 +0000
Date: Mon, 18 May 2026 08:16:16 +0800
From: kernel test robot <lkp@intel.com>
To: vishnu.saini@oss.qualcomm.com, Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, prahlad.valluru@oss.qualcomm.com,
	Ravi Agola <raviagol@qti.qualcomm.com>,
	Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: Re: [PATCH] drm/bridge: lt9611uxc: support displays with up to 4
 EDID blocks
Message-ID: <202605180850.uN2x73KR-lkp@intel.com>
References: <20260517-lt9611usc_edid34_misc_next-v1-1-5e2fd8c6399b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-lt9611usc_edid34_misc_next-v1-1-5e2fd8c6399b@oss.qualcomm.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4c26e162947f91aa78ba57dd4fddd38fc80e7d60]

url:    https://github.com/intel-lab-lkp/linux/commits/vishnu-saini-oss-qualcomm-com/drm-bridge-lt9611uxc-support-displays-with-up-to-4-EDID-blocks/20260518-021632
base:   4c26e162947f91aa78ba57dd4fddd38fc80e7d60
patch link:    https://lore.kernel.org/r/20260517-lt9611usc_edid34_misc_next-v1-1-5e2fd8c6399b%40oss.qualcomm.com
patch subject: [PATCH] drm/bridge: lt9611uxc: support displays with up to 4 EDID blocks
config: csky-randconfig-001-20260518 (https://download.01.org/0day-ci/archive/20260518/202605180850.uN2x73KR-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180850.uN2x73KR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180850.uN2x73KR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/lontium-lt9611uxc.c: In function 'lt9611uxc_get_edid_block':
>> drivers/gpu/drm/bridge/lontium-lt9611uxc.c:454:37: warning: 'memcmp' specified bound 8 exceeds source size 4 [-Wstringop-overread]
     454 |                 while (!ret && 0 == memcmp(&edid_header, &buf, 8) && retry_cnt-- > 0) {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/lontium-lt9611uxc.c:415:53: note: source object allocated here
     415 | static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
         |                                                 ~~~~^~~


vim +/memcmp +454 drivers/gpu/drm/bridge/lontium-lt9611uxc.c

   414	
   415	static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
   416	{
   417		struct lt9611uxc *lt9611uxc = data;
   418		int ret = 0;
   419		int retry_cnt = 10;
   420		int edid_ext_block;
   421		const u8 edid_header[8] = { 0x00, 0xFF, 0xFF, 0xFF,
   422					    0xFF, 0xFF, 0xFF, 0x00 };
   423	
   424		if (len > EDID_BLOCK_SIZE)
   425			return -EINVAL;
   426	
   427		if (block >= EDID_NUM_BLOCKS)
   428			return -EINVAL;
   429	
   430		if (block == 2) {
   431			lt9611uxc_lock(lt9611uxc);
   432	
   433			/* Read number of block available in EDID data */
   434			ret = regmap_read(lt9611uxc->regmap, 0xb02a, &edid_ext_block);
   435			if (ret) {
   436				dev_err(lt9611uxc->dev, "edid block read failed: %d\n", ret);
   437				lt9611uxc_unlock(lt9611uxc);
   438				return ret;
   439			}
   440	
   441			/* Reset EDID ready flag so that lt9611uxc can read 2nd and 3rd block */
   442			regmap_write(lt9611uxc->regmap, 0xb02a, (edid_ext_block & (~BIT(3))));
   443	
   444			lt9611uxc_unlock(lt9611uxc);
   445	
   446			msleep(100);
   447	
   448			ret = lt9611uxc_read_edid_block(lt9611uxc, block, buf, len);
   449	
   450			/*
   451			 * Compare first 8 bytes of EDID header (0th block) and 2nd block to confirm
   452			 * that 2nd EDID block data is read successfully by lt9611uxc
   453			 */
 > 454			while (!ret && 0 == memcmp(&edid_header, &buf, 8) && retry_cnt-- > 0) {
   455				msleep(100);
   456				ret = lt9611uxc_read_edid_block(lt9611uxc, block, buf, len);
   457			}
   458		} else {
   459			ret = lt9611uxc_read_edid_block(lt9611uxc, block, buf, len);
   460		}
   461	
   462		return ret;
   463	};
   464	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
