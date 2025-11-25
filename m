Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6E1523A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 07:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764054462; cv=none; b=T8ItkJ8q6w+dDpQpk7tRCfZwVrfEocDJ1WGSIBBLDl8lyR9qxGWxyuo+3rtPB5J9C3P8ALGkXXz4Rg4+EYF6hDDOFvY2SFkTRal977kwXdHG2p6teB/NGa2Ti7rCWzwA03ixV1G3437hdbIDpYL3PbotkMj74Y2R6qx3FIqByyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764054462; c=relaxed/simple;
	bh=b8vwJ8bhsamsXO55pJnHAwYaxaVCrUBgnvgcki+FRko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=loIwySDRN+BH54crIpqmB9zCM3AZ0rVnvQDMV5Rcsy0AOwxP2zDMEIBAR+5259o4LqOi8Vug+6NlHmj2gh8JxdJwgCbrAlGweI/djCWASDV3RpZ4Nc+Rh9aq8yRcMCfKibYdVyaRO7uR/O77mDs4OfMvyHvLYN9xZvHUlB4/kXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InUmljLC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InUmljLC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764054461; x=1795590461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b8vwJ8bhsamsXO55pJnHAwYaxaVCrUBgnvgcki+FRko=;
  b=InUmljLCqbc6mDNI2zfwXOKQ/c1m6A0WqtD1PiUSEkTu+knWfhLXqXQA
   2b5aL53rg26ynAPHc+PeQ5+7SscBgnSKiZMcUpO7dAWdzXjpy6IxGFELL
   GStFadJbYlxs5Bcei9U+bWBOej6k+RtcsNLjhEpjq/BXf4R0l2hfqvIwH
   Y9gBo/E6U88ati0uuDDlMl+K7AL1l2l3iZnQTHken3TkqLOby54e7Nd+q
   29wGhp45jQdADtJiZUG2wk6RzqADw+JXplI8K79eo45Q3jkF8+cjMb1w8
   k9FBKYi1KuOinvnFSB8Cuyncu3639XYRb64cnNwoMofV5Zz4PjiztPmy5
   g==;
X-CSE-ConnectionGUID: 45uMDuezQTSJgNKpTxwDoA==
X-CSE-MsgGUID: rDgzeyOITXqOM+tX8o9rpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65249885"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="65249885"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 23:07:40 -0800
X-CSE-ConnectionGUID: 9kWsM79dQQmjNPrn6LZ49g==
X-CSE-MsgGUID: 19gVon7HT9mgJN4FQ0SDJQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 24 Nov 2025 23:07:39 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNn9F-000000000Rt-0Brq;
	Tue, 25 Nov 2025 07:07:37 +0000
Date: Tue, 25 Nov 2025 08:07:27 +0100
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Krist=F3fer_Fannar_Bj=F6rnsson?= <kristoferfannarb@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1208 3/17] warning: missing documentation for a method
Message-ID: <202511250859.erL9glB0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1208
head:   9bba107357a10d7bc2b6d669bfecb41e498bbb5d
commit: 21818fd952201cc98f35bb826c82e33895c430e9 [3/17] setup fs modules
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251125/202511250859.erL9glB0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250859.erL9glB0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511250859.erL9glB0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: missing documentation for a method
   --> rust/kernel/fs.rs:56:5
   |
   56 |     pub fn register<T: Type + ?Sized>(self: Pin<&mut Self>, module: &'static ThisModule) -> Result {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: requested on the command line with `-W missing-docs`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
