Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2EA6AC2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 08:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1DhWfIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699433351; x=1730969351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o8vUptc04+oRAMdpkYm4YQGdXBVZex/cRW5DsmGR8ss=;
  b=C1DhWfICkcMXd2xwXGPMLk91Ra+WRQtdy7CeaHE8hUVAvJvA7mp12bQ8
   Y8lv+0RB1MHeDM/A4Cl9dWLKzaT38Ivhh+tHvlWGrPY85s5gkr4WWMXfs
   rwwspNkHFW1O2UIJ0Z4qPxU4Oogd3+iDyKvB7V+kW3DYH+rRS0WNujvWY
   W3W29HDWNpJRyOsjGqBt7XwiP3zUHoIACksgwu19hI9y3b15eKwth9Dn+
   pgkEvsl80MSckK0C+zgdZesjsZSg+c6J31AVv2QBnVBSij2+oW8gVpS04
   FZKVxricvhL8skaAMRUH/bEkTFGvF8BvYy44c0IYQ4ALYiBKnnxqRnM0z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="2746421"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="2746421"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 00:49:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="880137270"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="880137270"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Nov 2023 00:49:08 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0eFG-0007pH-1S;
	Wed, 08 Nov 2023 08:49:06 +0000
Date: Wed, 8 Nov 2023 16:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/start-BRA-support 37/37]
 drivers/soundwire/cadence_master.c:1913:14: warning: no previous prototype
 for 'sdw_bra_actual_data_size'
