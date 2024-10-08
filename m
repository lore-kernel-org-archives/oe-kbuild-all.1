Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BC242AB1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 07:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728372045; cv=none; b=teCwzXwfYVtASU/xlFSxGvLd49CiemyYXrNF2EiaiIPE4CQU+d1GL7bFzGZeebOOzTcTnXsm96KKjn1Hwd6Iyi1EQ5BS2uFO4HmrgHxWhDXYF3XcLhdILGpqtNU3f/lAX7enq5lMYkBsyBrdTVrRF2g13nrboxCf+OFOk4Wvyk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728372045; c=relaxed/simple;
	bh=Rn1tdMF4LSwkuLbf4jm6VgwMbmYg+6fAZnOTNc7Z68U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQNe1/0+sGIfZ/GGRfdLQzDYpArnMrIi9vjCRgpKDK8ZkjAzfYDJgrs6AU7AmHdiFh7qXK7xDSX2XQiyQHS+tcbVjMm6ePFVZs8/g+9aFpHPJz4cpomdTmdAa9NCiIqoTbl8VeuZ2NL23i6ccFv9qhLQuUGnIcFRUZsM0EgVAig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqVO7kvk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqVO7kvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728372042; x=1759908042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rn1tdMF4LSwkuLbf4jm6VgwMbmYg+6fAZnOTNc7Z68U=;
  b=IqVO7kvk4YbyUUJunYFPo2CMY/FSQTiuUMtu2woGq6MZ/IPzeDQjORTT
   yfw4+ysj4DMh2F+ZvCr7yl3BG/7sFvNFqQcyhEgqSy8EKbMT5LyfJ29Uy
   biUJ+gBWjEjSWMNfxnZ+WQrWzz6mCaQxuGSpwSOQD8nbayDX0sx1zEvGR
   phFNbi/0/cRgQPYLpi+145WWOkUdEBI490N+Vc7Y0N0BkvzdUo2ORVJu2
   Q3DmNPMc38novbEkZJwHsILm3rjCge1gNbZCiv83vGa8RiyVxML1uN0CM
   XB2m6hZRxFGKAC6RpxeiFAnKdAh5rO7oPFSBxIgByn0U117QflV7A5MY+
   Q==;
X-CSE-ConnectionGUID: b20oU75+QOKNmqYDRl+JBg==
X-CSE-MsgGUID: M84rh6KOSvaIIruKpb7ZuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27714324"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="27714324"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 00:20:42 -0700
X-CSE-ConnectionGUID: 2kh+tj+rSnqnTCl+hUh0XQ==
X-CSE-MsgGUID: aTJGazz7SLGMJjOmbvdKaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="75301280"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Oct 2024 00:20:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy4WM-00062C-1A;
	Tue, 08 Oct 2024 07:20:38 +0000
Date: Tue, 8 Oct 2024 15:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Stockhausen <markus.stockhausen@gmx.de>,
	linux-phy@lists.infradead.org, chris.packham@alliedtelesis.co.nz,
	devicetree@vger.kernel.org, krzk@kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: Re: [PATCH v2 3/3] phy: Integrate Realtek Otto SerDes driver into
 build system
Message-ID: <202410081449.rLWpQtUj-lkp@intel.com>
References: <20241007163623.3274510-4-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007163623.3274510-4-markus.stockhausen@gmx.de>

Hi Markus,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on krzk-dt/for-next linus/master v6.12-rc2 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Stockhausen/dt-bindings-phy-add-realtek-otto-serdes-PHY-binding/20241008-003929
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241007163623.3274510-4-markus.stockhausen%40gmx.de
patch subject: [PATCH v2 3/3] phy: Integrate Realtek Otto SerDes driver into build system
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241008/202410081449.rLWpQtUj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410081449.rLWpQtUj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410081449.rLWpQtUj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/debugfs.h:16,
                    from drivers/phy/realtek/phy-rtk-otto-serdes.c:7:
   drivers/phy/realtek/phy-rtk-otto-serdes.c: In function 'rtsds_dbg_mode_open':
