Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FC338DE1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 08:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CEUAWVS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701333294; x=1732869294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0SboqQn8ZcUo9uKZvfvCfyG81ezCN6T/zrFvF7NSEBw=;
  b=CEUAWVS2V+bZlnMtCMyg/hz3Wzaj7U5Y7MJfMBJXHis4+UgmUQJIh6NQ
   3VhLOi4Cx0wW9lHo1SMy13qcK9G6L7MESL06frWCkwwcpFoPM14ouitDS
   EXWAXQZ5O44HNYiobElVBa+nSV9xjMIGiNo4yWoXFJdOAJpnWWLFaPdyc
   +BouurfKDOvWMy0LnlJ5xraVP2Gp/PImAxEX+guUCXqH3T/eB+rHpjPkb
   2iy5eYEFKRHiu4gt4ETANK65SPBlBNjSq0qpF2aVAh/g8+gVpifWpGv8L
   rkkSzx/PHn98TFPD2D7FZuyZnd4fyPxZnn3c5qIkpoPjd98dm5MrrFTU6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="6562131"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="6562131"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 00:34:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="803601465"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="803601465"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 30 Nov 2023 00:34:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8cVW-0001a8-0V;
	Thu, 30 Nov 2023 08:34:50 +0000
Date: Thu, 30 Nov 2023 16:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Beniamin Sandu <beniaminsandu@gmail.com>, dinguyen@kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Beniamin Sandu <beniaminsandu@gmail.com>
Subject: Re: [PATCH] firmware: stratix10-rsu: correctly report unsupported
 DCMF commands
Message-ID: <202311301536.gQXR41jR-lkp@intel.com>
References: <20231129190336.247674-1-beniaminsandu@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129190336.247674-1-beniaminsandu@gmail.com>

Hi Beniamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc3 next-20231130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Beniamin-Sandu/firmware-stratix10-rsu-correctly-report-unsupported-DCMF-commands/20231130-055016
base:   linus/master
patch link:    https://lore.kernel.org/r/20231129190336.247674-1-beniaminsandu%40gmail.com
patch subject: [PATCH] firmware: stratix10-rsu: correctly report unsupported DCMF commands
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231130/202311301536.gQXR41jR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301536.gQXR41jR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301536.gQXR41jR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/stratix10-rsu.c: In function 'rsu_dcmf_version_callback':
>> drivers/firmware/stratix10-rsu.c:240:9: error: expected ';' before 'else'
     240 |         else
         |         ^~~~
   drivers/firmware/stratix10-rsu.c: In function 'rsu_dcmf_status_callback':
   drivers/firmware/stratix10-rsu.c:271:9: error: expected ';' before 'else'
     271 |         else
         |         ^~~~


vim +240 drivers/firmware/stratix10-rsu.c

   217	
   218	/**
   219	 * rsu_dcmf_version_callback() - Callback from Intel service layer for getting
   220	 * the DCMF version
   221	 * @client: pointer to client
   222	 * @data: pointer to callback data structure
   223	 *
   224	 * Callback from Intel service layer for DCMF version number
   225	 */
   226	static void rsu_dcmf_version_callback(struct stratix10_svc_client *client,
   227					      struct stratix10_svc_cb_data *data)
   228	{
   229		struct stratix10_rsu_priv *priv = client->priv;
   230		unsigned long long *value1 = (unsigned long long *)data->kaddr1;
   231		unsigned long long *value2 = (unsigned long long *)data->kaddr2;
   232	
   233		if (data->status == BIT(SVC_STATUS_OK)) {
   234			priv->dcmf_version.dcmf0 = FIELD_GET(RSU_DCMF0_MASK, *value1);
   235			priv->dcmf_version.dcmf1 = FIELD_GET(RSU_DCMF1_MASK, *value1);
   236			priv->dcmf_version.dcmf2 = FIELD_GET(RSU_DCMF2_MASK, *value2);
   237			priv->dcmf_version.dcmf3 = FIELD_GET(RSU_DCMF3_MASK, *value2);
   238		} else if (data->status == BIT(SVC_STATUS_NO_SUPPORT))
   239			dev_warn(client->dev, "Secure FW doesn't support DCMF version.")
 > 240		else
   241			dev_err(client->dev, "failed to get DCMF version\n");
   242	
   243		complete(&priv->completion);
   244	}
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
