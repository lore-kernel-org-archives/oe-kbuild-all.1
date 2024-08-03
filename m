Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27925D2EE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 09:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722676196; cv=none; b=q7y62n4p9PapIPBQ0pmKhdq5sgJt04+3TJBiI1Q3DK7qKqVhIZzL+6Om6953YLOIA/Tj64l/HFk7YBq50mMZyreqk6GbHHCk5liN47dYbqo6e/r7qR/m3rYtx6nrqLXO0kpA5XVBPFozRvWZDNxEbc60pxTds7GdFJhAFuTzVyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722676196; c=relaxed/simple;
	bh=EHhJCT9y3tJmP2jy5f+eRtii6ccVkUXe5uAUCe7a0tE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=suzcmxvfHeKUbJt+skC4XXQEB6ipkeXUV7Qa4BYXBrTZRMW0tk2HThdSU4/XCyIOgv7ZRdDN4rjDkyRfZ6aI0Gid+itzgmX/rJCbApu8jwJFUdIATWnlUjiwk8DgN1+zi0CP//5HQFOe8II7o2jAL7DhOiTSWq3Cykl07cn7cT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iegmTJ8B; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iegmTJ8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722676195; x=1754212195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EHhJCT9y3tJmP2jy5f+eRtii6ccVkUXe5uAUCe7a0tE=;
  b=iegmTJ8Bj6gtvK0YrB3tjglD9yOvUbifE96OcLq0mcTomRQq9qWgBlvp
   GZHVD7R/9i0Zl8odYLd80bP6lPq+z0G3/iGJRHn83736NR6vZ2EDK03nF
   /Ce+wKMkVg45SK6jkBf5xLIfWcOquHtNwn8n4OYUVrQ2YcSm3Z/GqbRk6
   R64GpdOqw6OR2KmpHaH4+tIpAo0S92175JiAWSlJDQK3BwZcMNA81vi7B
   ue9UYzNkTJ7LcUIuAXD8Iq/yxJp4UHlg3p7ZGxO6lSZTQ0wm4JzA61jVM
   4EWrUS2VCzkSkY1CSXZpMJc+CufLL1sbLGCrXfseqYcMI0Fz7XP45dSeA
   Q==;
X-CSE-ConnectionGUID: MCApMLPPSq6qUAIghM7wJg==
X-CSE-MsgGUID: Q0p6QSK6QImJ9s0uJDvyQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20644797"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="20644797"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 02:09:54 -0700
X-CSE-ConnectionGUID: GmJwsUzOSXKRHFPvXBiP8w==
X-CSE-MsgGUID: hiWesc/iRiy4CVPYAjifQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="86613257"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Aug 2024 02:09:52 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saAlp-0000LM-30;
	Sat, 03 Aug 2024 09:09:49 +0000
Date: Sat, 3 Aug 2024 17:09:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kyle Swenson <kyle.swenson@est.tech>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [netdev-net:main 4/5] drivers/net/pse-pd/tps23881.c:755:13: error:
 implicit declaration of function 'FIELD_GET'
Message-ID: <202408031752.bo12Tv5D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
head:   fba917b169bea5f8f2ee300e19d5f7a6341a5251
commit: 89108cb5c28527c1882df2987394e5c261a1f4aa [4/5] net: pse-pd: tps23881: Fix the device ID check
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240803/202408031752.bo12Tv5D-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031752.bo12Tv5D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031752.bo12Tv5D-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/pse-pd/tps23881.c: In function 'tps23881_i2c_probe':
>> drivers/net/pse-pd/tps23881.c:755:13: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     755 |         if (FIELD_GET(TPS23881_REG_DEVID_MASK, ret) != TPS23881_DEVICE_ID) {
         |             ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +755 drivers/net/pse-pd/tps23881.c

   734	
   735	static int tps23881_i2c_probe(struct i2c_client *client)
   736	{
   737		struct device *dev = &client->dev;
   738		struct tps23881_priv *priv;
   739		int ret;
   740		u8 val;
   741	
   742		if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
   743			dev_err(dev, "i2c check functionality failed\n");
   744			return -ENXIO;
   745		}
   746	
   747		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   748		if (!priv)
   749			return -ENOMEM;
   750	
   751		ret = i2c_smbus_read_byte_data(client, TPS23881_REG_DEVID);
   752		if (ret < 0)
   753			return ret;
   754	
 > 755		if (FIELD_GET(TPS23881_REG_DEVID_MASK, ret) != TPS23881_DEVICE_ID) {
   756			dev_err(dev, "Wrong device ID\n");
   757			return -ENXIO;
   758		}
   759	
   760		ret = tps23881_flash_sram_fw(client);
   761		if (ret < 0)
   762			return ret;
   763	
   764		ret = i2c_smbus_read_byte_data(client, TPS23881_REG_FWREV);
   765		if (ret < 0)
   766			return ret;
   767	
   768		dev_info(&client->dev, "Firmware revision 0x%x\n", ret);
   769	
   770		/* Set configuration B, 16 bit access on a single device address */
   771		ret = i2c_smbus_read_byte_data(client, TPS23881_REG_GEN_MASK);
   772		if (ret < 0)
   773			return ret;
   774	
   775		val = ret | TPS23881_REG_NBITACC;
   776		ret = i2c_smbus_write_byte_data(client, TPS23881_REG_GEN_MASK, val);
   777		if (ret)
   778			return ret;
   779	
   780		priv->client = client;
   781		i2c_set_clientdata(client, priv);
   782		priv->np = dev->of_node;
   783	
   784		priv->pcdev.owner = THIS_MODULE;
   785		priv->pcdev.ops = &tps23881_ops;
   786		priv->pcdev.dev = dev;
   787		priv->pcdev.types = ETHTOOL_PSE_C33;
   788		priv->pcdev.nr_lines = TPS23881_MAX_CHANS;
   789		ret = devm_pse_controller_register(dev, &priv->pcdev);
   790		if (ret) {
   791			return dev_err_probe(dev, ret,
   792					     "failed to register PSE controller\n");
   793		}
   794	
   795		return ret;
   796	}
   797	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
