Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FB81ADC6D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 18:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736966966; cv=none; b=cKXvIoPRveUvHUkMUjDNFr4EGLpfiggoQbe6yyhsL5T3LAkrulpH/kWOjqY+qT0kMf05gf5JlJmoYQQOLGrjwxTl9a8L93qtaGnPtgG4Rha+J1lruh94GYAXcEg/EiU5ij6V3kIEzotj2wg4859S/C+Dkhw+LLUriQh67OnsR4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736966966; c=relaxed/simple;
	bh=80zTGhCXpzfaQMCPn1/s5Zfeg+EFmGbaXUW/rcACpbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VvvkVqjyWuCXzjDUXrARLHpeo+EGEi/fdBkUcuiDf/sS7OKcRiX0pCEN1ted3hIEdnXqlL4dYVxbbypF3whsF8tX9NdyJDmEbd8isYj1MKSYATpcKzOXFoxq9+2rNSaEQS3hdsoVek5ZZT6nroFZehRJWlLI+mx7XaMAOJQEVXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnqvlsT/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnqvlsT/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736966964; x=1768502964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=80zTGhCXpzfaQMCPn1/s5Zfeg+EFmGbaXUW/rcACpbk=;
  b=lnqvlsT/YcxQQe1a+47tbtrcWrAFxqTcFFhwZy25S9f8xfYYdMk0hRnb
   9gpyMulL+VqpXrmLkHaHT7qax2zoOvEf5mglTQE0IudigFiGBH+pF1QR9
   orr8cxoARQ/MNr2vs3Fk/ulGth7n6lmcuPTzYATmfDoNL0752ol5MBHiy
   qi8T9C9WuB0Fcl8dTrkqFfogaLsxrS3mAwtYO1eXsbq3ydntXETd8gItd
   wDoiOvo/tXQEf9+9sqchZkvaop+zHQGmryppIpmCuUZImld72Sd8h0kwI
   s7mIcWRE0AE8f3BtafmjSeiBw9/drFUcC+1u6h48sZ9jb044KTY7YE1eo
   g==;
X-CSE-ConnectionGUID: QkjgkSRGTyeFfhqzGPDwCg==
X-CSE-MsgGUID: QTHdhTd0Toy/QqBUp8S6Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="41253867"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="41253867"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 10:49:23 -0800
X-CSE-ConnectionGUID: iamRWszPT42aTWZTMyc1gA==
X-CSE-MsgGUID: hrzRMzRiQu+Ic1lrcK/BOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142493046"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Jan 2025 10:49:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tY8S7-000Qi3-1A;
	Wed, 15 Jan 2025 18:49:19 +0000
Date: Thu, 16 Jan 2025 02:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>
Subject: drivers/net/can/usb/etas_es58x/es58x_devlink.c:201:55: warning:
 '%02u' directive output may be truncated writing between 2 and 3 bytes into
 a region of size between 1 and 3
