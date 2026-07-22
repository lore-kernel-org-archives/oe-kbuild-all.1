Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA24536404D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jul 2026 01:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784683202; cv=none; b=IJiq5uPR0jelapk1MfYfYLYppUqrRmi3+FxpkqVcnslbj+KrXLVh/R/kdMhthfFmph0zskT0neYemmlQkLC8L8Cjp2DGyPt1koMwN+Z6SA6Sw64TJvREzTF5LvpGHaG/9E992EXO9vLOj02hl/M19QHsuBqpOcxSSWBVTihJN2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784683202; c=relaxed/simple;
	bh=rL4bKNtepSIIikLpxwfuIkwddwlxzbKs2aCKkiRgwn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aexNdBSIvvLhhov3+tt5qW0cnJgkQWoKDyRqSMhlak7FI31qV94SYFjKCkombzWjx8BVbNgvEsEzxVVeC9Y8Jd6KPqb8Vjo6TcaUsUEnfd28Hy24w9FixnaSMkhhMaMZf1UgfqZRXaHxfSd5e+JdAi5+fXyIEWK5QDLa+pgHa3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2NGM18I; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2NGM18I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784683201; x=1816219201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rL4bKNtepSIIikLpxwfuIkwddwlxzbKs2aCKkiRgwn4=;
  b=V2NGM18I8uyTHhzzXoskH6uV+lhYSKG0o7+gQloviDV8tPQ8Ok4i49Nm
   5YFDFX1o/WPBgxnmZuhf3z4jvXLRIV9MwVgmevVOEWS1E3/8Ex9yto/QH
   HZyEAxPpGJlQDxvB7N8d9WaV3JIW64x5TzHItpqKydumC/CWyGeDuYYEh
   Yn+YcIauJJCuYMl9wjwRqrtVk580EFpO9Ozo9avKxg5VRBaGZY6s3nQRM
   2Iriln+mN52UsFoF92bZ2cm/qJUXLPIdjRyeQkjAqtuf6T+XwXtPV1Fkg
   BpmU746z8IshDklxyQEPZfaHQ1FgLQQUh0LhXBYNgBqwJPLqhH+9UgYgt
   w==;
X-CSE-ConnectionGUID: zODI5dD0Q9KlGShQO8WF3g==
X-CSE-MsgGUID: etG3wa+ISr2qs6BzqyUoHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85394646"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85394646"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 18:20:00 -0700
X-CSE-ConnectionGUID: pr7BiU04R0Sd2qHsxFV9/w==
X-CSE-MsgGUID: SmSVb+TES7GrLfBLZklcpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="262875390"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jul 2026 18:19:59 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmLcq-000000000C2-3rjD;
	Wed, 22 Jul 2026 01:19:56 +0000
Date: Wed, 22 Jul 2026 03:19:09 +0200
From: kernel test robot <lkp@intel.com>
To: "Maxime =?utf-8?Q?B=C3=A9lair"?= <maxime.belair@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
 John Johansen <john.johansen@canonical.com>
Subject: [linux-next:master 1239/8209] Warning:
 security/apparmor/apparmorfs.c:501 function parameter 'compressed_data' not
 described in 'aa_get_data_from_compressed'
Message-ID: <202607220324.DucQ2xIq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   290aaf24a551d5a0dce037e3fab30820f9113a10
commit: 17b5758bf35c7a113363cd7a350b7e6a251b80f4 [1239/8209] apparmor: Initial support for compressed policies
config: i386-randconfig-2006-20250825 (https://download.01.org/0day-ci/archive/20260722/202607220324.DucQ2xIq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260722/202607220324.DucQ2xIq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607220324.DucQ2xIq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/apparmor/apparmorfs.c:501 function parameter 'compressed_data' not described in 'aa_get_data_from_compressed'
>> Warning: security/apparmor/apparmorfs.c:501 function parameter 'compressed_data' not described in 'aa_get_data_from_compressed'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
