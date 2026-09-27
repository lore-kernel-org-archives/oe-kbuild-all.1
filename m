Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246B6332621
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 16:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790524957; cv=none; b=W6cnyL3gvkn7ztS3nvMguaPxSd1KX6ytHr4c1WmdQlYZhEbI15t43nLfjKEl0gmgHjVOWgvOA3VCCDA6lzPdCV5Zxg3i9rLDPbBc7L5KzGTTQLPy4sAuQP8TXBrdQ/uHRkrJBzXkmQ+h2EGtsYIf6F+6C7s3Rmp/uivpVh+KMt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790524957; c=relaxed/simple;
	bh=CTavZ99JhSancwAsfzE/DN+VXQbwpmkhXZpVZJuivRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqrKcg8C3j3JlOVCnQGoIB5jBF72ry7CV2AxaUdE+WznKUK2UAqFyhHILR4dDD0hh1ptjtUI51uHNnrCTPuRK6b+qSSevyjnt05MQfWqE4t6GVcHnudqmGDve88Wwx1oOSUAjIbkBBhsceX2SikcQOIlGFmZdnVvXhgJ6ue68PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SYcXrqzi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYcXrqzi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790524954; x=1822060954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CTavZ99JhSancwAsfzE/DN+VXQbwpmkhXZpVZJuivRE=;
  b=SYcXrqziPMGcNFCC4eVnHfFtTZuIVP9DVeGJpJluFiBqVZy1sQM6BD0N
   sdcOKoohQh6EwdG9ysiAbb2KYHLwstGlkvuoHoQ0W/SJRq4OjeiDQW6K5
   s1H/ITO70wfiagP6oNfeetogYK7Lo4vlbaXqF6O/TXXjWljb6PhIGpCuM
   l4YNLr/ofd0CR9N6TCQPPBt8ZP0wL74jxY4hS0eUee1u9FntCGgjSDk+0
   dywclp/LFJwZagkbNrOj/j/boMkVFRg3HC0eEswHk2LkL7Ut1njYGyDLN
   vFi4eDNybxaPh3bR/kDqsOaR28SdgZ6dXePUwywBN4jYoxTGlgao7QPps
   g==;
X-CSE-ConnectionGUID: 4mkDpjhIQbqMyGVS9OyU8g==
X-CSE-MsgGUID: W3iotvUqSUu+B6/pqnYXWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101898218"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="101898218"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 09:02:33 -0700
X-CSE-ConnectionGUID: nLEMoT7ET6CiSvxDhsc62g==
X-CSE-MsgGUID: XdM9XDKSSPyCk3+TQ0yBlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="274358961"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Sep 2026 09:02:31 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xArKe-00000000Mzp-0QOT;
	Sun, 27 Sep 2026 16:02:28 +0000
Date: Mon, 28 Sep 2026 00:01:50 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Bapat <abhishekbapat@google.com>,
	Suren Baghdasaryan <surenb@google.com>, Hao Ge <hao.ge@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Abhishek Bapat <abhishekbapat@google.com>
Subject: Re: [PATCH 4/4] alloc_tag: add a test for trace state toggle and
 filtering
Message-ID: <202609272338.hVBNO626-lkp@intel.com>
References: <988dddb203416668a10bc9c5e6157a78615d2ed2.1790025465.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <988dddb203416668a10bc9c5e6157a78615d2ed2.1790025465.git.abhishekbapat@google.com>

Hi Abhishek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8d61431ed2607386b427752505379536eb634ce8]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhishek-Bapat/alloc_tag-Add-trace-events-for-tracing-allocations/20260921-212638
base:   8d61431ed2607386b427752505379536eb634ce8
patch link:    https://lore.kernel.org/r/988dddb203416668a10bc9c5e6157a78615d2ed2.1790025465.git.abhishekbapat%40google.com
patch subject: [PATCH 4/4] alloc_tag: add a test for trace state toggle and filtering
config: xtensa-randconfig-1001-20260927 (https://download.01.org/0day-ci/archive/20260927/202609272338.hVBNO626-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609272338.hVBNO626-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609272338.hVBNO626-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: alloc_tag_trace_hit+0x28 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: run_tracer_selftest+0x250 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
