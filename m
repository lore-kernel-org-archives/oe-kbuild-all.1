Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8C81991A5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721125014; cv=none; b=CTifrru+fI4tlcrk4tRlhcGbj4o2sYzx+TM71b8D+vOcD8dGCU3YfoYy5/t5aEaqyqivnV4sftYkN/jfqLZfdbA0HNOtAiawEuv9gAuCspZeVQyS1/rHDjiIIWt29Wj7DbrKcNIakBgKjysbor/BJ+hWA/gCf3ERMM/Jg8SJVDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721125014; c=relaxed/simple;
	bh=aXwkgbHgN2Non6uHbmwnhBiv4tynUHRFW5BllKOQg+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n6z394WriC0UzMn9oHVYApTvV5vr2iVOpJe2YdJ7SdaMUWEBQPHhBdf8wDSUS7MVhYsT+3UK0CBsSOJ7CUn/6Yt+j7zit/nYDcSVf7wdFlDfImW6PtJUzB/lv1hAyRjDr5DvG+07+bpdmDMlMwXg4bltmY1P4Tnf8L03GXUKIsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PrMaonR9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PrMaonR9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721125013; x=1752661013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aXwkgbHgN2Non6uHbmwnhBiv4tynUHRFW5BllKOQg+4=;
  b=PrMaonR9+gYqYN0ai0vYh+PKDLMQbR85WJllw6cw4oy2xz6fv4T+J3PY
   bsCAKRXM7fwqki7uX05kvZkgbv4Kf5ehQn8Z22UegyvK4fWKL/szDjhyp
   UXPMbDfhDfYFqOObkkWLeEDIFbC1goEvfUDX+hrW7wSWpiEK75fZ5TBLW
   /CvMRfLJ4W+d3OLdCMJSUZdWGGUDq2IeAkhr5pM9BfpRxv4ZMh0HBeZYq
   utPdDu8HuTbo+ve+8TjqwBbn50M8DOBl0KSHjHeSZ8CzAz7YH8nGzeyPe
   /dpPJ7b2Z09tNFkqmST3pcmgY6g3A9PgsmgUaqETVal6LGDAZS0ryg9QJ
   A==;
X-CSE-ConnectionGUID: zxrh+mgVTmuFUtMngOpqAg==
X-CSE-MsgGUID: c+NJvQJISSuYXj+pp371OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18165461"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="18165461"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 03:16:52 -0700
X-CSE-ConnectionGUID: tp71aK2WT+a5uxf537iNkw==
X-CSE-MsgGUID: KBQXlIf/RIyEXN+4ZgOdug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="55111503"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Jul 2024 03:16:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTfEl-000f7O-0E;
	Tue, 16 Jul 2024 10:16:47 +0000
Date: Tue, 16 Jul 2024 18:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5503/7893] Warning: can't set `imports_granularity
 = Item`, unstable features are only available in nightly channel.
Message-ID: <202407161824.IGVilr0c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   11cf99a210e4916f7a066658c851c08ab6b123ce
commit: 6bacfda06c7bc4a51d082ec01f02384789695a40 [5503/7893] rue/scx/sched_ext: Add scx_rusty, a rust userspace hybrid scheduler
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240716/202407161824.IGVilr0c-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407161824.IGVilr0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407161824.IGVilr0c-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> Warning: can't set `imports_granularity = Item`, unstable features are only available in nightly channel.
>> Warning: can't set `group_imports = StdExternalCrate`, unstable features are only available in nightly channel.
>> Warning: can't set `version = Two`, unstable features are only available in nightly channel.
>> Warning: can't set `imports_granularity = Item`, unstable features are only available in nightly channel.
>> Warning: can't set `group_imports = StdExternalCrate`, unstable features are only available in nightly channel.
>> Warning: can't set `version = Two`, unstable features are only available in nightly channel.
>> error: couldn't read tools/sched_ext/scx_rusty/src/bpf/.output/rusty.skel.rs: No such file or directory (os error 2)
   --> tools/sched_ext/scx_rusty/src/main.rs:6:1
   |
   6 | mod rusty;
   | ^^^^^^^^^^
--
   Error writing files: failed to resolve mod `rusty`: tools/sched_ext/scx_rusty/src/bpf/.output/rusty.skel.rs does not exist
>> Warning: can't set `imports_granularity = Item`, unstable features are only available in nightly channel.
>> Warning: can't set `group_imports = StdExternalCrate`, unstable features are only available in nightly channel.
>> Warning: can't set `version = Two`, unstable features are only available in nightly channel.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
