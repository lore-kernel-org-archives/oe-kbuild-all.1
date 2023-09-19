Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D4F30F8F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 18:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695148206; x=1726684206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=50GNO5IvhfVjwdd6weH5GDYS7RNPqTEiLwbvd0qpxVU=;
  b=U9uNZF45L/+ehsTLD8BtVVPUUB9PVHbQiXy/jzgYmIegfpcRLqLEf51U
   jFZv08CW5zCjP2s5xeYG6nxMrH+W1I+NpO7xT0NpFXxA7ivN06gX8iTKo
   9PN1XGNtDZEGed6+av+h9EqYVS5C/bWDhhjE/TdXOatPWAuKpaHewNoB7
   HGq0OWlG+j9tEouXj4/rMohYlHjCa126evtjxPuiWJQTGSBYu+UZRuM5K
   YktQlSxUhUaZ00PeHNo7aZPH2mGovrhj2cvIau97fSMaO5lfRDth4Pq5U
   ruz5gb3JBotXdlx+UaLOnAuUAqzjpaGo+SHM3iKbhL0j39r0Go5+XtGYC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="446493178"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="446493178"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 11:30:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="749594506"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="749594506"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 19 Sep 2023 11:30:04 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qifU2-0007ni-0X;
	Tue, 19 Sep 2023 18:30:02 +0000
Date: Wed, 20 Sep 2023 02:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: Katta Dhanunjanrao <katta.dhanunjanrao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 1216/1363]
 drivers/staging/xlnx_hdcp1x/xilinx-hdcp1x-cipher.c:812: warning: Function
 parameter or member 'bx' not described in 'xhdcp1x_cipher_setb'
Message-ID: <202309200212.AZDbCXZz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   4f412ed20fd2c5353c1e878ef9ed77952a5040a1
commit: e6f04926dcd85fb353928a9c899a54e023bf4e69 [1216/1363] staging: xlnx_hdcp1x: Add HDCP1x cipher common functionality
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309200212.AZDbCXZz-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200212.AZDbCXZz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200212.AZDbCXZz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/xlnx_hdcp1x/xilinx-hdcp1x-cipher.c:812: warning: Function parameter or member 'bx' not described in 'xhdcp1x_cipher_setb'
>> drivers/staging/xlnx_hdcp1x/xilinx-hdcp1x-cipher.c:812: warning: Function parameter or member 'by' not described in 'xhdcp1x_cipher_setb'
>> drivers/staging/xlnx_hdcp1x/xilinx-hdcp1x-cipher.c:812: warning: Function parameter or member 'bz' not described in 'xhdcp1x_cipher_setb'
>> drivers/staging/xlnx_hdcp1x/xilinx-hdcp1x-cipher.c:812: warning: Excess function parameter 'x' description in 'xhdcp1x_cipher_setb'
>> drivers/staging/xlnx_hdcp1x/xilinx-hdcp1x-cipher.c:812: warning: Excess function parameter 'y' description in 'xhdcp1x_cipher_setb'
>> drivers/staging/xlnx_hdcp1x/xilinx-hdcp1x-cipher.c:812: warning: Excess function parameter 'z' description in 'xhdcp1x_cipher_setb'


vim +812 drivers/staging/xlnx_hdcp1x/xilinx-hdcp1x-cipher.c

   799	
   800	/**
   801	 * xhdcp1x_cipher_setb - This function writes the contents of the B register in BM0.
   802	 * @ref: reference to cipher instance
   803	 * @x: is the value to be written to bx.
   804	 * @y: is the value to be written to by.
   805	 * @z: is the value to be written to bz.
   806	 *
   807	 * @return:
   808	 *		- SUCCESS if successful.
   809	 *		- NON_ZERO otherwise.
   810	 */
   811	int xhdcp1x_cipher_setb(void *ref, u32 bx, u32 by, u32 bz)
 > 812	{
   813		struct xhdcp1x_cipher *cipher = (struct xhdcp1x_cipher *)ref;
   814		u32 value = 0;
   815	
   816		if (!(xhdcp1x_cipher_is_enabled(cipher)))
   817			return -EINVAL;
   818	
   819		/* Clear the register update bit */
   820		value = xhdcp1x_cipher_read(cipher, XHDCP1X_CIPHER_REG_CONTROL);
   821		value &= ~XHDCP1X_CIPHER_BITMASK_CONTROL_UPDATE;
   822		xhdcp1x_cipher_write(cipher, XHDCP1X_CIPHER_REG_CONTROL, value);
   823	
   824		/* Update the Bx */
   825		value = (bx & XHDCP1X_CIPHER_SET_B);
   826		xhdcp1x_cipher_write(cipher, XHDCP1X_CIPHER_REG_CIPHER_BX, value);
   827	
   828		/* Update the By */
   829		value = (by & XHDCP1X_CIPHER_SET_B);
   830		xhdcp1x_cipher_write(cipher, XHDCP1X_CIPHER_REG_CIPHER_BY, value);
   831	
   832		/* Update the Bz */
   833		value = (bz & XHDCP1X_CIPHER_SET_B);
   834		xhdcp1x_cipher_write(cipher, XHDCP1X_CIPHER_REG_CIPHER_BZ, value);
   835	
   836		/* Set the register update bit */
   837		value = xhdcp1x_cipher_read(cipher, XHDCP1X_CIPHER_REG_CONTROL);
   838		value |= XHDCP1X_CIPHER_BITMASK_CONTROL_UPDATE;
   839		xhdcp1x_cipher_write(cipher, XHDCP1X_CIPHER_REG_CONTROL, value);
   840	
   841		return 0;
   842	}
   843	EXPORT_SYMBOL_GPL(xhdcp1x_cipher_setb);
   844	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
