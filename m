Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C36B381A4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 23:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqbCF4qa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697500087; x=1729036087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rZ/cbzTKUre7lD4bMLiJlwnM0g3pUpXlQ5wSpbw5Qjw=;
  b=aqbCF4qaocVjRLdWaTNQCvSNVWRh062+XxYomxHD3FMJguVYauVlqjBb
   lWty/QmHZBlp6UDjnkrr2vTIyq3hbkzhvG7Jmy5pNkiXmutq8BQ7in1lI
   Z/ELVNWj8WiOm9IViNjMS/cFyeO7WGRKffYOYOTfKIv6MDx9YJAwjY8zp
   1PibHWTt1KQLXhxu6ZT2h+knSRVTPzENtfxZik5M6WU8kGby4ws/EeLAw
   Llo++7K2uGeuGjvGB4wx7t4uFOqh+xqA9a6623PdaquG34xCKzw+XneD0
   bT8OtN+Nf31jjjJxONSjT2vnDwN2y/Qv55lijDdp1YMVKH98QTdhc6pMU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="449888251"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="449888251"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 16:48:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="846596102"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="846596102"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Oct 2023 16:48:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsXJa-0008lL-0V;
	Mon, 16 Oct 2023 23:48:02 +0000
Date: Tue, 17 Oct 2023 07:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jenny Manne <jenny.v.manne@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
	linux-doc@vger.kernel.org
Subject: [hverkuil-media-tree:hdmi-dbg 4/29] dtbs_check:
 Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml:42:1: [error]
 syntax error: found character '\t' that cannot start any token (syntax)
Message-ID: <202310170730.d2FwYaBp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   d344bfea2a3086931de23669e9fe7a73cf373bb3
commit: 3ccffba164ef0246aff8f810e17c9756c598c170 [4/29] ti-ads7128: driver for the TI ADS7128 ADC
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170730.d2FwYaBp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170730.d2FwYaBp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml:42:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
--
>> Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml:42:1: found a tab character where an indentation space is expected
--
>> Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml: ignoring, error parsing file

vim +42 Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml

    32	
    33	examples:
    34	  - |
    35	    i2c {
    36	        #address-cells = <1>;
    37	        #size-cells = <0>;
    38	
    39	        adc@17 {
    40	            compatible = "ti,ads7128";
    41	            reg = <0x17>;
  > 42		    vref-supply = <&vref_5v0_reg>;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
