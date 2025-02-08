Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45B4246331
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739016655; cv=none; b=FGFHXdCijDAuuj4pirvyUAz62WInXJ+LREi7UOoKhVkx+DmQsn1wUOCgp+tvbEajgLlPafv6Hbx8O/RdkBncAB+tK1VhiGMLSB7M7yxtwmPNKrNSk8De4pWHT5axaLneQHtEKt4M6A4Zjaw7EpzX94uza5Z0otuA4mXiEUmIQ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739016655; c=relaxed/simple;
	bh=Y4cah178pVm/TyCjnR2BxWLPSd7RUgpqPRJ2KklwCB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QllKH2+nd1QuVRcJdG0cx3ZODcYi9mtkVYBPaniPAR5wgPHgnyNwnKI+4bqjMD1rnlQ1tEz4V49P33LEaCcyGa0s0RYpd7t8+aXysFtVeLjIDnBYCUnYsS7Z9LV2chc/3uVMscVaVcOL1WHJ7JpLSaDqodGT8ZXovS9BtQul+4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqmSA9zc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqmSA9zc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739016654; x=1770552654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y4cah178pVm/TyCjnR2BxWLPSd7RUgpqPRJ2KklwCB0=;
  b=NqmSA9zc1uBR25o1gyxwW+WD0nnFwc7Qqc/t5B8unXYmbYi4jKSKOjeH
   LyFXGfR2zHJOnk77ZbKYt0wNDXAxDNGSdpAH8y5i4v4RqvpYjIQaKcIBn
   FcwLFX7jthzUegvDoHJmxhM6GbzuAti8gLL+/J3cHIWJvJzyrkD4D1bOm
   NAGVpXpln0GNR4Th92v6xvxzrje1FeYpUQGzMLR6NOT0p8ZX++rffdo2B
   PMSbCllm8pR0WUzTN/5r9FEyw2ElvlwZj17VSC9Rjg+ZHB5u4zs0Kx/ke
   tZhaIZQyy7c8/YlSX3sgupZCoeYcafmVEA0CoexqoUzFnvEKVsJyjIint
   w==;
X-CSE-ConnectionGUID: DSEtWDaoQTO6O7j0ps/7rA==
X-CSE-MsgGUID: 9J39nAObTh6hvlTkiuddAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="57070804"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="57070804"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 04:10:52 -0800
X-CSE-ConnectionGUID: UKX7WyT1R12FPhdDM3c1XQ==
X-CSE-MsgGUID: YDExt5IHSWi50POe66I1Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="116770919"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Feb 2025 04:10:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgjfa-000zw7-35;
	Sat, 08 Feb 2025 12:10:46 +0000
Date: Sat, 8 Feb 2025 20:10:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jill Donahue <jilliandonahue58@gmail.com>, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Jill Donahue <jilliandonahue58@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3] f_midi_complete to call tasklet_hi_schedule
Message-ID: <202502081928.T2cRhulq-lkp@intel.com>
References: <20250207203441.945196-1-jilliandonahue58@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207203441.945196-1-jilliandonahue58@gmail.com>

Hi Jill,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v6.14-rc1 next-20250207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jill-Donahue/f_midi_complete-to-call-tasklet_hi_schedule/20250208-043845
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250207203441.945196-1-jilliandonahue58%40gmail.com
patch subject: [PATCH v3] f_midi_complete to call tasklet_hi_schedule
config: i386-buildonly-randconfig-003-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081928.T2cRhulq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081928.T2cRhulq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081928.T2cRhulq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/gadget/function/f_midi.c: In function 'f_midi_complete':
>> drivers/usb/gadget/function/f_midi.c:286:50: error: 'struct f_midi' has no member named 'tasklet'
     286 |                         tasklet_hi_schedule(&midi->tasklet);
         |                                                  ^~


vim +286 drivers/usb/gadget/function/f_midi.c

   269	
   270	static void
   271	f_midi_complete(struct usb_ep *ep, struct usb_request *req)
   272	{
   273		struct f_midi *midi = ep->driver_data;
   274		struct usb_composite_dev *cdev = midi->func.config->cdev;
   275		int status = req->status;
   276	
   277		switch (status) {
   278		case 0:			 /* normal completion */
   279			if (ep == midi->out_ep) {
   280				/* We received stuff. req is queued again, below */
   281				f_midi_handle_out_data(ep, req);
   282			} else if (ep == midi->in_ep) {
   283				/* Our transmit completed. See if there's more to go.
   284				 * f_midi_transmit eats req, don't queue it again. */
   285				req->length = 0;
 > 286				tasklet_hi_schedule(&midi->tasklet);
   287				return;
   288			}
   289			break;
   290	
   291		/* this endpoint is normally active while we're configured */
   292		case -ECONNABORTED:	/* hardware forced ep reset */
   293		case -ECONNRESET:	/* request dequeued */
   294		case -ESHUTDOWN:	/* disconnect from host */
   295			VDBG(cdev, "%s gone (%d), %d/%d\n", ep->name, status,
   296					req->actual, req->length);
   297			if (ep == midi->out_ep) {
   298				f_midi_handle_out_data(ep, req);
   299				/* We don't need to free IN requests because it's handled
   300				 * by the midi->in_req_fifo. */
   301				free_ep_req(ep, req);
   302			}
   303			return;
   304	
   305		case -EOVERFLOW:	/* buffer overrun on read means that
   306					 * we didn't provide a big enough buffer.
   307					 */
   308		default:
   309			DBG(cdev, "%s complete --> %d, %d/%d\n", ep->name,
   310					status, req->actual, req->length);
   311			break;
   312		case -EREMOTEIO:	/* short read */
   313			break;
   314		}
   315	
   316		status = usb_ep_queue(ep, req, GFP_ATOMIC);
   317		if (status) {
   318			ERROR(cdev, "kill %s:  resubmit %d bytes --> %d\n",
   319					ep->name, req->length, status);
   320			usb_ep_set_halt(ep);
   321			/* FIXME recover later ... somehow */
   322		}
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
