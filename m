Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A852AE74
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 03:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739935115; cv=none; b=n3YM0C8fkQddl+6XxnaMtJ6gjXN0Gzn9haeg7D4wRZq/+axYH8EuHYX1xv+aaJ9DNVnOgEYg6v9R4WSlSNx44it9nDxyS0jfwa8MWWQaJuiw4vitd4Jk8ZOymZUtXbqxG/gJPftluaV+Pf8orbb6IHckqW+Pf7XDoEMZWTvIF9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739935115; c=relaxed/simple;
	bh=P5Xjukuzp7mGzlO5q3FBzhO+Gvju6cHMpX7VxuEhbTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aD4ewjhc+oZAsP78OrPSWbV6EYl63a2wv5VaodZ44V4N5Axrmc1wRFtZWk6Y5rcAnT1DYbR8yVs+0QyNCJh188xVBnajswJ/9Gx0QyIT8UUIpgCUUdMjygBpoyJoZSLgqaPGpUZQBXh9xYrur1UyS/zJOVj3lTFYdgJF3nlAP8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SjfIRWf3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjfIRWf3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739935114; x=1771471114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P5Xjukuzp7mGzlO5q3FBzhO+Gvju6cHMpX7VxuEhbTk=;
  b=SjfIRWf3F6jpa9CprmrbOSgXPhgU6ToUomLXfeKuDib+PaUMIlTv3nVi
   xN97Cp51/LwVpsOFMgHA0oKtSEHyNQi5GkX1Hu93PYovdGa8myUEcvzi4
   w7fdBZ0hy+NFlbUaGZjfeOMWuEMa4skLEqeOOBNVLvbALo0LcB9GifEMI
   NUsLp9qIcexqM+132iwSfzdw4mvdnEu5hStWS+GwRdaoIDpLFpjhRiypN
   8VuPWFsUWnWNVhk37Pm1sl6VXjMYPv8ys2IoHeKel18I7yTOgC6JlrAl5
   7XotbdA7+vG4LIjFrvHF2yAHIW+REqeJavPCC2j2c/aMhD8NxKZxSli+u
   Q==;
X-CSE-ConnectionGUID: 0Op6Voj6Tpe79Eeq7KJrtg==
X-CSE-MsgGUID: igQv1OVoSvy6ivXjGGTDNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="63132676"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="63132676"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 19:18:33 -0800
X-CSE-ConnectionGUID: 75X7zMpCT1yPdzwGlIGNrw==
X-CSE-MsgGUID: +J2jxyl0Qw+HmqxgVPOcGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119236703"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Feb 2025 19:16:16 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkaZJ-0001Bb-2X;
	Wed, 19 Feb 2025 03:16:13 +0000
Date: Wed, 19 Feb 2025 11:16:07 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/fineibt-bhi 14/17] arch/x86/lib/bhi.o: warning:
 objtool: bad .discard.annotate_insn entry: 16 of type 1
Message-ID: <202502191158.7McyBdDM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/fineibt-bhi
head:   fc37d12eb49df491173cf99055fce6108a2a99a3
commit: 442c39013ba6a089a8ac592b1456fa15bfed8fe7 [14/17] x86: BHI stubs
config: x86_64-buildonly-randconfig-003-20250219 (https://download.01.org/0day-ci/archive/20250219/202502191158.7McyBdDM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502191158.7McyBdDM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191158.7McyBdDM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/lib/bhi.o: warning: objtool: bad .discard.annotate_insn entry: 16 of type 1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
