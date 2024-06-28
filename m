Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB337603A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 21:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719609229; cv=none; b=JVDAfNNH/PsQ9XZaGW+SCaleRIMohWmrAzgl4radHTNjZuHRtjgi8tRqTLGzgelX0AZDQO04a/Xc+ua3wGkaPzl97V8z4PaE2Vwi0iCvE57od1HO9sMV8diMSHA5GDFvg4zi4PXRjeRlWRYDnPe6WjsAe/DFQ3H0ewHYHFcEAWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719609229; c=relaxed/simple;
	bh=rcq0CBNdH9/HbkNZOXGVIt8R7lyhg6gNjzCq1VjpI0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rC2qDBu6kG6Cyl/9h+T3V6cSzQt2Mi6hLO3rcfjtCYl3c2FdHF48a8C6UXg/AwIYCJfDNJI/fd8+g1Bx1fGrYpkU2dHfjCLF3h8vbCiW0vJNdkWJWrcZwJDJmoV6Yq85fdxAVFpk9Hza7DCzUxY6alhruEsYxlbHNhlXPCgbb3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5v3FkCw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5v3FkCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719609228; x=1751145228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rcq0CBNdH9/HbkNZOXGVIt8R7lyhg6gNjzCq1VjpI0Y=;
  b=O5v3FkCwJVA8SvAjKlfZhU1DBW35RPnvJG1VYty3vpWe5qdxWzrogoAL
   pKHzda8MnWg4gZ2rwcJo0K7nyzT4a4dWSCOL0tM51EQtyF+fLPjihXiXL
   icpezpJHlsZhnA/h1fclQUQKkwjk8pheQ1YZz0X45ljjS+Gcix+ad6m2H
   yUptS6RMfaaCED2v0bdh7R+Yqm3NgH/tP4twWRkvc5A1LKhqFeHowmkDt
   58cinJDgHyQyMr1HAVFzvXmoTv7lPEH+EM7meuGNqRAsjWG/AfucYxifg
   a2SbG6qeXDVigjQ3r0RC2zlljHZlAqJLtIFY+A7F5Evu6snzImbMzmsgB
   w==;
X-CSE-ConnectionGUID: RDNPFTElSzuTZlDP58bRcA==
X-CSE-MsgGUID: Vb3RO12aSqGQmr2fgmk3FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="42226279"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="42226279"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 14:13:41 -0700
X-CSE-ConnectionGUID: eL0VABp6SuW1CTy/hqejpQ==
X-CSE-MsgGUID: bPSXXLdrSjijBpfmf7z87A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="44838889"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jun 2024 14:13:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNIuY-000IUK-1b;
	Fri, 28 Jun 2024 21:13:38 +0000
Date: Sat, 29 Jun 2024 05:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [morimoto:sound-ak4619-for-upstream-2024-06-28 5/8]
 Documentation/devicetree/bindings/sound/simple-audio-mux.yaml: state-labels:
 missing type definition
Message-ID: <202406290553.oLOBg3m5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-ak4619-for-upstream-2024-06-28
head:   1fcff128782574ab57b108b58c74363f602252e6
commit: ad1349eda3c8e174887cff500cf17d1b02b192d7 [5/8] ASoC: dt-bindings: simple-audio-mux: add mux-names property
config: csky-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240629/202406290553.oLOBg3m5-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240629/202406290553.oLOBg3m5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406290553.oLOBg3m5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
>> Documentation/devicetree/bindings/sound/simple-audio-mux.yaml: state-labels: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
