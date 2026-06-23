Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A6237F73A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782223565; cv=none; b=taA2KMLd3+sqD4fwDPQyFgmfiNJtph0BxW9wlqkRYmKoL+B89bhHgFNObuAU8LBvIepvt7qe+hRj6boc0LWU44fbr5aQ8Qo4caSbi2SG/yJ6BIMRuNzaOCS77qD0Wro0SAvwONiCpZqPdxK8aVc03guRaRbTbCJcY/5luuzEffU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782223565; c=relaxed/simple;
	bh=VTZ/avZaZnBJE2vV8o3EqfD2jwMJu1c9TH8AxemQC2M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gVPBys5bzxH5qPmWIiMyuoZWGjYNrzfbwiQ0bTUTJTJY4zxWKgyeMg4lP2cXzr5IP8JWzvwExs9gl0lAGeqN8JMI+w3+cR6uE1dWsTBb8FanSHR5V/ate+jzzGW8ODMUvGgV41W5snKYt49SRCHbwNaiLoNtrCLd5XKlWkbedoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPbb44vr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPbb44vr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782223564; x=1813759564;
  h=date:from:to:cc:subject:message-id;
  bh=VTZ/avZaZnBJE2vV8o3EqfD2jwMJu1c9TH8AxemQC2M=;
  b=NPbb44vrO3UblZRc8LBKeoWSwsWflRMV6/BepnA5q8zI6esD/rLMl8q2
   oJhDlD+tdCfC17mo/kvBgaW0aKpwdCbohAhyjEh7pZgywWsQTCrCMNs0a
   /sMM5Uj8LSvmWz6LNUlnu1QNj0LI/yl6EWTunCiC02ZJMwSUyStLjQwL/
   2Cb4cQ8WrjLXqua6/ZIkbIGcP2Q11zfaT4GOKm9Z5dC03TDfuA+Zl2mVU
   epeX8Tr+s3eb0WmqyBS3BRBY/fHLGeXZjICY2RyEM8LrQUWzIolcnPqbI
   8mEXsrmbvF4tnRdLoiwECoMoeuXdk8PFfqd6w/5RlfktkrIGnXxDpHKOj
   w==;
X-CSE-ConnectionGUID: HP5HcfLVTgyMlEk0CXli2w==
X-CSE-MsgGUID: O4Cs9TdkReiRRf0qwWFORg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94460151"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="94460151"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 07:06:04 -0700
X-CSE-ConnectionGUID: eroCKEVzRyC8y1qv+3Z58Q==
X-CSE-MsgGUID: ju/c39MiQaW6+F6LMAODDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="247189083"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jun 2026 07:06:02 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc1lH-000000006DV-33ur;
	Tue, 23 Jun 2026 14:05:59 +0000
Date: Tue, 23 Jun 2026 16:05:53 +0200
From: kernel test robot <lkp@intel.com>
To: "David Lechner (TI)" <dlechner@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [dlech:b4/iio-adc-ti-ads122c14 10/10] htmldocs:
 Documentation/iio/ads112c14.rst:57: WARNING: Block quote ends without a blank
 line; unexpected unindent. [docutils]
Message-ID: <202606231501.hG7m0kHG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/dlech/linux b4/iio-adc-ti-ads122c14
head:   9a48214781dd8525063938516a2a00ffb7b3c23c
commit: 9a48214781dd8525063938516a2a00ffb7b3c23c [10/10] WIP
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260623/202606231501.hG7m0kHG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231501.hG7m0kHG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   in0_lcrit_fault_log             Set to 1 by a VIN undervoltage fault occurring.
   in0_crit_fault_log              Set to 1 by a VIN overvoltage fault occurring.
   curr1_crit_fault_log            Set to 1 by an overcurrent fault occurring.
   =======================         ========================================== [docutils]
   Documentation/iio/ads112c14.rst:56: ERROR: Unexpected indentation. [docutils]
>> Documentation/iio/ads112c14.rst:57: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   WARNING: ./include/linux/damon.h:909 struct member 'probes' not described in 'damon_ctx'
   WARNING: ./include/linux/damon.h:909 struct member 'rnd_state' not described in 'damon_ctx'
   WARNING: ./include/linux/damon.h:909 struct member 'probes' not described in 'damon_ctx'
   WARNING: ./include/linux/damon.h:909 struct member 'rnd_state' not described in 'damon_ctx'
   Documentation/mm/memfd_preservation:7: ./mm/memfd_luo.c:13: ERROR: Unexpected section title.
--
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:58: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:228: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:251: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/iio/ads112c14.rst:22: WARNING: unknown document: '../devicetree/bindings/iio/adc/ti,ads112c14' [ref.doc]
   Documentation/networking/checksum-offloads:157: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]


vim +57 Documentation/iio/ads112c14.rst

    21	
  > 22	See :doc:`../devicetree/bindings/iio/adc/ti,ads112c14` for the complete
    23	binding description.
    24	
    25	The minimal device tree node looks like this::
    26	
    27	    adc@40 {
    28	        compatible = "ti,ads122c14";
    29	        reg = <0x40>;
    30	        avdd-supply = <&avdd>;
    31	        dvdd-supply = <&dvdd>;
    32	
    33	        /* TODO: add channel@ nodes here */
    34	    };
    35	
    36	Effect of devicetree on registers
    37	---------------------------------
    38	
    39	Device properties have the following effects on registers:
    40	
    41	* ``CLK_SEL`` and ``GPIO3_CFG`` are set if the ``clocks`` property is present.
    42	* ``GPIO2_SRC`` may be set when ``interrupts`` and ``interrupt-names`` for
    43	  "fault" is present.
    44	* ``GPIO3_SRC`` may be set when ``interrupts`` and ``interrupt-names`` for
    45	  "drdy" is present.
    46	
    47	Channel-specific properties have the following effects on registers only when
    48	a measurement is active on the channel:
    49	
    50	* ``AINP`` and ``AINN`` are set according to the ``single-channel`` or
    51	  ``differential-channel`` properties of each channel.
    52	* ``REF_SEL`` and ``REF_VAL`` will be set according to the value of the
    53	  ``ti,ref-source`` property.
    54	* When ``ti,ref-source`` is set to REFP-REFN:
    55	  * If ``refp-supply`` is given and not the same phandle as ``avdd-supply``,
    56	    ``REFP_BUF_EN`` will be set to 1, otherwise it will be 0.
  > 57	  * If ``refn-supply`` is given, ``REFN_BUF_EN`` will be set to 1, otherwise it
    58	    will be 0.
    59	* ``I1MUX`` and ``I2MUX`` will be set to the values of the ``excitation-channels``
    60	   property.
    61	* ``IUNIT``, ``I1MAG`` and ``I2MAG`` will be set to best fit according to the
    62	   values of the ``excitation-current-nanoamp`` property.
    63	* ``GC_EN`` will be set to 1 if the ``input-channel-rotation`` property is present,
    64	  otherwise it will be 0.
    65	* ``CODING`` is set based on the ``bipolar`` property.
    66	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
