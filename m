Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898B032D45C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 21:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769550704; cv=none; b=mZv5Wq/C6wN4aOOTXKvrcR+OkksnzSFGFtpxW1HWGgOdYeo7WjaRvz7f67DZLL/k8wyVLtJz6vRKz1fh+5t7PLbhYWrl9KvgU5NlPT0TY+k1XDmOur1dlh0aMkJaeYuO1rKZf41aQN4e3NnlQKeM59+ZE+zcwwV2GYkqCnJxDOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769550704; c=relaxed/simple;
	bh=dtIffU36g8FmQEzwROroB7gOkf5mKnNp6PxM5/4MYo0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aHMXCbeKYQFldhIeaMkwjlgYB85RPkv0MBLhQLMskZ5BLozOmmkUYVA6yxz9AxtvAMYLPsF6rX8o9XEsqvgnopZpkeAq1/F9D1uEDLj54rAEDjZqVN5I4VJE4RR9847RBTMR5W3iFbLrOfgOwlDXKNkuOkRTquca/jZdHoHPJzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krw1tRNM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krw1tRNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769550701; x=1801086701;
  h=date:from:to:cc:subject:message-id;
  bh=dtIffU36g8FmQEzwROroB7gOkf5mKnNp6PxM5/4MYo0=;
  b=krw1tRNMEWR+BDnNytUAdh28sCGQxGtpzEGfrWgm+iOsjMZDtvsNoR9w
   MaVRnLuy173N9SW6I08awyt/BSM0kzbNYrx6v5O3LDYbGZO3GUQDueESI
   OYY7TYFADlQy5nvE8al45IcIltdjWamGWaH5CFaZYDpIbDlei87dmVPiG
   W4ewiHOkhecP2Y5BC9Wa7zyizeQ7OtcxSejpkwWM7+2kPyQAWBaKrlZL+
   RoOEKhy+BV5ToOphvMygY8oO+jwtZ+os7ehV8qJn2QXuUvudAl/BZBg8e
   3dzxnQxc4rJMXFXsLC9yV0L93JQx6Z+rtN3FTqk+VJ65Pn7hKxi7bq2ck
   g==;
X-CSE-ConnectionGUID: xvFNQdo0TMmHBu6gjSrtXw==
X-CSE-MsgGUID: t/nllcRuR7um+3EJWBmP4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="96222208"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="96222208"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 13:51:41 -0800
X-CSE-ConnectionGUID: hMeoLc9lSlmBrlW815kNag==
X-CSE-MsgGUID: vm608pI8SpG8/aDzyPdtMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207986972"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jan 2026 13:51:39 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkqyH-000000001wF-2wYV;
	Tue, 27 Jan 2026 21:51:37 +0000
Date: Tue, 27 Jan 2026 22:51:27 +0100
From: kernel test robot <lkp@intel.com>
To: Victor Duicu <victor.duicu@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/hwmon/mcp9982.rst:2: WARNING:
 Explicit markup ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202601272257.CLCmXvcW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/victor-duicu-microchip-com/dt-bindings-hwmon-add-support-for-MCP998X/20260127-234206
head:   0baaf837477ebfcec7499ca315778155b2688e5d
commit: 0baaf837477ebfcec7499ca315778155b2688e5d hwmon: add support for MCP998X
date:   6 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260127/202601272257.CLCmXvcW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601272257.CLCmXvcW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/hid_bpf.h
   ERROR: Cannot find file ./include/linux/hid_bpf.h
   WARNING: No kernel-doc for file ./include/linux/hid_bpf.h
   ERROR: Cannot find file ./include/linux/hid.h
   WARNING: No kernel-doc for file ./include/linux/hid.h
>> Documentation/hwmon/mcp9982.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent. [docutils]
   Documentation/hwmon/mcp9982.rst:70: ERROR: Unexpected indentation. [docutils]
>> Documentation/hwmon/mcp9982.rst:71: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/hwmon/mcp9982.rst:72: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
   ERROR: Cannot find file ./include/linux/i2c-atr.h
   WARNING: No kernel-doc for file ./include/linux/i2c-atr.h
   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h


vim +2 Documentation/hwmon/mcp9982.rst

   > 2	Kernel driver MCP998X
     3	=====================
     4	
     5	Supported chips:
     6	
     7	  * Microchip Technology MCP998X/MCP9933 and MCP998XD/MCP9933D
     8	
     9	    Prefix: 'mcp9982'
    10	
    11	    Datasheet:
    12	    https://ww1.microchip.com/downloads/aemDocuments/documents/MSLD/ProductDocuments/DataSheets/MCP998X-Family-Data-Sheet-DS20006827.pdf
    13	
    14	Authors:
    15	
    16	   - Victor Duicu <victor.duicu@microchip.com>
    17	
    18	Description
    19	-----------
    20	
    21	This driver implements support for the MCP998X family containing: MCP9982,
    22	MCP9982D, MCP9983, MCP9983D, MCP9984, MCP9984D, MCP9985, MCP9985D,
    23	MCP9933 and MCP9933D.
    24	
    25	The MCP998X Family is a high accuracy 2-wire multichannel automotive
    26	temperature monitor.
    27	
    28	The chips in the family have different numbers of external channels,
    29	ranging from 1 (MCP9982) to 4 channels (MCP9985). Reading diodes in
    30	anti-parallel connection is supported by MCP9984/85/33 and
    31	MCP9984D/85D/33D. Dedicated hardware shutdown circuitry is present
    32	only in MCP998XD and MCP9933D.
    33	
    34	Temperatures are read in millidegrees Celsius, ranging from -64 to
    35	191.875 with 0.125 precision.
    36	
    37	Each channel has a minimum, maximum, and critical limit alongside associated alarms.
    38	The chips also implement a hysteresis mechanism which applies only to the maximum
    39	and critical limits. The relative difference between a limit and its hysteresis
    40	is the same for both and the value is kept in a single register.
    41	
    42	The chips measure temperatures with a variable conversion rate.
    43	Update_interval = Conversion/Second, so the available options are:
    44	- 16000 (ms) = 1 conv/16 sec
    45	- 8000 (ms) = 1 conv/8 sec
    46	- 4000 (ms) = 1 conv/4 sec
    47	- 2000 (ms) = 1 conv/2 sec
    48	- 1000 (ms) = 1 conv/sec
    49	- 500 (ms) = 2 conv/sec
    50	- 250 (ms) = 4 conv/sec
    51	- 125 (ms) = 8 conv/sec
    52	- 64 (ms) = 16 conv/sec
    53	- 32 (ms) = 32 conv/sec
    54	- 16 (ms) = 64 conv/sec
    55	
    56	Usage Notes
    57	-----------
    58	
    59	Parameters that can be configured in devicetree:
    60	- anti-parallel diode mode operation
    61	- resistance error correction on channels 1 and 2
    62	- resistance error correction on channels 3 and 4
    63	Chips 82/83 and 82D/83D do not support anti-parallel diode mode.
    64	For chips with "D" in the name resistance error correction must be on.
    65	Please see Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
    66	for details.
    67	
    68	There are two power states:
    69	- Active state: in which the chip is converting on all channels at the
    70	  programmed rate.
  > 71	- Standby state: in which the host must initiate a conversion cycle.
  > 72	Chips with "D" in the name work in Active state only and those without
    73	can work in either state.
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
