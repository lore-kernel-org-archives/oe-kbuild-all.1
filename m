Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CD517D1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 05:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695964522; x=1727500522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=73uMG51IxN75m0fqOYv/bygzHaFAHKpPxm+RgU8xN+Q=;
  b=U8C9kTgZwkfH+3DHXp+o1S4wXSNuYvCQH9Lz66sHF3MW4IbYklDL1NkQ
   g2mtV3RdcnT/HHh5276tr7dm6dUxn4cwTkrQAxaesnDwiyYkhOfCS387C
   6w8Ky972hYLXibGFaPYmIzYRp1Ngvcbg3adchiLp9qcAeEEv3blGVBB9v
   L6mnEKRaVmTPhFZVy1Lqa7H/fSTW4HruatNChAsV7jxXtUbs+wcn6goN1
   LY/l8R9t1XSBM3+ek1gWfRj2XRj6sGRwpsyjRUCJJPXJ3K6z4hvhfzro+
   8Ew0Ugiv+s0JcaTooOWc1nkZxn2wFA3rJAhuKExjoUNXxeCQLJHAE2wYO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="448729785"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="448729785"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 22:15:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="923508695"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="923508695"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 28 Sep 2023 22:15:19 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm5qP-0002V7-0z;
	Fri, 29 Sep 2023 05:15:17 +0000
Date: Fri, 29 Sep 2023 13:14:37 +0800
From: kernel test robot <lkp@intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Davor Joja <davor.joja@logicbricks.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 334/1370]
 drivers/media/i2c/adv7511-v4l2.c:2073:63: sparse: sparse: incorrect type in
 argument 1 (different base types)
