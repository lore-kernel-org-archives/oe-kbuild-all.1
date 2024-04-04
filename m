Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E211332A5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 19:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712259250; cv=none; b=hzHMi8wKNj73y+Jw5obHfGi4C+N++ZamY0kzA5V6E9uWvgJJUkziPAVBShrjWSLLQGyUL2UeY8SICOc/Ybidq6UmCLDaR7c20H5MbFJardTWtZHrKMq8jkGQY7sCI9fS2jSoAVwrpRN1AyIxkKmzWk1HEh6jIF03qbOAkGgiNA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712259250; c=relaxed/simple;
	bh=714LvdlyyCyCJC9BFhMRE4wtfQsPulLCfHARPPlZrLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S2P8co20LeMchIzMTvw83lA6yufInnzikWO3AYewYuzQKjgjFYIdUWGIb+xKWaUqXD0mZ/OTZ+wrPQZATVCRTVflSJUkN3Anou6HyEIMBMsDOiNMuRYLj/+Rjl+UCiOCaoojiFy81XO96sD3pLnDi7HFmKkjKOC0yCsWonaBv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISKnDH3R; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISKnDH3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712259248; x=1743795248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=714LvdlyyCyCJC9BFhMRE4wtfQsPulLCfHARPPlZrLI=;
  b=ISKnDH3RkEKxSx1cR7xpBW61+kGk9cPKlFuzEfZ4NphP7pw2SA3eS0Y6
   YuYKNkqreCCLrsMxn0/n0wA9mz9D5SLwQs9CmjaBKYW6kN25UyOlgP/yP
   Sw4cdPpnfHpLnBDPQvbxRpp1nOCHsvmPXJq1ryfbOycj9qi2rFyoTVseb
   QtJPDE5cPuQrC5ItC2gVVDaApYOK9M57QK2VrXC32+J08wk+A4ewDE8N4
   4daUkd07iT7yqp40hq4f7/PMZAYVM/bI3rAQsXLHfPI1fYXKGs3rqVLRi
   XmiB6D7Wu05MxNyUa4Z7uGjkPFheRl9ogfde83rIWcdNO4S91Z27yZB99
   g==;
X-CSE-ConnectionGUID: ZGMAT88jSUSGjN1taSM7Bw==
X-CSE-MsgGUID: T5TSnRcuSfiV1y/vEnb7Ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="8149510"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="8149510"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 12:34:07 -0700
X-CSE-ConnectionGUID: uek8srAcQre25GvcrcQqVw==
X-CSE-MsgGUID: 1dtFHPAfRd6YpWv5mboikA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18937153"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Apr 2024 12:34:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsSqa-0001QM-15;
	Thu, 04 Apr 2024 19:34:04 +0000
Date: Fri, 5 Apr 2024 03:33:07 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:auto-update-info 3/5]
 drivers/firmware/microchip/mpfs-auto-update.c:361:56: warning: format
 specifies type 'unsigned long' but the argument has type 'size_t' (aka
 'unsigned int')
Message-ID: <202404050304.iwz8gX0F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git auto-update-info
head:   694fc81510d43333a74fe1c594dd4f1a5318996e
commit: cf1d0043a35569e127181d268f39f200206a5ee4 [3/5] firmware: microchip: support writing bitstream info too
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240405/202404050304.iwz8gX0F-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050304.iwz8gX0F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050304.iwz8gX0F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/microchip/mpfs-auto-update.c:361:56: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     361 |         dev_info(priv->dev, "Wrote %lx bytes to the flash\n", bytes_written);
         |                                    ~~~                        ^~~~~~~~~~~~~
         |                                    %zx
   include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +361 drivers/firmware/microchip/mpfs-auto-update.c

   292	
   293	static int mpfs_auto_update_write_bitstream(struct fw_upload *fw_uploader, const u8 *data,
   294						    u32 offset, u32 size, u32 *written)
   295	{
   296		struct mpfs_auto_update_priv *priv = fw_uploader->dd_handle;
   297		struct erase_info erase;
   298		char *buffer;
   299		loff_t directory_address = AUTO_UPDATE_UPGRADE_DIRECTORY;
   300		size_t erase_size = AUTO_UPDATE_DIRECTORY_SIZE;
   301		size_t bytes_written = 0;
   302		bool is_info = mpfs_auto_update_is_bitstream_info(data, size);
   303		u32 image_address;
   304		int ret;
   305	
   306		erase_size = round_up(erase_size, (u64)priv->flash->erasesize);
   307	
   308		if (is_info)
   309			image_address = AUTO_UPDATE_INFO_BASE;
   310		else
   311			image_address = AUTO_UPDATE_BITSTREAM_BASE +
   312					AUTO_UPDATE_UPGRADE_INDEX * priv->size_per_bitstream;
   313	
   314		buffer = devm_kzalloc(priv->dev, erase_size, GFP_KERNEL);
   315		if (!buffer)
   316			return -ENOMEM;
   317	
   318	
   319		/*
   320		 * For bitstream info, the descriptor is written to a fixed offset,
   321		 * so there is no need to set the image address.
   322		 */
   323		if (!is_info) {
   324	
   325			ret = mpfs_auto_update_set_image_address(priv, buffer, image_address, directory_address);
   326			if (ret) {
   327				dev_err(priv->dev, "failed to set image address in the SPI directory: %d\n", ret);
   328				return ret;
   329			}
   330		}
   331	
   332		/*
   333		 * Now the .spi image itself can be written to the flash. Preservation
   334		 * of contents here is not important here, unlike the spi "directory"
   335		 * which must be RMWed.
   336		 */
   337		erase.len = round_up(size, (size_t)priv->flash->erasesize);
   338		erase.addr = image_address;
   339	
   340		dev_info(priv->dev, "Erasing the flash at address (%x)\n", image_address);
   341		ret = mtd_erase(priv->flash, &erase);
   342		if (ret)
   343			goto out;
   344	
   345		/*
   346		 * No parsing etc of the bitstream is required. The system controller
   347		 * will do all of that itself - including verifying that the bitstream
   348		 * is valid.
   349		 */
   350		dev_info(priv->dev, "Writing the image to the flash at address (%x)\n", image_address);
   351		ret = mtd_write(priv->flash, (loff_t)image_address, size, &bytes_written, data);
   352		if (ret)
   353			goto out;
   354	
   355		if (bytes_written != size) {
   356			ret = -EIO;
   357			goto out;
   358		}
   359	
   360		*written = bytes_written;
 > 361		dev_info(priv->dev, "Wrote %lx bytes to the flash\n", bytes_written);
   362	
   363	out:
   364		devm_kfree(priv->dev, buffer);
   365		return ret;
   366	}
   367	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
