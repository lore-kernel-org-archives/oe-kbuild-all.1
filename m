Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7327518A93C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749913689; cv=none; b=n9xvW6mYgHHY27bwqXabo+RX7QHjWJcOofDedlGoq29WQsqoj/XLryRx5fXIwVKz9oS/RERRIqNdbKNuFzz/9Fuvg0PFF9I1+27popxvEzRwOLdgGXwqUxXCwE5kR39U9fO848VnJUphUM5wm13YvJHZiD8gF3f3b4zKjSgWp7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749913689; c=relaxed/simple;
	bh=MPy7ZX+WesAbbACLYDng+zLtkkNv1qr0cJzLNixzrZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmI6z8lsqsZ/eEJFKBjYh3UlsWgOhJ2v/olpcLD/ozBhbJ0se3fw2xAczt0PU27quGhTp5dOkiUy4BkfiaUwvtN+Put5BEJp4OhZF3Rwao27HUQT9lS+zpIfKqmc4PDMiqN+TKSI6f3FKn8HXuMl8urA9ieJokXVZaeQL7mQMOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0Ngi4EH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0Ngi4EH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749913687; x=1781449687;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MPy7ZX+WesAbbACLYDng+zLtkkNv1qr0cJzLNixzrZA=;
  b=m0Ngi4EH4Aoff9j4paqA7/ps9QFi7x+0zXD7nYC9lKjHcHNEDF4pOS22
   lM2mUhwOzmtqyToephhKqka+Fth9Zx75x0Qt9XHoo5lqBI2YlKK4JPy7T
   uOrhTbQpE9LcYFCmqVRdFyEAPrfOFhi4UH3/kfWxK1xDyd9RcSeASCimG
   8X9ZhhCu4XXBFVlqY+0/IThVtr2K+W+uCW/Sqxz+UtmdPXtOC09kdbaOv
   3y8XLVEpdBBiPhHYW6TQWJVFcxt/67juv4ZidGsixa4yLjeshone01Kl1
   /mGSZ3ctU54ZrDMRfv699va2l4ujMEOxrFebzvFC8qzO4pBOtVddI2uJr
   w==;
X-CSE-ConnectionGUID: QKoRM4G7QUCN6RIo4GQ67w==
X-CSE-MsgGUID: Nfq1/af0RHeT+IgZWdOTIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="69556106"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="69556106"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 08:08:06 -0700
X-CSE-ConnectionGUID: LDgqd4TNRgCk39sg4rYrIQ==
X-CSE-MsgGUID: n6GbxvhmT1SrrqFVKX5JUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="148059158"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2025 08:08:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQSU9-000Dbm-0a;
	Sat, 14 Jun 2025 15:07:57 +0000
Date: Sat, 14 Jun 2025 23:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <helgaas@kernel.org>, Mark Brown <broonie@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>
Subject: Re: [PATCH v3 12/28] driver core: fw_devlink: Tag the fwnode dev
 member as private
Message-ID: <202506142207.gM92KvY9-lkp@intel.com>
References: <20250613134817.681832-13-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-13-herve.codina@bootlin.com>

Hi Herve,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus wsa/i2c/for-next pci/next pci/for-linus linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina/Revert-treewide-Fix-probing-of-devices-in-DT-overlays/20250613-220124
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250613134817.681832-13-herve.codina%40bootlin.com
patch subject: [PATCH v3 12/28] driver core: fw_devlink: Tag the fwnode dev member as private
config: arc-randconfig-r123-20250614 (https://download.01.org/0day-ci/archive/20250614/202506142207.gM92KvY9-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250614/202506142207.gM92KvY9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506142207.gM92KvY9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/v4l2-core/v4l2-async.c:913:28: sparse: sparse: dereference of noderef expression
   drivers/media/v4l2-core/v4l2-async.c:913:52: sparse: sparse: dereference of noderef expression
   drivers/media/v4l2-core/v4l2-async.c:913:52: sparse: sparse: dereference of noderef expression

vim +913 drivers/media/v4l2-core/v4l2-async.c

517fd2b6a058bc Ezequiel Garcia 2021-01-08  896  
9b4d2f37484bed Sakari Ailus    2023-02-19  897  static void print_waiting_match(struct seq_file *s,
9b4d2f37484bed Sakari Ailus    2023-02-19  898  				struct v4l2_async_match_desc *match)
517fd2b6a058bc Ezequiel Garcia 2021-01-08  899  {
9b4d2f37484bed Sakari Ailus    2023-02-19  900  	switch (match->type) {
7a2259fc5182bc Sakari Ailus    2023-05-05  901  	case V4L2_ASYNC_MATCH_TYPE_I2C:
9b4d2f37484bed Sakari Ailus    2023-02-19  902  		seq_printf(s, " [i2c] dev=%d-%04x\n", match->i2c.adapter_id,
9b4d2f37484bed Sakari Ailus    2023-02-19  903  			   match->i2c.address);
517fd2b6a058bc Ezequiel Garcia 2021-01-08  904  		break;
7a2259fc5182bc Sakari Ailus    2023-05-05  905  	case V4L2_ASYNC_MATCH_TYPE_FWNODE: {
9b4d2f37484bed Sakari Ailus    2023-02-19  906  		struct fwnode_handle *devnode, *fwnode = match->fwnode;
517fd2b6a058bc Ezequiel Garcia 2021-01-08  907  
517fd2b6a058bc Ezequiel Garcia 2021-01-08  908  		devnode = fwnode_graph_is_endpoint(fwnode) ?
517fd2b6a058bc Ezequiel Garcia 2021-01-08  909  			  fwnode_graph_get_port_parent(fwnode) :
517fd2b6a058bc Ezequiel Garcia 2021-01-08  910  			  fwnode_handle_get(fwnode);
517fd2b6a058bc Ezequiel Garcia 2021-01-08  911  
517fd2b6a058bc Ezequiel Garcia 2021-01-08  912  		seq_printf(s, " [fwnode] dev=%s, node=%pfw\n",
517fd2b6a058bc Ezequiel Garcia 2021-01-08 @913  			   devnode->dev ? dev_name(devnode->dev) : "nil",
517fd2b6a058bc Ezequiel Garcia 2021-01-08  914  			   fwnode);
517fd2b6a058bc Ezequiel Garcia 2021-01-08  915  
517fd2b6a058bc Ezequiel Garcia 2021-01-08  916  		fwnode_handle_put(devnode);
517fd2b6a058bc Ezequiel Garcia 2021-01-08  917  		break;
517fd2b6a058bc Ezequiel Garcia 2021-01-08  918  	}
517fd2b6a058bc Ezequiel Garcia 2021-01-08  919  	}
517fd2b6a058bc Ezequiel Garcia 2021-01-08  920  }
517fd2b6a058bc Ezequiel Garcia 2021-01-08  921  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