Message-ID: <202309291359.zlLoL7mE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 735b2b500b004b16981ba99aed31749db2e7104a [334/1370] drivers: media: Customized adv7511 for Xylon LogiCVC (deprecated)
config: i386-randconfig-062-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291359.zlLoL7mE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291359.zlLoL7mE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291359.zlLoL7mE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/adv7511-v4l2.c:2073:63: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2073:63: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2073:63: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2077:65: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2077:65: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2077:65: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2081:62: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2081:62: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2081:62: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2088:55: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2088:55: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2088:55: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2092:55: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2092:55: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2092:55: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2096:55: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2096:55: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2096:55: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2100:55: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2100:55: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2100:55: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2104:55: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2104:55: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2104:55: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2108:55: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2108:55: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2108:55: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2112:55: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2112:55: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2112:55: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2122:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2122:42: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2122:42: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2128:55: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2128:55: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2128:55: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2132:55: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2132:55: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2132:55: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2136:55: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2136:55: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2136:55: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2140:55: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2140:55: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2140:55: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2145:63: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2145:63: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2145:63: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2152:72: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2152:72: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2152:72: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2157:72: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2157:72: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2157:72: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2162:72: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2162:72: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2162:72: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2167:72: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2167:72: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2167:72: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2172:72: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2172:72: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2172:72: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2177:72: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2177:72: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2177:72: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2182:72: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2182:72: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2182:72: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2187:72: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2187:72: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2187:72: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2192:72: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2192:72: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2192:72: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2197:72: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2197:72: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2197:72: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2202:72: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2202:72: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2202:72: sparse:     got unsigned int const [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2207:72: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop @@
   drivers/media/i2c/adv7511-v4l2.c:2207:72: sparse:     expected restricted __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2207:72: sparse:     got unsigned int const [usertype] *[assigned] prop

vim +2073 drivers/media/i2c/adv7511-v4l2.c

  2057	
  2058	
  2059	static void adv7511_get_ofdt_config(struct i2c_client *client,
  2060		struct adv7511_state *state)
  2061	{
  2062		struct device_node *dn = client->dev.of_node;
  2063		struct device_node *np;
  2064		struct adv7511_config *config = &state->cfg;
  2065		u32 const *prop;
  2066		int size;
  2067		bool vin_loaded, vout_loaded;
  2068	
  2069		vin_loaded = vout_loaded = false;
  2070	
  2071		prop = of_get_property(dn, "edid-addr", &size);
  2072		if (prop)
> 2073			state->pdata.i2c_edid = (uint8_t)be32_to_cpup(prop);
  2074	
  2075		prop = of_get_property(dn, "pktmem-addr", &size);
  2076		if (prop)
  2077			state->pdata.i2c_pktmem = (uint8_t)be32_to_cpup(prop);
  2078	
  2079		prop = of_get_property(dn, "cec-addr", &size);
  2080		if (prop)
  2081			state->pdata.i2c_cec = (uint8_t)be32_to_cpup(prop);
  2082	
  2083		np = of_find_node_by_name(dn, "video-input");
  2084		if (np) {
  2085			prop = of_get_property(np, "input-id", &size);
  2086			if (prop)
  2087				config->in_params.input_id =
  2088					(uint8_t)be32_to_cpup(prop);
  2089			prop = of_get_property(np, "input-style", &size);
  2090			if (prop)
  2091				config->in_params.input_style =
  2092					(uint8_t)be32_to_cpup(prop);
  2093			prop = of_get_property(np, "input-color-depth", &size);
  2094			if (prop)
  2095				config->in_params.input_color_depth =
  2096					(uint8_t)be32_to_cpup(prop);
  2097			prop = of_get_property(np, "bit-justification", &size);
  2098			if (prop)
  2099				config->in_params.bit_justification =
  2100					(uint8_t)be32_to_cpup(prop);
  2101			prop = of_get_property(np, "hsync-polarity", &size);
  2102			if (prop)
  2103				config->in_params.hsync_polarity =
  2104					(uint8_t)be32_to_cpup(prop);
  2105			prop = of_get_property(np, "vsync-polarity", &size);
  2106			if (prop)
  2107				config->in_params.vsync_polarity =
  2108					(uint8_t)be32_to_cpup(prop);
  2109			prop = of_get_property(np, "clock-delay", &size);
  2110			if (prop)
  2111				config->in_params.clock_delay =
  2112					(uint8_t)be32_to_cpup(prop);
  2113			vin_loaded = true;
  2114		} else {
  2115			pr_info("No video input configuration, using device default\n");
  2116		}
  2117	
  2118		np = of_find_node_by_name(dn, "video-output");
  2119		if (np) {
  2120			prop = of_get_property(np, "hdmi-mode", &size);
  2121			if (prop) {
  2122				if (be32_to_cpup(prop) == 1)
  2123					config->out_params.hdmi_mode = true;
  2124			}
  2125			prop = of_get_property(np, "output-format", &size);
  2126			if (prop)
  2127				config->out_params.output_format =
  2128					(uint8_t)be32_to_cpup(prop);
  2129			prop = of_get_property(np, "output-color-space", &size);
  2130			if (prop)
  2131				config->out_params.output_color_space =
  2132					(uint8_t)be32_to_cpup(prop);
  2133			prop = of_get_property(np, "up-conversion", &size);
  2134			if (prop)
  2135				config->out_params.up_conversion =
  2136					(uint8_t)be32_to_cpup(prop);
  2137			prop = of_get_property(np, "csc-enable", &size);
  2138			if (prop)
  2139				config->out_params.csc_enable =
  2140					(uint8_t)be32_to_cpup(prop);
  2141			if (config->out_params.csc_enable) {
  2142				prop = of_get_property(np, "csc-scaling-factor", &size);
  2143				if (prop) {
  2144					config->out_params.csc_scaling_factor =
  2145						(uint8_t)be32_to_cpup(prop);
  2146				}
  2147				np = of_find_node_by_name(dn, "csc-coefficients");
  2148				if (np) {
  2149					prop = of_get_property(np, "a1", &size);
  2150					if (prop) {
  2151						config->out_params.csc_coeff.a1 =
  2152							(uint16_t)be32_to_cpup(prop);
  2153					}
  2154					prop = of_get_property(np, "a2", &size);
  2155					if (prop) {
  2156						config->out_params.csc_coeff.a2 =
  2157							(uint16_t)be32_to_cpup(prop);
  2158					}
  2159					prop = of_get_property(np, "a3", &size);
  2160					if (prop) {
  2161						config->out_params.csc_coeff.a3 =
  2162							(uint16_t)be32_to_cpup(prop);
  2163					}
  2164					prop = of_get_property(np, "a4", &size);
  2165					if (prop) {
  2166						config->out_params.csc_coeff.a4 =
  2167							(uint16_t)be32_to_cpup(prop);
  2168					}
  2169					prop = of_get_property(np, "b1", &size);
  2170					if (prop) {
  2171						config->out_params.csc_coeff.b1 =
  2172							(uint16_t)be32_to_cpup(prop);
  2173					}
  2174					prop = of_get_property(np, "b2", &size);
  2175					if (prop) {
  2176						config->out_params.csc_coeff.b2 =
  2177							(uint16_t)be32_to_cpup(prop);
  2178					}
  2179					prop = of_get_property(np, "b3", &size);
  2180					if (prop) {
  2181						config->out_params.csc_coeff.b3 =
  2182							(uint16_t)be32_to_cpup(prop);
  2183					}
  2184					prop = of_get_property(np, "b4", &size);
  2185					if (prop) {
  2186						config->out_params.csc_coeff.b4 =
  2187							(uint16_t)be32_to_cpup(prop);
  2188					}
  2189					prop = of_get_property(np, "c1", &size);
  2190					if (prop) {
  2191						config->out_params.csc_coeff.c1 =
  2192							(uint16_t)be32_to_cpup(prop);
  2193					}
  2194					prop = of_get_property(np, "c2", &size);
  2195					if (prop) {
  2196						config->out_params.csc_coeff.c2 =
  2197							(uint16_t)be32_to_cpup(prop);
  2198					}
  2199					prop = of_get_property(np, "c3", &size);
  2200					if (prop) {
  2201						config->out_params.csc_coeff.c3 =
  2202							(uint16_t)be32_to_cpup(prop);
  2203					}
  2204					prop = of_get_property(np, "c4", &size);
  2205					if (prop) {
  2206						config->out_params.csc_coeff.c4 =
  2207							(uint16_t)be32_to_cpup(prop);
  2208					}
  2209				} else {
  2210					pr_info("No CSC coefficients, using default\n");
  2211				}
  2212			}
  2213			vout_loaded = true;
  2214		} else {
  2215			pr_info("No video output configuration, using device default\n");
  2216		}
  2217	
  2218		if (vin_loaded && vout_loaded)
  2219			config->loaded = true;
  2220	}
  2221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
