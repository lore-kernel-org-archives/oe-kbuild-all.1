Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD26B2868BD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 22:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753222253; cv=none; b=hy0d/RFYLipE3WtA4zFkL0UJCpQLVouC+RKyT1vOEzq+7ZLjCbxjsK4CefIAKESfFDNHfI6nZaA4cl7amXDSCAUsz6T1TH7e04DHtNywJBMnSofWghQL/akCex3Xe99l+tylNwkZYclRRiQKQc04l0mg+eFM9AtTdiY7EcywMmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753222253; c=relaxed/simple;
	bh=C2FBRWKCIQGxWRG+faoXHvCKGguLUFl1fbUyeX1jHAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkQWWYBzhXPPUZ0lL7DenJQMCrl6d60Kpmlt54/yN4qyNjllCRcKcGWjEfgSBJTqB17+RaBP8Qr6FjJgSZeVWlJuSQTiWD6enbTeWpVtiT3aHSeojjaBGAbHGWLILqfPX0++F6GF4tZb90xqBv0f6AkKccYuUrKaCAwmFj40grI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZacArTz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZacArTz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753222251; x=1784758251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C2FBRWKCIQGxWRG+faoXHvCKGguLUFl1fbUyeX1jHAo=;
  b=HZacArTzcmehK0DdILgPn+CLwqxN0yCzvJ1ZRgnNeNhKFzixczC3Eimz
   dkZOPgiFCC/FrHcfgs5bTDo2208KIasaBbAssmTDrq8isdsi+sLqMepll
   ynQnWhRV+d43V9oQuyzkYzvfs3XDECIeMnYim9PIJSPCARMnwo1lmQR36
   9UWXuex8ZSuG6QW5iJale1Yj3jwBUo9sYt+ALraeG+OKxTvxyUolub+3i
   Je82/8JEDi0TxfUR3MJqunqy58pjLcUq6bTAl4tAM+N1bmM0F/4ZXfsFv
   WdoAZ8DlXcp7GoQHh8kS7rxlqQNLFKKwy2YG+EUl8N7av+yAFkWUvf8Nl
   A==;
X-CSE-ConnectionGUID: 9Cjedze/TzWeeIC1STJYdw==
X-CSE-MsgGUID: nJ3q8TLfRfyEwC4bZakwrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="54706852"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="54706852"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 15:10:51 -0700
X-CSE-ConnectionGUID: BXbq7hgsRPSplwyEI9nfKg==
X-CSE-MsgGUID: GOe4/IchQK+wBiBY0MImcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="158563056"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Jul 2025 15:10:48 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueLCA-000IkR-1c;
	Tue, 22 Jul 2025 22:10:46 +0000
Date: Wed, 23 Jul 2025 06:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Lecomte <contact@arnaud-lcm.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
	snovitoll@gmail.com,
	syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com, contact@arnaud-lcm.com
Subject: Re: [PATCH] usb: mon: Fix slab-out-of-bounds in mon_bin_event due to
 unsafe URB transfer_buffer access
Message-ID: <202507230548.g6zwppI6-lkp@intel.com>
References: <20250720200057.19720-1-contact@arnaud-lcm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720200057.19720-1-contact@arnaud-lcm.com>

Hi Arnaud,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v6.16-rc7 next-20250722]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Lecomte/usb-mon-Fix-slab-out-of-bounds-in-mon_bin_event-due-to-unsafe-URB-transfer_buffer-access/20250721-040222
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250720200057.19720-1-contact%40arnaud-lcm.com
patch subject: [PATCH] usb: mon: Fix slab-out-of-bounds in mon_bin_event due to unsafe URB transfer_buffer access
config: m68k-randconfig-r073-20250723 (https://download.01.org/0day-ci/archive/20250723/202507230548.g6zwppI6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507230548.g6zwppI6-lkp@intel.com/

smatch warnings:
drivers/usb/mon/mon_bin.c:422 mon_bin_get_data() warn: unsigned 'mon_copy_to_buff(rp, offset, urb->transfer_buffer, length)' is never less than zero.
drivers/usb/mon/mon_bin.c:443 mon_bin_get_data() warn: unsigned 'offset' is never less than zero.

vim +422 drivers/usb/mon/mon_bin.c

   409	
   410	static unsigned int mon_bin_get_data(const struct mon_reader_bin *rp,
   411	    unsigned int offset, struct urb *urb, unsigned int length,
   412	    char *flag)
   413	{
   414		int i;
   415		struct scatterlist *sg;
   416		unsigned int this_len;
   417	
   418		*flag = 0;
   419		if (urb->num_sgs == 0) {
   420			if (
   421				urb->transfer_buffer == NULL ||
 > 422				mon_copy_to_buff(rp, offset, urb->transfer_buffer, length) < 0
   423			) {
   424				*flag = 'Z';
   425				return length;
   426			}
   427			length = 0;
   428	
   429		} else {
   430			/* If IOMMU coalescing occurred, we cannot trust sg_page */
   431			if (urb->transfer_flags & URB_DMA_SG_COMBINED) {
   432				*flag = 'D';
   433				return length;
   434			}
   435	
   436			/* Copy up to the first non-addressable segment */
   437			for_each_sg(urb->sg, sg, urb->num_sgs, i) {
   438				if (length == 0 || PageHighMem(sg_page(sg)))
   439					break;
   440				this_len = min_t(unsigned int, sg->length, length);
   441				offset = mon_copy_to_buff(rp, offset, sg_virt(sg),
   442						this_len);
 > 443				if (offset < 0) {
   444					*flag = 'Z';
   445					return length;
   446				}
   447				length -= this_len;
   448			}
   449			if (i == 0)
   450				*flag = 'D';
   451		}
   452	
   453		return length;
   454	}
   455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
