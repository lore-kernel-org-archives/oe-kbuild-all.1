Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B5310780
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHkYUq95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699517593; x=1731053593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zk017WLOVTnUB6M7Vh0juX4beeBH1AsX7p7DEK+yBQU=;
  b=SHkYUq95Z2xl+qgHMuesL8O8RLBvTnTmSB6a3LgXCyj2CVS/3Zw09lC/
   ekK88emV1gzkaJmFeAKTAhIq+wQlLLOJqNTkM+LFs2Pss2qdBf+xscC0R
   nZeox2CgoQLmfsdVkc0QtiC14ZeP5NWTiQPAhGge70yzR5dMwVf9FGmPX
   b9/DD0WRvjGb9Bbqxwtw1y6AQDsgOCqCthmF/I+Nxr/Zo9C23Vn60nlkx
   PcTwhj9KZRHMrCPHF1ye9e7kpCnEMHZZjr+E/5C/6VqvnO5rV/+3Xeh3+
   H/ADH19sKHtSOaa+D34sGQ7lKm12O3iywk17h3W8eiYUJFiixdhsBa5Cw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="370142923"
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; 
   d="scan'208";a="370142923"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 00:13:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="936771520"
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; 
   d="scan'208";a="936771520"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Nov 2023 00:13:10 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r10A0-0008a3-0I;
	Thu, 09 Nov 2023 08:13:08 +0000
Date: Thu, 9 Nov 2023 16:12:20 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/start-BRA-support 38/38]
 drivers/soundwire/cadence_master.c:2087:5: warning: no previous prototype
 for 'sdw_prepare_read_pd0_buffer'
