Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963D437754D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534443; cv=none; b=AgJRW5Sm79XTl4OzcOFZZ78YTbfzMvxH/6SRparwKzphVsv39xnUuvXHm88am3j/Ul5YQzWSQtgxOx8Rh/8nd1p/Ll0hDnoN1jdHSac1qsKAPbqeE+eyeJUAR0QLsw2QmZ4iCjwD1dm97ccbVyzw0Pv83VGEbw2780OazBmPlOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534443; c=relaxed/simple;
	bh=JqFdJQvh+85MPvdIPOcWvJHfvP/feCTUskARF7qj5uI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQ61ZVM93L7WNah6iDOAyxHcFtymUpj5zRBOO5Hhagg4Isy5qTr1h84z9D1YSHIBxagQeNiXJG0QeahDoo/gq0O4MXzjvOB5pksbwzvZwU6uS2rZFWQvwRp8HIx2aj+jniR2DzhFv2Z+opZL/STuMD2lzYao2wxajJoglp4ZdUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQYLbJqM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQYLbJqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534442; x=1807070442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JqFdJQvh+85MPvdIPOcWvJHfvP/feCTUskARF7qj5uI=;
  b=lQYLbJqMf/R89XR/DRmN9RN5bUcACsjTBlRjRSfUVObbTQUX44e11UOZ
   oVX+GU3F7bf2J2rflYFEsyGOQ56qGF70UXOxCVgU9O8Vm9bKaY7zFBAT5
   A6Ayva4Wy6tC5ShVNlibJYTyUIO7Ic563UM2SOK5nSQCm90QDwqqCZlyK
   2Aa+wPQnUh0CHgf0esyuIfRbn/XvaFr4Dfp53gRJbMfPbv8/Q0dxiWsqz
   JNyZpQmp/cdjYsShALTcOCJx9+8TrWV95sCz9SHaM1KyQnLhaLlrycp4f
   mu7UtQbnhxE2qpxnQYtwJ1Gu4dToP+M+5Cn1F3q4A/wzZ3utcDG3j1RrZ
   Q==;
X-CSE-ConnectionGUID: mwBY/KeIR9qFrtLy+yto3A==
X-CSE-MsgGUID: Nqe7MrRkTV2h8e8YTPcr9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86782270"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86782270"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:00:41 -0700
X-CSE-ConnectionGUID: wDIAC8YER5KdCC0LiDS5wg==
X-CSE-MsgGUID: +3YWodOqRAGptbgPT5PLSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="224844901"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Apr 2026 21:00:37 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xc9-0000000007F-1hKX;
	Tue, 07 Apr 2026 04:00:33 +0000
Date: Tue, 7 Apr 2026 12:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: Yunseong Kim <ysk@kzalloc.com>, Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, max.byungchul.park@gmail.com,
	"kernel_team@skhynix.com" <kernel_team@skhynix.com>,
	kernel-team@lge.com, Yunseong Kim <ysk@kzalloc.com>,
	Byungchul Park <byungchul@sk.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH] lkdtm: Add folio_lock deadlock scenarios
Message-ID: <202604051743.4BM8o6lT-lkp@intel.com>
References: <20260402143947.162844-1-ysk@kzalloc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402143947.162844-1-ysk@kzalloc.com>

Hi Yunseong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus kees/for-next/pstore kees/for-next/kspp shuah-kselftest/next shuah-kselftest/fixes soc/for-next linus/master v7.0-rc6 next-20260403]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunseong-Kim/lkdtm-Add-folio_lock-deadlock-scenarios/20260405-145013
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260402143947.162844-1-ysk%40kzalloc.com
patch subject: [PATCH] lkdtm: Add folio_lock deadlock scenarios
config: s390-randconfig-002-20260405 (https://download.01.org/0day-ci/archive/20260405/202604051743.4BM8o6lT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051743.4BM8o6lT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051743.4BM8o6lT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/misc/lkdtm/deadlock.c:228 function parameter '' not described in 'lkdtm_waiter_thread'
>> Warning: drivers/misc/lkdtm/deadlock.c:228 function parameter '' not described in 'lkdtm_waiter_thread'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
   Selected by [y]:
   - REGULATOR_RT5133 [=y] && REGULATOR [=y] && I2C [=y] && GPIOLIB [=y] && OF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
