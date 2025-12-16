Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014F733554B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 18:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765910665; cv=none; b=EVjlbtFCggBjE2rRhOLPgb5BjFXltOS6sXuyjEVrPfbX2ZZ8QNFaR0vcjPdizVWMguJIaVaKKLBGWYV2cymBsRPy9i6o/QKSyHfEhp2g01RUed/O+oCztBGry3IoYnHSuzEFauyez71Iq6Ax75cao/4PxNsVi3YlRoFy0R9emSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765910665; c=relaxed/simple;
	bh=N86iY285Ufrqvw6QGzCZzxCjjsfyw5l5I4LxbHDi1mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DXFT1jpjdXDSHecApJc41+bclRtJo8Fje/yMfUz+PANHmHSiqe/y/xXuV3LNJoeMMbKc+ePz3paTnkcP+JJKXwiIqy7IQAgjs7DfmlD19neSUcUaTsztJDnJegjAn6mBGbwko9RlMn+BP7uxGJ/H+TAbq6bSqtdWkE4GEQwI15w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btGQm/Co; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btGQm/Co"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765910664; x=1797446664;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=N86iY285Ufrqvw6QGzCZzxCjjsfyw5l5I4LxbHDi1mQ=;
  b=btGQm/CopX/l/A4CtEfVLVC9MpWRsArEdVshvEoZm/8odx6Z7SbyR+/f
   14pxYuGOMXNxu6y8kLBB6we5+XERXVJHc5k/56OJZCGymod2JDm8UhWtE
   kn9Dwlh8pWprWhs5mfOqCcMoMdD/8AF64U06itASpHdBsUXz3QT8DLelR
   OpxjjjyYEgZ+pJFLmdlX++KiCdzVHaOqaIbouG/i2llze5//L/mrtXses
   uQjOEjDBDkNzA1t8wmj2iQ/wGHEoWLRyW0+cu7na+Sd7GVNJC7UY5cCJ+
   tbTkz67OTgbD0Chrg2wiKGyWFUkw/2i2WV2s/USviDvlIJU2CHXFQqQhD
   g==;
X-CSE-ConnectionGUID: Uz6QgChCSka3pqrYdoEedQ==
X-CSE-MsgGUID: DqeChWH7RnGL/x5Jkhsf9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="55412499"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="55412499"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 10:44:22 -0800
X-CSE-ConnectionGUID: D7lRAn+KS/azxJn/tj8yHQ==
X-CSE-MsgGUID: HPmy69loRaqZFSm9pYvcuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197848696"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Dec 2025 10:44:21 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVa1o-000000003jo-1DIB;
	Tue, 16 Dec 2025 18:44:11 +0000
Date: Wed, 17 Dec 2025 02:43:39 +0800
From: kernel test robot <lkp@intel.com>
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] net: usb: pegasus: fix memory leak on usb_submit_urb()
 failure
Message-ID: <aUGoWyl1QocktKkz@7df3ebb995de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216184113.197439-1-petko.manolov@konsulko.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] net: usb: pegasus: fix memory leak on usb_submit_urb() failure
Link: https://lore.kernel.org/stable/20251216184113.197439-1-petko.manolov%40konsulko.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