Message-ID: <202311091600.JEIuj7fv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/start-BRA-support
head:   eca5e5a023e3d4b764c173711062a720e5ad9467
commit: eca5e5a023e3d4b764c173711062a720e5ad9467 [38/38] [WIP] soundwire: cadence: add BRA read command formatting
config: arm64-randconfig-001-20231109 (https://download.01.org/0day-ci/archive/20231109/202311091600.JEIuj7fv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311091600.JEIuj7fv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091600.JEIuj7fv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soundwire/cadence_master.c:1913:14: warning: no previous prototype for 'sdw_bra_actual_data_size' [-Wmissing-prototypes]
    1913 | unsigned int sdw_bra_actual_data_size(unsigned int allocated_bytes_per_frame)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/cadence_master.c:1929:14: warning: no previous prototype for 'sdw_write_pdi0_buffer_size' [-Wmissing-prototypes]
    1929 | unsigned int sdw_write_pdi0_buffer_size(unsigned int actual_data_size)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/cadence_master.c:1947:14: warning: no previous prototype for 'sdw_write_pdi1_buffer_size' [-Wmissing-prototypes]
    1947 | unsigned int sdw_write_pdi1_buffer_size(unsigned int actual_data_size)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/cadence_master.c:1960:14: warning: no previous prototype for 'sdw_read_pdi0_buffer_size' [-Wmissing-prototypes]
    1960 | unsigned int sdw_read_pdi0_buffer_size(unsigned int actual_data_size)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/cadence_master.c:1971:14: warning: no previous prototype for 'sdw_read_pdi1_buffer_size' [-Wmissing-prototypes]
    1971 | unsigned int sdw_read_pdi1_buffer_size(unsigned int actual_data_size)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/cadence_master.c:1991:5: warning: no previous prototype for 'sdw_copy_write_data' [-Wmissing-prototypes]
    1991 | int sdw_copy_write_data(u8 *data, int data_size, u8 *dma_buffer, int dma_buffer_size)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/soundwire/cadence_master.c:2027:5: warning: no previous prototype for 'sdw_prepare_write_pd0_buffer' [-Wmissing-prototypes]
    2027 | int sdw_prepare_write_pd0_buffer(u8 *header, unsigned int header_size,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soundwire/cadence_master.c:2087:5: warning: no previous prototype for 'sdw_prepare_read_pd0_buffer' [-Wmissing-prototypes]
    2087 | int sdw_prepare_read_pd0_buffer(u8 *header, unsigned int header_size,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/cadence_master.c:2130:5: warning: no previous prototype for 'sdw_prepare_write_dma_buffer' [-Wmissing-prototypes]
    2130 | int sdw_prepare_write_dma_buffer(u8 dev_num, u32 start_register,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soundwire/cadence_master.c:2206:5: warning: no previous prototype for 'sdw_prepare_read_dma_buffer' [-Wmissing-prototypes]
    2206 | int sdw_prepare_read_dma_buffer(u8 dev_num, u32 start_register,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/cadence_master.c:2277:5: warning: no previous prototype for 'sdw_test_bra_data_block' [-Wmissing-prototypes]
    2277 | int sdw_test_bra_data_block(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/sdw_prepare_read_pd0_buffer +2087 drivers/soundwire/cadence_master.c

  2086	
> 2087	int sdw_prepare_read_pd0_buffer(u8 *header, unsigned int header_size,
  2088					u8 *dma_buffer, unsigned int dma_buffer_size,
  2089					unsigned int *dma_data_written,
  2090					unsigned int frame_counter)
  2091	{
  2092		u8 crc8_lookup_table[CRC8_TABLE_SIZE];
  2093		u8 crc;
  2094		int data_written;
  2095		u8 *last_byte;
  2096	
  2097		crc8_populate_msb(crc8_lookup_table, SDW_CRC8_POLY);
  2098	
  2099		/* clear buffer */
  2100		memset(dma_buffer, 0, dma_buffer_size);
  2101		*dma_data_written = 0;
  2102	
  2103		dma_buffer[3] = BIT(7);
  2104		dma_buffer[3] |= frame_counter & GENMASK(3, 0);
  2105	
  2106		data_written = sdw_copy_write_data(header, header_size, dma_buffer, dma_buffer_size);
  2107		if (data_written < 0)
  2108			return data_written;
  2109		dma_buffer += data_written;
  2110		dma_buffer_size -= data_written;
  2111		*dma_data_written += data_written;
  2112	
  2113		crc = 0xFF;
  2114		crc = crc8(crc8_lookup_table, header, header_size, crc);
  2115	
  2116		data_written = sdw_copy_write_data(&crc, 1, dma_buffer, dma_buffer_size);
  2117		if (data_written < 0)
  2118			return data_written;
  2119		dma_buffer += data_written;
  2120		dma_buffer_size -= data_written;
  2121		*dma_data_written += data_written;
  2122	
  2123		/* tag last byte */
  2124		last_byte = dma_buffer - 1;
  2125		last_byte[0] = BIT(6);
  2126	
  2127		return 0;
  2128	}
  2129	
  2130	int sdw_prepare_write_dma_buffer(u8 dev_num, u32 start_register,
  2131					 u8 *data, int data_size,
  2132					 int data_per_frame,
  2133					 u8 *dma_buffer, int dma_buffer_size,
  2134					 int *dma_buffer_total_bytes)
  2135	{
  2136		u8 header[SDW_CDNS_BRA_HDR];
  2137		u8 *p_dma_buffer;
  2138		u8 *p_data;
  2139		int dma_data_written;
  2140		int total_dma_data_written;
  2141		u8 counter;
  2142		int remainder;
  2143		int ret;
  2144	
  2145		counter = 1;
  2146	
  2147		header[0] = BIT(1);		/* write command: BIT(1) set */
  2148		header[0] |= GENMASK(7, 6);	/* header is active */
  2149		header[0] |= (dev_num << 2);
  2150	
  2151		p_data = &data[0];
  2152		p_dma_buffer = &dma_buffer[0];
  2153		total_dma_data_written = 0;
  2154	
  2155		while (data_size / data_per_frame) {
  2156			header[1] = data_per_frame;
  2157			header[2] = start_register >> 24 & 0xFF;
  2158			header[3] = start_register >> 16 & 0xFF;
  2159			header[4] = start_register >> 8 & 0xFF;
  2160			header[5] = start_register >> 0 & 0xFF;
  2161	
  2162			ret = sdw_prepare_write_pd0_buffer(header, SDW_CDNS_BRA_HDR,
  2163							   p_data, data_per_frame,
  2164							   p_dma_buffer, dma_buffer_size,
  2165							   &dma_data_written,
  2166							   counter);
  2167			if (ret < 0)
  2168				return ret;
  2169	
  2170			counter++;
  2171	
  2172			p_data += data_per_frame;
  2173			data_size -= data_per_frame;
  2174	
  2175			p_dma_buffer += dma_data_written;
  2176			dma_buffer_size -= dma_data_written;
  2177			total_dma_data_written += dma_data_written;
  2178	
  2179			start_register += data_per_frame;
  2180		}
  2181	
  2182		remainder = data_size % data_per_frame;
  2183		if (remainder) {
  2184			header[1] = remainder;
  2185			header[2] = start_register >> 24 & 0xFF;
  2186			header[3] = start_register >> 16 & 0xFF;
  2187			header[4] = start_register >> 8 & 0xFF;
  2188			header[5] = start_register >> 0 & 0xFF;
  2189	
  2190			ret = sdw_prepare_write_pd0_buffer(header, SDW_CDNS_BRA_HDR,
  2191							   p_data, remainder,
  2192							   p_dma_buffer, dma_buffer_size,
  2193							   &dma_data_written,
  2194							   counter);
  2195			if (ret < 0)
  2196				return ret;
  2197	
  2198			total_dma_data_written += dma_data_written;
  2199		}
  2200	
  2201		*dma_buffer_total_bytes = total_dma_data_written;
  2202	
  2203		return 0;
  2204	}
  2205	
> 2206	int sdw_prepare_read_dma_buffer(u8 dev_num, u32 start_register,
  2207					int data_size,
  2208					int data_per_frame,
  2209					u8 *dma_buffer, int dma_buffer_size,
  2210					int *dma_buffer_total_bytes)
  2211	{
  2212		u8 header[SDW_CDNS_BRA_HDR];
  2213		u8 *p_dma_buffer;
  2214		int dma_data_written;
  2215		int total_dma_data_written;
  2216		u8 counter;
  2217		int remainder;
  2218		int ret;
  2219	
  2220		counter = 1;
  2221	
  2222		header[0] = 0;			/* read command: BIT(1) cleared */
  2223		header[0] |= GENMASK(7, 6);	/* header is active */
  2224		header[0] |= (dev_num << 2);
  2225	
  2226		p_dma_buffer = &dma_buffer[0];
  2227		total_dma_data_written = 0;
  2228	
  2229		while (data_size / data_per_frame) {
  2230			header[1] = data_per_frame;
  2231			header[2] = start_register >> 24 & 0xFF;
  2232			header[3] = start_register >> 16 & 0xFF;
  2233			header[4] = start_register >> 8 & 0xFF;
  2234			header[5] = start_register >> 0 & 0xFF;
  2235	
  2236			ret = sdw_prepare_read_pd0_buffer(header, SDW_CDNS_BRA_HDR,
  2237							  p_dma_buffer, dma_buffer_size,
  2238							  &dma_data_written,
  2239							  counter);
  2240			if (ret < 0)
  2241				return ret;
  2242	
  2243			counter++;
  2244	
  2245			data_size -= data_per_frame;
  2246	
  2247			p_dma_buffer += dma_data_written;
  2248			dma_buffer_size -= dma_data_written;
  2249			total_dma_data_written += dma_data_written;
  2250	
  2251			start_register += data_per_frame;
  2252		}
  2253	
  2254		remainder = data_size % data_per_frame;
  2255		if (remainder) {
  2256			header[1] = remainder;
  2257			header[2] = start_register >> 24 & 0xFF;
  2258			header[3] = start_register >> 16 & 0xFF;
  2259			header[4] = start_register >> 8 & 0xFF;
  2260			header[5] = start_register >> 0 & 0xFF;
  2261	
  2262			ret = sdw_prepare_read_pd0_buffer(header, SDW_CDNS_BRA_HDR,
  2263							  p_dma_buffer, dma_buffer_size,
  2264							  &dma_data_written,
  2265							  counter);
  2266			if (ret < 0)
  2267				return ret;
  2268	
  2269			total_dma_data_written += dma_data_written;
  2270		}
  2271	
  2272		*dma_buffer_total_bytes = total_dma_data_written;
  2273	
  2274		return 0;
  2275	}
  2276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
