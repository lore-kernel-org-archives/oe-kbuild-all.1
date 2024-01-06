Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C309F8C12
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jan 2024 17:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGCqvQxa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704560929; x=1736096929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IAwvdhJYLS8yPLDpGRBLpndM9YLrPn9Cpf5WDRXt6fg=;
  b=dGCqvQxaFzqmzGPfllyfSve6+7Gnl8KMWlIYjwt8nKyc6pgXUsg8PjdF
   Ai/aJ7mnb7aa/2w2npYIwtE2j+0Blq9iEea+KTyu710SusD8RaShPeshH
   ywImevIZHxIght2FxuHlMO2lPZJBz3wnrFHtzrxOvzWZMX7MwAuHdCFQ3
   EjdQ5GIjOc74Y1Y2OVd2ouoRJzo0Zn1oHveFW0tvpTx+/YJ+xFKxp+aZ6
   sST08F+hq6GdKZ9J0K4/YYs257+IwtVksfbsBzULV3qHCfKj8eb+rqYIa
   Pu0jbBXacXxGZVWj7XdoIoYj2HsRf1pRWGt+1QLpTbGlXP4sJ1zRa+5wa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="382638558"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="382638558"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 09:08:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="924486235"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="924486235"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2024 09:08:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMAA9-0002mK-1t;
	Sat, 06 Jan 2024 17:08:45 +0000
Date: Sun, 7 Jan 2024 01:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [steev:c630-linux-v6.7.0-rc8 160/165]
 sound/soc/codecs/wsa884x.c:1782:38: error: 'struct sdw_stream_runtime' has
 no member named 'dev'
Message-ID: <202401070119.Uf29dEMS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux c630-linux-v6.7.0-rc8
head:   ff607c5b78e72a98f85de6a64124da02cca916b9
commit: 36178948b637e43373619370cac68c51fd4fffdd [160/165] ASoC: codecs: wsa884x: check if set_stream is called for proper bus
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240107/202401070119.Uf29dEMS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240107/202401070119.Uf29dEMS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401070119.Uf29dEMS-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/wsa884x.c: In function 'wsa884x_set_stream':
>> sound/soc/codecs/wsa884x.c:1782:38: error: 'struct sdw_stream_runtime' has no member named 'dev'
    1782 |         if (sdw->bus->dev != sruntime->dev)
         |                                      ^~


vim +1782 sound/soc/codecs/wsa884x.c

  1773	
  1774	static int wsa884x_set_stream(struct snd_soc_dai *dai,
  1775				      void *stream, int direction)
  1776	{
  1777		struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
  1778		struct sdw_stream_runtime *sruntime = stream;
  1779		struct sdw_slave *sdw = dev_to_sdw_dev(dai->dev);
  1780	
  1781		/* Check if this belongs to same bus */
> 1782		if (sdw->bus->dev != sruntime->dev)
  1783			return 0;
  1784	
  1785		wsa884x->sruntime = stream;
  1786	
  1787		return 0;
  1788	}
  1789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
