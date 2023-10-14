Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EB812B88
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 22:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQ8T0opE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697322232; x=1728858232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5+0I6f+JYrnYfpX6fVvWt4gY6dZCBnh5JS4XLFki7oM=;
  b=lQ8T0opEUnoilZxEY+UNSwTY96b0gGAL4r/Z3y4sa/2Rz0OUZN3u12k5
   Q66ttXqZRMdnH+z7mQ6Fh0+8/H0iD5VWXFWg4463qdvZVPSdIjjwcwdLu
   2QCdfzX0sOHxoXkaY2IwFsRSffOsFVnCkbF6rtgWH85fXeNoJMp0Wie/R
   +0rOLzusGi6B0BEVq2y654z4JZbenz0/VO54oi6zB+90aOoxV4/eZGZ5P
   74+xMVpQxgRNSww24j3sBswz6EQVHv58KYFqOyZIiKwlVTlV5M035WFZb
   OeJILHlQaTWXd/IsIu4AqlyYjWrcLW2OELm27LNoBnp3rNjcfRz8DNJmO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="6915949"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="6915949"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 15:23:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="758905639"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="758905639"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2023 15:23:50 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrn2x-0006kL-31;
	Sat, 14 Oct 2023 22:23:47 +0000
Date: Sun, 15 Oct 2023 06:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: Milan Broz <gmazyland@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mbroz:opal-test 6/9] drivers/usb/storage/usb-ids.h:13:8: warning:
 type qualifiers ignored on function return type
Message-ID: <202310150633.j9wirBMr-lkp@intel.com>
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
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310150633.j9wirBMr-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150633.j9wirBMr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150633.j9wirBMr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/storage/usb.c:59:
>> drivers/usb/storage/usb-ids.h:13:8: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
      13 | static const u64 usb_stor_di2flags(unsigned long idx)
         |        ^~~~~


vim +13 drivers/usb/storage/usb-ids.h

    12	
  > 13	static const u64 usb_stor_di2flags(unsigned long idx)
    14	{
    15		u64 flags = 0;
    16	
    17		if (idx < (1UL << 31))
    18			return idx;
    19	
    20		idx -= (1UL << 31);
    21	
    22		if (idx < usb_stor_di_idx_size)
    23			flags = usb_stor_di_to_u64[idx];
    24		else
    25			WARN_ONCE(true, "usb_stor_di_to_u64 table not updated");
    26	
    27		return flags;
    28	}
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
