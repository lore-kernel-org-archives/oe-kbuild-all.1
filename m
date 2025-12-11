Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740252BF015
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 23:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495798; cv=none; b=mbHvXUnLzSSfpaqxSVPtCvKuvbNyzLp6UQSHcH/TB5Wf6rlzvsaCBr9A2Hxersni8tgrn7SKlTpwuEUoJfTjSS319ZzXkQuBnNiFzSroqenMayV7sd23x6A6620uF74yTfIbgV3Tma6lrXJjoMRXS+5SHdu6AX/dsoj99lgzhDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495798; c=relaxed/simple;
	bh=AXScmKJqU3LejbBUgF0MVb4qdQfQSCusf00M1/4ViFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xw4otJzpajIXaY7/obbRj0GL1DqvhjNkCc294I+g5SEE1PpHs+hT0txc4Lzzfnxd2ZXuqbu1sKug93UeERYQlmYi/H54D7X25HO61JDM4LuNr//xEj1a4ScqZSzJ9TuyOnbMZZfVKYUhRdyiWqqAeBGWfTrY2VdWnxVaLZgTESQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mgwwYVf7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgwwYVf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765495796; x=1797031796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AXScmKJqU3LejbBUgF0MVb4qdQfQSCusf00M1/4ViFI=;
  b=mgwwYVf7HBb1t9cRa01W6ifhWtVzgqMB/bL3WuOHhCRu3vSdPbZbTxH2
   5j7Pcvhy6mCTrayIsYDxmrZfOpiiGRYTpeerUeVuLTv6xvBpglXsgipBp
   QKpHkNvEmZ6a4UZ1WYKwI2llJgC6wTnN5NzyUoMYY5n1oIMz7H/HuhF9D
   COeO2N6qxRjMsHcV0+ywuFw3b/twSa8uijHdl9fjv2jtsHXn9cFra/bQT
   O7JIWcO7nORAq5sR0fSBUVWoK4MwxxjZ5P81rI1i2l+lFLfUXTg/+KzM7
   b7s7cGB47bhx64zHumRpDvz7crxaXVK+9eTHOkcGFz5Huw29P/IJRAJa6
   g==;
X-CSE-ConnectionGUID: mVwE2nZFQtmkx5dFGt/Fyw==
X-CSE-MsgGUID: 9ROOsn1ZQu23/uMH1fxVhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="66669380"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="66669380"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 15:29:56 -0800
X-CSE-ConnectionGUID: HYydNz1CR36ntSVnJ1+/pw==
X-CSE-MsgGUID: PP7xuDOcTHWYVNpKv/zsRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196979715"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Dec 2025 15:29:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTq6a-000000005CD-01vT;
	Thu, 11 Dec 2025 23:29:52 +0000
Date: Fri, 12 Dec 2025 07:29:21 +0800
From: kernel test robot <lkp@intel.com>
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: Warning: drivers/usb/misc/usbio.c:117 struct member 'nr_i2c_buses'
 not described in 'usbio_device'
Message-ID: <202512120755.SLQnkrpa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 121a0f839dbb397af5fabb701cea3e9983223e50 usb: misc: Add Intel USBIO bridge driver
date:   3 months ago
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20251212/202512120755.SLQnkrpa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120755.SLQnkrpa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120755.SLQnkrpa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/usb/misc/usbio.c:117 struct member 'nr_i2c_buses' not described in 'usbio_device'
   Warning: drivers/usb/misc/usbio.c:117 struct member 'i2cs' not described in 'usbio_device'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
