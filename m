Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C0F1D681
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Feb 2024 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708188995; cv=none; b=ZLfRhhLEQIGD61qbWEqsB+9MJp9MzYC2INi6UtyRMS0zN3kDiLWpUDcqyJCVR21EQh/iy5WJkuhx2NJ4i2QZmg704ECjBC7+YwHkazPOakD34DsCx5s3iVi1IhYFLrjZlueIqbHbPiFQcNsG3+BUFy0fopQOzhJPJzUNatMozuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708188995; c=relaxed/simple;
	bh=guxYdloOBtgELXn+/kEtSPpi9sBvdZQ+4Ltzx/QGDWY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fqIEHFk/Yw+iCSTkTX/vq9Sxiv492t4Bwg61bWW5b/OcI5QFkNnK7jMERBZj2UFfOijGhmL64bEaPS9yNPcCmoGGLo0Swq8AnWlp8b/p3DYxyhvO7VVIL/SqBsrXvCyBHGBySnor8iACTc1k0h0CDUaJU09jYzOrDDswwgeP8CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaGxf5lA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaGxf5lA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708188993; x=1739724993;
  h=date:from:cc:subject:message-id:mime-version;
  bh=guxYdloOBtgELXn+/kEtSPpi9sBvdZQ+4Ltzx/QGDWY=;
  b=kaGxf5lApEFIP0c1IJSGITBeUJU9iAhRfwDCQoWosTyVZOISIFVJhU/y
   9h18wRZ9S9wTDezX0FfTlzBAv3AxfrL2pi7CZeZmO7ZJhf4R+s98MslMH
   QX6Bq0Jzx+8vTR7/vC0KcAM9nsRN4sUDSmcYRDktJlbarY51jfIPqxCmw
   gx7It65rWx8SVplHoD2mFJ3KWXVtqdxUztBaiwc6gzg6j43QNHTQhXQUO
   ZpTj1ZGLzOsXQ/IiHzoUHJc24miZfSPRc4AYE/b6STQWjplWYMcQqXXJs
   soueO2PCr9QlxQafLgtBrHNIfgkPKvxL9hkvSnTzcxakCa/bQLOA7ASw/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2457752"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="2457752"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 08:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="4393099"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 17 Feb 2024 08:56:30 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbNzI-0002I6-1Z;
	Sat, 17 Feb 2024 16:56:28 +0000
Date: Sun, 18 Feb 2024 00:56:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 17/22]
 drivers/media/platform/ti/vpe/vip.c:866:15: warning: variable 'list_length'
 set but not used
Message-ID: <202402180051.Mvs0JU8q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   77aa27cbdca359bf0735b36ada464ec65b520943
commit: 349aa3a70de7331db179f559221d795c01ff77fe [17/22] media: ti-vpe: Add the VIP driver
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240218/202402180051.Mvs0JU8q-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402180051.Mvs0JU8q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402180051.Mvs0JU8q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/ti/vpe/vip.c:866:15: warning: variable 'list_length' set but not used [-Wunused-but-set-variable]
           unsigned int list_length;
                        ^
>> drivers/media/platform/ti/vpe/vip.c:3541:36: warning: variable 'bus' set but not used [-Wunused-but-set-variable]
           struct v4l2_mbus_config_parallel *bus;
                                             ^
>> drivers/media/platform/ti/vpe/vip.c:3837:18: warning: variable 'pinctrl' set but not used [-Wunused-but-set-variable]
           struct pinctrl *pinctrl;
                           ^
   3 warnings generated.


vim +/list_length +866 drivers/media/platform/ti/vpe/vip.c

   861	
   862	static void populate_desc_list(struct vip_stream *stream)
   863	{
   864		struct vip_port *port = stream->port;
   865		struct vip_dev *dev = port->dev;
 > 866		unsigned int list_length;
   867	
   868		stream->desc_next = stream->desc_list.buf.addr;
   869		add_stream_dtds(stream);
   870	
   871		list_length = stream->desc_next - stream->desc_list.buf.addr;
   872		vpdma_map_desc_buf(dev->shared->vpdma, &stream->desc_list.buf);
   873	}
   874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
