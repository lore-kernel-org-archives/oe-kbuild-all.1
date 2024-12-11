Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860671C0DD3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 06:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733897698; cv=none; b=fQ7JawmjTigTZtNNxdYgIq7txUX8qObldTcvTT5QDVGN4KNizI+0AZMy1oHbAFjcJyF455O6Tz/SkExTsxSI7l/WE+HSWZTJUDAko582SnRm1666iLwAakkQcgxnidz04WKsp+9R3hlghT96/Rj0tzuIZBj4Fd50Q7vzgCnNRZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733897698; c=relaxed/simple;
	bh=FZk6GqVRAXFGXPc1qbS+TgphcvTnuZhwZNIwQIjK6Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fl9XCGzeOTBx2vd5yTvv3NmFjarUboER6nZRSsuWjDq7PmFoOLjnjJHkjlPzOfwPc03oJ7+qBvhd+F57ToncF8CSE2tdG4Wy7YY9wJR0fywfLgwlqKNEuYoRUOcCVbLbh8dBhJWH3t/6eG6jLr2/YNcfWURRM/Y2XZkrO0LvHps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Omy8h5YC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Omy8h5YC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733897697; x=1765433697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FZk6GqVRAXFGXPc1qbS+TgphcvTnuZhwZNIwQIjK6Lw=;
  b=Omy8h5YCOtjV9YijVPhSR2HpcQ7LrUhTu7MqB88D5IelHZvsPH964nt7
   P47liPtdVA92icGuYE3eEgx7ZvoxSrAZ8zp3ZDm9g0Z1lHgv6bwlzG8H9
   0AdrzDW0fAhmq08+Zz8hlr4YpELvDS42MiUNcoP2UnEPyWjOJByWwuNVj
   QnOKandNba+WPLG/m3mzclkouAFSXb+IOi0AwDUHY4pyGB7MHpffYRb6d
   DA4EN/NgtkalVFcQV8gYwffNT4koQq0ljZQYgJCkMT1hXLTF8HIFk6Xlv
   +QPsab13UrqTazgCUONN1kPDIYxwKy4xnKoLQbv9XOXEulNivVHrNvviS
   Q==;
X-CSE-ConnectionGUID: T4XqPD11TqqnF8IwO86L9g==
X-CSE-MsgGUID: 6gNX3fACTwagyacO1KDgzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44737012"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="44737012"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 22:14:56 -0800
X-CSE-ConnectionGUID: BAJ40np0Td6e84MLe5PsJA==
X-CSE-MsgGUID: QcfOVUXGStqOXIGd0ezxlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96131862"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2024 22:14:55 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLFzo-0006Lf-1t;
	Wed, 11 Dec 2024 06:14:52 +0000
Date: Wed, 11 Dec 2024 14:14:01 +0800
From: kernel test robot <lkp@intel.com>
To: Wesley Cheng <wcheng@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev, Todd Kjos <tkjos@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [sudeep-holla:android13-5.10/ffa 3795/9999]
 drivers/usb/dwc3/gadget.c:650: warning: Function parameter or member 'mult'
 not described in 'dwc3_gadget_calc_tx_fifo_size'
Message-ID: <202412111422.aDdOcUvG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.10/ffa
head:   9e12ac4f9c69befe08119567c073adc938aafc4d
commit: 79274dbb0011418ae935e40645116c2d1e18a0a8 [3795/9999] FROMGIT: usb: dwc3: Resize TX FIFOs to meet EP bursting requirements
config: i386-randconfig-004-20240106 (https://download.01.org/0day-ci/archive/20241211/202412111422.aDdOcUvG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412111422.aDdOcUvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412111422.aDdOcUvG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/gadget.c:650: warning: Function parameter or member 'mult' not described in 'dwc3_gadget_calc_tx_fifo_size'
>> drivers/usb/dwc3/gadget.c:650: warning: Excess function parameter 'nfifos' description in 'dwc3_gadget_calc_tx_fifo_size'


vim +650 drivers/usb/dwc3/gadget.c

   631	
   632	/**
   633	 * dwc3_gadget_calc_tx_fifo_size - calculates the txfifo size value
   634	 * @dwc: pointer to the DWC3 context
   635	 * @nfifos: number of fifos to calculate for
   636	 *
   637	 * Calculates the size value based on the equation below:
   638	 *
   639	 * DWC3 revision 280A and prior:
   640	 * fifo_size = mult * (max_packet / mdwidth) + 1;
   641	 *
   642	 * DWC3 revision 290A and onwards:
   643	 * fifo_size = mult * ((max_packet + mdwidth)/mdwidth + 1) + 1
   644	 *
   645	 * The max packet size is set to 1024, as the txfifo requirements mainly apply
   646	 * to super speed USB use cases.  However, it is safe to overestimate the fifo
   647	 * allocations for other scenarios, i.e. high speed USB.
   648	 */
   649	static int dwc3_gadget_calc_tx_fifo_size(struct dwc3 *dwc, int mult)
 > 650	{
   651		int max_packet = 1024;
   652		int fifo_size;
   653		int mdwidth;
   654	
   655		mdwidth = dwc3_mdwidth(dwc);
   656	
   657		/* MDWIDTH is represented in bits, we need it in bytes */
   658		mdwidth >>= 3;
   659	
   660		if (DWC3_VER_IS_PRIOR(DWC3, 290A))
   661			fifo_size = mult * (max_packet / mdwidth) + 1;
   662		else
   663			fifo_size = mult * ((max_packet + mdwidth) / mdwidth) + 1;
   664		return fifo_size;
   665	}
   666	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
