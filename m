Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DB627E04C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Apr 2026 12:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776601549; cv=none; b=qME67aJ05Wjjkz5cccdghwdfAQdQoqS1Fx64Z8XD5znJ38f7iqZgdO3x+/DCHjZEvNTPxtzqigk8Xc3UZsSw/KPB2OEdGYVuDb+RqfpgKfM01a8MderpD6SG2JNO+DoJIBGYqACkKBlNFx17MjG0l+K9jvVKSxvEgTYYiOOR4Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776601549; c=relaxed/simple;
	bh=00HYRBh4QBdVhx94851qBR+cTM28MyExi69+YRYYmRo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j0oB8Qi02CB9iloLHgu1qBWY7UoSVkQQ7icJ2XKraU5yNYKUGsNrd6qc7GkN/qxXAjAl8J1C5boejugTKp77Sf3xrPGQepQTfyH0yVNAXNBdqpAi9nGN9JLK3Y5JolpHMxil5xEUUT6RmHcJ5+Za81AdCzRMBP0eE60nbznuFcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxmeCBP5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxmeCBP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776601547; x=1808137547;
  h=date:from:to:cc:subject:message-id;
  bh=00HYRBh4QBdVhx94851qBR+cTM28MyExi69+YRYYmRo=;
  b=fxmeCBP55W8zcakEbQxPg4UELtzjRjOiDYl8ur6tzhgf6PmjC38Hh7H1
   ah9WyA4IdORpJAOVz6BWxpipUBNEx8Ci4s2iGVENglYeV7BPsaVGkJIZP
   yCEKZdH1hJwXZcr+LpZNuSKbkaCu6bo9BniEtklld1/VxJFEHtyshCBQP
   znY+uTO1t2jktQbvKfCGOvpPxU7zGa132akhTP4WChBKT/0B6LZXxSzlb
   AMj0tOMJu4BSWtRL/WsXc8sgkX9/5qmWQ1GzKKz8Nsy8kImtFXGwW27Qu
   ljqMnQToNIz/csSxuL2sXuEvuJh/HsoAJv2prB98Bh3gPEQl/7gZiay93
   w==;
X-CSE-ConnectionGUID: Jcrtxub3SKOiqStrA4RgMQ==
X-CSE-MsgGUID: s9l98Ng1RMSVTPibi1zLgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77726101"
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; 
   d="scan'208";a="77726101"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2026 05:25:47 -0700
X-CSE-ConnectionGUID: cCk/MwbyTP6UwZnUOExQaw==
X-CSE-MsgGUID: h1U6uSAiQA+6dK/yJaRHyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; 
   d="scan'208";a="236467633"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 19 Apr 2026 05:25:45 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wERDb-000000001y9-0krO;
	Sun, 19 Apr 2026 12:25:43 +0000
Date: Sun, 19 Apr 2026 14:24:54 +0200
From: kernel test robot <lkp@intel.com>
To: Rodrigo Alencar <rodrigo.alencar@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/iio/ad9910.rst:451: WARNING: Block
 quote ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202604191436.eNqraDV2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Rodrigo-Alencar-via-B4-Relay/dt-bindings-iio-frequency-add-ad9910/20260419-104913
head:   5ac9bfbe149f0815ff3156530d694c8c4a39dc75
commit: 5ac9bfbe149f0815ff3156530d694c8c4a39dc75 docs: iio: add documentation for ad9910 driver
date:   9 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260419/202604191436.eNqraDV2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604191436.eNqraDV2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
   Documentation/iio/ad9910.rst:444: ERROR: Unexpected indentation. [docutils]
   Documentation/iio/ad9910.rst:447: ERROR: Unexpected indentation. [docutils]
>> Documentation/iio/ad9910.rst:451: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/iio/ad9910.rst:452: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/iio/ad9910.rst:459: ERROR: Unexpected indentation. [docutils]
   Documentation/mm/memfd_preservation:7: ./mm/memfd_luo.c:13: ERROR: Unexpected section title.


vim +451 Documentation/iio/ad9910.rst

   440	
   441	- 72-byte header:
   442	  - 4-byte big-endian word count: number of 32-bit words to be loaded (0-1024)
   443	  - 4-byte big-endian CFR1 value: configuration for the CFR1 register. Only
   444	    bits relevant to RAM mode (data destination and internal profile control)
   445	    are considered. Other bits are ignored and have no effect.
   446	    - Bits [30:29]: RAM data destination:
   447	      - 00: frequency
   448	      - 01: phase
   449	      - 10: amplitude
   450	      - 11: polar
 > 451	    - Bits [20:17]: Internal profile control (see Table 14 of the datasheet).
   452	  - 8 sets of 8-byte big-endian profile data for profiles 0-7. Each set contains:
   453	    - Bits [55:40]: Address step rate value
   454	    - Bits [39:30]: End address for the profile
   455	    - Bits [23:14]: Start address for the profile
   456	    - Bit [5]: no-dwell high for ramp-up mode
   457	    - Bit [3]: zero-crossing for direct-switch mode
   458	    - Bits [2:0]: operating mode:
   459	      - 000: direct switch
   460	      - 001: ramp-up
   461	      - 010: bidirectional
   462	      - 011: bidirectional continuous
   463	      - 100: ramp-up continuous
   464	- Followed by the specified number of 32-bit big-endian data words.
   465	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
