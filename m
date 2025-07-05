Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C9614EC46
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 16:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751734344; cv=none; b=NKfhyXaveXY2L6qMwfbb98LIFhJqxDxzZJ+w7uxNa0nDqw+wF5uLGcAMt1zwlJGfaFqtE6S9oh1vGp5TstWe8ePMonmCXUYTnbEQ3ueiDmji9Vqcl3xdzPnRKlN55KXVKHoU56wjWnfXkraw7IbYlZC2jLORTZyldoey6DfBLwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751734344; c=relaxed/simple;
	bh=e2wiSNs48ZBe2YT9oRIVY+jqqRRhnGkNdUsYu5WN1Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7kHy5Yw3wYo522X7E3QZxI/S6N4cBMCNZmXOhgOLQBxKfCTF4zU1BU4ocFkhShoyOSDeB/yU3zn0usbdpYaaRn4M1AgWUEmN9ZAuwAH8SLNHDSqtVUYHkWUY+f1gn+xEWf61wJUNWiI7ccS7DJWcktms0OFkJ7aFz+gcQ2pgcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLu+Ni5Q; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLu+Ni5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751734342; x=1783270342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e2wiSNs48ZBe2YT9oRIVY+jqqRRhnGkNdUsYu5WN1Lw=;
  b=ZLu+Ni5QGqBU1QM1DbsUFwvmviqq4LMZTsgGjB+uEtRMkE7Rd/K/k8XF
   xkaQZFwaetEGUwODAf6Lz53wFJ6ZVmqofC+OZA7pq0b8eqlPhxqrGeYFl
   Rt4KQZgxd1ElzxtHzBFntowgoBUaWif4VdFHz2Vk9bLIPOiRh477ksrkG
   oBm7Aag8qnAnBQa5Y4wvk4dgamX98iHyv29sk47GEXbRRf212NqoqXjjq
   3o06QH8GnYVFfxwh1m2K96AmCWst5xk7d0yBVh+s1TAJ/a5XIgyO+P3rm
   qLShbhKqfZiVSoK3gH+j1jQdeH7zcOG6TFGse3VA0OPMlH+er/2E41+kx
   g==;
X-CSE-ConnectionGUID: r5pZi51ETXSvwnDICGXAUQ==
X-CSE-MsgGUID: oZrq+mj5Tnug5zNyxfQoGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="53238637"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="53238637"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 09:52:21 -0700
X-CSE-ConnectionGUID: z2oItUR9ROmbiFGY0UomQA==
X-CSE-MsgGUID: cOW1/8VqTWG0kX5QC4KFoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="154263751"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Jul 2025 09:52:20 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY67c-0004ch-1x;
	Sat, 05 Jul 2025 16:52:16 +0000
Date: Sun, 6 Jul 2025 00:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: yangge1116@126.com, ardb@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, jarkko@kernel.org,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	ilias.apalodimas@linaro.org, jgg@ziepe.ca,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, liuzixing@hygon.cn,
	Ge Yang <yangge1116@126.com>
Subject: Re: [PATCH V2] efi/tpm: Fix the issue where the CC platforms event
 log header can't be correctly identified
Message-ID: <202507060016.n5ikMP6Q-lkp@intel.com>
References: <1751710616-24464-1-git-send-email-yangge1116@126.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1751710616-24464-1-git-send-email-yangge1116@126.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on efi/next]
[also build test ERROR on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.16-rc4 next-20250704]
[cannot apply to intel-tdx/guest-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/yangge1116-126-com/efi-tpm-Fix-the-issue-where-the-CC-platforms-event-log-header-can-t-be-correctly-identified/20250705-182032
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/1751710616-24464-1-git-send-email-yangge1116%40126.com
patch subject: [PATCH V2] efi/tpm: Fix the issue where the CC platforms event log header can't be correctly identified
config: arc-randconfig-002-20250705 (https://download.01.org/0day-ci/archive/20250706/202507060016.n5ikMP6Q-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507060016.n5ikMP6Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060016.n5ikMP6Q-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/char/tpm/eventlog/tpm2.c: In function 'calc_tpm2_event_size':
>> drivers/char/tpm/eventlog/tpm2.c:40:25: error: implicit declaration of function 'cc_platform_has' [-Werror=implicit-function-declaration]
      40 |                         cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT));
         |                         ^~~~~~~~~~~~~~~
>> drivers/char/tpm/eventlog/tpm2.c:40:41: error: 'CC_ATTR_GUEST_STATE_ENCRYPT' undeclared (first use in this function)
      40 |                         cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT));
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/eventlog/tpm2.c:40:41: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/char/tpm/eventlog/tpm2.c:41:1: warning: control reaches end of non-void function [-Wreturn-type]
      41 | }
         | ^
   cc1: some warnings being treated as errors


vim +/cc_platform_has +40 drivers/char/tpm/eventlog/tpm2.c

    24	
    25	/*
    26	 * calc_tpm2_event_size() - calculate the event size, where event
    27	 * is an entry in the TPM 2.0 event log. The event is of type Crypto
    28	 * Agile Log Entry Format as defined in TCG EFI Protocol Specification
    29	 * Family "2.0".
    30	
    31	 * @event: event whose size is to be calculated.
    32	 * @event_header: the first event in the event log.
    33	 *
    34	 * Returns size of the event. If it is an invalid event, returns 0.
    35	 */
    36	static size_t calc_tpm2_event_size(struct tcg_pcr_event2_head *event,
    37					   struct tcg_pcr_event *event_header)
    38	{
    39		return __calc_tpm2_event_size(event, event_header, false,
  > 40				cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT));
  > 41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
