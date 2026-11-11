Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393026;
	b=z+LRqBhiLFn6ZoXA9QlEegNPqXumb+YyPEi6RdWAnZcUiW5ldgUlNjnTDMLjJ6X6ExV3
	 p7BHOi/D6ALMNyvSyFmS4ekRN5rGBJHsxN3rOq1c11uMpXbhPUQL0LunFl49UMVbLNE57
	 jgQ9zxfFD+nzgQ+KHEWn6id9iAV9eFcJ0JGUlATsnumzOetopL6DVgcmrgCUuezWyCezO
	 1nP7vE4j5Wbg8zSZ7Glsrklry4mKl5pMjbgsRB+CkjTFyNz4SarDbXHK5TSTPeTYwXuq4
	 QPQHtUMLlP1jMzxNvT0XvnysYPP2DWd9w+cXefVsbnqTS+q5AM0H2L4twvFELi+734g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393026;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=sYUhvtEWMAMuteE3xX7bfSNMU3ZCaEPn0Wha78DIitM=;
	b=l7BmODG+HdP+AKkh2rZiw5+wldfEvzH2dRZa6JatPY4jvMqgXlcomL8KZs9MLtpkUHJ4
	 dY1F1xYltvYz1T2ORLCQl0o1pI5eMj0DmboBnpkB+i2pDArKwqI1PENQ7SuELFP34S7aM
	 +lhQ5r95RJea+uYixNbaPE4fVhjCJDZxWisLTkZsjiPkgs3LypXz/9Pp6G4IL+q/GXLzi
	 Om1YuAzbN7ugblYbLbHAFIJ2zbbRjlgtVl5CcrYxE2Kb3Id9WKB6zH8QlubA1Xy09HXOm
	 DtpFExezkkcjOa+zGNF5XUEAo9hTQj+B211AmiMKIPmPV46qCFYgY9OmeBjvIMLh22g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="MWH/mfvL";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9338606A31C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 10:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9338606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MWH/mfvL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794393026; x=1825929026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bNqrsPF0ia1G50zFa+Tnq3jn+4/kOWd7VD+Y20U/Zzg=;
  b=MWH/mfvLF2CZc1OpTpMiuqqwihVUUINa8ru5m5KCS9uhOhlqHxnilFYR
   RwWSmGRorHB6oedqWIAKpyq524UW1U3wJm0rvLFv1BJUNNozrTTFq/Tu2
   a2lezlqmdhEUMc9FbynYUdEwfEQcxHJeLwNDwmWoFRuFmG08IE8SSQ9Hv
   HUDCj42Ot3U1Pg3mL7Snm7yZSgcxciqFNzcKLjlXnf2/7/l73QjKGOOPW
   ORWHcLQGOJsy9X6oK3LP0FNcSl4+cpV0p8kXfKz1k/53ZX5uuw6GEUyaA
   pEavgizp/xdf0iUuY+1Crxy/rhYP5Kr4a0qanmL0nFqR6gEzq6EJwRHbm
   g==;
X-CSE-ConnectionGUID: L90kP7nTQam/qryGLZ9Adg==
X-CSE-MsgGUID: zlbkXBYNSs2zlCyx7OwZXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3082295"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3082295"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 02:30:25 -0800
X-CSE-ConnectionGUID: mc7HGpepRX+UTL9JgAXiKw==
X-CSE-MsgGUID: tfr4/1ryScifVe4B7dwdaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8364221"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Nov 2026 02:30:22 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR5as-00000000yf5-3Boq;
	Wed, 11 Nov 2026 10:30:18 +0000
Date: Wed, 11 Nov 2026 18:29:49 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>,
	"Paul J. Murphy" <paul.j.murphy@intel.com>,
	Martina Krasteva <martinax.krasteva@intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Gyula Kelemen <gyula.kelemen@advasolutions.com>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 3/8] media: i2c: ov9282: fix flash duration to/from
 microseconds conversion
Message-ID: <202611111848.aTw1f2PZ-lkp@intel.com>
References: <20261110-ov9282-fixes-v3-3-cb6df80cbc22@linux.dev>
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
In-Reply-To: <20261110-ov9282-fixes-v3-3-cb6df80cbc22@linux.dev>

Hi Richard,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7475ea8b58616b33c04afb976cf0fbaad9dd63fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Leitner/media-i2c-ov9282-handle-error-from-exposure-range-update/20261110-141010
base:   7475ea8b58616b33c04afb976cf0fbaad9dd63fb
patch link:    https://lore.kernel.org/r/20261110-ov9282-fixes-v3-3-cb6df80cbc22%40linux.dev
patch subject: [PATCH v3 3/8] media: i2c: ov9282: fix flash duration to/from microseconds conversion
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20261111/202611111848.aTw1f2PZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611111848.aTw1f2PZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611111848.aTw1f2PZ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/media/i2c/ov9282.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