>> drivers/phy/realtek/phy-rtk-otto-serdes.c:868:29: error: passing argument 2 of 'single_open' from incompatible pointer type [-Werror=incompatible-pointer-types]
     868 | DEFINE_SHOW_STORE_ATTRIBUTE(rtsds_dbg_mode);
         |                             ^~~~~~~~~~~~~~
         |                             |
         |                             ssize_t (*)(struct seq_file *, void *) {aka long int (*)(struct seq_file *, void *)}
   include/linux/seq_file.h:223:34: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     223 |         return single_open(file, __name ## _show, inode->i_private);    \
         |                                  ^~~~~~
   include/linux/seq_file.h:176:32: note: expected 'int (*)(struct seq_file *, void *)' but argument is of type 'ssize_t (*)(struct seq_file *, void *)' {aka 'long int (*)(struct seq_file *, void *)'}
     176 | int single_open(struct file *, int (*)(struct seq_file *, void *), void *);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-otto-serdes.c: In function 'rtsds_dbg_reset_open':
   drivers/phy/realtek/phy-rtk-otto-serdes.c:891:29: error: passing argument 2 of 'single_open' from incompatible pointer type [-Werror=incompatible-pointer-types]
     891 | DEFINE_SHOW_STORE_ATTRIBUTE(rtsds_dbg_reset);
         |                             ^~~~~~~~~~~~~~~
         |                             |
         |                             ssize_t (*)(struct seq_file *, void *) {aka long int (*)(struct seq_file *, void *)}
   include/linux/seq_file.h:223:34: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     223 |         return single_open(file, __name ## _show, inode->i_private);    \
         |                                  ^~~~~~
   include/linux/seq_file.h:176:32: note: expected 'int (*)(struct seq_file *, void *)' but argument is of type 'ssize_t (*)(struct seq_file *, void *)' {aka 'long int (*)(struct seq_file *, void *)'}
     176 | int single_open(struct file *, int (*)(struct seq_file *, void *), void *);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/single_open +868 drivers/phy/realtek/phy-rtk-otto-serdes.c

40f1aea80b53b8 Markus Stockhausen 2024-10-07  847  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  848  static ssize_t rtsds_dbg_mode_write(struct file *file, const char __user *userbuf,
40f1aea80b53b8 Markus Stockhausen 2024-10-07  849  				size_t count, loff_t *ppos)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  850  {
40f1aea80b53b8 Markus Stockhausen 2024-10-07  851  	struct seq_file *seqf = file->private_data;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  852  	struct rtsds_macro *macro = dev_get_drvdata(seqf->private);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  853  	struct rtsds_ctrl *ctrl = macro->ctrl;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  854  	int ret, hwmode, phymode, sid = macro->sid;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  855  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  856  	ret = kstrtou32_from_user(userbuf, count, 16, &hwmode);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  857  	if (ret)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  858  		return ret;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  859  	/*
40f1aea80b53b8 Markus Stockhausen 2024-10-07  860  	 * Allow to set arbitrary modes into the SerDes to improve error analysis. Accept that
40f1aea80b53b8 Markus Stockhausen 2024-10-07  861  	 * this might confuse the internal state tracking.
40f1aea80b53b8 Markus Stockhausen 2024-10-07  862  	 */
40f1aea80b53b8 Markus Stockhausen 2024-10-07  863  	phymode = rtsds_hwmode_to_phymode(ctrl, hwmode);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  864  	rtsds_phy_set_mode_int(ctrl, sid, phymode, hwmode);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  865  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  866  	return count;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  867  }
40f1aea80b53b8 Markus Stockhausen 2024-10-07 @868  DEFINE_SHOW_STORE_ATTRIBUTE(rtsds_dbg_mode);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  869  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
