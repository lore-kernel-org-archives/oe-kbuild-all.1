Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768417;
	b=JBYnC3abi7pn00lOgV5zHkC/ruC8OcnkKf2G/tFtfXULn9bR9vxvqKKMiIXJzME6hH6w
	 eoOZrM+blWNILp6j8OIHIiDCKfk2Y6dBWd0MvhfqnFZz4khgdHlBSq68MF+zDhEuFjSXk
	 vr1e0w7knCEjY2+i47S+esESyl3pHmxOmEWGtHdoIpfKAaqyuUzq3s6Ei0fvAaIEm8S8C
	 w7uqZj6Q5+cCxQOosd4+AY58ML/xcsomUpHPthXH3TDYMci/wB/KMen3p32g1ZY5fH78x
	 16vqlgIY8Up5M94q4i4OrZEE5mjvF1dQX7wwnZ034hjn/G3gQ+EB0zooyWkAZV3hP8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768417;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2adoUAJE2urbAHUCjcZJHR3qU6oXeqmDWStaP03rNfU=;
	b=MiATYuQvAHL0MFxQ3gKjeDSc0ku8EqI6ERm+0rPykJsh34/MI/ixbO7O20E5sV6UJR6m
	 I9xPsDDSpCe5RCoezSQN9lZj+lBqU60zdk4ExoElE49dSjXfmKgZwX1xfaUwTtTk6F3Ff
	 ZeqyiM3/hJy4gp5MkpSuM9bjiHuauAILB6aTj7TOQbdAKAbAE3XxjJma34kQZvowlT1T8
	 0w21owmHLgXtXw4M4J1DTgSu39qa8kKPqRtq79grDNk9QIGwgeT2r3yJzvbdzB2OIc0oV
	 ejN9sgGRmfwdgdc22T3gcOoN+bmaWB/IoZd7g+sbVDv5mfClV3jXw9a86ojWKj82XPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mU7+Zk1g;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCA4606A32F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 08:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABCA4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mU7+Zk1g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795768416; x=1827304416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qO1CBDql5BdqV/ZAEf8Juo9+US4w1SccOa1RJtgkBvo=;
  b=mU7+Zk1gqTyMnVeVu6GslqoCFWHE8wVNz5B5d1UAGxMaDUdkLKl127+p
   aKxpasmAKQdlU5azbnk9gh4a3VFA0TepAwv+YmZ+ESBjaQFyEiXGukWF2
   IdW6nfSz+BN2GFWYK3kYbpTLrnHEalF95cZUFetF7rWlsPfJna5+XCtys
   MlZiSey7ELOrLFgivb6bGk8AXlQtAliVxPc2zJJCi7hTyh2qgoVnmcMtz
   ZyEx+sGg2IwtwpFjUWeONcAFxXJ5YZSji8KAwqHlMBuC4bQNVbYJJ4DkL
   IV88GYR6X1gZFzKHOMEfAsuf6Yde/44uC5TPdJZw6uXuBDr4HnfHPS7XF
   A==;
X-CSE-ConnectionGUID: TJ6GkDkWTRyjbTf6NW77sA==
X-CSE-MsgGUID: SZPrjzSDRmuy5h6CqMeg/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4587773"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4587773"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 00:33:36 -0800
X-CSE-ConnectionGUID: syHLHn8XT/ejptysGfyUHg==
X-CSE-MsgGUID: BJ2OY1R6TP2HtUrSTCXDvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12132628"
Received: from igk-lkp-server01.igk.intel.com (HELO e79648c3b81b) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2026 00:33:18 -0800
Received: from kbuild by e79648c3b81b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWrO8-0000000000r-44cZ;
	Fri, 27 Nov 2026 08:33:00 +0000
Date: Fri, 27 Nov 2026 09:32:04 +0100
From: kernel test robot <lkp@intel.com>
To: Alan Pluto <alanpluto@163.com>, platform-driver-x86@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com, i@rong.moe, W_Armin@gmx.de,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: lenovo-wmi-other: Add raw
 GetDataByPackage interface
Message-ID: <20261127084625.fhboKKCu-lkp@intel.com>
References: <20261123061120.18740-1-alanpluto@163.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123061120.18740-1-alanpluto@163.com>

Hi Alan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.4-rc4 next-20261126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alan-Pluto/platform-x86-lenovo-wmi-other-Add-raw-GetDataByPackage-interface/20261123-141120
base:   linus/master
patch link:    https://lore.kernel.org/r/20261123061120.18740-1-alanpluto%40163.com
patch subject: [PATCH v2] platform/x86: lenovo-wmi-other: Add raw GetDataByPackage interface
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261127/20261127084625.fhboKKCu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127084625.fhboKKCu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:823: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:832: ./include/uapi/linux/landlock.h:256: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:832: ./include/uapi/linux/landlock.h:279: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:832: ./include/uapi/linux/landlock.h:317: ERROR: Unknown target name: "permission flags". [docutils]
   Documentation/userspace-api/landlock:832: ./include/uapi/linux/landlock.h:352: ERROR: Unknown target name: "permission flags". [docutils]
>> Documentation/wmi/devices/lenovo-wmi-other.rst:37: WARNING: Title underline too short.


vim +37 Documentation/wmi/devices/lenovo-wmi-other.rst

    35	
    36	GetDataByPackage diagnostics
  > 37	~~~~~~~~~~~~~~~~~~~~~~~~~~~
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
