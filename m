Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D7822576E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785567041; cv=none; b=eo32o4UBW0sqEN3QaoxXQrktcalI5O0V0ELF/SzGzgQ/+2L8W3TmsgxxcF/aRm9mfagklLDGHU9a0UBlCQ701NK06ZeABnPSrS97kty9zu1Eidqm4D9HikJzoyyej200j68ZYrMxfNLIEwy2X+VIsfIm1V6H+3OythK3E+kHLoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785567041; c=relaxed/simple;
	bh=K1LTJB8B+VFrYPw3h9IRyJGtWY9ACglE+phogWj1iTs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g0RDAj8sfNqCC3gTxQSePUPHP4lGFK4hVHz3vYMs6WYaXZqYC+z4Lnt2epyUjKwFW+lEMrvk9+hwUzTm3zTrZgtjVeSVWS/TySvnRtRAq4rNSdjzjfbNPvAOGExpbGW8wrPc7+NCMG/tLjBAYTl64+vKLPpeg2FeJD6pC5+pafc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cfawsX1m; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfawsX1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785567037; x=1817103037;
  h=date:from:to:cc:subject:message-id;
  bh=K1LTJB8B+VFrYPw3h9IRyJGtWY9ACglE+phogWj1iTs=;
  b=cfawsX1m9mxLgnhKuvvpLBgH3u8h8Dz6d/cISttCE6E5XXH/lc0MNX46
   wpTCZrA4q5qpr1wtt0A9kejDSsb8nya60O2+/juyu2k04thqmIsGjxO3y
   dfbkSEOlQ1AxQ9egSIQ+smrYGeSVGJugZ4Ir2TWOFHAmCs+8lVZlzKmRU
   b+xkEZ1hC7yWctlaHrdYpFsANU9xYNpxgYe9A7EM0NKlV7dvssnUFOZp8
   fckVaokTqaUnTxfucb+swF5YQtLdrgiLGn+UR1oNWnxuZ+9P1h9aaavO1
   C01LKbmpuSxXPS6aT/+hKxUtfZ+niXiLEVbkq+/veqs463sGzKg2epwkL
   w==;
X-CSE-ConnectionGUID: 0vU0w/1tRGCoOb3FZlSLtw==
X-CSE-MsgGUID: X7vmQfbAQSW3DUrXIf4phg==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86135237"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="86135237"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 23:50:37 -0700
X-CSE-ConnectionGUID: DfUC4hdURWiV7CDQhwhaIw==
X-CSE-MsgGUID: kS7eHYLiSKOgOJQqoNUFHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="285379507"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jul 2026 23:50:35 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq3YH-000000003OY-0aji;
	Sat, 01 Aug 2026 06:50:33 +0000
Date: Sat, 01 Aug 2026 08:49:45 +0200
From: kernel test robot <lkp@intel.com>
To: "David Lechner (TI)" <dlechner@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [dlech:b4/iio-adc-ti-ads122c14 1/14] htmldocs:
 Documentation/iio/ads112c14.rst:57: WARNING: Block quote ends without a blank
 line; unexpected unindent. [docutils]
Message-ID: <202608010857.ceqTcPRr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/dlech/linux b4/iio-adc-ti-ads122c14
head:   c0c226e06d7019964f60738cde5a3eae4f0c0814
commit: 368fd704de0b90a9f9c30683d25db116ef8308bc [1/14] WIP
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260801/202608010857.ceqTcPRr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010857.ceqTcPRr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
   Documentation/iio/ads112c14.rst:56: ERROR: Unexpected indentation. [docutils]
>> Documentation/iio/ads112c14.rst:57: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   WARNING: ./include/linux/damon.h:909 struct member 'probes' not described in 'damon_ctx'
   WARNING: ./include/linux/damon.h:909 struct member 'rnd_state' not described in 'damon_ctx'
   WARNING: ./include/linux/damon.h:909 struct member 'probes' not described in 'damon_ctx'
   WARNING: ./include/linux/damon.h:909 struct member 'rnd_state' not described in 'damon_ctx'
   Documentation/mm/memfd_preservation:7: ./mm/memfd_luo.c:13: ERROR: Unexpected section title.
--
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:228: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:251: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/networking/netlink_spec/index.rst: WARNING: document isn't included in any toctree [toc.not_included]
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
    51	  ``diff-channel`` properties of each channel.
    52	* ``REF_SEL`` and ``REF_VAL`` will be set according to the value of the
    53	  ``reference-sources`` property.
    54	* When ``reference-sources`` is set to "external":
    55	  * If ``refp-supply`` is given and not the same phandle as ``avdd-supply``,
    56	    ``REFP_BUF_EN`` will be set to 1, otherwise it will be 0.
  > 57	  * If ``refn-supply`` is given, ``REFN_BUF_EN`` will be set to 1, otherwise it
    58	    will be 0.
    59	* ``I1MUX`` and ``I2MUX`` will be set to the values of the ``excitation-channels``
    60	   property.
    61	* ``IUNIT``, ``I1MAG`` and ``I2MAG`` will be set to best fit according to the
    62	   values of the ``excitation-current-nanoamp`` property.
    63	* ``GC_EN`` will be set to 1 if the ``input-chopping`` property is present,
    64	  otherwise it will be 0.
    65	* ``CODING`` is set based on the ``bipolar`` property.
    66	* ``DELAY`` is set based on the ``settling-time-us`` property.
    67	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
