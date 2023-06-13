Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2473D385
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 21:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686692907; x=1718228907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0wgOieI/cYvfDquGZwmNO9r/9UvAT9qAMFt6hKsxZNk=;
  b=d5h37xpy4ra7irMD/6Cdkd2iBIvVZyZbklYA93ZVvdaILGyxjLB9kD2p
   6yOkNdzu2FInUiQRS6/U8Bateg/nCNcLm9F6TfyZcnvPT/CsMXLI0djpp
   VtEI6wKlwCHdavby+2tado8WUDvd3RbFUxCHXPvG5aeeCH0xAS0eQ+/Gx
   0WRJAxEcswOtNmjhv97JvvngIrsKnlEScBONNVIGzmHotzymCIn5sKIF4
   yHYwfRXB4GME1scilpBt/y9R289EIO1pO2PYRJAxLsnnkxOqE481ikHTD
   aXwbtT8A/gVU+1Sk4if3CCGd49kJCN2VKaVLWosPyO7TxghGoz9CvAYUa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="338812705"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="338812705"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 14:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="741602675"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="741602675"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Jun 2023 14:48:24 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9BsF-0001om-2w;
	Tue, 13 Jun 2023 21:48:23 +0000
Date: Wed, 14 Jun 2023 05:47:50 +0800
From: kernel test robot <lkp@intel.com>
To: Shay Drory <shayd@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Moshe Shemesh <moshe@nvidia.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 8191/9385] htmldocs:
 Documentation/networking/device_drivers/ethernet/mellanox/mlx5/switchdev.rst:57:
 WARNING: Unexpected indentation.
Message-ID: <202306140505.ZTBob65w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1f6ce8392d6ff486af5ca96df9ded5882c4b6977
commit: e71383fb9cd15a28d6c01d2c165a96f1c0bcf418 [8191/9385] net/mlx5: Light probe local SFs
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e71383fb9cd15a28d6c01d2c165a96f1c0bcf418
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e71383fb9cd15a28d6c01d2c165a96f1c0bcf418
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306140505.ZTBob65w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/networking/device_drivers/ethernet/mellanox/mlx5/switchdev.rst:57: WARNING: Unexpected indentation.
>> Documentation/networking/device_drivers/ethernet/mellanox/mlx5/switchdev.rst:66: WARNING: undefined label: documentation/networking/devlink/devlink-params.rst (if the link has no caption the label must precede a section header)

vim +57 Documentation/networking/device_drivers/ethernet/mellanox/mlx5/switchdev.rst

    52	
    53	Usage example:
    54	Create SF:
    55	$ devlink port add pci/0000:08:00.0 flavour pcisf pfnum 0 sfnum 11
    56	$ devlink port function set pci/0000:08:00.0/32768 \
  > 57	               hw_addr 00:00:00:00:00:11 state active
    58	
    59	Enable ETH auxiliary device:
    60	$ devlink dev param set auxiliary/mlx5_core.sf.1 \
    61	              name enable_eth value true cmode driverinit
    62	
    63	Now, in order to fully probe the SF, use devlink reload:
    64	$ devlink dev reload auxiliary/mlx5_core.sf.1
    65	
  > 66	mlx5 supports ETH,rdma and vdpa (vnet) auxiliary devices devlink params (see :ref:`Documentation/networking/devlink/devlink-params.rst`)
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
