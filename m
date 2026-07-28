Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6093A190473
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 01:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785201020; cv=none; b=MaE0Hq+m1rkVB43rsRkuUzempxZS8n7AzuRJQmB/XF4MymiVHTrVBPJ5CGChhTmYZsiZTk8p9wBYnq80cLCoaru4rmzdAytNt5DkznafqOmbMY3vOarKJT/LL2kMxGheSoTNebTEWkrrzR7VbkrjfhSXFVFA28AUVxKk1aWfkjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785201020; c=relaxed/simple;
	bh=N46GGiTw540EILD9wVnYg8v38R9jzQhdU+fNom2vBU8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V/yN+drWKDp6tCGVjnIoH/14H5MoeGkT6/i39aPYypd37fMlbCK+Qrrf/ESXIHQEIkykYzDQnglUg5qaVnkIMuHmjbtoEGRusxgSsazd6E0iTn43YIeL8cxiMVrHdD6XUhYT0TE1Zy70yxGKPCRG9rSL9F50IcBWUqTm7R22+As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1ZYzUkd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1ZYzUkd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785201019; x=1816737019;
  h=date:from:to:cc:subject:message-id;
  bh=N46GGiTw540EILD9wVnYg8v38R9jzQhdU+fNom2vBU8=;
  b=Z1ZYzUkdgM6bR4SgG7WUaU/zstmmjA4rYo3kMfQwjY2fjdI2k22/Lfoj
   6B5Ba89RjqO6QsujqEa9yL6/a0507raKeZqrIUB2vl8TxC15f+RTDXO2Q
   c52IXlbou2m9v82YquDpRM738s9ZUcVccLwOS46rgVNWBXkjaTshyGffH
   rqIR4gYNh2t+AKXADoFbQdTfbqzU2EuzB8Tpqy8QjOWl0P49msvDE4old
   WOFvTHxUoaZa/CnVX4oW3Z3amJ7vQncu0kFNx2NrVnotW41ds4pqFi8nl
   LGs0ILLd7fhvcktqvostx5nV9SnQCS+ZJcNCWK4IhpAOO+6QRrtPtOzqZ
   A==;
X-CSE-ConnectionGUID: Og7KI7xxQsOhxpTSmv2NvA==
X-CSE-MsgGUID: 5/jRoadVT8SwKEPqX/eqCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96931911"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="96931911"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 18:10:19 -0700
X-CSE-ConnectionGUID: mr/N66apSWyoi+hJFhvnMQ==
X-CSE-MsgGUID: 7v6s+fOIQJuMaXzRvPnn4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="263349496"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Jul 2026 18:10:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woWKk-00000000dmB-0N5Q;
	Tue, 28 Jul 2026 01:10:14 +0000
Date: Tue, 28 Jul 2026 09:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: [thesofproject:topic/sof-dev 12/23] Warning:
 sound/soc/sof/intel/hda-stream.c:1186 function parameter 'rtd' not described
 in 'hda_dsp_get_llp'
Message-ID: <202607280917.KwQS8F1T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   7e9e0409cd57924c4099090879154300c07b8643
commit: 589b466c7e51c6929ec3196b362f1feccf32b411 [12/23] ASoC: SOF: ops: Add new platform-specific ops for compress
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260728/202607280917.KwQS8F1T-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607280917.KwQS8F1T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607280917.KwQS8F1T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/sof/intel/hda-stream.c:1186 function parameter 'rtd' not described in 'hda_dsp_get_llp'
>> Warning: sound/soc/sof/intel/hda-stream.c:1186 function parameter 'dir' not described in 'hda_dsp_get_llp'
>> Warning: sound/soc/sof/intel/hda-stream.c:1186 expecting prototype for hda_dsp_get_stream_llp(). Prototype was for hda_dsp_get_llp() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
