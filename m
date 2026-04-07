Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154F5377577
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534444; cv=none; b=ArSLKlOgiCh7RUDhEcDUl0iTiwWJOZ21Bv4DAhK59VbePzXDjacVVSGgnszK1Kk/Fq3A1I3Nsn94f2kbGDk2nga1bsGET7IA37p+ssuRnkM3ApMsEkOF1W38YssAhSThDKh1qr7uibv/rEez2oIQTix2Fj1FPeX9Grfwkz6c5CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534444; c=relaxed/simple;
	bh=1er2E8TY9Tpy2Qwo99UK/oBDNc6k2nZpUyVSIYodlfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dB1Se/wOSivTmjawL2QijSzSyt99JvDN4t5wm7VjUheBlPhGBNP3vB46Bp5SlevkLX7DR3851yHtb9ujdX9fL9twDjwx3RrhjeN7PBhb6isyXQNIErkAMyAjlrZHRTgRa3sOR8P01iMTQ/lAqegC4MalMzitApPXiVaiIPsklDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHb0bv7L; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHb0bv7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534443; x=1807070443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1er2E8TY9Tpy2Qwo99UK/oBDNc6k2nZpUyVSIYodlfQ=;
  b=RHb0bv7LmXdvntDRM5ba19eGHpLpNTREgmde6MHFR1pMKqhBiEbwS/N+
   WDQzdPS7G0+dWeZySRfY8fSKTmzgDAx1WSGe9LDfEYrKZvoxtuH7T5v2A
   aZotJOAsDVZbygX0Fq6lAexqo/cXIsFegQhg3I/eM6jLrqKtQedTYlZEq
   mdr1ju084i6Ql5m+YB8pYr0e8y8DMXEI9QCUazeDrEGpaMnXPaA7PRAMH
   9QJju7yEef8D3TeZfPBlnnyzs+YhDCa8EKfRK0zzVKd9MCAhdB6nGOnCO
   SovWQNZNMzt9+ThFCZMEWlV9/zm3e3rR7TEdGl4o3aN0m1lE6gza6tmph
   g==;
X-CSE-ConnectionGUID: 5HMdkibcS6S+QVf9dXIguQ==
X-CSE-MsgGUID: JVTif4HESV+JPDZkANno8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86782273"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86782273"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:00:41 -0700
X-CSE-ConnectionGUID: 8S/r5/AsRyunzJ6lfbUhWQ==
X-CSE-MsgGUID: Js3bgglnQXerX3pfS9bH3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="224844899"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Apr 2026 21:00:37 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xc9-0000000007J-1v7Z;
	Tue, 07 Apr 2026 04:00:33 +0000
Date: Tue, 7 Apr 2026 12:00:24 +0800
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
Message-ID: <202604051847.ywz0arFk-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus kees/for-next/pstore kees/for-next/kspp shuah-kselftest/next shuah-kselftest/fixes soc/for-next linus/master v7.0-rc6 next-20260403]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunseong-Kim/lkdtm-Add-folio_lock-deadlock-scenarios/20260405-145013
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260402143947.162844-1-ysk%40kzalloc.com
patch subject: [PATCH] lkdtm: Add folio_lock deadlock scenarios
config: riscv-randconfig-002-20260405 (https://download.01.org/0day-ci/archive/20260405/202604051847.ywz0arFk-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051847.ywz0arFk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051847.ywz0arFk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/misc/lkdtm/deadlock.c: In function 'lkdtm_folio_mutex_kthread':
>> drivers/misc/lkdtm/deadlock.c:99:38: error: parameter name omitted
      99 | static int lkdtm_folio_mutex_kthread(void *)
         |                                      ^~~~~~
   drivers/misc/lkdtm/deadlock.c: In function 'lkdtm_mutex_folio_kthread':
   drivers/misc/lkdtm/deadlock.c:112:38: error: parameter name omitted
     112 | static int lkdtm_mutex_folio_kthread(void *)
         |                                      ^~~~~~
   drivers/misc/lkdtm/deadlock.c: In function 'lkdtm_waiter_thread':
   drivers/misc/lkdtm/deadlock.c:228:32: error: parameter name omitted
     228 | static int lkdtm_waiter_thread(void *)
         |                                ^~~~~~


vim +99 drivers/misc/lkdtm/deadlock.c

    97	
    98	/* Attempting 'folio_lock() A then Mutex B' order */
  > 99	static int lkdtm_folio_mutex_kthread(void *)
   100	{
   101		while (true) {
   102			folio_lock(folio_common);
   103			mutex_lock(&mutex_b);
   104			mutex_unlock(&mutex_b);
   105			folio_unlock(folio_common);
   106		}
   107	
   108		return 0;
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
