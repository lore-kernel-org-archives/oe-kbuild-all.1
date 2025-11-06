Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00912FFF9D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 08:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762416259; cv=none; b=q+9xGUUOcopAxR4XO+A2svyY7zgL3YufLGsO8APxpxPMqAiye3UNZ+n8mU6NUDVtoAhDAnS83eWk4CG+Bk4wCu+fTLoPtdbv/5codZyF+EkWNoHGaHIjy1Wf9nCv+sqYNx/b+/G6x1DP09umKurh+MdOIzis/NbQKkDDwX9AubU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762416259; c=relaxed/simple;
	bh=131iDQVyyskIhVuG1SFU61y/fyTqSpI4DzA2ydWEaSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pv51kfAyxLY1pvqGl8lGVqfgwmTz6z5vheSp+76dyVR+QQMW8M4tRisIPI6RKbtLstA543c0wSw61e71WWWoBiS5EAFQgQELyKPUCz8sb42KJSE4atoKWLVIlqvCn8vltUp6ufCUiG63QEDxrgk5Qc+7bU2SIGM0bDcoxv1eBvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mlCVHfEt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mlCVHfEt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762416258; x=1793952258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=131iDQVyyskIhVuG1SFU61y/fyTqSpI4DzA2ydWEaSU=;
  b=mlCVHfEtmDNCc+6K+P5lJTEsepx06Ed8p1JauN+SjtvVSbnnhq3IulH8
   xrMDdCudbIE640G8h4fHxZWtaLdSLz0Vd+3dAiTEANW5TJNg82go7ePy9
   8Jy7ijm+TOEDrZUO3pR8WilwitI7IAUf0Cc3lbNYG/VNxlhF6Hsb2Ki3o
   DbdJLDy1GqgnRP9TbS+XsxV/oy+qKTSlFaoAiH+iqdS+Wv0N+4umJgyYQ
   61sxR+LabK4mVNgLpX2RbdsQ02j0cz0c/8FoXyljfxBZvqBhX6BpzS40X
   Pvb40f7mfxmEW1TTo/Gjii4NJPAXaVRMryw+szhoWyZTNe1MUNYJfBUyd
   A==;
X-CSE-ConnectionGUID: CeQVEDFJSgq/w0hHrKAkgQ==
X-CSE-MsgGUID: n3lwZeLMRJKMeAp1PaBh0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75661927"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="75661927"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 00:04:17 -0800
X-CSE-ConnectionGUID: hnUDeEh8TwiKbA4olcaorg==
X-CSE-MsgGUID: 5dUVcYXoTZau1DVQwPTbdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="192742600"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2025 00:04:13 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGuyV-000Tds-1P;
	Thu, 06 Nov 2025 08:04:07 +0000
Date: Thu, 6 Nov 2025 16:03:46 +0800
From: kernel test robot <lkp@intel.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, David Jander <david@protonic.nl>,
	Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Subject: Re: [PATCH v1 2/2] iio: adc: Add TI ADS131M0x ADC driver
Message-ID: <202511061518.r106EK1T-lkp@intel.com>
References: <20251105143814.1807444-3-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105143814.1807444-3-o.rempel@pengutronix.de>

Hi Oleksij,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linus/master v6.18-rc4 next-20251106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleksij-Rempel/bindings-iio-adc-Add-bindings-for-TI-ADS131M0x-ADCs/20251105-224149
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20251105143814.1807444-3-o.rempel%40pengutronix.de
patch subject: [PATCH v1 2/2] iio: adc: Add TI ADS131M0x ADC driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20251106/202511061518.r106EK1T-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061518.r106EK1T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061518.r106EK1T-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iio/adc/ti-ads131m0x.c: In function 'ads131m_tx_frame_unlocked':
>> drivers/iio/adc/ti-ads131m0x.c:174:9: error: implicit declaration of function 'put_unaligned_be24' [-Wimplicit-function-declaration]
     174 |         put_unaligned_be24(command << 8, &priv->tx_buffer[0]);
         |         ^~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads131m0x.c:163:13: warning: unused variable 'ret' [-Wunused-variable]
     163 |         int ret;
         |             ^~~
   drivers/iio/adc/ti-ads131m0x.c: In function 'ads131m_check_status_crc_err':
