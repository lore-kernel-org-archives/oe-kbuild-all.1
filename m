Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BE515FD1B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719322542; cv=none; b=ZUK4mdvXwVZYTea5c7DZ6DFAdcu5RIzdCUYOupnbym/ENBSFXBTdKqQ4uS8yFMA36lka1+KjJsYNs7QF8v69QZ0M3UoCSyoVhcEhgN2P/08xJ7TGP7UI9veL3NukmnF69T19kgp2lo6Qi0cY7ygCA/rWfjVrh8VWPPwhdmRTec4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719322542; c=relaxed/simple;
	bh=oTfBBNjrMxF3+8EUNWyVBjiZ5mWolPrdKFpf/4v3430=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=YcbTLDy6bFdUpZjdcVzC3b/IAkgfXnnh56r9BeRFZqLhH/sOlP7vK0hk45F+VyZQQvhtPpjBtzY/CvM/MhGf7sGsTlqaP+nbjzFha/gXstfzbIRrQyyHLV2SqDjX+h2qUyJapah0ai1AP/Olg4qpWQDALrdIa/n2v4A2fIF+bsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KquyFErL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KquyFErL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719322541; x=1750858541;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=oTfBBNjrMxF3+8EUNWyVBjiZ5mWolPrdKFpf/4v3430=;
  b=KquyFErLihq87ucSzMRneCvmtKWB/GkR/e5d3csFOR3SBo9JPcD7goYr
   FBxX9Gia0n2J7siiGu9RshGO3jQmd4bWVj897Wvp3CgqMP25/LCYT/xpE
   mOKugRYVD8lkFzzg64a7G4wAYGM/jGtpw3o7W/wKG9evhn9iN8zNzRzmX
   428Hg3hFIvKFH7XReXrHK4C7Jkn7kta2ubYC5OPB54GjXJ0nmT5rKNfy4
   hqGaIGq7SY1XgCw8m02eCEnUjG9kIYT3MXhnuUYVXaPtKIQUPRDc0NPTQ
   9uVGjGQtLtbFZmKU7AA0Btqw4Mt7ueBNyXjRW/vpdz35L+PEW7bFTU/Fh
   w==;
X-CSE-ConnectionGUID: IqqY81RVRUqT4BsxH+QI2w==
X-CSE-MsgGUID: kTNOts7MTEihxswna5/XZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="38852488"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="38852488"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 06:35:41 -0700
X-CSE-ConnectionGUID: gIsbdLTnSSSmWPogy2ViJQ==
X-CSE-MsgGUID: 4VqUwGXQTWOrfGw33zUOAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="48089741"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Jun 2024 06:35:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sM6Ke-000EPy-0p;
	Tue, 25 Jun 2024 13:35:36 +0000
Date: Tue, 25 Jun 2024 21:35:35 +0800
From: kernel test robot <lkp@intel.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net 1/1] igc: Fix double reset adapter triggered from a
 single taprio cmd
Message-ID: <ZnrHp7CgfLecibDl@6715f18d4702>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625082656.2702440-1-faizal.abdul.rahim@linux.intel.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH net 1/1] igc: Fix double reset adapter triggered from a single taprio cmd
Link: https://lore.kernel.org/stable/20240625082656.2702440-1-faizal.abdul.rahim%40linux.intel.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