Message-ID: <202501160236.YSb9NcEp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   619f0b6fad524f08d493a98d55bac9ab8895e3a6
commit: 9f06631c3f1f0f298536443df85a6837ba4c5f5c can: etas_es58x: export product information through devlink_ops::info_get()
date:   2 years, 1 month ago
config: powerpc-buildonly-randconfig-r001-20230115 (https://download.01.org/0day-ci/archive/20250116/202501160236.YSb9NcEp-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160236.YSb9NcEp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501160236.YSb9NcEp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/can/usb/etas_es58x/es58x_devlink.c: In function 'es58x_devlink_info_get':
>> drivers/net/can/usb/etas_es58x/es58x_devlink.c:201:55: warning: '%02u' directive output may be truncated writing between 2 and 3 bytes into a region of size between 1 and 3 [-Wformat-truncation=]
     201 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
         |                                                       ^~~~
   drivers/net/can/usb/etas_es58x/es58x_devlink.c:201:44: note: directive argument in the range [0, 255]
     201 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
         |                                            ^~~~~~~~~~~~~~~~
   drivers/net/can/usb/etas_es58x/es58x_devlink.c:201:17: note: 'snprintf' output between 9 and 12 bytes into a destination of size 9
     201 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     202 |                          fw_ver->major, fw_ver->minor, fw_ver->revision);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/etas_es58x/es58x_devlink.c:211:55: warning: '%02u' directive output may be truncated writing between 2 and 3 bytes into a region of size between 1 and 3 [-Wformat-truncation=]
     211 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
         |                                                       ^~~~
   drivers/net/can/usb/etas_es58x/es58x_devlink.c:211:44: note: directive argument in the range [0, 255]
     211 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
         |                                            ^~~~~~~~~~~~~~~~
   drivers/net/can/usb/etas_es58x/es58x_devlink.c:211:17: note: 'snprintf' output between 9 and 12 bytes into a destination of size 9
     211 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     212 |                          bl_ver->major, bl_ver->minor, bl_ver->revision);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/etas_es58x/es58x_devlink.c:221:52: warning: '%03u' directive output may be truncated writing between 3 and 5 bytes into a region of size between 2 and 4 [-Wformat-truncation=]
     221 |                 snprintf(buf, sizeof(buf), "%c%03u/%03u",
         |                                                    ^~~~
   drivers/net/can/usb/etas_es58x/es58x_devlink.c:221:44: note: directive argument in the range [0, 65535]
     221 |                 snprintf(buf, sizeof(buf), "%c%03u/%03u",
         |                                            ^~~~~~~~~~~~~
   drivers/net/can/usb/etas_es58x/es58x_devlink.c:221:17: note: 'snprintf' output between 9 and 13 bytes into a destination of size 9
     221 |                 snprintf(buf, sizeof(buf), "%c%03u/%03u",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     222 |                          hw_rev->letter, hw_rev->major, hw_rev->minor);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +201 drivers/net/can/usb/etas_es58x/es58x_devlink.c

   177	
   178	/**
   179	 * es58x_devlink_info_get() - Report the product information.
   180	 * @devlink: Devlink.
   181	 * @req: skb wrapper where to put requested information.
   182	 * @extack: Unused.
   183	 *
   184	 * Report the firmware version, the bootloader version, the hardware
   185	 * revision and the serial number through netlink.
   186	 *
   187	 * Return: zero on success, errno when any error occurs.
   188	 */
   189	static int es58x_devlink_info_get(struct devlink *devlink,
   190					  struct devlink_info_req *req,
   191					  struct netlink_ext_ack *extack)
   192	{
   193		struct es58x_device *es58x_dev = devlink_priv(devlink);
   194		struct es58x_sw_version *fw_ver = &es58x_dev->firmware_version;
   195		struct es58x_sw_version *bl_ver = &es58x_dev->bootloader_version;
   196		struct es58x_hw_revision *hw_rev = &es58x_dev->hardware_revision;
   197		char buf[max(sizeof("xx.xx.xx"), sizeof("axxx/xxx"))];
   198		int ret = 0;
   199	
   200		if (es58x_sw_version_is_set(fw_ver)) {
 > 201			snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
   202				 fw_ver->major, fw_ver->minor, fw_ver->revision);
   203			ret = devlink_info_version_running_put(req,
   204							       DEVLINK_INFO_VERSION_GENERIC_FW,
   205							       buf);
   206			if (ret)
   207				return ret;
   208		}
   209	
   210		if (es58x_sw_version_is_set(bl_ver)) {
   211			snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
   212				 bl_ver->major, bl_ver->minor, bl_ver->revision);
   213			ret = devlink_info_version_running_put(req,
   214							       DEVLINK_INFO_VERSION_GENERIC_FW_BOOTLOADER,
   215							       buf);
   216			if (ret)
   217				return ret;
   218		}
   219	
   220		if (es58x_hw_revision_is_set(hw_rev)) {
   221			snprintf(buf, sizeof(buf), "%c%03u/%03u",
   222				 hw_rev->letter, hw_rev->major, hw_rev->minor);
   223			ret = devlink_info_version_fixed_put(req,
   224							     DEVLINK_INFO_VERSION_GENERIC_BOARD_REV,
   225							     buf);
   226			if (ret)
   227				return ret;
   228		}
   229	
   230		return devlink_info_serial_number_put(req, es58x_dev->udev->serial);
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
