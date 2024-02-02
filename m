Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366DCDDCE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 03:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706844660; cv=none; b=eWI+7sHUKEmX46lBW0oJIzpjMXwTMYhpVasVhCYJfpSwx/s84nswgyHgAZ+V8oZAlm2MFFimpbaSkDXlLpZoaPqXyP+dOkJ+jwZcsSzbgOR0oEQiH+ZoV+f7rfw3Qli99I+7JZ2zeZ9ARSvI3a0YLLv1l9A0Jf/4/GrxQn8fTQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706844660; c=relaxed/simple;
	bh=Kyn/qjZglIu0PolQtpYwwMTfSPFLW1x5oao+Fp4xSpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r7/flxSt0y83uJQyBtbyF/yW5yJrzPnaT+yUg3COyzQPdzrPRSok/Fplxt4KaGkScau2bE6UD8NeWS314uXVKO9z05Ow1/O4MRhiytMDcao6iXZY3MQyEh0wpwDYJrGICMN8oPakSYhPT14DpnIRXH8zDyn3x03gniZEB31XjOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SgLMX9BU; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SgLMX9BU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706844658; x=1738380658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kyn/qjZglIu0PolQtpYwwMTfSPFLW1x5oao+Fp4xSpE=;
  b=SgLMX9BU7lK4PYJh/ksZu/IICm67VMFlW+vXxprltlds2dsQo1T3yKkv
   vuRHd/pHp3PWQhZfg4qE8A2zUmAYJ+KlxsHIg7Yxe0qfHC91d0mFbXiDQ
   BJjveOf1S9I1O4wO9Z9jFFONl9haqsHZX0HSZKBencv+AOnKwJOtpzO0y
   PVLFoSfQrzcBZa0HsTBqqpHEcnwC1szFKLH9lPL8m1nC3e4PBi6ssdpLc
   LldOEUFw89JIn8LPuIj8KrKUAbovj7C9VbGaEBVdtCkuXFno0qkdj+uml
   FY9CVIDfk4pB1ZXrqhFfh8dOm/2EQ8Y+yfeuquRA/hs16cRLrf5QaN/Dm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="407776764"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="407776764"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 19:30:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="932360636"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="932360636"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 01 Feb 2024 19:30:56 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVkGT-0003Ww-2L;
	Fri, 02 Feb 2024 03:30:53 +0000
Date: Fri, 2 Feb 2024 11:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:dev/iio-backend-axi-dds-test 20/20]
 drivers/iio/dac/adi-axi-dac.c:63:31: warning: unused variable 'st'
Message-ID: <202402021147.fSxjV1Rl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux dev/iio-backend-axi-dds-test
head:   56a0faf5df7548936623a26c728ff3f0e970ef6a
commit: 56a0faf5df7548936623a26c728ff3f0e970ef6a [20/20] more stuff
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240202/202402021147.fSxjV1Rl-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240202/202402021147.fSxjV1Rl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402021147.fSxjV1Rl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/dac/adi-axi-dac.c: In function 'axi_dac_buffer_preenable':
>> drivers/iio/dac/adi-axi-dac.c:63:31: warning: unused variable 'st' [-Wunused-variable]
      63 |         struct axi_dac_state *st = iio_backend_get_priv(back);
         |                               ^~
>> drivers/iio/dac/adi-axi-dac.c:65:1: warning: no return statement in function returning non-void [-Wreturn-type]
      65 | }
         | ^
   drivers/iio/dac/adi-axi-dac.c: In function 'axi_dac_buffer_postdisable':
   drivers/iio/dac/adi-axi-dac.c:69:31: warning: unused variable 'st' [-Wunused-variable]
      69 |         struct axi_dac_state *st = iio_backend_get_priv(back);
         |                               ^~
   drivers/iio/dac/adi-axi-dac.c:70:1: warning: no return statement in function returning non-void [-Wreturn-type]
      70 | }
         | ^


vim +/st +63 drivers/iio/dac/adi-axi-dac.c

    60	
    61	static int axi_dac_buffer_preenable(struct iio_backend *back)
    62	{
  > 63		struct axi_dac_state *st = iio_backend_get_priv(back);
    64	
  > 65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
