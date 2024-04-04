Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29D7131E24
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 19:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712257209; cv=none; b=qeINmFLpZ6kqY3JQ/8tQIjL+x+rrTAw+jj/U2DiL0dXuqH96tLFRdyDooIxrbqWPuBJHZpS8LffdzOLhaKlaQafDyTdZWdZ33uqoxp7VoPhzS6nd/QJBcs+W0LEId16u4K+3OLKVON8rW4NnwbO48kXEEPE5e4CAynz8c0FH4G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712257209; c=relaxed/simple;
	bh=579gl6U2Hr6c7xEbCKgIykj7RM7kTI9PAzO06qkCgf0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SFgquCZZ8ggPAFX1EMnwUboWRn051gBaoc8NrLH9fG/QPpgUpvPy7yd6jsljxg6253vA7Zs+UrLpNsiSD6Q0MHbLcpfBOJalEf+LC3YfQ2qpXOd0PQXx1EvFCJaalPEIcfJ57yTri3/4VSipXSpxuub2P+Fzfi/2wl/dIPCNj/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5Xz8L9x; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5Xz8L9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712257208; x=1743793208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=579gl6U2Hr6c7xEbCKgIykj7RM7kTI9PAzO06qkCgf0=;
  b=G5Xz8L9xEf3F4gogiolcdq/d5cYm8DVLfW+IOSec0eF+90O/j4Q6nQkj
   6MFhMz0iKdMs+bDsFJjwgz3VyUkmc8ZjMvHkg45HcEuhaj3nKuD/WJr63
   H5Yxl/zVqbh0OmWP2eoneJGqDeduNxYgmF1+R0iuLb3xNLxt5B6vOmiD2
   j1ErCG9HLsGNI+fTB8u/RlewSeE8RZ5hr8Lztk/G+6IkHCEcCg7aCi3Vq
   CHx0WMahDf8NQIdgWvXM8JQ2BWHEbRlNO/FUzXQOSV60AEXwsp9yoPrvG
   wIF7xZFaISFfX+yE/BwGbmwkNv+g9QS11/CGkRIUbpiUUa1PN1e6p+f2T
   A==;
X-CSE-ConnectionGUID: wTc5YlgORxCE6qe0YJW3Bw==
X-CSE-MsgGUID: eCJPtBv7TzacMk1RlUVj3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="18300899"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="18300899"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 12:00:07 -0700
X-CSE-ConnectionGUID: Iy75lQ+lSVClFULLsez7xQ==
X-CSE-MsgGUID: olod8I1VQ1+vO/xQPENXww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="18857101"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Apr 2024 12:00:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsSJf-0001OI-0t;
	Thu, 04 Apr 2024 19:00:03 +0000
Date: Fri, 5 Apr 2024 02:59:54 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:auto-update-info 3/5]
 drivers/firmware/microchip/mpfs-auto-update.c:361:29: warning: format '%lx'
 expects argument of type 'long unsigned int', but argument 3 has type
 'size_t' {aka 'unsigned int'}
Message-ID: <202404050204.4wgKjbpx-lkp@intel.com>
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240405/202404050204.4wgKjbpx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050204.4wgKjbpx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050204.4wgKjbpx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/mtd/mtd.h:13,
                    from drivers/firmware/microchip/mpfs-auto-update.c:16:
   drivers/firmware/microchip/mpfs-auto-update.c: In function 'mpfs_auto_update_write_bitstream':
>> drivers/firmware/microchip/mpfs-auto-update.c:361:29: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     361 |         dev_info(priv->dev, "Wrote %lx bytes to the flash\n", bytes_written);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:150:58: note: in expansion of macro 'dev_fmt'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/firmware/microchip/mpfs-auto-update.c:361:9: note: in expansion of macro 'dev_info'
     361 |         dev_info(priv->dev, "Wrote %lx bytes to the flash\n", bytes_written);
         |         ^~~~~~~~
   drivers/firmware/microchip/mpfs-auto-update.c:361:38: note: format string is defined here
     361 |         dev_info(priv->dev, "Wrote %lx bytes to the flash\n", bytes_written);
         |                                    ~~^
         |                                      |
         |                                      long unsigned int
         |                                    %x


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
