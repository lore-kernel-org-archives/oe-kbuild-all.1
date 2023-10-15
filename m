Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7DE195
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 00:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKLyPA3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697329391; x=1728865391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sH7P2QUD7UKCOZk1H4Hcp9gx2ZhSdy7ZsQoMVX7QtJ8=;
  b=UKLyPA3plq5AGJKyHRxxw4hHQWjcZFxEg4xUe6JF4zDlGa7Y1Txuzozl
   PqyCGBCGC8Im7oAlwzo+ZOEhgzW6RmW9eq0pTEL9VRk8Opm+D4pLgD5jD
   j2V/sQKuLz6wBEynkIpjKwOlvOwcFWeoPcJTIEBGojshVWQUPVya/v2aQ
   IS9wPqbJbMcOAzLTlKOcfHnz5+N7+3vq1a7d4lSaCVYai1lz6uVNr6ogc
   O5Gwow1/K0LcAnyxJdpQBsFIntDUfZwP65DXdHDWlxgi5u+LMG1EDWxwe
   z4lzx6JT/8VCda/mjQeffTp5plwt2OEi0ppIOC12YBdkSCynZyi/BS3po
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="471586363"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="471586363"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 17:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="748805214"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="748805214"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Oct 2023 17:23:08 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrouQ-0006r1-1i;
	Sun, 15 Oct 2023 00:23:06 +0000
Date: Sun, 15 Oct 2023 08:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: Milan Broz <gmazyland@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mbroz:opal-test 6/9] arm-linux-gnueabi-ld:
 drivers/usb/storage/usual-tables.o:(.rodata+0x21f8): multiple definition of
 `usb_stor_di_idx_size'; drivers/usb/storage/uas.o:(.rodata+0x398): first
 defined here
Message-ID: <202310150811.RONjTAI4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mbroz/linux.git opal-test
head:   9a0d34bd9b37cbca78b3b599c3272e8a27c14320
commit: 78763fdeea9724d47e4af8def2adc973fc3dbcea [6/9] usb-storage,uas: use host helper to generate driver info
config: arm-randconfig-004-20231015 (https://download.01.org/0day-ci/archive/20231015/202310150811.RONjTAI4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150811.RONjTAI4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150811.RONjTAI4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: drivers/usb/storage/usual-tables.o:(.rodata+0x21f8): multiple definition of `usb_stor_di_idx_size'; drivers/usb/storage/uas.o:(.rodata+0x398): first defined here
>> arm-linux-gnueabi-ld: drivers/usb/storage/usual-tables.o:(.rodata+0x2200): multiple definition of `usb_stor_di_to_u64'; drivers/usb/storage/uas.o:(.rodata+0x3a0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