Message-ID: <202311081638.eePhGyRI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/start-BRA-support
head:   273d00e1cc4e07d6765ba70084a3efb0206f243c
commit: 273d00e1cc4e07d6765ba70084a3efb0206f243c [37/37] [WIP] soundwire: cadence: add BTP/BRA helpers to format data
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20231108/202311081638.eePhGyRI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081638.eePhGyRI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311081638.eePhGyRI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soundwire/cadence_master.c:1913:14: warning: no previous prototype for 'sdw_bra_actual_data_size' [-Wmissing-prototypes]
    1913 | unsigned int sdw_bra_actual_data_size(unsigned int allocated_bytes_per_frame)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soundwire/cadence_master.c:1929:14: warning: no previous prototype for 'sdw_write_pdi0_buffer_size' [-Wmissing-prototypes]
    1929 | unsigned int sdw_write_pdi0_buffer_size(unsigned int actual_data_size)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soundwire/cadence_master.c:1947:14: warning: no previous prototype for 'sdw_write_pdi1_buffer_size' [-Wmissing-prototypes]
    1947 | unsigned int sdw_write_pdi1_buffer_size(unsigned int actual_data_size)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soundwire/cadence_master.c:1960:14: warning: no previous prototype for 'sdw_read_pdi0_buffer_size' [-Wmissing-prototypes]
    1960 | unsigned int sdw_read_pdi0_buffer_size(unsigned int actual_data_size)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soundwire/cadence_master.c:1971:14: warning: no previous prototype for 'sdw_read_pdi1_buffer_size' [-Wmissing-prototypes]
    1971 | unsigned int sdw_read_pdi1_buffer_size(unsigned int actual_data_size)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soundwire/cadence_master.c:1991:5: warning: no previous prototype for 'sdw_copy_write_data' [-Wmissing-prototypes]
    1991 | int sdw_copy_write_data(u8 *data, int data_size, u8 *dma_buffer, int dma_buffer_size)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/soundwire/cadence_master.c:2027:5: warning: no previous prototype for 'sdw_prepare_write_pd0_buffer' [-Wmissing-prototypes]
    2027 | int sdw_prepare_write_pd0_buffer(u8 *header, unsigned int header_size,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soundwire/cadence_master.c:2087:5: warning: no previous prototype for 'sdw_prepare_write_dma_buffer' [-Wmissing-prototypes]
    2087 | int sdw_prepare_write_dma_buffer(u8 dev_num, u32 start_register,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soundwire/cadence_master.c:2164:5: warning: no previous prototype for 'sdw_test_bra_data_block' [-Wmissing-prototypes]
    2164 | int sdw_test_bra_data_block(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/sdw_bra_actual_data_size +1913 drivers/soundwire/cadence_master.c

  1912	
> 1913	unsigned int sdw_bra_actual_data_size(unsigned int allocated_bytes_per_frame)
  1914	{
  1915		unsigned int total;
  1916	
  1917		total = allocated_bytes_per_frame -
  1918			SDW_CDNS_BRA_HDR -
  1919			SDW_CDNS_BRA_HDR_CRC -
  1920			SDW_CDNS_BRA_HDR_RESP;
  1921	
  1922		total -= SDW_CDNS_BRA_DATA_CRC;
  1923	
  1924		total -= SDW_CDNS_BRA_FOOTER_RESP;
  1925	
  1926		return total;
  1927	}
  1928	
> 1929	unsigned int sdw_write_pdi0_buffer_size(unsigned int actual_data_size)
  1930	{
  1931		unsigned int total;
  1932	
  1933		total = SDW_CDNS_BRA_HDR +
  1934			SDW_CDNS_BRA_HDR_CRC +
  1935			SDW_CDNS_BRA_HDR_CRC_PAD;
  1936	
  1937		total += actual_data_size;
  1938		if (actual_data_size & 1)
  1939			total += SDW_CDNS_BRA_DATA_PAD;
  1940	
  1941		total += SDW_CDNS_BRA_DATA_CRC +
  1942			SDW_CDNS_BRA_DATA_CRC_PAD;
  1943	
  1944		return total * 2;
  1945	}
  1946	
> 1947	unsigned int sdw_write_pdi1_buffer_size(unsigned int actual_data_size)
  1948	{
  1949		unsigned int total;
  1950	
  1951		total = SDW_CDNS_BRA_HDR_RESP +
  1952			SDW_CDNS_BRA_HDR_RESP_PAD;
  1953	
  1954		total += SDW_CDNS_BRA_FOOTER_RESP +
  1955			SDW_CDNS_BRA_FOOTER_RESP_PAD;
  1956	
  1957		return total * 2;
  1958	}
  1959	
> 1960	unsigned int sdw_read_pdi0_buffer_size(unsigned int actual_data_size)
  1961	{
  1962		unsigned int total;
  1963	
  1964		total = SDW_CDNS_BRA_HDR +
  1965			SDW_CDNS_BRA_HDR_CRC +
  1966			SDW_CDNS_BRA_HDR_CRC_PAD;
  1967	
  1968		return total * 2;
  1969	}
  1970	
> 1971	unsigned int sdw_read_pdi1_buffer_size(unsigned int actual_data_size)
  1972	{
  1973		unsigned int total;
  1974	
  1975		total = SDW_CDNS_BRA_HDR_RESP +
  1976			SDW_CDNS_BRA_HDR_RESP_PAD;
  1977	
  1978		total += actual_data_size;
  1979		if (actual_data_size & 1)
  1980			total += SDW_CDNS_BRA_DATA_PAD;
  1981	
  1982		total += SDW_CDNS_BRA_HDR_CRC +
  1983			SDW_CDNS_BRA_HDR_CRC_PAD;
  1984	
  1985		total += SDW_CDNS_BRA_FOOTER_RESP +
  1986			SDW_CDNS_BRA_FOOTER_RESP_PAD;
  1987	
  1988		return total * 2;
  1989	}
  1990	
> 1991	int sdw_copy_write_data(u8 *data, int data_size, u8 *dma_buffer, int dma_buffer_size)
  1992	{
  1993		int i;
  1994		int j;
  1995	
  1996		/* size check to prevent out of bounds access */
  1997		i = data_size - 1;
  1998		j = (2 * i) - (i & 1);
  1999		if (data_size & 1)
  2000			j++;
  2001		j += 2;
  2002		if (j >= dma_buffer_size)
  2003			return -EINVAL;
  2004	
  2005		/* copy data */
  2006		for (i = 0; i < data_size; i++) {
  2007			j = (2 * i) - (i & 1);
  2008			dma_buffer[j] = data[i];
  2009		}
  2010		/* add required pad */
  2011		if (data_size & 1)
  2012			dma_buffer[++j] = 0;
  2013		/* skip last two bytes */
  2014		j += 2;
  2015	
  2016		/* offset and data are off-by-one */
  2017		return j + 1;
  2018	}
  2019	
  2020	/*
  2021	 * the MIPI SoundWire CRC8 polynomial is X^8 + X^6 + X^3 + X^2 + 1, MSB first
  2022	 * The value is (1)01001101 = 0x4D
  2023	 */
  2024	#define SDW_CRC8_SEED 0xFF
  2025	#define SDW_CRC8_POLY 0x4D
  2026	
> 2027	int sdw_prepare_write_pd0_buffer(u8 *header, unsigned int header_size,
  2028					 u8 *data, unsigned int data_size,
  2029					 u8 *dma_buffer, unsigned int dma_buffer_size,
  2030					 unsigned int *dma_data_written,
  2031					 unsigned int frame_counter)
  2032	{
  2033		u8 crc8_lookup_table[CRC8_TABLE_SIZE];
  2034		u8 crc;
  2035		int data_written;
  2036		u8 *last_byte;
  2037	
  2038		crc8_populate_msb(crc8_lookup_table, SDW_CRC8_POLY);
  2039	
  2040		/* clear buffer */
  2041		memset(dma_buffer, 0, dma_buffer_size);
  2042		*dma_data_written = 0;
  2043	
  2044		dma_buffer[3] = BIT(7);
  2045		dma_buffer[3] |= frame_counter & GENMASK(3, 0);
  2046	
  2047		data_written = sdw_copy_write_data(header, header_size, dma_buffer, dma_buffer_size);
  2048		if (data_written < 0)
  2049			return data_written;
  2050		dma_buffer += data_written;
  2051		dma_buffer_size -= data_written;
  2052		*dma_data_written += data_written;
  2053	
  2054		crc = 0xFF;
  2055		crc = crc8(crc8_lookup_table, header, header_size, crc);
  2056	
  2057		data_written = sdw_copy_write_data(&crc, 1, dma_buffer, dma_buffer_size);
  2058		if (data_written < 0)
  2059			return data_written;
  2060		dma_buffer += data_written;
  2061		dma_buffer_size -= data_written;
  2062		*dma_data_written += data_written;
  2063	
  2064		data_written = sdw_copy_write_data(data, data_size, dma_buffer, dma_buffer_size);
  2065		if (data_written < 0)
  2066			return data_written;
  2067		dma_buffer += data_written;
  2068		dma_buffer_size -= data_written;
  2069		*dma_data_written += data_written;
  2070	
  2071		crc = 0xFF;
  2072		crc = crc8(crc8_lookup_table, data, data_size, crc);
  2073		data_written = sdw_copy_write_data(&crc, 1, dma_buffer, dma_buffer_size);
  2074		if (data_written < 0)
  2075			return data_written;
  2076		dma_buffer += data_written;
  2077		dma_buffer_size -= data_written;
  2078		*dma_data_written += data_written;
  2079	
  2080		/* tag last byte */
  2081		last_byte = dma_buffer - 1;
  2082		last_byte[0] = BIT(6);
  2083	
  2084		return 0;
  2085	}
  2086	
> 2087	int sdw_prepare_write_dma_buffer(u8 dev_num, u32 start_register,
  2088					 u8 *data, int data_size,
  2089					 int data_per_frame,
  2090					 u8 *dma_buffer, int dma_buffer_size,
  2091					 int *dma_buffer_total_bytes)
  2092	{
  2093		u8 header[SDW_CDNS_BRA_HDR];
  2094		u8 *p_dma_buffer;
  2095		u8 *p_data;
  2096		int dma_data_written;
  2097		int total_dma_data_written;
  2098		u8 counter;
  2099		int remainder;
  2100		int ret;
  2101	
  2102		counter = 1;
  2103	
  2104		header[0] = 0;
  2105		header[0] |= GENMASK(7, 6);	/* header is active */
  2106		header[0] |= (dev_num << 2);
  2107		header[0] |= BIT(1);		/* write command */
  2108	
  2109		p_data = &data[0];
  2110		p_dma_buffer = &dma_buffer[0];
  2111		total_dma_data_written = 0;
  2112	
  2113		while (data_size / data_per_frame) {
  2114			header[1] = data_per_frame;
  2115			header[2] = start_register >> 24 & 0xFF;
  2116			header[3] = start_register >> 16 & 0xFF;
  2117			header[4] = start_register >> 8 & 0xFF;
  2118			header[5] = start_register >> 0 & 0xFF;
  2119	
  2120			ret = sdw_prepare_write_pd0_buffer(header, SDW_CDNS_BRA_HDR,
  2121							   p_data, data_per_frame,
  2122							   p_dma_buffer, dma_buffer_size,
  2123							   &dma_data_written,
  2124							   counter);
  2125			if (ret < 0)
  2126				return ret;
  2127	
  2128			counter++;
  2129	
  2130			p_data += data_per_frame;
  2131			data_size -= data_per_frame;
  2132	
  2133			p_dma_buffer += dma_data_written;
  2134			dma_buffer_size -= dma_data_written;
  2135			total_dma_data_written += dma_data_written;
  2136	
  2137			start_register += data_per_frame;
  2138		}
  2139	
  2140		remainder = data_size % data_per_frame;
  2141		if (remainder) {
  2142			header[1] = remainder;
  2143			header[2] = start_register >> 24 & 0xFF;
  2144			header[3] = start_register >> 16 & 0xFF;
  2145			header[4] = start_register >> 8 & 0xFF;
  2146			header[5] = start_register >> 0 & 0xFF;
  2147	
  2148			ret = sdw_prepare_write_pd0_buffer(header, 6,
  2149							   p_data, remainder,
  2150							   p_dma_buffer, dma_buffer_size,
  2151							   &dma_data_written,
  2152							   counter);
  2153			if (ret < 0)
  2154				return ret;
  2155	
  2156			total_dma_data_written += dma_data_written;
  2157		}
  2158	
  2159		*dma_buffer_total_bytes = total_dma_data_written;
  2160	
  2161		return 0;
  2162	}
  2163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
