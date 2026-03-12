Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57A9388E77
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 20:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773348762; cv=none; b=sNwX3v9A05Gdt0wYT4J1RSeCI/eig2YZXXQSjuGuz6tA2Of/0Hc27yulDk+e0OtPfiVVV0PDgSlOPNASZgpAZjkE1suhS29Zw/FAaolpNMQPiHOi1dpnzpkRUqrN5lJ2zU/J6xWZu1jl3PlfHxm2JU+bPs7w2FzWapTp0jipJ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773348762; c=relaxed/simple;
	bh=bfMai6EmzByB8jn6xgJ+4q/byXkoOF53ttzlDoqbxdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nY5CleraajU4X3Ozever31XnfD7+iCwm2SNh7pACCdBVT12nwTzyL4/zjx+py+Wue4toXHL+3G/YhAoSNYSiCviKqznlRBuEPWB28799hbx7MKF1ONtfoy6g7yquA4a210FEYQa8FRViOiKz+Tbt/NUMnOP7jtPJbz2t+h0p+Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTWRMIMW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTWRMIMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773348760; x=1804884760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bfMai6EmzByB8jn6xgJ+4q/byXkoOF53ttzlDoqbxdY=;
  b=JTWRMIMWter5Gzt0bUpO+I+kQnwsoL3UO9AEujI5jTOqoSeFBsejbQ5K
   qvH3ynjzTVhdv5ph+ySI/dJsVjp33ZQnC88BxydXY1pJ3BEA83mWk4uol
   P5w/I8xsd8ZJe2IIMfrT5HLh2zp0WBIxt0hDoKFogIQx9NTRIqcdo6RBb
   dt8DmPty4U6V/GldP2/I1C5/mHBdJwj4mbYIuPaeCFrxe0cRFFcrgFP/p
   F325f2NEY1Y7nRiCQCMdRluE27Ewr1rjsdeiPshNDYEPDOvCK6IC1XHBg
   R+LjOonHf3jzxLEXlYcOjh6Dc69ie9gmhDGQUOQrguXcvrJKVQuxLMbyE
   g==;
X-CSE-ConnectionGUID: MC9YDOYuRQmcbRwCx4qIzQ==
X-CSE-MsgGUID: 1KuVZ//OSku5VNOa/gvQDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74370768"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="74370768"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 13:52:39 -0700
X-CSE-ConnectionGUID: sGhTQMQeSH64hD9wKw69+g==
X-CSE-MsgGUID: Ry1cTHgERg2zaQIiml0ETA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="220886673"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Mar 2026 13:52:31 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0n19-000000003Bb-2z0t;
	Thu, 12 Mar 2026 20:52:27 +0000
Date: Fri, 13 Mar 2026 04:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org,
	m.tretter@pengutronix.de, mchehab@kernel.org,
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: oe-kbuild-all@lists.linux.dev, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
	kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org, ribalda@chromium.org,
	straube.linux@gmail.com, dan.carpenter@linaro.org,
	lukagejak5@gmail.com, ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
	s9430939@naver.com
Subject: Re: [PATCH 3/7] iio: st_sensors: simplify cleanup using __free
Message-ID: <202603130453.LnpVBScy-lkp@intel.com>
References: <20260310200513.2162018-4-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310200513.2162018-4-sanjayembedded@gmail.com>

Hi Sanjay,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-linus]
[also build test ERROR on jic23-iio/togreg linuxtv-media-pending/master linus/master v7.0-rc3 next-20260311]
[cannot apply to staging/staging-testing staging/staging-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sanjay-Chitroda/staging-greybus-simplify-cleanup-using-__free/20260311-041028
base:   staging/staging-linus
patch link:    https://lore.kernel.org/r/20260310200513.2162018-4-sanjayembedded%40gmail.com
patch subject: [PATCH 3/7] iio: st_sensors: simplify cleanup using __free
config: s390-randconfig-001-20260313 (https://download.01.org/0day-ci/archive/20260313/202603130453.LnpVBScy-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603130453.LnpVBScy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603130453.LnpVBScy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iio/common/st_sensors/st_sensors_core.c: In function 'st_sensors_read_axis_data':
>> drivers/iio/common/st_sensors/st_sensors_core.c:504:6: error: redeclaration of 'outdata' with no linkage
     u8 *outdata __free(kfree) = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
         ^~~~~~~
   drivers/iio/common/st_sensors/st_sensors_core.c:498:6: note: previous declaration of 'outdata' was here
     u8 *outdata;
         ^~~~~~~


vim +/outdata +504 drivers/iio/common/st_sensors/st_sensors_core.c

   493	
   494	static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
   495					     struct iio_chan_spec const *ch, int *data)
   496	{
   497		int err;
   498		u8 *outdata;
   499		struct st_sensor_data *sdata = iio_priv(indio_dev);
   500		unsigned int byte_for_channel;
   501	
   502		byte_for_channel = DIV_ROUND_UP(ch->scan_type.realbits +
   503						ch->scan_type.shift, 8);
 > 504		u8 *outdata __free(kfree) = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
   505		if (!outdata)
   506			return -ENOMEM;
   507	
   508		err = regmap_bulk_read(sdata->regmap, ch->address,
   509				       outdata, byte_for_channel);
   510		if (err < 0)
   511			return err;
   512	
   513		if (byte_for_channel == 1)
   514			*data = (s8)*outdata;
   515		else if (byte_for_channel == 2)
   516			*data = (s16)get_unaligned_le16(outdata);
   517		else if (byte_for_channel == 3)
   518			*data = (s32)sign_extend32(get_unaligned_le24(outdata), 23);
   519	
   520		return err;
   521	}
   522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