>> drivers/iio/adc/ti-ads131m0x.c:224:18: error: implicit declaration of function 'get_unaligned_be16' [-Wimplicit-function-declaration]
     224 |         status = get_unaligned_be16(&priv->rx_buffer[0]);
         |                  ^~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads131m0x.c: In function 'ads131m_adc_read':
>> drivers/iio/adc/ti-ads131m0x.c:523:30: error: implicit declaration of function 'get_unaligned_be24' [-Wimplicit-function-declaration]
     523 |         *val = sign_extend32(get_unaligned_be24(buf), 23);
         |                              ^~~~~~~~~~~~~~~~~~


vim +/put_unaligned_be24 +174 drivers/iio/adc/ti-ads131m0x.c

   149	
   150	/**
   151	 * ads131m_tx_frame_unlocked - Sends a command frame with Input CRC
   152	 * @priv: Device private data structure.
   153	 * @command: The 16-bit command to send (e.g., NULL, RREG, RESET).
   154	 *
   155	 * Assumes the mutex lock is held.
   156	 * This function sends a command in Word 0, and its calculated 16-bit
   157	 * CRC in Word 1, as required when Input CRC is enabled.
   158	 *
   159	 * Return: 0 on success, or a negative error code from spi_sync.
   160	 */
   161	static int ads131m_tx_frame_unlocked(struct ads131m_priv *priv, u32 command)
   162	{
   163		int ret;
   164		u16 crc;
   165	
   166		/*
   167		 * Zero the entire TX buffer to send a valid frame.
   168		 */
   169		memset(priv->tx_buffer, 0, ADS131M_FRAME_BSIZE(priv->num_channels));
   170	
   171		/*
   172		 * Word 0: 16-bit command, MSB-aligned in 24-bit word.
   173		 */
 > 174		put_unaligned_be24(command << 8, &priv->tx_buffer[0]);
   175	
   176		/*
   177		 * Word 1: Input CRC
   178		 * Calculated over the 3 bytes of Word 0.
   179		 */
   180		crc = ads131m_crc_calculate(priv->tx_buffer, 3);
   181		put_unaligned_be24(crc << 8, &priv->tx_buffer[3]);
   182	
   183		return spi_sync(priv->spi, &priv->msg);
   184	}
   185	
   186	/**
   187	 * ads131m_rx_frame_unlocked - Receives a full SPI data frame.
   188	 * @priv: Device private data structure.
   189	 *
   190	 * This function sends a NULL command (with its CRC) to clock out a
   191	 * full SPI frame from the device (e.g., response + channel data + CRC).
   192	 *
   193	 * Assumes the mutex lock is held.
   194	 *
   195	 * Return: 0 on success, or a negative error code from spi_sync.
   196	 */
   197	static int ads131m_rx_frame_unlocked(struct ads131m_priv *priv)
   198	{
   199		return ads131m_tx_frame_unlocked(priv, ADS131M_CMD_NULL);
   200	}
   201	
   202	/**
   203	 * ads131m_check_status_crc_err - Checks for an Input CRC error.
   204	 * @priv: Device private data structure.
   205	 *
   206	 * Sends a NULL command to fetch the STATUS register and checks the
   207	 * CRC_ERR bit. This is used to verify the integrity of the previous
   208	 * command (like RREG or WREG).
   209	 *
   210	 * Context: This function assumes the mutex 'lock' is held.
   211	 * Return: 0 on success, -EIO if CRC_ERR bit is set.
   212	 */
   213	static int ads131m_check_status_crc_err(struct ads131m_priv *priv)
   214	{
   215		int ret;
   216		u16 status;
   217	
   218		ret = ads131m_rx_frame_unlocked(priv);
   219		if (ret < 0) {
   220			dev_err(&priv->spi->dev, "SPI error on STATUS read for CRC check\n");
   221			return ret;
   222		}
   223	
 > 224		status = get_unaligned_be16(&priv->rx_buffer[0]);
   225		if (status & ADS131M_STATUS_CRC_ERR) {
   226			dev_err(&priv->spi->dev, "Previous input CRC error, STATUS=0x%04x\n",
   227				status);
   228			return -EIO;
   229		}
   230	
   231		return 0;
   232	}
   233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
