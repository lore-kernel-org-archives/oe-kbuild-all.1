Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B572D13211A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 02:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721700135; cv=none; b=Z/U1+o4/hcGVJkyKfjlNFHY4uEr4pWeWd7XQi5yulYf2WozBIwEWwpurr7FtC4UMDMlZCau8dafvXxGJOziyhmx26uhTwxSx4Cih0c6opVLS9ld4hyHb7BL1Vlc/zwKNB/v7Apsn5Un42YARPuKI71IDG0h5Ih3jlqmtO9BH/lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721700135; c=relaxed/simple;
	bh=CwbPUvUCNJy6h9faG9+OwmpfTBYeSIzJPwfmq0u58wU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqRaocCWuA0GIBnyFNQ73ZZLOZwFCoI7iJt+wx1/OMJsGG94nXdS5Mge2PUwiA7b6XlMrpz7WxSiVhaF+5AQ7CT6cqd0dcxRxJC70bzoKwLLRfwM2vWDiH0Ri1ks9OULnU2ROOjurCJ4AkQ6GprhmrxXS3NUkX0XELJR8NsQw0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkzXxBTw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkzXxBTw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721700134; x=1753236134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CwbPUvUCNJy6h9faG9+OwmpfTBYeSIzJPwfmq0u58wU=;
  b=CkzXxBTw8pPsPVPHJlzwZZLQZS1JnA4XSDqobNGqCegqW8fqCqDN9NTE
   WizrVyMjYwGJp2AdFcCfW+hn10DYi5r0YCbpiyaotIviWUebnXFkGbqm1
   0yaVZiMYsV8/N9fSgpg6d6CZEp4/wT/mCBVRhb1xcvUCqqex3zorckngw
   OqSMKXJo42RLF/QK3XzQStbU5jHtkjAR+jV2qrUxuWxRQdXSmmHhaw9rp
   Cwq+9df8tndSKDRWjCEutjD+5qvkEaRXXuC1KoAKSAJqCQZvg+HNgPnfR
   3dBcDzzfCF74a0ySUZviNr0nCnZ9Gbc3pDhp0DkTVZFlYoYYIMs8Blfxb
   Q==;
X-CSE-ConnectionGUID: Db2S2KUiQEGu77eVuYsYrw==
X-CSE-MsgGUID: y/+eaWdkQ/SJJpcAt0pqRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19149043"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="19149043"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 19:02:11 -0700
X-CSE-ConnectionGUID: eY5n9lSOTCWMBhWDBLluVA==
X-CSE-MsgGUID: PnpzADQWSWuoYX3SBB6wnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="52310048"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Jul 2024 19:02:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW4qs-000lY5-2E;
	Tue, 23 Jul 2024 02:02:06 +0000
Date: Tue, 23 Jul 2024 10:01:52 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>, Petr Mladek <pmladek@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v3 07/19] printk: Add helpers for flush type logic
Message-ID: <202407230936.FqviIH1q-lkp@intel.com>
References: <20240722171939.3349410-8-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722171939.3349410-8-john.ogness@linutronix.de>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on b18703ea7157f62f02eb0ceb11f6fa0138e90adc]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Ogness/printk-nbcon-Clarify-nbcon_get_default_prio-context/20240723-015154
base:   b18703ea7157f62f02eb0ceb11f6fa0138e90adc
patch link:    https://lore.kernel.org/r/20240722171939.3349410-8-john.ogness%40linutronix.de
patch subject: [PATCH printk v3 07/19] printk: Add helpers for flush type logic
config: x86_64-buildonly-randconfig-002-20240723 (https://download.01.org/0day-ci/archive/20240723/202407230936.FqviIH1q-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407230936.FqviIH1q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407230936.FqviIH1q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/printk/printk.c:61:
   kernel/printk/internal.h: In function 'printk_get_console_flush_type':
>> kernel/printk/internal.h:188:26: error: implicit declaration of function 'is_printk_deferred'; did you mean '_printk_deferred'? [-Werror=implicit-function-declaration]
     188 |    if (prefer_offload || is_printk_deferred())
         |                          ^~~~~~~~~~~~~~~~~~
         |                          _printk_deferred
   cc1: some warnings being treated as errors


vim +188 kernel/printk/internal.h

   172	
   173	/*
   174	 * Decide while console flushing methods are to be used. Used
   175	 * for all flushing except when flushing from emergency state.
   176	 *
   177	 * Set @prefer_offload to true if the context is only interested in
   178	 * offloading. Then offloading types will be set instead of direct,
   179	 * if appropriate.
   180	 */
   181	static inline void printk_get_console_flush_type(struct console_flush_type *ft, bool prefer_offload)
   182	{
   183		memset(ft, 0, sizeof(*ft));
   184	
   185		switch (nbcon_get_default_prio()) {
   186		case NBCON_PRIO_NORMAL:
   187			if (have_legacy_console || have_boot_console) {
 > 188				if (prefer_offload || is_printk_deferred())
   189					ft->legacy_offload = true;
   190				else
   191					ft->legacy_direct = true;
   192			}
   193	
   194			if (have_nbcon_console && !have_boot_console)
   195				ft->nbcon_atomic = true;
   196			break;
   197	
   198		case NBCON_PRIO_EMERGENCY:
   199			/*
   200			 * Skip. The consoles will be flushed when exiting emergency
   201			 * state. See printk_get_emergency_console_flush_type().
   202			 */
   203			break;
   204	
   205		case NBCON_PRIO_PANIC:
   206			if (have_nbcon_console && !have_boot_console)
   207				ft->nbcon_atomic = true;
   208	
   209			/*
   210			 * In panic, if nbcon atomic printing occurs, the legacy
   211			 * consoles must remain silent until explicitly allowed.
   212			 */
   213			if (legacy_allow_panic_sync || !ft->nbcon_atomic)
   214				ft->legacy_direct = true;
   215			break;
   216	
   217		default:
   218			WARN_ON_ONCE(1);
   219			break;
   220		}
   221	}
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
