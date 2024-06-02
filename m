Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4400410795
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jun 2024 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717333862; cv=none; b=pUMjLAbJRTmH0QjPAB+/hvP7HGuFOr00VRzt2lOHB62EV2HMc3wb0+Y70KzrJngYHr8uGqgmb0s4nVbZhgAc0GGEjU5uMZif20mTjgc1O9+QMyeR6VozBrMxK3zXlI6hLILjP6mtgLFSicieLlFzxMmeEsi9CldX+mKumkaASMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717333862; c=relaxed/simple;
	bh=Z/H4yRYrVWOT5SBN8QyC7P1fmyHZCLYqL/EfF4g/qnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H6JJS10ssqTRdDY7PtXG8HHln8X0B9gBx2ZwHJBv0MiZUK+DBdzfVs4RR5N+gR/q+wNOVa9RpfAkUy56RcFlK3bUynbtFQWFzHtTdvY+Lk+59ONkhuId/Gi325nrg5339o4x/asgXyXcg8wUgndc5o9MOLtbfpzBXokS/jkZB9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OiWLY36N; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OiWLY36N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717333860; x=1748869860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z/H4yRYrVWOT5SBN8QyC7P1fmyHZCLYqL/EfF4g/qnM=;
  b=OiWLY36NxnJh1HlWu8UK/tRgHQOjhipEbYJqu07IF9eGvcf9VvVu4kpY
   6KLEI/UNEp2SmIf4Fjcyjg0VgEhSlJ0l66EORuVSoGo3jwISBbUDyyITG
   uEDr2lSYhZnLtL9c3WnIS0yU4Me3pUZAKcVA1l0ghI8z9z/B3HYn/e+jT
   VRhMIsnQTPBfq46l91cNr3f89e/HuwqwtsB6RfLjdgoQJ44hd8DdexV9F
   3gTtVt8/03KaYyRRzMH1dOfplu9+bAaJcaycQqJjPhiiwKl3d5EdQNIqg
   GQ7oAqE2ND+ymd2t1ET9k4fBa3fhQp7ZJ8S/JiOkJDkQygBBBfQpXk5UL
   g==;
X-CSE-ConnectionGUID: GN0gnRYwQAafaWoO80tVWw==
X-CSE-MsgGUID: sV010mWHR9iH7i84aZraFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="11862134"
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; 
   d="scan'208";a="11862134"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2024 06:10:59 -0700
X-CSE-ConnectionGUID: 3v1An8VyT/iHjbIcYL2Mfg==
X-CSE-MsgGUID: 0G6xVQgiT+Wdoc4JROXA8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; 
   d="scan'208";a="36529390"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jun 2024 06:10:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDkz0-000K1X-1s;
	Sun, 02 Jun 2024 13:10:56 +0000
Date: Sun, 2 Jun 2024 21:09:56 +0800
From: kernel test robot <lkp@intel.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	David Lechner <dlechner@baylibre.com>
Subject: [jic23-iio:testing 62/78] drivers/iio/adc/ad7380.c:389: warning:
 Function parameter or struct member 'st' not described in
 'ad7380_update_xfers'
Message-ID: <202406022123.UCiKiwtQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   f63207dfc09b1aec17b264e5ae62a49ceba05f50
commit: a6717bfbc3423a935f0dfd3626fe339488ba57f4 [62/78] iio: adc: ad7380: add oversampling support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240602/202406022123.UCiKiwtQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240602/202406022123.UCiKiwtQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406022123.UCiKiwtQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/ad7380.c:389: warning: Function parameter or struct member 'st' not described in 'ad7380_update_xfers'
>> drivers/iio/adc/ad7380.c:389: warning: Function parameter or struct member 'scan_type' not described in 'ad7380_update_xfers'
>> drivers/iio/adc/ad7380.c:389: warning: Excess function parameter 'indio_dev' description in 'ad7380_update_xfers'
>> drivers/iio/adc/ad7380.c:389: warning: Excess function parameter 'chan' description in 'ad7380_update_xfers'


vim +389 drivers/iio/adc/ad7380.c

   381	
   382	/**
   383	 * ad7380_update_xfers - update the SPI transfers base on the current scan type
   384	 * @indio_dev:	IIO device structure
   385	 * @chan:	IIO channel
   386	 */
   387	static void ad7380_update_xfers(struct ad7380_state *st,
   388					const struct iio_scan_type *scan_type)
 > 389	{
   390		/*
   391		 * First xfer only triggers conversion and has to be long enough for
   392		 * all conversions to complete, which can be multiple conversion in the
   393		 * case of oversampling. Technically T_CONVERT_X_NS is lower for some
   394		 * chips, but we use the maximum value for simplicity for now.
   395		 */
   396		if (st->oversampling_ratio > 1)
   397			st->xfer[0].delay.value = T_CONVERT_0_NS + T_CONVERT_X_NS *
   398							(st->oversampling_ratio - 1);
   399		else
   400			st->xfer[0].delay.value = T_CONVERT_NS;
   401	
   402		st->xfer[0].delay.unit = SPI_DELAY_UNIT_NSECS;
   403	
   404		/*
   405		 * Second xfer reads all channels. Data size depends on if resolution
   406		 * boost is enabled or not.
   407		 */
   408		st->xfer[1].bits_per_word = scan_type->realbits;
   409		st->xfer[1].len = BITS_TO_BYTES(scan_type->storagebits) *
   410				  (st->chip_info->num_channels - 1);
   411	}
   412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
