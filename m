Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15CF43B3F4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 21:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786655732; cv=none; b=hQHCSsdauxVwj44kdIgse7uqdb8h/0XCBfrDrdyA0s4D6TCSei+HjfuQPYROcI/u+Q1xiLnvFnNgajfA3OpJhcUznS7bEzkhqF0cRrlpBernVmzHVnSiptP9bFtYrgLbPhpxM35w8+xMemPrWdzrhT/YyxSXkbrbsRCZ/SD24b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786655732; c=relaxed/simple;
	bh=brUVEV2YYPn4O/fRobquBV2mYMEjl7eMOR6CFz0kQFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PROQVc/vH01LIACOctVq/Jp0F6iuGzsXCpcuk/4NFQ7hp3pxuEmqJsiM6d9BkGdO12lWxmBFtpi//L7iNfPv1hvElO3XtKEyez5i0MWkgaZeczkgWpCgXZJLpWyvZHbUxn+FfszbU0BGDghCDKp4tdPV5q2+MCnAoHXq+Z0hgz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFMPKyxS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFMPKyxS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786655730; x=1818191730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=brUVEV2YYPn4O/fRobquBV2mYMEjl7eMOR6CFz0kQFc=;
  b=ZFMPKyxS9hNVxIpmv4VnqMOlCktITH8mPJkXXBveeav8GlxCHAC+nJR2
   Gj3t3fGehijFQDhakHmRnWu9DW7+82xSMH5GZ34DSmKNeFexBlHlN/q/B
   eYMaSgAoPC/AwjFB0HaALiiJLFV/xiJ9WZmOtAVo+HnQkL5DjnHks7j3a
   jWyLortoPLTzGyu0XTU33jNDbfeW+lGfSZv0+PbhXNvXdisnTnBu3BnbW
   dFaLkrEVtmLvsNsTkmcqN7QOMr8aHK3i8dPSmTi7hUl7WzoaWEay4rOXQ
   0cPRZQsfC/eVOXTSaJVZzHdfrQi9Z/DM9LiHo3u4PpM5tVfoE+rBLobLb
   w==;
X-CSE-ConnectionGUID: DgxFj7v6TgSemJXfg6Lbyw==
X-CSE-MsgGUID: 9R/d0QMUQWCAX8SIF2IsHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87000915"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87000915"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 14:15:28 -0700
X-CSE-ConnectionGUID: LgE5J6FKQQqklkRfqT5m9Q==
X-CSE-MsgGUID: SCoPT7ClRsGipqENgJbesg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="261407574"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Aug 2026 14:15:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wucln-00000000Wfq-1gLl;
	Thu, 13 Aug 2026 21:15:23 +0000
Date: Fri, 14 Aug 2026 05:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Hansson <newbie13xd@gmail.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Cc: oe-kbuild-all@lists.linux.dev,
	Stefan Hansson <newbyte@postmarketos.org>
Subject: Re: [PATCH] wifi: rsi: Fix types to appease CFI
Message-ID: <202608140519.Tt0pjFLu-lkp@intel.com>
References: <20260802-rsi-cfi-fix-v1-1-5821d2cb54ee@postmarketos.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802-rsi-cfi-fix-v1-1-5821d2cb54ee@postmarketos.org>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 95d6a9ccef99117115e41e9adb271243bd5e985b]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Hansson/wifi-rsi-Fix-types-to-appease-CFI/20260814-020048
base:   95d6a9ccef99117115e41e9adb271243bd5e985b
patch link:    https://lore.kernel.org/r/20260802-rsi-cfi-fix-v1-1-5821d2cb54ee%40postmarketos.org
patch subject: [PATCH] wifi: rsi: Fix types to appease CFI
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260814/202608140519.Tt0pjFLu-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140519.Tt0pjFLu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608140519.Tt0pjFLu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/wireless/rsi/rsi_91x_usb_ops.c:28 function parameter 'data' not described in 'rsi_usb_rx_thread'
>> Warning: drivers/net/wireless/rsi/rsi_91x_usb_ops.c:28 Excess function parameter 'common' description in 'rsi_usb_rx_thread'
>> Warning: drivers/net/wireless/rsi/rsi_91x_usb_ops.c:28 function parameter 'data' not described in 'rsi_usb_rx_thread'
>> Warning: drivers/net/wireless/rsi/rsi_91x_usb_ops.c:28 Excess function parameter 'common' description in 'rsi_usb_rx_thread'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
