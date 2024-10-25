Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86797433CE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 01:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729821399; cv=none; b=JMwoqijS2V/AJfIAVktF6A8M7xQuuJyqVI511R4lNEeTv76n++fG7btZ77l+l9tKWHUVMUAglVTEyhvA9mr2GHXqvKxPGhDku+KHyReHJCGAiCNrY0n/T2srCN15/Dj0v98qn95hGiHMs0KoZb0VEeCzcVYZl8HuxF+G6u48WBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729821399; c=relaxed/simple;
	bh=pX6zkblTjHp8UbHD+p+gvi9BPyy9GiBwOUX/k6hZgBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhYAJg7/ggs4L8hUYDe8zBQqWjYafgAs5zu59+VyqiwZPYdA6EaJoYw16uI3jgEWVm/+iR9fYQNTEXTsjUAPJK1rrmfnUz0caPYjo+nCFMaem26UqNRri/fTGNXhY++PQTyP9D77dvTf7leF0DlTPF0J0mbk7JNwhfT4lQR7tYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nu7+Q5jX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nu7+Q5jX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729821397; x=1761357397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pX6zkblTjHp8UbHD+p+gvi9BPyy9GiBwOUX/k6hZgBE=;
  b=nu7+Q5jXEnRr+iU1lvaE0OzHmOzAjovM9QmFhGwAB/ExPY4ISgY+uHda
   Ka8XTW45b9ttyJpNdKaV7yeLAnj9jnyVPsr6U1AtF4FyKLLVepn2kUDZY
   PwQfcYGElRy5C/gxjbKzWOqgXFObvysoNrDzuUYMJflU5/gBS5rDgqQ8c
   6LEn3cwrPWoYLb1rVy6U+q/OYTqx/uYeKLkRRVd/grNDvXx5oesJMscdf
   J1vBbDdwJhoJYtOXcuqlYk5isxQiqMfqtxdAsQ9Ry/Pqdbh99x/sn04MW
   BXl3SF3LJFWyzSs4ipn9QSbblveG55bnjd0iuZq0r2khu42fVH6CaZHje
   w==;
X-CSE-ConnectionGUID: 1WvuSZ6jQrGXPkYTyddCcg==
X-CSE-MsgGUID: lXGXxLKLTGiExBLM/nKLsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="17110049"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="17110049"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 18:56:34 -0700
X-CSE-ConnectionGUID: TGdMcNHOSBe3gzoPKhSCLw==
X-CSE-MsgGUID: XAyoUq3BS+yxWJARDRYptA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="81606311"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Oct 2024 18:56:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t49Z1-000XOm-0b;
	Fri, 25 Oct 2024 01:56:31 +0000
Date: Fri, 25 Oct 2024 09:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 2/5] perf hwmon_pmu: Add a tool PMU exposing events
 from hwmon in sysfs
Message-ID: <202410250927.jL8VMZKJ-lkp@intel.com>
References: <20241022180623.463131-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022180623.463131-3-irogers@google.com>

Hi Ian,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on next-20241024]
[cannot apply to tip/perf/core perf-tools/perf-tools linus/master acme/perf/core v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/tools-api-io-Ensure-line_len_out-is-always-initialized/20241023-020925
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20241022180623.463131-3-irogers%40google.com
patch subject: [PATCH v6 2/5] perf hwmon_pmu: Add a tool PMU exposing events from hwmon in sysfs
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250927.jL8VMZKJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250927.jL8VMZKJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:648: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.12.rc3.g05bfa0ab5537
>> util/hwmon_pmu.c:176:2: error: call to undeclared library function 'strlcpy' with type 'unsigned long (char *, const char *, unsigned long)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     176 |         strlcpy(fn_type, filename, sizeof(fn_type));
         |         ^
   util/hwmon_pmu.c:176:2: note: include the header <string.h> or explicitly provide a declaration for 'strlcpy'
   1 error generated.
   make[7]: *** [tools/build/Makefile.build:106: tools/perf/util/hwmon_pmu.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[5]: *** [Makefile.perf:789: tools/perf/perf-util-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:292: sub-make] Error 2
   make[3]: *** [Makefile:76: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
